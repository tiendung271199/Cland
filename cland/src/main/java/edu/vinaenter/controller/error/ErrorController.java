package edu.vinaenter.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;

@Controller
@RequestMapping(URLConstant.URL_ERROR)
public class ErrorController {

	@GetMapping(URLConstant.URL_ERROR_STATUS_403)
	public String error403() {
		return ViewNameConstant.VIEW_ERROR_403;
	}

	@GetMapping(URLConstant.URL_ERROR_STATUS_404)
	public String error404() {
		return ViewNameConstant.VIEW_ERROR_404;
	}

}
