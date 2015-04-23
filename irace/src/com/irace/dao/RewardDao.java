package com.irace.dao;

import java.util.List;

import com.irace.entity.RewardEntity;

public interface RewardDao {

	public Integer addReward(RewardEntity reward);
	
	public boolean delReward(int id);
	
	public RewardEntity getReward(int id); //获取不包括外键实体
	
	public RewardEntity getRewardDetail(int id); //获取包括外键实体
	
	public List getRewardList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getRewardListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateReward(RewardEntity reward);
}

