package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.ApplyDao;
import com.irace.entity.ApplyEntity;
import com.irace.entity.RaceEntity;

public class ApplyDaoImpl extends SDao implements ApplyDao{

	@Override
	public Integer addApply(ApplyEntity apply) {	
		return (Integer) this.sessionFactory.getCurrentSession().save(apply);
	}

	@Override
	public boolean delApply(int id) {
		this.hql = "DELETE FROM ApplyEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public ApplyEntity getApply(int id) {
		this.hql = "FROM ApplyEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (ApplyEntity)query.uniqueResult();
	}

	@Override
	public ApplyEntity getApplyDetail(int id) {
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity AS u inner join fetch a.raceEntity AS r inner join fetch a.groupRaceEntity AS g left join fetch a.teamEntity AS t where a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (ApplyEntity)query.uniqueResult();	
	}

	@Override
	public List getApplyList(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getApplyListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity AS u inner join fetch a.raceEntity AS r inner join fetch a.groupRaceEntity AS g left join fetch a.teamEntity AS t";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateApply(ApplyEntity apply) {
		sessionFactory.getCurrentSession().update(apply);
		return true;
	}
	
	

}
