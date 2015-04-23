package com.irace.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="notice")
public class NoticeEntity implements IEntity{
	public NoticeEntity(){}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer race; //通知所输的比赛
	
	private String title; //通知的标题
	
	private Date time; //通知发布时间
	
	private String content;//通知的内容

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 添加外键 参考比赛race
	 */
	@ManyToOne(targetEntity=RaceEntity.class)
	@JoinColumn(name="id")
	public Integer getRace() {
		return race;
	}

	public void setRace(Integer race) {
		this.race = race;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
