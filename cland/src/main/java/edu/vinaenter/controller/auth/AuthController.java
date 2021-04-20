package edu.vinaenter.controller.auth;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;

@Controller
public class AuthController {

	@GetMapping(URLConstant.URL_AUTH_LOGIN)
	public String login() {
		return ViewNameConstant.VIEW_AUTH_LOGIN;
	}

	@GetMapping(URLConstant.URL_AUTH_LOGOUT)
	public String logout(HttpSession session) {
		return "redirect:/" + URLConstant.URL_AUTH_LOGIN;
	}

	@GetMapping(URLConstant.URL_AUTH_SIGNUP)
	public String signup() {
		return ViewNameConstant.VIEW_AUTH_SIGNUP;
	}

}
