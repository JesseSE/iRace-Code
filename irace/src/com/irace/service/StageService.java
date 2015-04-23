/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.StageEntity;

/**
 * @author Tracy
 *
 */
public interface StageService {

	public Integer addStage(StageEntity stage);
	
	public boolean delStage(int id);
	
	public StageEntity getStage(int id); //获取不包括外键实体
	
	public StageEntity getStageDetail(int id); //获取包括外键实体
	
	public List getStageList(int pageNo); //获取不包括外键实体
	
	public List getStageListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateStage(StageEntity stage);
}

