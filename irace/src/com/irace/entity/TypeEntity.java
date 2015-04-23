package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import antlr.collections.List;

@Entity
@Table(name="type")
public class TypeEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id; //比赛分类的主键	
	private String name; //比赛分类的名字
	
//	private Integer inType; //该分类属于哪一个分类，参考TypeEntity，外键	
//	
//	@ManyToOne(fetch=FetchType.LAZY)
//	@JoinColumn(name="in_type",insertable=false,updatable=false)
//	private TypeEntity inTypeEntity; //分类所属外键，参考自己
//	
//	@OneToMany
//	private List hasTypeEntity;//该分类拥有的
//	
	public TypeEntity() {}
//	
//	/**
//	 * 增加比赛分类
//	 * @param name ：分类的名字
//	 * @param inType ：分类的父分类
//	 */
//	public TypeEntity(String name, Integer inType) {
//		this.name = name;
//		this.inType = inType;
//	}
//
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
//
//	public Integer getInType() {
//		return inType;
//	}
//
//	public void setInType(Integer inType) {
//		this.inType = inType;
//	}
//
//	public TypeEntity getInTypeEntity() {
//		return inTypeEntity;
//	}
//
//	public void setInTypeEntity(TypeEntity inTypeEntity) {
//		this.inTypeEntity = inTypeEntity;
//	}
	
}
