package com.irace.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="team")
public class TeamEntity implements IEntity{
	public TeamEntity(){}
	
	private Integer id = null;
	
	private Integer leader; //外键参考user
	
	private Integer group;//外键参考raceGroup
	
	private Integer reward;//外键参考reward
	
	private String name;
	
	@Column(name="pic_url")
	private String picUrl;
	
	private String slogan;//团队口号

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(targetEntity=UserEntity.class)
	@JoinColumn(name="id")
	public Integer getLeader() {
		return leader;
	}

	public void setLeader(Integer leader) {
		this.leader = leader;
	}

	@ManyToOne(targetEntity=GroupRaceEntity.class)
	@JoinColumn(name="id")
	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

	@ManyToOne(targetEntity=RewardEntity.class)
	@JoinColumn(name="id")
	public Integer getReward() {
		return reward;
	}

	public void setReward(Integer reward) {
		this.reward = reward;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getSlogan() {
		return slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	
	
}
