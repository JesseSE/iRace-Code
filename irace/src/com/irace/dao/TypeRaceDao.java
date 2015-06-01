package com.irace.dao;

import java.util.List;

import com.irace.entity.TypeRaceEntity;

public interface TypeRaceDao {

	public Integer addTypeRace(TypeRaceEntity typeRace);
	
	public boolean delTypeRace(int id);
	
	public List getTypeRaceList(int bigTypeId);
	
	public TypeRaceEntity getTypeRace(int id);
	
	public TypeRaceEntity getTypeRaceDetail(int id);
	
	public boolean updateTypeRace(TypeRaceEntity typeRace);
}
