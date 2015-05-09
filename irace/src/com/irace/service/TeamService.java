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
	
	public String getTeamList(int pageNo); //获取不包括外键实体
	
	public String getTeamListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	/**
	 * 自己创建的队伍列表
	 * @param userId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public String getCreatedTeamList(int userId, int pageNo);
	
	/**
	 * 已经加入的队伍列表
	 * @param userId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public String getJoinedTeamList(int userId, int pageNo);
	
	/**
	 * 正在申请加入的队伍列表
	 * @param userId
	 * @param pageNo
	 * @return
	 */
	public String getApplyingTeamList(int userId, int pageNo);
	
	public boolean updateTeam(TeamEntity team);
}
