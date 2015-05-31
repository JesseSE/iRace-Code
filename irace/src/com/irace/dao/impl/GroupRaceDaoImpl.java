package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
		return myGroupList(query.list());
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
	
	private List myGroupList(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<GroupRaceEntity> it = list.iterator();
		while(it.hasNext()){
			GroupRaceEntity group = it.next();
			Map<String,String> map = new HashMap<String,String>();
			map.put("id", Integer.toString(group.getId()));
			map.put("name",group.getName());
			map.put("status", Integer.toString(group.getStatus()));
			listMap.add(map);
		}
		return listMap;
		
	}

}
