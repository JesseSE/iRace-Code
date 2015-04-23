package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.SubmitDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageEntity;
import com.irace.entity.SubmitEntity;

public class SubmitImpl extends SDao implements SubmitDao{

	@Override
	public Integer addSubmit(SubmitEntity submit) {
		return (Integer)this.sessionFactory.getCurrentSession().save(submit);
	}

	@Override
	public boolean delSubmit(int id) {
		this.hql = "DELETE FROM SubmitEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public SubmitEntity getSubmit(int id) {
		this.hql = "FROM SubmitEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (SubmitEntity) query.uniqueResult();
	}

	@Override
	public SubmitEntity getSubmitDetail(int id) {
		this.hql = "FROM SubmitEntity AS s inner join fetch stageEntity AS s where s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (SubmitEntity)query.uniqueResult();
	}

	@Override
	public List getSubmitList(int pageNo, int pageItemNum) {
		this.hql = "FROM SubmitEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getSubmitListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM SubmitEntity AS s inner join fetch stageEntity AS s";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateSubmit(SubmitEntity submit) {
		sessionFactory.getCurrentSession().update(submit);
		return true;
	}

}
