package edu.vinaenter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Category;
import edu.vinaenter.model.Land;

@Repository
public class LandDAO extends AbstractDAO<Land> {

	@Override
	public List<Land> getAll() {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid ORDER BY lid DESC";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		});
	}

	// phân trang
	@Override
	public List<Land> getList(int offset, int rowCount) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid ORDER BY lid DESC LIMIT ?,?";
		// ResultSerSetExtractor => Join table
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, offset, rowCount);
	}

	@Override
	public int totalRow() {
		String sql = "SELECT COUNT(*) FROM lands INNER JOIN categories ON lands.cid = categories.cid";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	// phân trang
	public List<Land> getListByCat(int catID, int offset, int rowCount) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lands.cid = ? ORDER BY lid DESC LIMIT ?,?";
		// ResultSerSetExtractor => Join table
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, catID, offset, rowCount);
	}
	
	public int totalRowByCat(int catID) {
		String sql = "SELECT COUNT(*) FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lands.cid = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, catID);
	}

	@Override
	public Land findById(int id) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lid = ?";
		List<Land> list = jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, id);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int save(Land land) {
		String sql = "INSERT INTO lands(lname,description,cid,picture,area,address) VALUES (?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, land.getLname(), land.getDescription(), land.getCat().getCid(),
				land.getPicture(), land.getArea(), land.getAddress());
	}

	@Override
	public int update(Land land) {
		String sql = "UPDATE lands SET lname = ?, description = ?, cid = ?, picture = ?, area = ?, address = ? WHERE lid = ?";
		return jdbcTemplate.update(sql, land.getLname(), land.getDescription(), land.getCat().getCid(),
				land.getPicture(), land.getArea(), land.getAddress(), land.getLid());
	}

	public int updateCountView(int countView, int lid) {
		String sql = "UPDATE lands SET countView = ? WHERE lid = ?";
		return jdbcTemplate.update(sql, countView, lid);
	}

	@Override
	public int del(int id) {
		String sql = "DELETE FROM lands WHERE lid = ?";
		return jdbcTemplate.update(sql, id);
	}

	public List<Land> search(String content, int offset, int rowCount) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lname LIKE ? ORDER BY lid DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, "%" + content + "%", offset, rowCount);
	}
	
	public int totalRowSearch(String content) {
		String sql = "SELECT COUNT(*) FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lname LIKE ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, "%" + content + "%");
	}

	// Get land list by category id
	public List<Land> getLandByCatId(int cid) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lands.cid = ? ORDER BY lid DESC";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, cid);
	}

	// Get the most viewed land list
	public List<Land> getLandListByView() {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid ORDER BY countView DESC LIMIT 3";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		});
	}

	// Get land list relate
	public List<Land> getLandListRelate(int cid, int lid) {
		String sql = "SELECT * FROM lands INNER JOIN categories ON lands.cid = categories.cid WHERE lands.cid = ? AND lid != ? ORDER BY RAND() LIMIT 3";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Land>>() {
			List<Land> list = new ArrayList<Land>();

			@Override
			public List<Land> extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					list.add(new Land(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"),
							rs.getDate("dateCreate"), new Category(rs.getInt("cid"), rs.getString("cname")),
							rs.getString("picture"), rs.getInt("area"), rs.getString("address"),
							rs.getInt("countView")));
				}
				return list;
			}
		}, cid, lid);
	}

}
