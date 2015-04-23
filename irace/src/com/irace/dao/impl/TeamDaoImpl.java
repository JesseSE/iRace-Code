package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.TeamDao;
import com.irace.entity.StageEntity;
import com.irace.entity.TeamEntity;

public class TeamDaoImpl extends SDao implements TeamDao{

	@Override
	public Integer addTeam(TeamEntity team) {
		return (Integer)this.sessionFactory.getCurrentSession().save(team);
	}

	@Override
	public boolean delTeam(int id) {
		this.hql = "DELETE FROM TeamEntity AS t WHERE t.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public TeamEntity getTeam(int id) {
		this.hql = "FROM TeamEntity AS t WHERE t.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (TeamEntity) query.uniqueResult();
	}

	@Override
	public TeamEntity getTeamDetail(int id) {
		this.hql = "FROM TeamEntity AS t inner join fetch userEntity AS u inner join fetch groupRaceEntity AS g left join fetch rewardEntity AS r where t.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (TeamEntity)query.uniqueResult();
	}

	@Override
	public List getTeamList(int pageNo, int pageItemNum) {
		this.hql = "FROM TeamEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getTeamListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM RaceEntity AS r inner join fetch organizerEntity AS oFROM TeamEntity AS t inner join fetch userEntity AS u inner join fetch groupRaceEntity AS g left join fetch rewardEntity AS r";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateTeam(TeamEntity team) {
		sessionFactory.getCurrentSession().update(team);
		return true;
	}

}
