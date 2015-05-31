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

import com.irace.util.Constants;
import com.irace.util.TimeUtil;

@Entity
@Table(name="stagerace")
public class StageRaceEntity implements IEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	@Column(name="group_id")
	private Integer groupId;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="group_id",insertable=false,updatable=false)
	private GroupRaceEntity groupRaceEntity;
	
	private String name;
	
	private String content;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	
	
	@Column(name="status", columnDefinition="int default 0")
	private int status;//审核状态
	
	public StageRaceEntity(){}
	
	/**
	 * 为比赛的一个分组添加一个阶段
	 * @param group ：阶段所属的组
	 * @param name :阶段的名字
	 * @param content ：阶段的简单介绍
	 * @param startTime ：阶段的开始时间
	 * @param endTime ：阶段的结束时间
	 */
	public StageRaceEntity(Integer groupId, String name, String content, Date startTime, Date endTime){
		this.groupId = groupId;
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
	public StageRaceEntity(Integer groupId, String name, String content){
		this.groupId = groupId;
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
	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getStrTime(Date date) {
		return TimeUtil.formatDateToStr(date, Constants.DEDAULT_DATE_FORMAT);
	}
}
