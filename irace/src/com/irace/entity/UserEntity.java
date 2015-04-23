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

import net.sf.json.JSONObject;

@Entity
@Table(name = "users")
public class UserEntity implements IEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null; //主键
	
	private String username;
	
	private String pwd;
	
	private String nickname;
	
	private Integer role; 
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="role",insertable=false,updatable=false)
	private RoleEntity roleEntity;
	
	private String tel;
	
	private String qq;
	
	private String email;
	
	@Column(name="pic_url")
	private String picUrl;	
	
	
	public UserEntity() {}
	
	/**
	 * 添加新的用户
	 * @param username ：用户名
	 * @param pwd ：用户密码
	 * @param nickname ：用户昵称
	 * @param role ：用户身份
	 * @param tel ：用户电话
	 * @param qq ：用户QQ
	 * @param email ：用户邮箱
	 * @param picUrl ：用户头像
	 */
	public UserEntity(String username, String pwd, String nickname, Integer role, String tel,
			String qq, String email, String picUrl) {
		this.username =username;
		this.pwd = pwd;
		this.nickname = nickname;
		this.role = role;
		this.tel = tel;
		this.qq = qq;
		this.email = email;
		this.picUrl = picUrl;
	}
	
	/**
	 * 添加新的用户
	 * @param username ：用户名
	 * @param pwd ：用户密码
	 */
	public UserEntity(String username, String pwd) {
		this.username =username;
		this.pwd = pwd;
		this.nickname = null;
		this.role = null;
		this.tel = null;
		this.qq = null;
		this.email = null;
		this.picUrl = null;
	}
	

	/**
	 * 添加新的用户
	 * @param username ：用户名
	 * @param pwd ：用户密码
	 * @param role ：用户身份
	 * @param email ：用户邮箱
	 */
	public UserEntity(String username, String pwd, Integer role, String email) {
		this.username =username;
		this.pwd = pwd;
		this.nickname = null;
		this.role = role;
		this.tel = null;
		this.qq = null;
		this.email = email;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

//	@ManyToOne(targetEntity=RoleEntity.class)
//	@JoinColumn(name="id")
	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public RoleEntity getRoleEntity() {
		return roleEntity;
	}

	public void setRoleEntity(RoleEntity roleEntity) {
		this.roleEntity = roleEntity;
	}
	
}
