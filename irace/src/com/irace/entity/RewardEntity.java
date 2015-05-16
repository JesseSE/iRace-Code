package com.irace.entity;

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
@Table(name="reward")
public class RewardEntity implements IEntity{
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id = null; 
	
	private Integer groupId; //奖项所争对的比赛组别
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="groupId",insertable=false,updatable=false)
	private GroupRaceEntity groupRaceEntity;//奖项所争对的比赛组别
	
	private String name;//奖项的名字
	
	private String content;//奖项描述
	
	@Column(name = "status", columnDefinition = "int default 0")
	private int status; //奖项状态默认为0未颁奖
	
	public RewardEntity(){}
	
	/**
	 * 为比赛的组新建一个奖项
	 * @param group :奖项所属的比赛
	 * @param name ：奖项的名字
	 * @param content ：奖项的描述
	 */
	public RewardEntity(Integer groupId, String name, String content){ 
		this.groupId = groupId;
		this.name = name;
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	@ManyToOne(targetEntity=GroupRaceEntity.class)
//	@JoinColumn(name="id")
	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public GroupRaceEntity getGroupRaceEntity() {
		return groupRaceEntity;
	}

	public void setGroupRaceEntity(GroupRaceEntity groupRaceEntity) {
		this.groupRaceEntity = groupRaceEntity;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
