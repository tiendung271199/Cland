package edu.vinaenter.controller.admin;

import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.User;
import edu.vinaenter.service.CategoryService;
import edu.vinaenter.service.LandService;
import edu.vinaenter.service.UserService;
import edu.vinaenter.validate.UserValidator;

@Controller
@RequestMapping(URLConstant.URL_ADMIN)
public class AdminController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandService landService;

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@GetMapping(URLConstant.URL_EMPTY)
	public String index(Model model) {
		model.addAttribute("totalRowCat", categoryService.totalRow());
		model.addAttribute("totalRowLand", landService.totalRow());
		model.addAttribute("totalRowUser", userService.totalRow());
		return ViewNameConstant.VIEW_ADMIN;
	}

	@GetMapping(URLConstant.URL_ADMIN_PROFILE)
	public String profile() {
		return ViewNameConstant.VIEW_ADMIN_PROFILE;
	}

	@PostMapping(URLConstant.URL_ADMIN_PROFILE)
	public String profile(@Valid @ModelAttribute("userError") User user, BindingResult rs, Model model,
			RedirectAttributes ra, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		user.setId(userLogin.getId());
		userValidator.validateEditUser(user, rs);
		userValidator.validateEditUser(user, userLogin, rs);
		if (user.getPassword().equals("")) {
			if (rs.hasFieldErrors("username") || rs.hasFieldErrors("fullname")) {
				return ViewNameConstant.VIEW_ADMIN_PROFILE;
			}
			user.setPassword(userLogin.getPassword());
		} else {
			if (rs.hasErrors()) {
				model.addAttribute("objUser", user);
				return ViewNameConstant.VIEW_ADMIN_PROFILE;
			}
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		if (userService.update(user) > 0) {
			session.setAttribute("userLogin", user);
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("profileError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN + "/" + URLConstant.URL_ADMIN_PROFILE;
	}

}
