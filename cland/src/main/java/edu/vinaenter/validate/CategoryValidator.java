package edu.vinaenter.validate;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vinaenter.model.Category;
import edu.vinaenter.service.CategoryService;

@Component
public class CategoryValidator implements Validator {
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private CategoryService categoryService;

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object object, Errors errors) {

	}
	
	public void validateAddCat(Category category, Errors errors) {
		if (categoryService.findByName(category.getCname()) != null) {
			errors.rejectValue("cname", null, messageSource.getMessage("loopCatError", null, Locale.getDefault()));
		}
	}

	public void validateEditCat(Category category, Errors errors) {
		if (categoryService.findByName(category.getCname()) != null) {
			Category categoryByName = categoryService.findByName(category.getCname());
			if (categoryByName.getCid() != category.getCid()) {
				errors.rejectValue("cname", null, messageSource.getMessage("loopCatError", null, Locale.getDefault()));
			}
		}
	}
	
}
