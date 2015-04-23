package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.StageDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageEntity;

public class StageImpl extends SDao implements StageDao{

	@Override
	public Integer addStage(StageEntity stage) {
		return (Integer)this.sessionFactory.getCurrentSession().save(stage);
	}

	@Override
	public boolean delStage(int id) {
		this.hql = "DELETE FROM StageEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public StageEntity getStage(int id) {
		this.hql = "FROM StageEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (StageEntity) query.uniqueResult();
	}

	@Override
	public StageEntity getStageDetail(int id) {
		this.hql = "FROM StageEntity AS s inner join fetch groupRaceEntity AS g where s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (StageEntity)query.uniqueResult();	
	}

	@Override
	public List getStageList(int pageNo, int pageItemNum) {
		this.hql = "FROM StageEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getStageListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM StageEntity AS s inner join fetch groupRaceEntity AS g";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateStage(StageEntity stage) {
		sessionFactory.getCurrentSession().update(stage);
		return true;
	}
}
