package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.ApplyInfoDao;
import com.irace.entity.ApplyInfoEntity;
import com.irace.entity.RaceEntity;

public class ApplyInfoDaoImpl extends SDao implements ApplyInfoDao{

	@Override
	public Integer addApplyInfo(ApplyInfoEntity applyInfo) {
		return (Integer) this.sessionFactory.getCurrentSession().save(applyInfo);
	}

	@Override
	public boolean delApplyInfo(int id) {
		this.hql = "DELETE FROM ApplyInfoEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public ApplyInfoEntity getApplyInfo(int id) {
		this.hql = "FROM ApplyInfoEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (ApplyInfoEntity)query.uniqueResult();
	}

	@Override
	public ApplyInfoEntity getApplyInfoDetail(int id) {
		this.hql = "FROM ApplyInfoEntity AS a inner join fetch a.applyEntity AS ap inner join fetch a.propertyEntity AS p where a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (ApplyInfoEntity)query.uniqueResult();	
	}

	@Override
	public List getApplyInfoList(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyInfoEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getApplyInfoListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyInfoEntity AS a inner join fetch a.applyEntity AS ap inner join fetch a.propertyEntity AS p";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateApplyInfo(ApplyInfoEntity applyInfo) {
		sessionFactory.getCurrentSession().update(applyInfo);
		return true;
	}
	

	

}
