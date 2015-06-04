package com.irace.entity;

import java.util.Map;

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
@Table(name="advertisment")
public class AdvertismentEntity implements IEntity{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer publisher;//发布广告的用户userEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="publisher",insertable=false,updatable=false)	
	private UserEntity userEntity;//发布广告的用户userEntity
	
	private String link;
	
	@Column(name="pic_url")
	private String picUrl;
	
	private String content;

	

	public AdvertismentEntity() {}
	
	/**
	 * 构造一个新的广告，全参数
	 * @param publisher :广告的发布者
	 * @param link :广告的链接
	 * @param picUrl :广告的图片链接
	 * @param content :广告的说明
	 */
	public AdvertismentEntity(Integer publisher, String link, String picUrl, String content){
		this.publisher = publisher;
		this.link = link;
		this.picUrl = picUrl;
		this.content = content;	
	}
	
	/**
	 * 创建一个不带说明的广告
	 * @param publisher ：广告的发布者
	 * @param link ：广告的链接
	 * @param picUrl ：广告的图片
	 */
	public AdvertismentEntity(Integer publisher, String link, String picUrl){
		this.publisher = publisher;
		this.link = link;
		this.picUrl = picUrl;
		this.content = null;	
	}
	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	@ManyToOne(targetEntity=UserEntity.class)
//	@JoinColumn(name="id")
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

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	@Override
	public Map<String, Object> getMap() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
