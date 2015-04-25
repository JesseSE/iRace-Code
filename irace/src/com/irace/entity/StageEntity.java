package com.irace.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="stage")
public class StageEntity implements IEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer group; 
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="group",insertable=false,updatable=false)
	private GroupRaceEntity groupRaceEntity;
	
	private String name;
	
	private String content; 
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	
	public StageEntity(){}
	
	/**
	 * 为比赛的一个分组添加一个阶段
	 * @param group ：阶段所属的组
	 * @param name :阶段的名字
	 * @param content ：阶段的简单介绍
	 * @param startTime ：阶段的开始时间
	 * @param endTime ：阶段的结束时间
	 */
	public StageEntity(Integer group, String name, String content, Date startTime, Date endTime){
		this.group = group;
		this.name = name;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	/**
	 * 为比赛的一个分组添加一个阶段
	 * @param group ：阶段所属的组
	 * @param name :阶段的名字
	 * @param content ：阶段的简单介绍
	 */
	public StageEntity(Integer group, String name, String content){
		this.group = group;
		this.name = name;
		this.content = content;
		this.startTime = null;
		this.endTime = null;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
//	@ManyToOne
//	@JoinColumn(name="id")
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

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public GroupRaceEntity getGroupRaceEntity() {
		return groupRaceEntity;
	}

	public void setGroupRaceEntity(GroupRaceEntity groupRaceEntity) {
		this.groupRaceEntity = groupRaceEntity;
	}
	
	
}
