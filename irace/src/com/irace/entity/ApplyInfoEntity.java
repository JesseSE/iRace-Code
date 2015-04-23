package com.irace.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="apply_info")
public class ApplyInfoEntity implements IEntity{

	public ApplyInfoEntity() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer apply;//外键参考报名表
	
	private Integer property; //外键参考资料属性
	
	private String value;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 表名表有多个报名资料
	 */
	@ManyToOne(targetEntity=ApplyEntity.class)
	@JoinColumn(name="id")
	public Integer getApply() {
		return apply;
	}

	public void setApply(Integer apply) {
		this.apply = apply;
	}

	
	/*
	 * 添加外键 参PropertyEntity
	 * 多对一
	 */
	@ManyToOne(targetEntity=PropertyEntity.class)
	@JoinColumn(name="id")
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
	
	
}
