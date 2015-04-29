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
@Table(name="typerace")
public class TypeRaceEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id; //比赛分类的主键	
	private String name; //比赛分类的名字
	
	@Column(name="big_type")
	private Integer bigType; //比赛大分类外键
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="big_type",insertable=false,updatable=false) 
	private BigTypeEntity bigTypeEntity; //大分类实体
	
	public TypeRaceEntity() {}
	
	/**
	 * 新建小分类
	 * @param name
	 * @param bigType
	 */
	public TypeRaceEntity(String name, Integer bigType) {
		this.name = name;
		this.bigType = bigType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getBigType() {
		return bigType;
	}

	public void setBigType(Integer bigType) {
		this.bigType = bigType;
	}


	//@ManyToOne(cascade=CascadeType.ALL)
	//@JoinColumn(name="bigTypeEntityId")
	public BigTypeEntity getBigTypeEntity() {
		return bigTypeEntity;
	}

	public void setBigTypeEntity(BigTypeEntity bigTypeEntity) {
		this.bigTypeEntity = bigTypeEntity;
	}
}
