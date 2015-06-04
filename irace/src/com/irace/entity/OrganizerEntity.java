package com.irace.entity;

import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="organizer")
public class OrganizerEntity implements IEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null; //主键
	
	private String username;
	
	private String pwd;
	
	private String name;
	
	private String tel;
	
	private String email;
	
	private String city;
	
	private String comment;//�ٰ췽������
	
	@Column(name="pic_url")
	private String picUrl;//比赛主办方的logo
	
	public OrganizerEntity(){}
	
	/**
	 * 新建一个比赛举办方，主要用于比赛举办方注册模块
	 * @param username ：用户名
	 * @param pwd ：用户密码
	 * @param name ：机构名称
	 * @param city ：所在的城市
	 * @param comment ：简单的说明
	 * @param picUrl ：logo的存储位置
	 */
	public OrganizerEntity(String username, String pwd, String name, String city, String comment,String picUrl){
		this.username = username;
		this.pwd = pwd;
		this.name = name;
		this.city = city;
		this.comment = comment;
		this.picUrl = picUrl;		
	}
	
	/**
	 * 新建一个比赛举办方，主要用于比赛举办方注册模块
	 * @param username ：用户名
	 * @param pwd ：用户密码
	 */
	public OrganizerEntity(String username, String pwd){
		this.username = username;
		this.pwd = pwd;
		this.name = null;
		this.city = null;
		this.comment = null;
		this.picUrl = null;		
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public Map<String, Object> getMap() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
