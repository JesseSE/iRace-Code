package com.irace.service.impl;

import java.util.List;

import com.irace.dao.TeamDao;
import com.irace.entity.TeamEntity;
import com.irace.service.TeamService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;

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
	public String getTeamList(int pageNo) {
		// TODO Auto-generated method stub
//		return JsonUtil.listToJSONString(teamDao.getTeamList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), 
//				new String[]{"RewardEntity","userEntity","groupRaceEntity","rewardEntity"});
		return JsonUtil.getJsonByMapList(teamDao.getTeamList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM));
	}

	@Override
	public String getTeamListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
//		return JsonUtil.listToJSONString(teamDao.getTeamListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), 
//				new String[]{"RewardEntity","userEntity","groupRaceEntity","rewardEntity"});
		return JsonUtil.getJsonByMapList(teamDao.getTeamListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM));
	}

	@Override
	public boolean updateTeam(TeamEntity team) {
		// TODO Auto-generated method stub
		return teamDao.updateTeam(team);
	}

	@Override
	public String getCreatedTeamList(int userId, int pageNo) {
		// TODO Auto-generated method stub
//		return JsonUtil.listToJSONString(teamDao.getCreatedTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), 
//				new String[]{"RewardEntity","userEntity","groupRaceEntity","rewardEntity"});
		return JsonUtil.getJsonByMapList(teamDao.getCreatedTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM));
	}

	@Override
	public String getJoinedTeamList(int userId, int pageNo) {
		// TODO Auto-generated method stub
//		return JsonUtil.listToJSONString(teamDao.getJoinedTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), 
//				new String[]{"RewardEntity","userEntity","groupRaceEntity","rewardEntity"});
		return JsonUtil.getJsonByMapList(teamDao.getJoinedTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM));
	}

	@Override
	public String getApplyingTeamList(int userId, int pageNo) {
		// TODO Auto-generated method stub
//		return JsonUtil.listToJSONString(teamDao.getApplyingTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), 
//				new String[]{"RewardEntity","userEntity","groupRaceEntity","rewardEntity"});
		return JsonUtil.getJsonByMapList(teamDao.getApplyingTeamList(userId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM));
	}

	@Override
	public String getTeamListByGroup(int groupID) {
		// TODO Auto-generated method stub
		//return JsonUtil.listToJSONString(teamDao.getTeamListByGroup(groupID), new String[]{});
		return JsonUtil.getJsonByMapList(teamDao.getTeamListByGroup(groupID));
	}

	@Override
	public String getTeamListByGroup(int groupID, int status) {
		// TODO Auto-generated method stub
		//return JsonUtil.listToJSONString(teamDao.getTeamListByGroup(groupID, status), new String[]{});
		return JsonUtil.getJsonByMapList(teamDao.getTeamListByGroup(groupID, status));
	}

	@Override
	public List getTeamEntityListByGroup(int groupID, int status) {
		// TODO Auto-generated method stub
		return teamDao.getTeamDetailListByGroup(groupID, status);
	}



}
