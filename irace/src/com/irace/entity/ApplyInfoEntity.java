package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="apply_info")
public class ApplyInfoEntity implements IEntity{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer apply;//报名表，实体ApplyEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="apply",insertable=false,updatable=false)
	private ApplyEntity applyEntity;//报名表，实体ApplyEntity
	
	private Integer property; //资料属性，实体PropertyEntity
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="property",insertable=false,updatable=false)
	private PropertyEntity propertyEntity;//报名表，实体ApplyEntity
	
	private String value;
	

	public ApplyInfoEntity() {}	

	/**
	 * 创建报名要求实体,资料争对每一个报名的人
	 * @param apply ：所属的报名项
	 * @param property :需要填写的项目的编号
	 * @param value ：填写的内容
	 */
	public ApplyInfoEntity(Integer apply, Integer property, String value) {
		this.apply = apply;
		this.property = property;
		this.value = value;
	}
	
	/**
	 * 创建报名要求实体,资料争对每一个报名的人,内容放弃填写
	 * @param apply ：所属的报名项
	 * @param property :需要填写的项目的编号
	 */
	public ApplyInfoEntity(Integer apply, Integer property) {
		this.apply = apply;
		this.property = property;
		this.value = null;
	}
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
//	@ManyToOne(targetEntity=ApplyEntity.class)
//	@JoinColumn(name="id")
	public Integer getApply() {
		return apply;
	}

	public void setApply(Integer apply) {
		this.apply = apply;
	}

	
	/*
	 * ������ ��PropertyEntity
	 * ���һ
	 */
//	@ManyToOne(targetEntity=PropertyEntity.class)
//	@JoinColumn(name="id")
	public Integer getProperty() {
		return property;
	}

	public void setProperty(Integer property) {
		this.property = property;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public ApplyEntity getApplyEntity() {
		return applyEntity;
	}

	public void setApplyEntity(ApplyEntity applyEntity) {
		this.applyEntity = applyEntity;
	}

	public PropertyEntity getPropertyEntity() {
		return propertyEntity;
	}

	public void setPropertyEntity(PropertyEntity propertyEntity) {
		this.propertyEntity = propertyEntity;
	}
	
	
}
