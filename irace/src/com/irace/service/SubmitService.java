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
	
	public List getSubmitList(int pageNo); //获取不包括外键实体
	
	public List getSubmitListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateSubmit(SubmitEntity submit);
}

