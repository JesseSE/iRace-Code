/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.AdvertismentEntity;

/**
 * @author Tracy
 *
 */
public interface AdvertismentService {

	public Integer addAdvertisment(AdvertismentEntity advertisment);
	
	public boolean delAdvertisment(int id);
	
	public AdvertismentEntity getAdvertisment(int id); //获取不包括外键实体
	
	public AdvertismentEntity getAdvertismentDetail(int id); //获取包括外键实体
	
	public List getAdvertismentList(int pageNo); //获取不包括外键实体
	
	public List getAdvertismentListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateAdvertisment(AdvertismentEntity advertisment);
}
