package com.irace.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="bigtype")
public class BigTypeEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id; //比赛大分类分类的主键	
	private String name; //比赛大分类分类的名字
	@OneToMany(fetch = FetchType.EAGER,targetEntity=TypeRaceEntity.class, cascade=CascadeType.ALL, mappedBy="bigTypeEntity")
	//@JoinColumns(value={@JoinColumn(name="id",referencedColumnName="id")})  
	private Set<TypeRaceEntity> typeEntities = new HashSet<TypeRaceEntity>();  

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

	//@OneToMany(mappedBy="bigTypeEntity", targetEntity=TypeEntity.class)
	//@JoinColumn(name="bigTypeEntityId")
	
	public Set<TypeRaceEntity> getTypeEntities() {
		return typeEntities;
	}

	public void setTypeEntities(Set<TypeRaceEntity> typeEntities) {
		this.typeEntities = typeEntities;
	}

}
