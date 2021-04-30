package edu.vinaenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.UserDAO;
import edu.vinaenter.model.User;

@Service
public class UserService implements ICRUDService<User> {

	@Autowired
	private UserDAO userDAO;

	@Override
	public List<User> getAll() {
		List<User> list = userDAO.getAll();
		return list;
	}

	@Override
	public int update(User user) {
		return userDAO.update(user);
	}

	@Override
	public int save(User user) {
		return userDAO.save(user);
	}
	
	public int save2(User user) {
		return userDAO.save2(user);
	}

	@Override
	public int del(int id) {
		return userDAO.del(id);
	}

	@Override
	public User findOne(User t) {
		return null;
	}

	@Override
	public User findById(int id) {
		User user = userDAO.findById(id);
		return user;
	}

	@Override
	public List<User> search(String content) {
		return null;
	}
	
	public List<User> search(String content, int offset, int rowCount) {
		List<User> list = userDAO.search(content, offset, rowCount);
		return list;
	}
	
	public int totalRowSearch(String content) {
		return userDAO.totalRowSearch(content);
	}

	public boolean checkLogin(String username, String password) {
		List<User> list = userDAO.getAll();
		if (list.size() > 0) {
			for (User user : list) {
				if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
					return true;
				}
			}
		}
		return false;
	}
	
	public User findUserByUsername(String username) {
		User user = userDAO.findUserByUsername(username);
		return user;
	}

	@Override
	public List<User> getList(int offset, int rowCount) {
		List<User> list = userDAO.getList(offset, rowCount);
		return list;
	}
	
	public int totalRow() {
		return userDAO.totalRow();
	}

}
