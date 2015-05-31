package com.irace.service.impl;

import java.util.List;

import com.irace.dao.TypeRaceDao;
import com.irace.entity.TypeRaceEntity;
import com.irace.service.TypeRaceService;

public class TypeRaceServiceImpl implements TypeRaceService {

	TypeRaceDao typeRaceDao = null;
	
	public void setTypeRaceDao(TypeRaceDao typeRaceDao) {
		this.typeRaceDao = typeRaceDao;
	}

	@Override
	public Integer addTypeRace(TypeRaceEntity typeRace) {
		// TODO Auto-generated method stub
		return typeRaceDao.addTypeRace(typeRace);
	}

	@Override
	public boolean delTypeRace(int id) {
		// TODO Auto-generated method stub
		return typeRaceDao.delTypeRace(id);
	}

	@Override
	public List getTypeRaceList(int bigTypeId) {
		// TODO Auto-generated method stub
		return typeRaceDao.getTypeRaceList(bigTypeId);
	}

	@Override
	public TypeRaceEntity getTypeRace(int id) {
		// TODO Auto-generated method stub
		return typeRaceDao.getTypeRace(id);
	}

	@Override
	public TypeRaceEntity getTypeRaceDetail(int id) {
		// TODO Auto-generated method stub
		return typeRaceDao.getTypeRaceDetail(id);
	}

	@Override
	public boolean updateTypeRace(TypeRaceEntity typeRace) {
		// TODO Auto-generated method stub
		return typeRaceDao.updateTypeRace(typeRace);
	}

}
