package com.irace.service.impl;

import java.util.List;

import com.irace.dao.SubmitDao;
import com.irace.entity.SubmitEntity;
import com.irace.service.SubmitService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;

public class SubmitServiceImpl implements SubmitService {

	SubmitDao submitDao;
	
	public void setSubmitDao(SubmitDao submitDao) {
		this.submitDao = submitDao;
	}

	@Override
	public Integer addSubmit(SubmitEntity submit) {
		// TODO Auto-generated method stub
		return submitDao.addSubmit(submit);
	}

	@Override
	public boolean delSubmit(int id) {
		// TODO Auto-generated method stub
		return submitDao.delSubmit(id);
	}

	@Override
	public SubmitEntity getSubmit(int id) {
		// TODO Auto-generated method stub
		return submitDao.getSubmit(id);
	}

	@Override
	public SubmitEntity getSubmitDetail(int id) {
		// TODO Auto-generated method stub
		return submitDao.getSubmitDetail(id);
	}

	@Override
	public List getSubmitList(int stageId,int pageNo) {
		// TODO Auto-generated method stub
		return submitDao.getSubmitList(stageId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public String getSubmitListDetail(int stageId, int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		List list = submitDao.getSubmitListDetail(stageId, pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
		return JsonUtil.listToJSONString(list, null);
	}

	@Override
	public boolean updateSubmit(SubmitEntity submit) {
		// TODO Auto-generated method stub
		return submitDao.updateSubmit(submit);
	}

	@Override
	public List getSubmitListByTeam(int teamId) {
		// TODO Auto-generated method stub
		return submitDao.getSubmitListByTeam(teamId);
	}

	@Override
	public List getSubmitByStage(int stageID) {
		// TODO Auto-generated method stub
		return submitDao.getSubmitByStage(stageID);
	}

}
