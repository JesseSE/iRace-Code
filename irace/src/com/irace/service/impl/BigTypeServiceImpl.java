/**
 * 
 */
package com.irace.service.impl;

import java.util.List;

import com.irace.dao.BigTypeDao;
import com.irace.entity.BigTypeEntity;
import com.irace.service.BigTypeService;
import com.irace.util.JsonUtil;

/**
 * @author Tracy
 *
 */
public class BigTypeServiceImpl implements BigTypeService {

	private BigTypeDao bigTypeDao;
	
	public void setBigTypeDao(BigTypeDao bigTypeDao) {
		this.bigTypeDao = bigTypeDao;
	}

	
	@Override
	public Integer addBigType(BigTypeEntity bigType) {
		// TODO Auto-generated method stub
		return bigTypeDao.addBigType(bigType);
	}

	
	@Override
	public boolean delBigType(int id) {
		// TODO Auto-generated method stub
		return bigTypeDao.delBigType(id);
	}

	
	@Override
	public BigTypeEntity getBigType(int id) {
		// TODO Auto-generated method stub
		return bigTypeDao.getBigType(id);
	}

	
	@Override
	public String getBigTypeListDetail() {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(bigTypeDao.getBigTypeListDetail(), new String[]{"bigTypeEntity"});
	}

	
	@Override
	public boolean updateBigType(BigTypeEntity bigType) {
		// TODO Auto-generated method stub
		return bigTypeDao.updateBigType(bigType);
	}


	@Override
	public List getBigTypeList() {
		// TODO Auto-generated method stub
		return bigTypeDao.getBigTypeListDetail();
	}

}
