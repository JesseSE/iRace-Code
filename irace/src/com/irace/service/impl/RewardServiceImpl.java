package com.irace.service.impl;

import java.util.List;

import com.irace.dao.RewardDao;
import com.irace.entity.RewardEntity;
import com.irace.service.RewardService;

public class RewardServiceImpl implements RewardService {

	private RewardDao rewardDao;
	
	public void setRewardDao(RewardDao rewardDao) {
		this.rewardDao = rewardDao;
	}

	@Override
	public Integer addReward(RewardEntity reward) {
		// TODO Auto-generated method stub
		return rewardDao.addReward(reward);
	}

	@Override
	public boolean delReward(int id) {
		// TODO Auto-generated method stub
		return rewardDao.delReward(id);
	}

	@Override
	public RewardEntity getReward(int id) {
		// TODO Auto-generated method stub
		return rewardDao.getReward(id);
	}

	@Override
	public RewardEntity getRewardDetail(int id) {
		// TODO Auto-generated method stub
		return rewardDao.getRewardDetail(id);
	}

	@Override
	public List getRewardListByGroup(int groupId) {
		// TODO Auto-generated method stub
		return rewardDao.getRewardListByGroup(groupId);
	}

	@Override
	public List getRewardListDetailByGroup(int groupId) {
		// TODO Auto-generated method stub
		return rewardDao.getRewardListDetailByGroup(groupId);
	}

	@Override
	public List getRewardListByUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRewardListDetailByUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateReward(RewardEntity reward) {
		// TODO Auto-generated method stub
		return rewardDao.updateReward(reward);
	}

}
