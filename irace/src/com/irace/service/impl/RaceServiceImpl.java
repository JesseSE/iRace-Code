/**
 * 
 */
package com.irace.service.impl;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.irace.dao.RaceDao;
import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;

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
	public String getRaceList(Integer pageNo) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(
				raceDao.getRaceList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM),
				new String[] { "typeRaceEntity", "organizerEntity" });

	}

	@Override
	public String getRaceList(Integer pageNo, int type) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceList(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, type), new String[] {
				"typeRaceEntity", "organizerEntity" });
	}

	@Override
	public String getRaceList(Integer pageNo, String keyword) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceList(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, keyword), new String[] {
				"typeRaceEntity", "organizerEntity" });
	}

	@Override
	public String getRaceListByGrade(Integer pageNo, String grade) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListByGrade(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, grade), new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListByTime(Integer pageNo, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListByTime(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, startTime, endTime),
				new String[] {"typeEntities"});
	}

	@Override
	public RaceEntity getRaceDetail(int id) {
		// TODO Auto-generated method stub
		return raceDao.getRaceDetail(id);
	}

	@Override
	public String getRaceListDetail(int pageNo) {
		// TODO Auto-generated method stub
		//return JsonUtil.listToJSONString(raceDao.getRaceListDetail(pageNo,
		//		Constants.DEFAULT_PAGE_ITEM_NUM), null);
		List list = raceDao.getRaceListDetail(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM);
		return JsonUtil.listToJSONString(list, new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListDetail(int pageNo, String keyword) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListDetail(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, keyword), new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedStartTime(int pageNo, boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedStartTime(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, isAsc),  new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedEndTime(int pageNo, boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedEndTime(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, isAsc),  new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedHotPoint(int pageNo, boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedHotPoint(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, isAsc), new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedStartTime(int pageNo, String keyword,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedStartTime(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, keyword, isAsc),
				 new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedEndTime(int pageNo, String keyword,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedEndTime(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, keyword, isAsc),
				 new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListBySortedHotPoint(int pageNo, String keyword,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListBySortedHotPoint(
				pageNo, Constants.DEFAULT_PAGE_ITEM_NUM, keyword, isAsc),
				 new String[] {"typeEntities"});
	}

	@Override
	public String getRaceListByUser(Integer pageNo, int userID) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(raceDao.getRaceListByUser(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, userID),  new String[] {"typeEntities"});
	}

}
