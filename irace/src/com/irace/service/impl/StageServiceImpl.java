package com.irace.service.impl;

import java.util.List;

import com.irace.dao.StageDao;
import com.irace.entity.StageRaceEntity;
import com.irace.service.StageService;
import com.irace.util.JsonUtil;

public class StageServiceImpl implements StageService {

	private StageDao stageDao;
	
	public void setStageDao(StageDao stageDao) {
		this.stageDao = stageDao;
	}

	@Override
	public Integer addStage(StageRaceEntity stage) {
		// TODO Auto-generated method stub
		return stageDao.addStage(stage);
	}

	@Override
	public boolean delStage(int id) {
		// TODO Auto-generated method stub
		return stageDao.delStage(id);
	}

	@Override
	public StageRaceEntity getStage(int id) {
		// TODO Auto-generated method stub
		return stageDao.getStage(id);
	}

	@Override
	public StageRaceEntity getStageDetail(int id) {
		// TODO Auto-generated method stub
		return stageDao.getStageDetail(id);
	}

	@Override
	public List getStageList(int groupId) {
		// TODO Auto-generated method stub
		return stageDao.getStageList(groupId);
	}

	@Override
	public List getStageListDetail(int groupId) {
		// TODO Auto-generated method stub
		return stageDao.getStageListDetail(groupId);
	}

	@Override
	public boolean updateStage(StageRaceEntity stage) {
		// TODO Auto-generated method stub
		return stageDao.updateStage(stage);
	}

	@Override
	public String getStageByGroup(int groupID) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(stageDao.getStageByGroup(groupID), new String[]{});
	}

	@Override
	public StageRaceEntity getStageDetail(int groupId, int state) {
		// TODO Auto-generated method stub
		return stageDao.getStageDetail(groupId, state);
	}

}
