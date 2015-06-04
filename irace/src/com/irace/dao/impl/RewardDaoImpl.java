package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.irace.dao.RewardDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.RewardEntity;
import com.irace.entity.UserEntity;


public class RewardDaoImpl extends SDao implements RewardDao {

	public RewardDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Integer addReward(RewardEntity reward) {		
		return (Integer)this.sessionFactory.getCurrentSession().save(reward);
	}

	@Override
	public boolean delReward(int id) {
		this.hql = "DELETE FROM RewardEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;	
	}


	@Override
	public RewardEntity getReward(int id) {
		// TODO Auto-generated method stub
		this.hql = "FROM RewardEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (RewardEntity) query.uniqueResult();
	}

	@Override
	public RewardEntity getRewardDetail(int id) {
		this.hql = "FROM RewardEntity AS r inner join fetch r.groupRaceEntity AS g where r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (RewardEntity)query.uniqueResult();	
	}
	
	@Override
	public boolean updateReward(RewardEntity reward) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(reward);
		return true;
	}

	@Override
	public List getRewardListByGroup(int groupId) {
		// TODO Auto-generated method stub
		this.hql = "FROM RewardEntity AS r where r.groupId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupId);
		return query.list();
	}

	@Override
	public List getRewardListDetailByGroup(int groupId) {
		// TODO Auto-generated method stub
		this.hql = "FROM RewardEntity AS r inner join fetch r.groupRaceEntity AS g where r.groupId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupId);
		return query.list();
	}
	
	private List myReward(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<RewardEntity> it = list.iterator();
		while(it.hasNext()){
			Map<String, String> map = new HashMap<String, String>();
			RewardEntity reward = it.next();
			map.put("id", Integer.toString(reward.getId()));
			map.put("name", reward.getName());
			System.out.println("aaabbb");
			listMap.add(map);
		}
		return listMap;
	}

}
