package edu.vinaenter.validate;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.model.User;
import edu.vinaenter.service.UserService;

@Component
public class UserValidator implements Validator {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object object, Errors errors) {

	}

	public void validateAddUser(User user, Errors errors) {
		if (userService.findUserByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", null, messageSource.getMessage("loopUserError", null, Locale.getDefault()));
		}
	}

	public void validateEditUser(User user, Errors errors) {
		if (userService.findUserByUsername(user.getUsername()) != null) {
			User userByUsername = userService.findUserByUsername(user.getUsername());
			if (userByUsername.getId() != user.getId()) {
				errors.rejectValue("username", null, messageSource.getMessage("loopUserError", null, Locale.getDefault()));
			}
		}
	}
	
	public void validateEditUser(User user, User oldUser, Errors errors) {
		if (!user.getPassword().equals(GlobalConstant.EMPTY)) {
			if (bCryptPasswordEncoder.matches(user.getPassword(), oldUser.getPassword())) {
				errors.rejectValue("password", null, messageSource.getMessage("loopPassError", null, Locale.getDefault()));
			}
		}
	}

}
