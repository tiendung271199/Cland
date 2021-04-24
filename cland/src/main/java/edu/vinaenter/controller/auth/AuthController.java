package edu.vinaenter.controller.auth;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.User;
import edu.vinaenter.service.UserService;

@Controller
public class AuthController {
	
	@Autowired
	private MessageSource messageSource;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private UserService userService;

	@GetMapping(URLConstant.URL_AUTH_LOGIN)
	public String login() {
		return ViewNameConstant.VIEW_AUTH_LOGIN;
	}

	@GetMapping(URLConstant.URL_AUTH_LOGOUT)
	public String logout() {
		return "redirect:/" + URLConstant.URL_AUTH_LOGIN;
	}

	@GetMapping(URLConstant.URL_AUTH_SIGNUP)
	public String signup() {
		return ViewNameConstant.VIEW_AUTH_SIGNUP;
	}

	@PostMapping(URLConstant.URL_AUTH_SIGNUP)
	public String signup(@Valid @ModelAttribute("userError") User user, BindingResult rs, RedirectAttributes ra,
			Model model) {
		model.addAttribute("objUser", user);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_AUTH_SIGNUP;
		}
		if (userService.checkUsername(user.getUsername()) != null) {
			model.addAttribute("uError", messageSource.getMessage("loopError", null, Locale.getDefault()));
			return ViewNameConstant.VIEW_AUTH_SIGNUP;
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		if (userService.save(user) > 0) {
			ra.addFlashAttribute("signupSuccess", messageSource.getMessage("signupSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("loginError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_AUTH_LOGIN;
	}

}
