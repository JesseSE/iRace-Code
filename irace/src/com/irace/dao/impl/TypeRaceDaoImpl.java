package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.TypeRaceDao;
import com.irace.entity.TypeRaceEntity;

public class TypeRaceDaoImpl extends SDao implements TypeRaceDao {

	@Override
	public Integer addTypeRace(TypeRaceEntity typeRace) {
		// TODO Auto-generated method stub
		return (Integer) sessionFactory.getCurrentSession().save(typeRace);
	}

	@Override
	public boolean delTypeRace(int id) {
		// TODO Auto-generated method stub
		hql = "delete from TypeRaceEntity as t where t.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public List getTypeRaceList(int bigTypeId) {
		// TODO Auto-generated method stub
		hql = "from TypeRaceEntity as t where t.bigType=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, bigTypeId);
		return query.list();
	}

	@Override
	public TypeRaceEntity getTypeRaceDetail(int id) {
		// TODO Auto-generated method stub
		hql = "from TypeRaceEntity as t inner fetch t.bigTypeEntity where t.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (TypeRaceEntity)query.uniqueResult();
	}

	@Override
	public boolean updateTypeRace(TypeRaceEntity typeRace) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(typeRace);
		return true;
	}

	@Override
	public TypeRaceEntity getTypeRace(int id) {
		// TODO Auto-generated method stub
		hql = "from TypeRaceEntity as t where t.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (TypeRaceEntity)query.uniqueResult();
	}

}
