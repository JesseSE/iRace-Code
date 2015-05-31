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
	
	@Column(name="stage_id")
	private Integer stageId;
	
	@ManyToOne(fetch=FetchType.LAZY, targetEntity=StageRaceEntity.class)	
	@JoinColumn(name="stage_id",insertable=false,updatable=false)
	private StageRaceEntity stageEntity;
	
	@Column(name = "team_id")
	private Integer teamId;
	
	@ManyToOne(fetch=FetchType.LAZY, targetEntity = TeamEntity.class)
	@JoinColumn(name="team_id",insertable=false,updatable=false)
	private TeamEntity teamEntity;
	
	private String name;
	
	@Column(name = "status", columnDefinition = "int default 0")
	private int status;//淘汰的状态0,1
	
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
	public SubmitEntity(Integer stageId, String name, String content, String fileUrl){
		this.stageId = stageId;
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
	public SubmitEntity(Integer stageId, String name, String content){
		this.stageId = stageId;
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


	public Integer getStagte() {
		return stageId;
	}

	public void setStagte(Integer stageId) {
		this.stageId = stageId;
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

	public StageRaceEntity getStageEntity() {
		return stageEntity;
	}

	public void setStageEntity(StageRaceEntity stageEntity) {
		this.stageEntity = stageEntity;
	}

	public Integer getStageId() {
		return stageId;
	}

	public void setStageId(Integer stageId) {
		this.stageId = stageId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
