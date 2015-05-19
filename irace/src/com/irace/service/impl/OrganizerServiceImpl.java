package com.irace.service.impl;

import java.util.List;

import com.irace.dao.OrganizerDao;
import com.irace.entity.OrganizerEntity;
import com.irace.service.OrganizerService;
import com.irace.util.Constants;

public class OrganizerServiceImpl implements OrganizerService {

	private OrganizerDao organizerDao; 
	
	public void setOrganizerDao(OrganizerDao organizerDao) {
		this.organizerDao = organizerDao;
	}

	@Override
	public Integer addOrganizer(OrganizerEntity organizer) {
		// TODO Auto-generated method stub
		return organizerDao.addOrganizer(organizer);
	}

	@Override
	public boolean delOrganizer(int id) {
		// TODO Auto-generated method stub
		return organizerDao.delOrganizer(id);
	}

	@Override
	public OrganizerEntity getOrganizer(int id) {
		// TODO Auto-generated method stub
		return organizerDao.getOrganizer(id);
	}

	@Override
	public OrganizerEntity getOrganizerDetail(int id) {
		// TODO Auto-generated method stub
		return organizerDao.getOrganizerDetail(id);
	}

	@Override
	public List getOrganizerList(int pageNo) {
		// TODO Auto-generated method stub
		return organizerDao.getOrganizerList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public List getOrganizerListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		return organizerDao.getOrganizerListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	@Override
	public boolean updateOrganizer(OrganizerEntity organizer) {
		// TODO Auto-generated method stub
		return organizerDao.updateOrganizer(organizer);
	}

}
