package edu.vinaenter.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Category;
import edu.vinaenter.service.CategoryService;

@Controller
@RequestMapping(URLConstant.URL_ADMIN)
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping(URLConstant.URL_EMPTY)
	public String index() {
		return ViewNameConstant.VIEW_ADMIN;
	}
	
	@GetMapping(URLConstant.URL_ADMIN_SEARCH)
	public ResponseEntity<List<Category>> listAllCategory(@RequestParam String searchContent) {
		List<Category> catList = categoryService.search(searchContent);
		if (catList.isEmpty()) {
			return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Category>>(catList, HttpStatus.OK);
	}
	
}
