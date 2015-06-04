package com.irace.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
@Table(name="team")
public class TeamEntity implements IEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer leader; //队伍的创建者，队长
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="leader",insertable=false,updatable=false)
	private UserEntity userEntity;//队伍的创建者，队长
	
	private Integer group;//队伍所属的比赛的组别raceGroup
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="group",insertable=false,updatable=false)
	private GroupRaceEntity groupRaceEntity;//队伍所属的比赛的组别raceGroup
	
	private Integer reward;//队伍所获得奖项
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="reward",insertable=false,updatable=false)
	private RewardEntity rewardEntity;//队伍所获得奖项
	
	private String name;
	
	@Column(name="pic_url")
	private String picUrl;
	
	private String slogan;//队伍的口号
	
	private int status;
	
	public TeamEntity(){}
	
	/**
	 * 创建队伍
	 * @param leader ：队伍的创建者，队长
	 * @param group ：队伍所属的比赛的组
	 * @param reward ：队伍所获得的奖项
	 * @param name ：队伍的名字
	 * @param picUrl ：队伍的logo
	 * @param slogan ：队伍的口号
	 */
	public TeamEntity(Integer leader, Integer group, Integer reward,
			String name, String picUrl, String slogan){
		this.leader = leader;
		this.group = group;
		this.reward = reward;
		this.name = name;
		this.picUrl = picUrl;
		this.slogan = slogan;
	}
	
	/**
	 * 队长创建队伍,未设置获得奖项，为null
	 * @param leader ：队伍的创建者，队长
	 * @param group ：队伍所属的比赛的组
	 * @param name ：队伍的名字
	 * @param picUrl ：队伍的logo
	 * @param slogan ：队伍的口号
	 */
	public TeamEntity(Integer leader, Integer group,
			String name, String picUrl, String slogan){
		this.leader = leader;
		this.group = group;
		this.reward = null;
		this.name = name;
		this.picUrl = picUrl;
		this.slogan = slogan;
	}
	
	/**
	 * 队长创建队伍,未设置获得奖项，为null,未设置队伍logo和口号，都设置为null;
	 * @param leader ：队伍的创建者，队长
	 * @param group ：队伍所属的比赛的组
	 * @param name ：队伍的名字
	 */
	public TeamEntity(Integer leader, Integer group,String name){
		this.leader = leader;
		this.group = group;
		this.reward = null;
		this.name = name;
		this.picUrl = null;
		this.slogan = null;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	@ManyToOne(targetEntity=UserEntity.class)
//	@JoinColumn(name="id")
	public Integer getLeader() {
		return leader;
	}

	public void setLeader(Integer leader) {
		this.leader = leader;
	}

//	@ManyToOne(targetEntity=GroupRaceEntity.class)
//	@JoinColumn(name="id")
	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

//	@ManyToOne(targetEntity=RewardEntity.class)
//	@JoinColumn(name="id")
	public Integer getReward() {
		return reward;
	}

	public void setReward(Integer reward) {
		this.reward = reward;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getSlogan() {
		return slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public GroupRaceEntity getGroupRaceEntity() {
		return groupRaceEntity;
	}

	public void setGroupRaceEntity(GroupRaceEntity groupRaceEntity) {
		this.groupRaceEntity = groupRaceEntity;
	}

	public RewardEntity getRewardEntity() {
		return rewardEntity;
	}

	public void setRewardEntity(RewardEntity rewardEntity) {
		this.rewardEntity = rewardEntity;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public Map<String,Object> getMap() {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("", null);
		
		return map;
	}
	
	
}
