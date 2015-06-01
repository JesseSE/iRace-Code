/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.BigTypeEntity;

/**
 * @author Tracy
 *
 */
public interface BigTypeService {
	
	public Integer addBigType(BigTypeEntity bigType);
	
	public boolean delBigType(int id);
	
	public BigTypeEntity getBigType(int id);
	
	/**
	 * 一次性获取全部的分类 此方法会将大分类下的小分类一起获取
	 * @return
	 */
	public String getBigTypeListDetail();
	
	public List getBigTypeList();
	
	public boolean updateBigType(BigTypeEntity bigType);
}
