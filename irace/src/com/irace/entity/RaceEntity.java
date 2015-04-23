/**
 * 
 */
package com.irace.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Song
 *
 */
@Entity
@Table(name="race")
public class RaceEntity implements IEntity {
	public RaceEntity(){
	
	}
	
	private Integer id = null; //涓婚敭	
	
	private Integer organizer;
	
	private String name;
	
	private String type;//比赛的分类
	
	private String grade;//比赛的等级
	
	@Column(name="pic_url")
	private String picUrl;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	
	private int numRest;//每个队伍允许的参加人数
	
	private String content;//比赛的描述

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	/*
	 * 添加外键 参考举办方organizerEntity
	 */
	@ManyToOne(targetEntity=OrganizerEntity.class)
	@JoinColumn(name="id")
	public Integer getOrganizer() {
		return organizer;
	}

	public void setOrganizer(Integer organizer) {
		this.organizer = organizer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
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

	public int getNumRest() {
		return numRest;
	}

	public void setNumRest(int numRest) {
		this.numRest = numRest;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
