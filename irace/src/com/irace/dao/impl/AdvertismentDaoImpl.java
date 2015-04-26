package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.AdvertismentDao;
import com.irace.entity.AdvertismentEntity;
import com.irace.entity.RaceEntity;

public class AdvertismentDaoImpl extends SDao implements AdvertismentDao{

	@Override
	public Integer addAdvertisment(AdvertismentEntity advertisment) {
		return (Integer)this.sessionFactory.getCurrentSession().save(advertisment);
	}

	@Override
	public boolean delAdvertisment(int id) {
		this.hql = "DELETE FROM Advertisment AS a WHERE a.id=?";
        Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
        query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public AdvertismentEntity getAdvertisment(int id) {
		this.hql = "FROM Advertisment AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (AdvertismentEntity)query.uniqueResult();
	}

	@Override
	public AdvertismentEntity getAdvertismentDetail(int id) {
		this.hql = "FROM AdvertismentEntity AS a inner join fetch a.userEntity AS u where a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (AdvertismentEntity)query.uniqueResult();	
	}

	@Override
	public List getAdvertismentList(int pageNo, int pageItemNum) {
		this.hql = "FROM Advertisment";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getAdvertismentListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM AdvertismentEntity AS a inner join fetch a.userEntity AS u";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateAdvertisment(AdvertismentEntity advertisment) {
		sessionFactory.getCurrentSession().update(advertisment);
		return true;
	}

}
