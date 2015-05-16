/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.PropertyEntity;

/**
 * @author Tracy
 *
 */
public interface PropertyService {

	public Integer addProperty(PropertyEntity property);
	
	public boolean delProperty(int id);
	
	public PropertyEntity getProperty(int id); //获取不包括外键实体
	
	public PropertyEntity getPropertyDetail(int id); //获取包括外键实体
	
	public List getPropertyList(int raceId); //获取不包括外键实体
	
	public List getPropertyListDetail(int raceId); //获取包括外键实体
	
	public boolean updateProperty(PropertyEntity property);
}
