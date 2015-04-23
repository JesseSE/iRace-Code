/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.TeamEntity;

/**
 * @author Tracy
 *
 */
public interface TeamService {

	public Integer addTeam(TeamEntity team);
	
	public boolean delTeam(int id);
	
	public TeamEntity getTeam(int id); //获取不包括外键实体
	
	public TeamEntity getTeamDetail(int id); //获取包括外键实体
	
	public List getTeamList(int pageNo); //获取不包括外键实体
	
	public List getTeamListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateTeam(TeamEntity team);
}
