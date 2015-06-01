/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.SubmitEntity;

/**
 * @author Tracy
 *
 */
public interface SubmitService {

	public Integer addSubmit(SubmitEntity submit);
	
	public boolean delSubmit(int id);
	
	public SubmitEntity getSubmit(int id); //获取不包括外键实体
	
	public SubmitEntity getSubmitDetail(int id); //获取包括外键实体
	
	public List getSubmitList(int stageId, int pageNo); //获取不包括外键实体
	
	/**
	 * 根据阶段Id分页获取SubmitList，包括获取Submit的队伍信息
	 * @param stageId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public String getSubmitListDetail(int stageId, int pageNo, int pageItemNum); //获取包括外键实体
	
	/**
	 * 根据阶段Id直接获取所有的Submit
	 * @param stageID
	 * @return
	 */
	public List getSubmitByStage(int stageID);
	
	public boolean updateSubmit(SubmitEntity submit);
	
	/**
	 * 通过队伍查询该队伍的所有提交
	 * @param teamId
	 * @return
	 */
	public List getSubmitListByTeam(int teamId);
	
}

