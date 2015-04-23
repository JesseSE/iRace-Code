package com.irace.dao.impl;

import java.util.List;

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
		this.hql = "FROM RewardEntity AS r inner join fetch groupRaceEntity AS g where r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (RewardEntity)query.uniqueResult();	
	}


	@Override
	public List getRewardList(int pageNo, int pageItemNum) {
		this.hql = "FROM RewardEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}
	

	@Override
	public List getRewardListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM RewardEntity AS r inner join fetch groupRaceEntity AS g";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	
	@Override
	public boolean updateReward(RewardEntity reward) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(reward);
		return true;
	}

}
