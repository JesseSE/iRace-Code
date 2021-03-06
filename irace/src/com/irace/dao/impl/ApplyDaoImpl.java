package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.irace.dao.ApplyDao;
import com.irace.entity.ApplyEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.TeamEntity;

public class ApplyDaoImpl extends SDao implements ApplyDao{

	@Override
	public Integer addApply(ApplyEntity apply) {	
		return (Integer) this.sessionFactory.getCurrentSession().save(apply);
	}

	@Override
	public boolean delApply(int id) {
		this.hql = "DELETE FROM ApplyEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public ApplyEntity getApply(int id) {
		this.hql = "FROM ApplyEntity AS a WHERE a.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (ApplyEntity)query.uniqueResult();
	}

	@Override
	public ApplyEntity getApplyDetail(int id) {
		//this.hql = "FROM ApplyEntity WHERE a.id = ?";
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity AS u inner join fetch a.raceEntity AS r inner join fetch a.groupRaceEntity AS g inner join fetch a.teamEntity AS t where a.id = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (ApplyEntity)query.uniqueResult();	
	}

	@Override
	public List getApplyList(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getApplyListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity AS u inner join fetch a.raceEntity AS r inner join fetch a.groupRaceEntity AS g left join fetch a.teamEntity AS t";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateApply(ApplyEntity apply) {
		sessionFactory.getCurrentSession().update(apply);
//		this.hql = "UPDATE ApplyEntity AS a SET a.status = ? WHERE a.id = ?";
//		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
//		System.out.println(apply.getStatus()+""+apply.getId());
//		query.setInteger(0, apply.getStatus());
//		query.setInteger(1, apply.getId());
//		query.executeUpdate();
		return true;
	}
	
	
	@Override
	public List getTeamDetail(int userId, int raceId){
		this.hql = "FROM ApplyEntity AS a inner join fetch a.teamEntity AS t WHERE a.race = ? AND a.user=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);		
		query.setInteger(0, raceId);
		query.setInteger(1, userId);
		//List a = query.list();
		return query.list();
	}

	@Override
	public ApplyEntity getApply(int uid, int groupId) {
		// TODO Auto-generated method stub
		this.hql = "FROM ApplyEntity AS a WHERE a.user=? and a.groupId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, uid);
		query.setInteger(1, groupId);
		return (ApplyEntity)query.uniqueResult();
	}

}
