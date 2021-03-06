package com.irace.dao;

import java.util.List;

import com.irace.entity.ApplyEntity;

public interface ApplyDao {

	public Integer addApply(ApplyEntity apply);
	
	public boolean delApply(int id);
	
	public ApplyEntity getApply(int id); //获取不包括外键实体
	
	public ApplyEntity getApplyDetail(int id); //获取包括外键实体
	
	public List getApplyList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getApplyListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateApply(ApplyEntity apply);
	
	public List getTeamDetail(int userId, int raceId);//通过userId和raceId 获得用户所参加的组
	
	public ApplyEntity getApply(int uid, int groupId);
}