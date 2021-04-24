package edu.vinaenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.RoleDAO;
import edu.vinaenter.model.Role;

@Service
public class RoleService implements ICRUDService<Role> {

	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public List<Role> getAll() {
		return roleDAO.getAll();
	}

	@Override
	public List<Role> getList(int offset, int rowCount) {
		return null;
	}

	@Override
	public int update(Role t) {
		return 0;
	}

	@Override
	public int save(Role t) {
		return 0;
	}

	@Override
	public int del(int id) {
		return 0;
	}

	@Override
	public Role findOne(Role t) {
		return null;
	}

	@Override
	public Role findById(int id) {
		return null;
	}

	@Override
	public List<Role> search(String content) {
		return null;
	}
	
}
