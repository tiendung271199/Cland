package edu.vinaenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.dao.LandDAO;
import edu.vinaenter.model.Land;

@Service
public class LandService implements ICRUDService<Land> {

	@Autowired
	private LandDAO landDAO;

	@Override
	public List<Land> getAll() {
		List<Land> landList = landDAO.getAll();
		return landList;
	}

	@Override
	public int save(Land land) {
		int saveLand = landDAO.save(land);
		return saveLand;
	}

	@Override
	public int update(Land land) {
		return landDAO.update(land);
	}
	
	public int updateCountView(int countView, int lid) {
		return landDAO.updateCountView(countView, lid);
	}

	@Override
	public int del(int id) {
		return landDAO.del(id);
	}

	@Override
	public Land findOne(Land land) {
		return null;
	}

	@Override
	public Land findById(int id) {
		Land objLand = landDAO.findById(id);
		return objLand;
	}
	
	public List<Land> search(String content, int offset, int rowCount) {
		List<Land> searchLandList = landDAO.search(content, offset, rowCount);
		return searchLandList;
	}
	
	public int totalRowSearch(String content) {
		return landDAO.totalRowSearch(content);
	}

	// Get land list by category id
	public List<Land> getLandByCatId(int cid) {
		List<Land> landListByCatId = landDAO.getLandByCatId(cid);
		return landListByCatId;
	}

	// Get the most viewed land list
	public List<Land> getLandListByView() {
		List<Land> landListByView = landDAO.getLandListByView();
		return landListByView;
	}

	// Get land list relate
	public List<Land> getLandListRelate(int cid, int lid) {
		List<Land> landListRelate = landDAO.getLandListRelate(cid, lid);
		return landListRelate;
	}
	
	// phân trang
	@Override
	public List<Land> getList(int offset, int rowCount) {
		List<Land> list = landDAO.getList(offset, rowCount);
		return list;
	}
	
	public int totalRow() {
		return landDAO.totalRow();
	}
	
	public List<Land> getListByCat(int catID, int offset, int rowCount) {
		List<Land> list = landDAO.getListByCat(catID, offset, rowCount);
		return list;
	}
	
	public int totalRowByCat(int catID) {
		return landDAO.totalRowByCat(catID);
	}

	@Override
	public List<Land> search(String content) {
		return null;
	}

}
