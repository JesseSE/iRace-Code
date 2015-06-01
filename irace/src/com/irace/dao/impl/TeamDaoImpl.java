package com.irace.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.irace.dao.TeamDao;
import com.irace.entity.ApplyEntity;
import com.irace.entity.GroupRaceEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageRaceEntity;
import com.irace.entity.TeamEntity;
import com.irace.entity.UserEntity;

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
		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.status = 3 and a.teamEntity.leader = a.user";
		//this.hql = "FROM ApplyEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		System.out.print(userId);
		
		return myTeamList(query.list());
		//return query.list();

	}

	@Override
	public List getJoinedTeamList(int userId, int pageNo, int pageItemNum) {

		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.teamEntity.leader <> a.user and a.status = 3 ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		System.out.println("joined");
		
		return myTeamList(query.list());

	}

	@Override
	public List getApplyingTeamList(int userId, int pageNo, int pageItemNum) {

		this.hql = "FROM ApplyEntity AS a inner join fetch a.userEntity inner join fetch a.raceEntity inner join fetch a.teamEntity WHERE a.user = ? and a.teamEntity.leader <> a.user and a.status = 2 and a.teamEntity.status = 1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userId);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		System.out.println("waitting");

		return myTeamList(query.list());
	}
	
	private void test(List list){
		if(list.isEmpty())
			System.out.print("null");
		else{
			Iterator<ApplyEntity> it = list.iterator();
			while(it.hasNext()){
				ApplyEntity ap = it.next();
				GroupRaceEntity group = new GroupRaceEntity();
				RaceEntity ra = ap.getRaceEntity();
				TeamEntity ta = ap.getTeamEntity();
				UserEntity ua = ap.getUserEntity();
				System.out.println(ap.getGroupRaceEntity().getName());
				System.out.println(ap.getRaceEntity().getName());
				System.out.println(ap.getTeamEntity().getName());
				System.out.println(ap.getUserEntity().getUsername());
			}
		}
			System.out.print("sss");
	}
	
	private List myTeamList(List list){
	List<Map> listMap = new ArrayList<Map>();
	Iterator<ApplyEntity> it = list.iterator();
	while(it.hasNext()){
		Map<String,String> map =new HashMap<String,String>();
		ApplyEntity ap = it.next();
		map.put("teamStatus", Integer.toString(ap.getTeamEntity().getStatus()));
		map.put("teamId", Integer.toString(ap.getTeamEntity().getId()));
		map.put("teamName",ap.getTeamEntity().getName());
		map.put("raceName", ap.getRaceEntity().getName());
		map.put("leaderName",ap.getTeamEntity().getUserEntity().getNickname());
		map.put("teamSlogan",ap.getTeamEntity().getSlogan());
		//数据库为空
		//map.put("reward",ap.getTeamEntity().getRewardEntity().getName());
		listMap.add(map);
	}
	return listMap;
	
    }
    //测试数据
	@Override
	public List getTeamListByGroup(int groupID) {
		//this.hql = "FROM TeamEntity AS t WHERE t.group = ? and t.status = 2";
		this.hql = "FROM TeamEntity AS t WHERE t.group = ? ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupID);
		return myGroupTeam(query.list());
	}

	@Override
	//测试
	public List getTeamListByGroup(int groupID, int status) {
		//this.hql = "FROM TeamEntity AS t WHERE t.group = ? and t.status = ?";
		this.hql = "FROM TeamEntity AS t WHERE t.group = ? ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, groupID);
		//query.setInteger(1, status);
		return myGroupTeam(query.list());
	}
	
	private List myGroupTeam(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<TeamEntity> it = list.iterator();
		while(it.hasNext()){
			TeamEntity team = it.next();
			Map<String, String> map = new HashMap<String, String>();
			map.put("groupID", Integer.toString(team.getGroup()));
			map.put("id",Integer.toString(team.getId()));
			map.put("name", team.getName());
			map.put("slogan", team.getSlogan());
			map.put("leader", team.getUserEntity().getNickname());
			map.put("leadId", Integer.toString(team.getLeader()));
			//map.put("reward",team.getRewardEntity().getName());
			listMap.add(map);
		}
		return listMap;	
	}

}
