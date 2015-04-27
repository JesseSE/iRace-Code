package com.irace.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="bigtype")
public class BigTypeEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id; //比赛大分类分类的主键	
	private String name; //比赛大分类分类的名字
	private Set<TypeEntity> typeEntities = new HashSet<TypeEntity>();  

	public BigTypeEntity() {}
	
	/**
	 * 兴建比赛大分类
	 */
	public BigTypeEntity(String name) {
		this.name = name;
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

	@OneToMany(mappedBy="bigTypeEntity")  
	public Set<TypeEntity> getTypeEntities() {
		return typeEntities;
	}

	public void setTypeEntities(Set<TypeEntity> typeEntities) {
		this.typeEntities = typeEntities;
	}

}
