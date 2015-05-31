package com.irace.dao;

import java.util.List;

import com.irace.entity.SubmitEntity;

public interface SubmitDao {

	public Integer addSubmit(SubmitEntity submit);
	
	public boolean delSubmit(int id);
	
	public SubmitEntity getSubmit(int id); //获取不包括外键实体
	
	public SubmitEntity getSubmitDetail(int id); //获取包括外键实体
	
	public List getSubmitList(int stageId, int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getSubmitListDetail(int stageId, int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateSubmit(SubmitEntity submit);
	
	/**
	 * 通过队伍查询该队伍的所有提交
	 * @param teamId
	 * @return
	 */
	public List getSubmitListByTeam(int teamId);
	
	public List getSubmitByStage(int stageID);
}
