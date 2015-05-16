package com.irace.service.impl;

import java.util.List;

import com.irace.dao.PropertyDao;
import com.irace.entity.PropertyEntity;
import com.irace.service.PropertyService;
import com.irace.util.JsonUtil;

public class PropertyServiceImpl implements PropertyService {

	private PropertyDao propertyDao;
	
	public void setPropertyDao(PropertyDao propertyDao) {
		this.propertyDao = propertyDao;
	}

	@Override
	public Integer addProperty(PropertyEntity property) {
		// TODO Auto-generated method stub
		return propertyDao.addProperty(property);
	}

	@Override
	public boolean delProperty(int id) {
		// TODO Auto-generated method stub
		return propertyDao.delProperty(id);
	}

	@Override
	public PropertyEntity getProperty(int id) {
		// TODO Auto-generated method stub
		return propertyDao.getProperty(id);
	}

	@Override
	public PropertyEntity getPropertyDetail(int id) {
		// TODO Auto-generated method stub
		return propertyDao.getPropertyDetail(id);
	}

	@Override
	public List getPropertyList(int raceId) {
		// TODO Auto-generated method stub
		List list = propertyDao.getPropertyList(raceId);
		//return JsonUtil.listToJSONString(list, new String[]{"raceEntity"});
		return list;
	}

	@Override
	public List getPropertyListDetail(int raceId) {
		// TODO Auto-generated method stub
		List list = propertyDao.getPropertyListDetail(raceId);
		//return JsonUtil.listToJSONString(list, null);
		return list;
	}

	@Override
	public boolean updateProperty(PropertyEntity property) {
		// TODO Auto-generated method stub
		return propertyDao.updateProperty(property);
	}

}
