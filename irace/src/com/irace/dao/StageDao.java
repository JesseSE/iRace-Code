package com.irace.dao;

import java.util.List;

import com.irace.entity.StageRaceEntity;

public interface StageDao {

	public Integer addStage(StageRaceEntity stage);
	
	public boolean delStage(int id);
	
	public StageRaceEntity getStage(int id); //获取不包括外键实体
	
	public StageRaceEntity getStageDetail(int id); //获取包括外键实体
	
	public List getStageList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getStageListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateStage(StageRaceEntity stage);
}

