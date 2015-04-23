package com.irace.service.impl;

import java.util.List;

import com.irace.dao.TeamDao;
import com.irace.entity.TeamEntity;
import com.irace.service.TeamService;
import com.irace.util.Constants;

public class TeamServiceImpl implements TeamService {

	private TeamDao teamDao;
	
	public void setTeamDao(TeamDao teamDao) {
		this.teamDao = teamDao;
	}

	@Override
	public Integer addTeam(TeamEntity team) {
		// TODO Auto-generated method stub
		return teamDao.addTeam(team);
	}

	@Override
	public boolean delTeam(int id) {
		// TODO Auto-generated method stub
		return teamDao.delTeam(id);
	}

	@Override
	public TeamEntity getTeam(int id) {
		// TODO Auto-generated method stub
		return teamDao.getTeam(id);
	}

	@Override
	public TeamEntity getTeamDetail(int id) {
		// TODO Auto-generated method stub
		return teamDao.getTeamDetail(id);
	}

	@Override
	public List getTeamList(int pageNo) {
		// TODO Auto-generated method stub
		return teamDao.getTeamList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public List getTeamListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		return teamDao.getTeamListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public boolean updateTeam(TeamEntity team) {
		// TODO Auto-generated method stub
		return false;
	}

}
