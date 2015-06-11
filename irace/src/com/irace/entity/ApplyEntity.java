package com.irace.entity;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

@Entity
@Table(name="apply")
public class ApplyEntity implements IEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer user;//报名比赛的人，实体是usersEntitty
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user",insertable=false,updatable=false)
	private UserEntity userEntity;//报名比赛的人，实体是usersEntitty
	
	private Integer race;//报名的比赛，实体是RaceEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="race",insertable=false,updatable=false)
	private RaceEntity raceEntity;//报名的比赛，实体是RaceEntity
	
	private Integer group;//报名的比赛的组别groupRace
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="group",insertable=false,updatable=false)
	private GroupRaceEntity groupRaceEntity;//报名的比赛的组别groupRace
	
	private Integer team;//所参加的队伍，可以为空，TeamEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="team",insertable=false,updatable=false)
	private TeamEntity teamEntity;//所参加的队伍，可以为空，TeamEntity
	
	private int status = 0;//报名的状态 , 0:报名但是为参加小组,1报名且已经发出进组申请, 2报名且已经加入一个小组	
	

	public ApplyEntity() {}
	
	/**
	 * 创建报名，使用全参数
	 * @param user ：报名比赛的人
	 * @param race ：报名参加的比赛
	 * @param group ：报名参加的组别
	 * @param team ：报名参加的小组
	 * @param status ：报名后的状态
	 */
	public ApplyEntity(Integer user, Integer race, Integer group, Integer team, int status){
		this.user = user;
		this.race = race;
		this.group = group;
		this.team = team;
		this.status = status;
	}
	
	/**
	 * 报名比赛了，但是还未选择参加哪一个小组
	 * @param user ：报名比赛的人
	 * @param race ：报名参加的比赛
	 * @param group ：报名参加的组别
	 * @param status ：报名的状态 , 0:报名但是为参加小组,1报名且已经发出进组申请, 2报名且已经加入一个小组	
	 */
	public ApplyEntity(Integer user, Integer race, Integer group, int status){
		this.user = user;
		this.race = race;
		this.group = group;
		this.team = null;
		this.status = status;
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	@ManyToOne(targetEntity=UserEntity.class)
//	@JoinColumn(name="id")
	public Integer getUser() {
		return user;
	}

	public void setUser(Integer user) {
		this.user = user;
	}

//	@ManyToOne(targetEntity=RaceEntity.class)
//	@JoinColumn(name="id")
	public Integer getRace() {
		return race;
	}

	public void setRace(Integer race) {
		this.race = race;
	}

//	@ManyToOne(targetEntity=GroupRaceEntity.class)
//	@JoinColumn(name="id")
	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

//	@ManyToOne(targetEntity=TeamEntity.class)
//	@JoinColumn(name="id")
	public Integer getTeam() {
		return team;
	}

	public void setTeam(Integer team) {
		this.team = team;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public RaceEntity getRaceEntity() {
		return raceEntity;
	}

	public void setRaceEntity(RaceEntity raceEntity) {
		this.raceEntity = raceEntity;
	}

	public GroupRaceEntity getGroupRaceEntity() {
		return groupRaceEntity;
	}

	public void setGroupRaceEntity(GroupRaceEntity groupRaceEntity) {
		this.groupRaceEntity = groupRaceEntity;
	}

	public TeamEntity getTeamEntity() {
		return teamEntity;
	}

	public void setTeamEntity(TeamEntity teamEntity) {
		this.teamEntity = teamEntity;
	}

	@Override
	public Map<String, Object> getMap() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("teamStatus",this.getStatus());
		map.put("teamId", this.getTeam());
		map.put("teamName",this.getTeamEntity().getName());
		map.put("raceName", this.getRaceEntity().getName());
		map.put("leaderName",this.getTeamEntity().getUserEntity().getNickname());
		map.put("teamSlogan",this.getTeamEntity().getSlogan());
		map.put("email",this.getUserEntity().getEmail());
		map.put("tel",this.getUserEntity().getTel());
		map.put("id", this.getId());
		map.put("raceId", this.getRace());
		map.put("userName", this.getUserEntity().getNickname());
		map.put("raceStatus", this.getRaceEntity().getStatus());
		map.put("leaderId", this.getTeamEntity().getLeader());
		map.put("status", this.getStatus());
		//map.put("reward",ap.getTeamEntity().getRewardEntity().getName());
		return map;
	}
	

}
