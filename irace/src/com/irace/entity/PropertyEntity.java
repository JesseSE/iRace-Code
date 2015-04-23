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
@Table(name="property")
public class PropertyEntity implements IEntity{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer race;//属性所属的比赛
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="race", insertable=false,updatable=false)
	private RaceEntity raceEntity;
	
	private String name;
	
	private String require;
	

	public PropertyEntity() {}
	
	/**
	 * 新建一个属性
	 * @param race ：对应的比赛
	 * @param name ：属性的名称
	 * @param require ：属性的要求
	 */
	public PropertyEntity(Integer race, String name, String require) {
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

	@ManyToOne(targetEntity=RaceEntity.class)
	@JoinColumn(name="id")
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
	
	
}
