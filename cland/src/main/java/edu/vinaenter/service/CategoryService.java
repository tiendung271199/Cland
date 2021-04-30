package edu.vinaenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.CategoryDAO;
import edu.vinaenter.model.Category;
import edu.vinaenter.service.ICRUDService;

@Service
public class CategoryService implements ICRUDService<Category> {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public List<Category> getAll() {
		List<Category> catList = categoryDAO.getAll();
		return catList;
	}

	@Override
	public int update(Category category) {
		return categoryDAO.update(category);
	}

	@Override
	public int save(Category category) {
		return categoryDAO.save(category);
	}

	@Override
	public int del(int id) {
		return categoryDAO.del(id);
	}

	@Override
	public Category findOne(Category category) {
		return null;
	}

	@Override
	public Category findById(int id) {
		Category objCat = categoryDAO.findById(id);
		return objCat;
	}

	@Override
	public List<Category> search(String content) {
		List<Category> list = categoryDAO.search(content);
		return list;
	}
	
	public List<Category> search(String content, int offset, int rowCount) {
		return categoryDAO.search(content, offset, rowCount);
	}
	
	public int totalRowSearch(String content) {
		return categoryDAO.totalRowSearch(content);
	}
	
	public Category findByName(String cname) {
		return categoryDAO.findByName(cname);
	}

	@Override
	public List<Category> getList(int offset, int rowCount) {
		List<Category> list = categoryDAO.getList(offset, rowCount);
		return list;
	}
	
	public List<Category> getAll2() {
		List<Category> list = categoryDAO.getAll2();
		return list;
	}
	
	public int totalRow() {
		return categoryDAO.totalRow();
	}
	
	public List<Category> getCatHot() {
		return categoryDAO.getCatHot();
	}

}
