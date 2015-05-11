package com.irace.dao;

import java.util.List;

import com.irace.entity.RewardEntity;

public interface RewardDao {

	public Integer addReward(RewardEntity reward);
	
	public boolean delReward(int id);
	
	public RewardEntity getReward(int id); //获取不包括外键实体
	
	public RewardEntity getRewardDetail(int id); //获取包括外键实体
	
	public List getRewardListByGroup(int groupId); //获取不包括外键实体
	
	public List getRewardListDetailByGroup(int groupId); //获取包括外键实体
	
//	public List getRewardListByUser(int userId); //获取不包括外键实体
//	
//	public List getRewardListDetailByUser(int userId); //获取包括外键实体
	
	public boolean updateReward(RewardEntity reward);
}

