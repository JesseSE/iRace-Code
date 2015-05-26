package com.irace.dao;

import java.util.List;

import com.irace.entity.ApplyInfoEntity;

public interface ApplyInfoDao {

	public Integer addApplyInfo(ApplyInfoEntity applyInfo);
	
	public boolean delApplyInfo(int id);
	
	public ApplyInfoEntity getApplyInfo(int id); //获取不包括外键实体
	
	public ApplyInfoEntity getApplyInfoDetail(int id); //获取包括外键实体
	
	public List getApplyInfoList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getApplyInfoListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateApplyInfo(ApplyInfoEntity applyInfo);
	
	public List getApplyInfoListByAR(int applyID,int raceID);
}
