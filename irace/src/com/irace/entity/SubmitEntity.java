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
@Table(name="submit")
public class SubmitEntity implements IEntity{
		
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id = null;
	
	private Integer stagte;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="stagte",insertable=false,updatable=false)
	private StageEntity stageEntity;//���ʵ��	
	
	private String name;
	
	private String content;
	
	@Column(name="file_url")
	private String fileUrl;

	public SubmitEntity(){}
	
	/**
	 * 阶段性提交物,包含附件
	 * @param stagte ：所属阶段
	 * @param name ：提交物名称
	 * @param content ：提交无描述
	 * @param fileUrl ：提交物存放路径
	 */
	public SubmitEntity(Integer stagte, String name, String content, String fileUrl){
		this.stagte = stagte;
		this.name = name;
		this.content = content;
		this.fileUrl = fileUrl;
	}
	
	/**
	 * 阶段性提交物,不包含附件
	 * @param stagte ：所属阶段
	 * @param name ：提交物名称
	 * @param content ：提交无描述
	 */
	public SubmitEntity(Integer stagte, String name, String content){
		this.stagte = stagte;
		this.name = name;
		this.content = content;
		this.fileUrl = null;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*
	 * ���һ��ϵ��һ���׶��ж���ύ��
	 */
//	@ManyToOne(targetEntity=StageEntity.class)
//	@JoinColumn(name="id")
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

	public StageEntity getStageEntity() {
		return stageEntity;
	}

	public void setStageEntity(StageEntity stageEntity) {
		this.stageEntity = stageEntity;
	}
}
