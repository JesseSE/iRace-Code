package com.irace.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="advertisment")
public class AdvertismentEntity implements IEntity {

	public AdvertismentEntity() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer publisher;//外键，参考用户表userEntity
	
	private String link;
	
	@Column(name="pic_url")
	private String picUrl;
	
	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(targetEntity=UserEntity.class)
	@JoinColumn(name="id")
	public Integer getPublisher() {
		return publisher;
	}

	public void setPublisher(Integer publisher) {
		this.publisher = publisher;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

}
