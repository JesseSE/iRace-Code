package com.irace.service.impl;

import java.util.List;

import com.irace.dao.AdvertismentDao;
import com.irace.entity.AdvertismentEntity;
import com.irace.service.AdvertismentService;
import com.irace.util.Constants;

public class AdvertismentServiceImpl implements AdvertismentService {

	private AdvertismentDao advertismentDao;
	
	public void setAdvertismentDao(AdvertismentDao advertismentDao) {
		this.advertismentDao = advertismentDao;
	}

	@Override
	public Integer addAdvertisment(AdvertismentEntity advertisment) {
		// TODO Auto-generated method stub
		return advertismentDao.addAdvertisment(advertisment);
	}

	@Override
	public boolean delAdvertisment(int id) {
		// TODO Auto-generated method stub
		return advertismentDao.delAdvertisment(id);
	}

	@Override
	public AdvertismentEntity getAdvertisment(int id) {
		// TODO Auto-generated method stub
		return advertismentDao.getAdvertisment(id);
	}

	@Override
	public AdvertismentEntity getAdvertismentDetail(int id) {
		// TODO Auto-generated method stub
		return advertismentDao.getAdvertismentDetail(id);
	}

	@Override
	public List getAdvertismentList(int pageNo) {
		// TODO Auto-generated method stub
		return advertismentDao.getAdvertismentList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public List getAdvertismentListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		return advertismentDao.getAdvertismentListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public boolean updateAdvertisment(AdvertismentEntity advertisment) {
		// TODO Auto-generated method stub
		return advertismentDao.updateAdvertisment(advertisment);
	}

}
