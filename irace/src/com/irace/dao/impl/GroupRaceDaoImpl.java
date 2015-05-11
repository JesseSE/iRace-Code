package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.GroupRaceDao;
import com.irace.entity.GroupRaceEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.UserEntity;

public class GroupRaceDaoImpl extends SDao implements GroupRaceDao{

	@Override
	public Integer addGroupRace(GroupRaceEntity groupRace) {
		return (Integer)this.sessionFactory.getCurrentSession().save(groupRace);
	}

	@Override
	public boolean delGroupRace(int id) {
		this.hql = "DELETE FROM GroupRaceEntity AS g WHERE g.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public GroupRaceEntity getGroupRace(int id) {
		this.hql = "FROM GroupRaceEntity AS g WHERE g.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (GroupRaceEntity) query.uniqueResult();
	}

	@Override
	public GroupRaceEntity getGroupRaceDetail(int id) {
		this.hql = "FROM GroupRaceEntity AS g inner join fetch g.raceEntity AS r where g.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (GroupRaceEntity)query.uniqueResult();	
	}

	@Override
	public List getGroupRaceList(int raceId) {
		this.hql = "FROM GroupRaceEntity as g where g.race=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, raceId);
		return query.list();
	}

	@Override
	public List getGroupRaceListDetail(int raceId) {
		this.hql = "FROM GroupRaceEntity AS g inner join fetch g.raceEntity AS r where g.race=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, raceId);
		return query.list();
	}

	@Override
	public boolean updateGroupRace(GroupRaceEntity groupRace) {
		sessionFactory.getCurrentSession().update(groupRace);
		return true;
	}

}
