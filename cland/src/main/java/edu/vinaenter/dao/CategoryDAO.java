package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Category;

@Repository
public class CategoryDAO extends AbstractDAO<Category> {

	@Override
	public List<Category> getAll() {
		String sql = "SELECT * FROM categories ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
	}

	public List<Category> getAll2() {
		String sql = "SELECT categories.cid,cname,COUNT(lands.cid) FROM categories "
				+ "LEFT JOIN lands ON categories.cid = lands.cid "
				+ "GROUP BY lands.cid ORDER BY categories.cid DESC LIMIT 5";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Category>>() {
			List<Category> list = new ArrayList<Category>();

			@Override
			public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Category(rs.getInt("categories.cid"), rs.getString("cname"),
							rs.getInt("COUNT(lands.cid)")));
				}
				return list;
			}
		});
	}
	
	public List<Category> getCatHot() {
		String sql = "SELECT categories.cid,cname,COUNT(lands.cid) FROM categories "
				+ "LEFT JOIN lands ON categories.cid = lands.cid "
				+ "GROUP BY lands.cid ORDER BY COUNT(lands.cid) DESC LIMIT 5";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Category>>() {
			List<Category> list = new ArrayList<Category>();

			@Override
			public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Category(rs.getInt("categories.cid"), rs.getString("cname"),
							rs.getInt("COUNT(lands.cid)")));
				}
				return list;
			}
		});
	}
	
	@Override
	public int totalRow() {
		String sql = "SELECT COUNT(*) FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public List<Category> getList(int offset, int rowCount) {
		String sql = "SELECT * FROM categories ORDER BY cid DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), offset, rowCount);
	}

	@Override
	public Category findById(int id) {
		try {
			String sql = "SELECT * FROM categories WHERE cid = ?";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), id);
		} catch (Exception e) {
			System.out.println("Không có dữ liệu trong database");
		}
		return null;
	}

	@Override
	public int save(Category category) {
		String sql = "INSERT INTO categories(cname) VALUES (?)";
		return jdbcTemplate.update(sql, category.getCname());
	}

	@Override
	public int update(Category category) {
		String sql = "UPDATE categories SET cname = ? WHERE cid = ?";
		return jdbcTemplate.update(sql, category.getCname(), category.getCid());
	}

	@Override
	public int del(int id) {
		String sql = "DELETE FROM categories WHERE cid = ?";
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<Category> search(String content) {
		String sql = "SELECT * FROM categories WHERE cname LIKE ? ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), "%" + content + "%");
	}
	
	public List<Category> search(String content, int offset, int rowCount) {
		String sql = "SELECT * FROM categories WHERE cname LIKE ? ORDER BY cid DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class), "%" + content + "%", offset, rowCount);
	}
	
	public int totalRowSearch(String content) {
		String sql = "SELECT COUNT(*) FROM categories WHERE cname LIKE ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, "%" + content + "%");
	}

	public Category findByName(String cname) {
		try {
			String sql = "SELECT * FROM categories WHERE cname = ?";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Category.class), cname);
		} catch (Exception e) {
			System.out.println("Không có dữ liệu trong database");
		}
		return null;
	}

}
