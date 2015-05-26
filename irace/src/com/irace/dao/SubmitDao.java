package com.irace.dao;

import java.util.List;

import com.irace.entity.SubmitEntity;

public interface SubmitDao {

	public Integer addSubmit(SubmitEntity submit);
	
	public boolean delSubmit(int id);
	
	public SubmitEntity getSubmit(int id); //获取不包括外键实体
	
	public SubmitEntity getSubmitDetail(int id); //获取包括外键实体
	
	public List getSubmitList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getSubmitListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateSubmit(SubmitEntity submit);
	
	
	public List getSubmitByStage(int stageID);
}
