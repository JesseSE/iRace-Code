package com.irace.entity;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*
 * author: song
 */
@Entity
@Table(name="notice")
public class NoticeEntity implements IEntity{
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer race; //ͨ比赛实体
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="race",insertable=false,updatable=false)
	private RaceEntity raceEntity;//ͨ通知所属的比赛的实体
	
	private String title; //ͨ通知的标题
	
	private Date time; //ͨ通知的时间
	
	private String content;//ͨ通知的内容
	
	public NoticeEntity(){}
	
	/**
	 * 创建新的公告
	 * @param race ：比赛外键
	 * @param title ：公告的标题
	 * @param time ：比赛公告发布的时间
	 * @param content ：比赛公告的内容
	 */
	public NoticeEntity(Integer race, String title, Date time, String content){
		this.race = race;
		this.title = title;
		this.time = time;
		this.content = content;
	}
	
	/**
	 * 创建新的公告
	 * @param race ：比赛外键
	 * @param title ：公告的标题
	 * @param content ：比赛公告的内容
	 */
	public NoticeEntity(Integer race, String title, String content){
		this.race = race;
		this.title = title;
		this.time = null;
		this.content = content;
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 
	 */
//	@ManyToOne(targetEntity=RaceEntity.class)
//	@JoinColumn(name="id")
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

	public RaceEntity getRaceEntity() {
		return raceEntity;
	}

	public void setRaceEntity(RaceEntity raceEntity) {
		this.raceEntity = raceEntity;
	}
	
	
}
