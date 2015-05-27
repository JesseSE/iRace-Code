/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.ApplyInfoEntity;

/**
 * @author Tracy
 *
 */
public interface ApplyInfoService {

	public Integer addApplyInfo(ApplyInfoEntity applyInfo);
	
	public boolean delApplyInfo(int id);
	
	public ApplyInfoEntity getApplyInfo(int id); //获取不包括外键实体
	
	public ApplyInfoEntity getApplyInfoDetail(int id); //获取包括外键实体
	
	public List getApplyInfoList(int pageNo); //获取不包括外键实体
	
	public List getApplyInfoListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateApplyInfo(ApplyInfoEntity applyInfo);
	
	public String getApplyInfoListByAR(int applyID,int raceID);
}

