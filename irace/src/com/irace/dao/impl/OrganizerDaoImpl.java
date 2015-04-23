package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.OrganizerDao;
import com.irace.entity.OrganizerEntity;
import com.irace.entity.RaceEntity;


public class OrganizerDaoImpl extends SDao implements OrganizerDao {

	public OrganizerDaoImpl() {
		
	}

	
	@Override
	public Integer addOrganizer(OrganizerEntity organizer) {
		// TODO Auto-generated method stub
		return (Integer)this.sessionFactory.getCurrentSession().save(organizer);
	}

	@Override
	public boolean delOrganizer(int id) {
		this.hql = "DELETE FROM OrganizerEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}
	

	@Override
	public OrganizerEntity getOrganizer(int id) {
		this.hql = "FROM OrganizerEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, id);
		return (OrganizerEntity)query.uniqueResult();
	}


	@Override
	public OrganizerEntity getOrganizerDetail(int id) {
		return null;
	}


	@Override
	public List getOrganizerList(int pageNo, int pageItemNum) {		
		this.hql = "FROM OrganizerEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}


	@Override
	public List getOrganizerListDetail(int pageNo, int pageItemNum) {
		return null;
	}


	@Override
	public boolean updateOrganizer(OrganizerEntity organizer) {
		sessionFactory.getCurrentSession().update(organizer);
		return true;
	}

}
