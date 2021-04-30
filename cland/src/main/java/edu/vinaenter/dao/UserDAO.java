package edu.vinaenter.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.User;

@Repository
public class UserDAO extends AbstractDAO<User> {

	@Override
	public List<User> getAll() {
		String sql = "SELECT * FROM users ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
	}
	
	@Override
	public List<User> getList(int offset, int rowCount) {
		String sql = "SELECT * FROM users ORDER BY id DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), offset, rowCount);
	}
	
	@Override
	public int totalRow() {
		String sql = "SELECT COUNT(*) FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public User findById(int id) {
		try {
			String sql = "SELECT * FROM users WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
		} catch (Exception e) {
			System.out.println("No data in database");
		}
		return null;
	}

	@Override
	public int save(User user) {
		String sql = "INSERT INTO users(username,fullname,password) VALUES (?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(), user.getFullname(), user.getPassword());
	}
	
	public int save2(User user) {
		String sql = "INSERT INTO users(username,fullname,password,roleId) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(), user.getFullname(), user.getPassword(), user.getRoleId());
	}

	@Override
	public int update(User user) {
		String sql = "UPDATE users SET username = ?, fullname = ?, password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, user.getUsername(), user.getFullname(), user.getPassword(), user.getId());
	}

	@Override
	public int del(int id) {
		String sql = "DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(sql, id);
	}

	public List<User> search(String content, int offset, int rowCount) {
		String sql = "SELECT * FROM users WHERE username LIKE ? ORDER BY id DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), "%" + content + "%", offset, rowCount);
	}
	
	public int totalRowSearch(String content) {
		String sql = "SELECT COUNT(*) FROM users WHERE username LIKE ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, "%" + content + "%");
	}

	public User findUserByUsername(String username) {
		try {
			String sql = "SELECT * FROM users WHERE username = ?";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
		} catch (Exception e) {
			System.out.println("Không có dữ liệu trong database");
		}
		return null;
		
	}

}
