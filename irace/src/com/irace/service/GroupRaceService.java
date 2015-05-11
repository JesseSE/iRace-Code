/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.GroupRaceEntity;

/**
 * @author Tracy
 *
 */
public interface GroupRaceService {

	public Integer addGroupRace(GroupRaceEntity groupRace);
	
	public boolean delGroupRace(int id);
	
	public GroupRaceEntity getGroupRace(int id); //获取不包括外键实体
	
	public GroupRaceEntity getGroupRaceDetail(int id); //获取包括外键实体
	
	public List getGroupRaceList(int raceId); //获取不包括外键实体
	
	public List getGroupRaceListDetail(int raceId); //获取包括外键实体
	
	public boolean updateGroupRace(GroupRaceEntity groupRace);
}
