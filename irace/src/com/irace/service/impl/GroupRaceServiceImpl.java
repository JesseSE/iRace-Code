package com.irace.service.impl;

import java.util.List;

import com.irace.dao.GroupRaceDao;
import com.irace.entity.GroupRaceEntity;
import com.irace.service.GroupRaceService;

public class GroupRaceServiceImpl implements GroupRaceService {

	private GroupRaceDao groupRaceDao;
	
	public void setGroupRaceDao(GroupRaceDao groupRaceDao) {
		this.groupRaceDao = groupRaceDao;
	}

	@Override
	public Integer addGroupRace(GroupRaceEntity groupRace) {
		// TODO Auto-generated method stub
		return groupRaceDao.addGroupRace(groupRace);
	}

	@Override
	public boolean delGroupRace(int id) {
		// TODO Auto-generated method stub
		return groupRaceDao.delGroupRace(id);
	}

	@Override
	public GroupRaceEntity getGroupRace(int id) {
		// TODO Auto-generated method stub
		return groupRaceDao.getGroupRace(id);
	}

	@Override
	public GroupRaceEntity getGroupRaceDetail(int id) {
		// TODO Auto-generated method stub
		return groupRaceDao.getGroupRaceDetail(id);
	}

	@Override
	public List getGroupRaceList(int raceId) {
		// TODO Auto-generated method stub
		return groupRaceDao.getGroupRaceList(raceId);
	}

	@Override
	public List getGroupRaceListDetail(int raceId) {
		// TODO Auto-generated method stub
		return groupRaceDao.getGroupRaceListDetail(raceId);
	}

	@Override
	public boolean updateGroupRace(GroupRaceEntity groupRace) {
		// TODO Auto-generated method stub
		return groupRaceDao.updateGroupRace(groupRace);
	}

}
