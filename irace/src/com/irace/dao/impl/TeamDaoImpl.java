package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.TeamDao;
import com.irace.entity.StageRaceEntity;
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
		this.hql = "FROM TeamEntity AS t inner join fetch t.userEntity AS u inner join fetch t.groupRaceEntity AS g left join fetch t.rewardEntity AS r where t.id=?";
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
		this.hql = "FROM TeamEntity AS t inner join fetch t.userEntity AS u inner join fetch t.groupRaceEntity AS g left join fetch t.rewardEntity AS r";
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

	@Override

	public List getCreatedTeamList(int userId, int pageNo, int pageItemNum) {	
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.status = 3";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		test(query.list());
		return query.list();

	}

	@Override
	public List getJoinedTeamList(int userId, int pageNo, int pageItemNum) {

		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.teamEntity.leader <> a.user and a.status = 3 and a.teamEntity.leader = a.user";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();	

	}

	@Override
	public List getApplyingTeamList(int userId, int pageNo, int pageItemNum) {

		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.teamEntity.leader <> a.user and a.status = 2";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();	
	}
	
	private void test(List list){
		if(list.isEmpty())
			System.out.print("null");
		else
			System.out.print("sss");
	}

}
