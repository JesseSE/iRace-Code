package com.irace.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="submit")
public class SubmitEntity implements IEntity{
	public SubmitEntity(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer stagte;//外键，参考比赛阶段stageEntity
	
	private String name;
	
	private String content;
	
	@Column(name="file_url")
	private String fileUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * 多对一关系，一个阶段有多个提交物
	 */
	@ManyToOne(targetEntity=StageEntity.class)
	@JoinColumn(name="id")
	public Integer getStagte() {
		return stagte;
	}

	public void setStagte(Integer stagte) {
		this.stagte = stagte;
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

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
}
