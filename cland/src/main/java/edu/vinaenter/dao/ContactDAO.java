package edu.vinaenter.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Contact;

@Repository
public class ContactDAO extends AbstractDAO<Contact> {
	
	@Override
	public List<Contact> getAll() {
		String sql = "SELECT * FROM vnecontact ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Contact.class));
	}
	
	@Override
	public List<Contact> getList(int offset, int rowCount) {
		String sql = "SELECT * FROM vnecontact ORDER BY cid DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Contact.class), offset, rowCount);
	}
	
	@Override
	public int totalRow() {
		String sql = "SELECT COUNT(*) FROM vnecontact";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	@Override
	public int save(Contact contact) {
		String sql = "INSERT INTO vnecontact(fullname,email,subject,content) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, contact.getFullname(), contact.getEmail(), contact.getSubject(), contact.getContent());
	}
	
	@Override
	public int del(int id) {
		String sql = "DELETE FROM vnecontact WHERE cid = ?";
		return jdbcTemplate.update(sql, id);
	}
	
	@Override
	public List<Contact> search(String content) {
		String sql = "SELECT * FROM vnecontact WHERE fullname LIKE ? ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Contact.class), "%" + content + "%");
	}
	
}
