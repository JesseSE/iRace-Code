package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.irace.dao.SubmitDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageRaceEntity;
import com.irace.entity.SubmitEntity;
import com.irace.entity.TeamEntity;

public class SubmitDaoImpl extends SDao implements SubmitDao{

	@Override
	public Integer addSubmit(SubmitEntity submit) {
		return (Integer)this.sessionFactory.getCurrentSession().save(submit);
	}

	@Override
	public boolean delSubmit(int id) {
		this.hql = "DELETE FROM SubmitEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public SubmitEntity getSubmit(int id) {
		this.hql = "FROM SubmitEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (SubmitEntity) query.uniqueResult();
	}

	@Override
	public SubmitEntity getSubmitDetail(int id) {
		this.hql = "FROM SubmitEntity AS s inner join fetch s.stageEntity AS st where s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (SubmitEntity)query.uniqueResult();
	}

	@Override
	public boolean updateSubmit(SubmitEntity submit) {
		sessionFactory.getCurrentSession().update(submit);
		return true;
	}

	@Override
	public List getSubmitByStage(int stageID) {
		this.hql = "FROM SubmitEntity AS s inner join fetch s.teamEntity WHERE s.stageId = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, stageID);
		return query.list();
	}

	@Override
	public List getSubmitList(int stageId, int pageNo, int pageItemNum) {
		this.hql = "FROM SubmitEntity WHERE stageId = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, stageId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getSubmitListDetail(int stageId, int pageNo, int pageItemNum) {
		this.hql = "FROM SubmitEntity AS s inner join fetch s.stageEntity AS st";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, stageId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getSubmitListByTeam(int teamId) {
		this.hql = "FROM SubmitEntity AS s inner join fetch s.teamEntity WHERE s.teamId = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, teamId);
		return null;
	}
	
	private List myList(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<SubmitEntity> it = list.iterator();
		while(it.hasNext()){
			Map<String, String> map = new HashMap<String, String>();
			SubmitEntity submit = it.next();
			map.put("teamName",submit.getTeamEntity().getName());
			map.put("name", submit.getName());
			map.put("content", submit.getContent());
			map.put("fileUrl", submit.getFileUrl());
			listMap.add(map);
		}
		return listMap;
	}

	@Override
	public SubmitEntity getSubmitByStageAndTeam(int stageId, int teamId) {
		this.hql = "FROM SubmitEntity AS s WHERE s.stageId=? and s.teamId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, stageId);
		query.setInteger(1, teamId);
		return (SubmitEntity) query.uniqueResult();
	}

}
