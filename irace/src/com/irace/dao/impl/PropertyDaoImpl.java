package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.PropertyDao;
import com.irace.entity.PropertyEntity;
import com.irace.entity.RaceEntity;

public class PropertyDaoImpl extends SDao implements PropertyDao{

	@Override
	public Integer addProperty(PropertyEntity property) {		
		return (Integer)this.sessionFactory.getCurrentSession().save(property);
	}

	@Override
	public boolean delProperty(int id) {
		this.hql = "DELETE FROM PropertyEntity AS p WHERE p.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public PropertyEntity getProperty(int id) {
		this.hql = "FROM PropertyEntity AS p WHERE p.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (PropertyEntity) query.uniqueResult();
	}

	@Override
	public PropertyEntity getPropertyDetail(int id) {
		this.hql = "FROM PropertEntity AS p inner join fetch raceEntity AS r where p.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (PropertyEntity)query.uniqueResult();	
	}

	@Override
	public List getPropertyList(int pageNo, int pageItemNum) {
		this.hql = "FROM PropertyEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getPropertyListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM PropertEntity AS p inner join fetch raceEntity AS r";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateProperty(PropertyEntity property) {
		sessionFactory.getCurrentSession().update(property);
		return true;
	}

}
