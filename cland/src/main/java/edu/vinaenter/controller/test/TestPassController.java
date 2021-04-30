package edu.vinaenter.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestPassController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("test/create-pass")
	@ResponseBody
	public String testPass() {
		System.out.println(bCryptPasswordEncoder.matches("123456", bCryptPasswordEncoder.encode("123456")));
		return bCryptPasswordEncoder.encode("123");
	}

	@GetMapping("test/user-login")
	@ResponseBody
	public String testLogin() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		}
		return "No User Login";
	}

}
