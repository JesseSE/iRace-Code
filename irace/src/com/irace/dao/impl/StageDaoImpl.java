package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.irace.dao.StageDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageRaceEntity;

public class StageDaoImpl extends SDao implements StageDao{

	@Override
	public Integer addStage(StageRaceEntity stage) {
		return (Integer)this.sessionFactory.getCurrentSession().save(stage);
	}

	@Override
	public boolean delStage(int id) {
		this.hql = "DELETE FROM StageRaceEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public StageRaceEntity getStage(int id) {
		this.hql = "FROM StageRaceEntity AS s WHERE s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (StageRaceEntity) query.uniqueResult();
	}

	@Override
	public StageRaceEntity getStageDetail(int id) {
		this.hql = "FROM StageRaceEntity AS s inner join fetch s.groupRaceEntity AS g where s.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (StageRaceEntity)query.uniqueResult();	
	}
	
	@Override
	public StageRaceEntity getStageDetail(int id, int state) {
		this.hql = "FROM StageRaceEntity AS s where s.id=? and s.status=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		query.setInteger(1, state);	
		return (StageRaceEntity)query.uniqueResult();	
	}

	@Override
	public List getStageList(int groupId) {
		this.hql = "FROM StageRaceEntity as s where s.groupId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupId);
		return query.list();
	}

	@Override
	public List getStageListDetail(int groupId) {
		this.hql = "FROM StageRaceEntity AS s inner join fetch s.groupRaceEntity AS g where s.groupId=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupId);
		return query.list();
	}

	@Override
	public boolean updateStage(StageRaceEntity stage) {
		sessionFactory.getCurrentSession().update(stage);
		return true;
	}

	@Override
	public List getStageByGroup(int groupID) {
		this.hql = "FROM StageRaceEntity AS s WHERE s.groupId = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupID);
		return query.list();
	}
	
	private List myStage(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<StageRaceEntity> it = list.iterator();
		while(it.hasNext()){
			StageRaceEntity stage = it.next();
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", Integer.toString(stage.getId()));
			map.put("name", stage.getName());
			map.put("status", Integer.toString(stage.getStatus()));
			//map.put("startTime", stage.getStartTime().toString());
			//map.put("endTime",stage.getEndTime().toString());
			//map.put("groupName", stage.getGroupRaceEntity().getName());
			listMap.add(map);
		}
		return listMap;	
	}
}
