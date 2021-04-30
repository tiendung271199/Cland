package edu.vinaenter.controller.admin;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.User;
import edu.vinaenter.service.RoleService;
import edu.vinaenter.service.UserService;
import edu.vinaenter.util.PageUtil;
import edu.vinaenter.validate.UserValidator;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_USER)
public class AdminUserController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserValidator userValidator;

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}",
			URLConstant.URL_EMPTY + "/{search}/{page}" })
	public String index(@PathVariable(required = false) String page, @PathVariable(required = false) String search,
			@RequestParam(required = false) String searchContent, Model model, RedirectAttributes ra) {
		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("userError", messageSource.getMessage("urlError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_USER;
			}
		}
		if (search != null) {
			searchContent = search;
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = userService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		List<User> userList = userService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			if (searchContent.equals("")) {
				ra.addFlashAttribute("userError", messageSource.getMessage("searchError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_USER;
			}
			model.addAttribute("searchContent", searchContent);
			totalRow = userService.totalRowSearch(searchContent);
			totalPage = PageUtil.getTotalPage(totalRow);
			userList = userService.search(searchContent, offset, GlobalConstant.TOTAL_ROW);
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("userList", userList);
		return ViewNameConstant.VIEW_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_ADD)
	public String add(Model model) {
		model.addAttribute("roleList", roleService.getAll());
		return ViewNameConstant.VIEW_ADMIN_USER_ADD;
	}

	@PostMapping(URLConstant.URL_ADMIN_ADD)
	public String add(@Valid @ModelAttribute("userError") User user, BindingResult rs, RedirectAttributes ra,
			Model model) {
		model.addAttribute("roleList", roleService.getAll());
		model.addAttribute("objUser", user);
		userValidator.validateAddUser(user, rs);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_USER_ADD;
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		if (userService.save2(user) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("addSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("userError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_EDIT)
	public String edit(@PathVariable String id, Model model, RedirectAttributes ra) {
		int userId = 0;
		try {
			userId = Integer.parseInt(id);
			if (userId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("userError", messageSource.getMessage("urlError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_USER;
		}
		User objUser = userService.findById(userId);
		model.addAttribute("objUser", objUser);
		return ViewNameConstant.VIEW_ADMIN_USER_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT)
	public String edit(@Valid @ModelAttribute("userError") User user, BindingResult rs, Model model,
			RedirectAttributes ra) {
		model.addAttribute("objUser", user);
		User oldUser = userService.findById(user.getId());
		userValidator.validateEditUser(user, rs);
		userValidator.validateEditUser(user, oldUser, rs);
		if (user.getPassword().equals("")) {
			if (rs.hasFieldErrors("username") || rs.hasFieldErrors("fullname")) {
				return ViewNameConstant.VIEW_ADMIN_USER_EDIT;
			}
			user.setPassword(oldUser.getPassword());
		} else {
			if (rs.hasErrors()) {
				return ViewNameConstant.VIEW_ADMIN_USER_EDIT;
			}
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		if (userService.update(user) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("userError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE)
	public String delete(@PathVariable String id, Model model, RedirectAttributes ra) {
		int userId = 0;
		try {
			userId = Integer.parseInt(id);
			if (userId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("userError", messageSource.getMessage("urlError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_USER;
		}
		if (userService.del(userId) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("userError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

}
