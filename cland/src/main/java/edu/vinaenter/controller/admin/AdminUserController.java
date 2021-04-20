package edu.vinaenter.controller.admin;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import edu.vinaenter.service.UserService;
import edu.vinaenter.util.PageUtil;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_USER)
public class AdminUserController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private UserService userService;

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}" })
	public String index(@PathVariable(required = false) String page,
			@RequestParam(required = false) String searchContent, Model model, RedirectAttributes ra) {
		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("userError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_USER;
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = userService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		List<User> userList = userService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			model.addAttribute("searchContent", searchContent);
			userList = userService.search(searchContent);
		}
		model.addAttribute("userList", userList);
		return ViewNameConstant.VIEW_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_ADD)
	public String add() {
		return ViewNameConstant.VIEW_ADMIN_USER_ADD;
	}

	@PostMapping(URLConstant.URL_ADMIN_ADD)
	public String add(@Valid @ModelAttribute("userError") User user, BindingResult rs, RedirectAttributes ra,
			Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("objUser", user);
			return ViewNameConstant.VIEW_ADMIN_USER_ADD;
		}
		if (userService.checkUsername(user.getUsername()) != null) {
			model.addAttribute("uError", messageSource.getMessage("loopError", null, Locale.getDefault()));
			return ViewNameConstant.VIEW_ADMIN_USER_ADD;
		}
		if (userService.save(user) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("addSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("userError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_EDIT + "/{id}")
	public String edit(@PathVariable int id, Model model) {
		User objUser = userService.findById(id);
		model.addAttribute("objUser", objUser);
		return ViewNameConstant.VIEW_ADMIN_USER_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT)
	public String edit(@Valid @ModelAttribute("userError") User user, BindingResult rs, Model model,
			RedirectAttributes ra) {
		if (rs.hasErrors()) {
			model.addAttribute("objUser", user);
			return ViewNameConstant.VIEW_ADMIN_USER_EDIT;
		}
		if (userService.update(user) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("userError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE + "/{id}")
	public String delete(@PathVariable int id, Model model, RedirectAttributes ra) {
		if (userService.del(id) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_USER;
	}

}
