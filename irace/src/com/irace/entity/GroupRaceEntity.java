package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="grouprace")
public class GroupRaceEntity implements IEntity{
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer race;//组别所属的比赛，外键实体是RaceEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="race",insertable=false,updatable=false)
	private RaceEntity raceEntity;
	
	private String name;
	
	private String require;

	
	public GroupRaceEntity(){}
	
	/**
	 * 为比赛新建一个比赛分类
	 * @param race ：比赛分类所属的比赛
	 * @param name ：比赛分类的名字
	 * @param require ：比赛分类的要求说明
	 */
	public GroupRaceEntity(Integer race, String name, String require){
		this.race = race;
		this.name = name;
		this.require = require;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * ������ �ο�����race
	 */
//	@ManyToOne(targetEntity=RaceEntity.class)
//	@JoinColumn(name="id")
	public Integer getRace() {
		return race;
	}

	public void setRace(Integer race) {
		this.race = race;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public RaceEntity getRaceEntity() {
		return raceEntity;
	}

	public void setRaceEntity(RaceEntity raceEntity) {
		this.raceEntity = raceEntity;
	}
	
	
}
