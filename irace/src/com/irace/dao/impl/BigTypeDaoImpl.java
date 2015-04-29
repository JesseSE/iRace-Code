package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.BigTypeDao;
import com.irace.entity.ApplyInfoEntity;
import com.irace.entity.BigTypeEntity;

public class BigTypeDaoImpl extends SDao implements BigTypeDao {

	@Override
	public Integer addBigType(BigTypeEntity bigType) {
		return (Integer)this.sessionFactory.getCurrentSession().save(bigType);
	}

	@Override
	public boolean delBigType(int id) {
		this.hql = "DELETE FROM BigTypeEntity AS b WHERE b.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public BigTypeEntity getBigType(int id) {
		this.hql = "FROM BigTypeEntity AS b WHERE b.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (BigTypeEntity)query.uniqueResult();
	}

	@Override
	public List getBigTypeListDetail() {
		this.hql = "FROM BigTypeEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		return query.list();
	}

	@Override
	public boolean updateBigType(BigTypeEntity bigType) {
		sessionFactory.getCurrentSession().update(bigType);
		return true;
	}

}
