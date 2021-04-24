package edu.vinaenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.ContactDAO;
import edu.vinaenter.model.Contact;

@Service
public class ContactService implements ICRUDService<Contact> {

	@Autowired
	private ContactDAO contactDAO;

	@Override
	public List<Contact> getAll() {
		List<Contact> list = contactDAO.getAll();
		return list;
	}

	@Override
	public int update(Contact t) {
		return 0;
	}

	@Override
	public int save(Contact contact) {
		int rs = contactDAO.save(contact);
		return rs;
	}

	@Override
	public int del(int id) {
		return contactDAO.del(id);
	}

	@Override
	public Contact findOne(Contact t) {
		return null;
	}

	@Override
	public Contact findById(int id) {
		return null;
	}

	@Override
	public List<Contact> search(String content) {
		return null;
	}

	@Override
	public List<Contact> getList(int offset, int rowCount) {
		List<Contact> list = contactDAO.getList(offset, rowCount);
		return list;
	}
	
	public int totalRow() {
		return contactDAO.totalRow();
	}
	
	public List<Contact> search(String content, int offset, int rowCount) {
		List<Contact> list = contactDAO.search(content, offset, rowCount);
		return list;
	}
	
	public int totalRowSearch(String content) {
		return contactDAO.totalRowSearch(content);
	}

}
