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
@Table(name="message")
public class MessageEntity implements IEntity{

	public MessageEntity() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer sender;//外键参考用户表
	
	private Integer receiver;//外键参考用户表
	
	private Date time;
	
	private String content;
	
	private int status;//标识消息是否已经被查阅

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 添加外键 参考举办方UserEntity
	 */
	@ManyToOne(targetEntity=UserEntity.class)
	@JoinColumn(name="id")
	public Integer getSender() {
		return sender;
	}

	public void setSender(Integer sender) {
		this.sender = sender;
	}

	/*
	 * 添加外键 参考举办方UserEntity
	 */
	@ManyToOne(targetEntity=UserEntity.class)
	@JoinColumn(name="id")
	public Integer getReceiver() {
		return receiver;
	}

	public void setReceiver(Integer receiver) {
		this.receiver = receiver;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
