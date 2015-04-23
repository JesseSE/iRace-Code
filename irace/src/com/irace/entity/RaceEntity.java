/**
 * 
 */
package com.irace.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null; //主键	
	
	private Integer organizer;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="organizer",insertable=false,updatable=false)
	private OrganizerEntity organizerEntity;//
	
	private String name;
	
	private Integer type;//外键，比赛的分类
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="type",insertable=false,updatable=false)
	private TypeEntity typeEntity;
	
	private String grade;//比赛的级别
	
	@Column(name="pic_url")
	private String picUrl;
	
	@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	
	private int numRest;//比赛所允许的队伍最大人数
	
	private String content;//比赛简单介绍

	
	public RaceEntity(){}
	
	/**
	 * 新建一个赛
	 * @param organizer ：举办方
	 * @param name ：比赛的名字
	 * @param type ：比赛的类型
	 * @param grade :比赛的 级别
	 * @param picUrl ：比赛的logo
	 * @param startTime :比赛的开始时间
	 * @param endTime ：比赛的结束时间
	 * @param numRest ：比赛允许的每个队伍的最大人数
	 * @param content ：比赛的简单介绍
	 */
	public RaceEntity(Integer organizer, String name, Integer type, String grade, 
			String picUrl,Date startTime, Date endTime, int numRest,String content){
		this.organizer = organizer;
		this.name = name;
		this.type = type;
		this.grade = grade;
		this.picUrl = picUrl;
		this.startTime = startTime;
		this.endTime = endTime;
		this.numRest = numRest;
		this.content = content;
	}
	
	/**
	 * 新建一个赛
	 * @param organizer ：举办方
	 * @param name ：比赛的名字
	 */
	public RaceEntity(Integer organizer, String name){
		this.organizer = organizer;
		this.name = name;
		this.type = null;
		this.grade = null;
		this.picUrl = null;
		this.startTime = null;
		this.endTime = null;
		this.numRest = 0;
		this.content = null;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	/*
	 * ������ �ο��ٰ췽organizerEntity
	 */
//	@ManyToOne(targetEntity=OrganizerEntity.class)
//	@JoinColumn(name="id")
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
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

	public OrganizerEntity getOrganizerEntity() {
		return organizerEntity;
	}

	public void setOrganizerEntity(OrganizerEntity organizerEntity) {
		this.organizerEntity = organizerEntity;
	}
}
