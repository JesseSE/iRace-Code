/**
 * 
 */
package com.irace.service.impl;

import java.sql.Date;
import java.util.List;

import com.irace.dao.RaceDao;
import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
import com.irace.util.Constants;

/**
 * @author Tracy
 *
 */
public class RaceServiceImpl implements RaceService {

	RaceDao raceDao = null;
	
	public void setRaceDao(RaceDao raceDao) {
		this.raceDao = raceDao;
	}

	@Override
	public Integer addRace(RaceEntity race) {
		// TODO Auto-generated method stub
		return raceDao.addRace(race);
	}

	@Override
	public boolean delRace(Integer id) {
		// TODO Auto-generated method stub
		return raceDao.delRace(id);
	}

	@Override
	public boolean delRaceByType(int type) {
		// TODO Auto-generated method stub
		return raceDao.delRaceByType(type);
	}

	@Override
	public boolean updateRace(RaceEntity race) {
		// TODO Auto-generated method stub
		return raceDao.updateRace(race);
	}

	@Override
	public RaceEntity getRace(Integer id) {
		// TODO Auto-generated method stub
		return raceDao.getRace(id);
	}

	@Override
	public List getRaceList(Integer pageNo) {
		// TODO Auto-generated method stub
		return raceDao.getRaceList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public List getRaceList(Integer pageNo, int type) {
		// TODO Auto-generated method stub
		return raceDao.getRaceList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, type);
	}

	@Override
	public List getRaceList(Integer pageNo, String keyword) {
		// TODO Auto-generated method stub
		return raceDao.getRaceList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, keyword);
	}

	@Override
	public List getRaceListByGrade(Integer pageNo, String grade) {
		// TODO Auto-generated method stub
		return raceDao.getRaceListByGrade(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, grade);
	}

	@Override
	public List getRaceListByTime(Integer pageNo, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return raceDao.getRaceListByTime(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, startTime, endTime);
	}

	@Override
	public RaceEntity getRaceDetail(int id) {
		// TODO Auto-generated method stub
		return raceDao.getRaceDetail(id);
	}

	@Override
	public List getRaceListDetail(int pageNo) {
		// TODO Auto-generated method stub
		return raceDao.getRaceListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	

}
