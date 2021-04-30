package edu.vinaenter.validate;

import java.util.Locale;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import edu.vinaenter.constant.GlobalConstant;

@Component
public class FileValidator implements Validator {
	
	@Autowired
	private MessageSource messageSource;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {

	}
	
	public void validateAddPicture(Errors errors, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String suffixFileName = FilenameUtils.getExtension(fileName);
		if (fileName.equals(GlobalConstant.EMPTY)) {
			errors.rejectValue("picture", null, messageSource.getMessage("fileError", null, Locale.getDefault()));
		} else {
			if (!suffixFileName.equals("jpg") && !suffixFileName.equals("png")) {
				errors.rejectValue("picture", null, messageSource.getMessage("suffixFileError", null, Locale.getDefault()));
			}
		}
	}
	
	public void validateUpdatePicture(Errors errors, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String suffixFileName = FilenameUtils.getExtension(fileName);
		if (!fileName.equals(GlobalConstant.EMPTY)) {
			if (!suffixFileName.equals("jpg") && !suffixFileName.equals("png")) {
				errors.rejectValue("picture", null, messageSource.getMessage("suffixFileError", null, Locale.getDefault()));
			}
		}
	}

}
