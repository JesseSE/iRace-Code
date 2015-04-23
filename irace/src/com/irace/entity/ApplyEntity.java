package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="apply")
public class ApplyEntity implements IEntity{

	public ApplyEntity() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer user;//外键参考用户表usersEntitty
	
	private Integer race;//外键参考比赛表
	
	private Integer group;//外键参考比赛组别groupRace
	
	private Integer team;//外键参考比赛队伍TeamEntity
	
	private int status;//标示用户报名状态太

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(targetEntity=UserEntity.class)
	@JoinColumn(name="id")
	public Integer getUser() {
		return user;
	}

	public void setUser(Integer user) {
		this.user = user;
	}

	@ManyToOne(targetEntity=RaceEntity.class)
	@JoinColumn(name="id")
	public Integer getRace() {
		return race;
	}

	public void setRace(Integer race) {
		this.race = race;
	}

	@ManyToOne(targetEntity=GroupRaceEntity.class)
	@JoinColumn(name="id")
	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

	@ManyToOne(targetEntity=TeamEntity.class)
	@JoinColumn(name="id")
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
	

}
