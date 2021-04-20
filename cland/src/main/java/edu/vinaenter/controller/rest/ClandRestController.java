package edu.vinaenter.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.vinaenter.model.Category;
import edu.vinaenter.service.CategoryService;

@RestController
public class ClandRestController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("rest/cat")
	public ResponseEntity<List<Category>> listAllCategory() {
		List<Category> catList = categoryService.getAll2();
		if (catList.isEmpty()) {
			return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Category>>(catList, HttpStatus.OK);
	}
	
}
