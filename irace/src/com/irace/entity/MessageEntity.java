package com.irace.entity;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.collections.map.HashedMap;

@Entity
@Table(name="message")
public class MessageEntity implements IEntity{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer sender;//发送消息的人，外键实体为userEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sender",insertable=false,updatable=false)
	private UserEntity sUserEntity;
	
	private Integer receiver;//接收消息的人，外键的实体为userEntity 
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="receiver",insertable=false,updatable=false)
	private UserEntity rUserEntity;
	
	private Date time;
	
	private String content;
	
	private int status;//消息是否已经被阅读0,1


	public MessageEntity() {}
	
	/**
	 * 新建一个消息
	 * @param sender ：发送者
	 * @param receiver ：消息接受者
	 * @param time ：消息发送时的时间
	 * @param content ：消息的内容
	 * @param status ：消息的状态，是否被阅读
	 */
	public MessageEntity(Integer sender, Integer receiver, Date time, String content, int status) {
		this.sender = sender;
		this.receiver = receiver;
		this.time = time;
		this.content = content;
		this.status = status;
	}
	
	/**
	 * 新建一个消息,消息默认尚未阅读，默认是0
	 * @param sender ：发送者
	 * @param receiver ：消息接受者
	 * @param time ：消息发送时的时间
	 * @param content ：消息的内容
	 */
	public MessageEntity(Integer sender, Integer receiver, Date time, String content) {
		this.sender = sender;
		this.receiver = receiver;
		this.time = time;
		this.content = content;
		this.status = 0; //任然需要更改
	}
	
	/**
	 * 新建一个消息,消息默认尚未阅读，默认是0
	 * 时间是当前系统时间
	 * @param sender ：发送者
	 * @param receiver ：消息接受者
	 * @param content ：消息的内容
	 */
	public MessageEntity(Integer sender, Integer receiver, String content) {
		this.sender = sender;
		this.receiver = receiver;		
		this.content = content;
		this.time = new Date();//任然需要设置
		this.status = 0; //任然需要更改
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * ������ �ο��ٰ췽UserEntity
	 */
//	@ManyToOne(targetEntity=UserEntity.class)
//	@JoinColumn(name="id")
	public Integer getSender() {
		return sender;
	}

	public void setSender(Integer sender) {
		this.sender = sender;
	}

	/*
	 * ������ �ο��ٰ췽UserEntity
	 */
//	@ManyToOne(targetEntity=UserEntity.class)
//	@JoinColumn(name="id")
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

	public UserEntity getsUserEntity() {
		return sUserEntity;
	}

	public void setsUserEntity(UserEntity sUserEntity) {
		this.sUserEntity = sUserEntity;
	}

	public UserEntity getrUserEntity() {
		return rUserEntity;
	}

	public void setrUserEntity(UserEntity rUserEntity) {
		this.rUserEntity = rUserEntity;
	}

	@Override
	public Map<String, Object> getMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("messageId", this.getId());
		map.put("messageContent", this.getContent());
		map.put("messageTime", this.getTime());
		map.put("messageState", this.getStatus());
		map.put("senderId", this.getSender());
		map.put("senderName", this.getsUserEntity().getNickname());
		map.put("receiverId", this.getReceiver());
		map.put("receiverName", this.getrUserEntity().getNickname());
		return map;
	}
	
}
