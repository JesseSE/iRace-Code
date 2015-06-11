package com.irace.service.impl;

import java.util.List;

import com.irace.dao.ApplyInfoDao;
import com.irace.entity.ApplyInfoEntity;
import com.irace.service.ApplyInfoService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;

public class ApplyInfoServiceImpl implements ApplyInfoService {

	ApplyInfoDao applyInfoDao;
	
	public void setApplyInfoDao(ApplyInfoDao applyInfoDao) {
		this.applyInfoDao = applyInfoDao;
	}

	@Override
	public Integer addApplyInfo(ApplyInfoEntity applyInfo) {
		// TODO Auto-generated method stub
		return applyInfoDao.addApplyInfo(applyInfo);
	}

	@Override
	public boolean delApplyInfo(int id) {
		// TODO Auto-generated method stub
		return applyInfoDao.delApplyInfo(id);
	}

	@Override
	public ApplyInfoEntity getApplyInfo(int id) {
		// TODO Auto-generated method stub
		return applyInfoDao.getApplyInfo(id);
	}

	@Override
	public ApplyInfoEntity getApplyInfoDetail(int id) {
		// TODO Auto-generated method stub
		return applyInfoDao.getApplyInfoDetail(id);
	}

	@Override
	public List getApplyInfoList(int pageNo) {
		// TODO Auto-generated method stub
		return applyInfoDao.getApplyInfoList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public List getApplyInfoListDetail(int pageNo) {
		// TODO Auto-generated method stub
		return applyInfoDao.getApplyInfoListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public boolean updateApplyInfo(ApplyInfoEntity applyInfo) {
		// TODO Auto-generated method stub
		return applyInfoDao.updateApplyInfo(applyInfo);
	}

	@Override
	public String getApplyInfoListByAR(int applyID, int raceID) {
		// TODO Auto-generated method stub
		return JsonUtil.getJsonByMapList(applyInfoDao.getApplyInfoListByAR(applyID, raceID));
	}

}
