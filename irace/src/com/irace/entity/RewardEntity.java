package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="reward")
public class RewardEntity implements IEntity{
	public RewardEntity(){ }
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null; //奖项
	
	private Integer group; //奖项所属的比赛,外键
	
	private String name;//奖项的名称
	
	private String content;//奖项的描述

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 添加外键 参考比赛groupRace
	 */
	@ManyToOne(targetEntity=GroupRaceEntity.class)
	@JoinColumn(name="id")
	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
