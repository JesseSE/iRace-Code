package com.irace.dao;

import java.util.List;

import com.irace.entity.TeamEntity;

public interface TeamDao {

	public Integer addTeam(TeamEntity team);
	
	public boolean delTeam(int id);
	
	public TeamEntity getTeam(int id); //获取不包括外键实体
	
	public TeamEntity getTeamDetail(int id); //获取包括外键实体
	
	public List getTeamList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getTeamListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	/**
	 * 自己创建的队伍列表
	 * @param userId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public List getCreatedTeamList(int userId, int pageNo, int pageItemNum);
	
	/**
	 * 已经加入的队伍列表
	 * @param userId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public List getJoinedTeamList(int userId, int pageNo, int pageItemNum);
	
	/**
	 * 正在申请加入的队伍列表
	 * @param userId
	 * @param pageNo
	 * @param pageItemNum
	 * @return
	 */
	public List getApplyingTeamList(int userId, int pageNo, int pageItemNum);
	
	public boolean updateTeam(TeamEntity team);
	
	public List getTeamListByGroup(int groupID);
	
	/**
	 * 查询没有被淘汰的队伍
	 * @param groupID
	 * @param status
	 * @return
	 */
	public List getTeamListByGroup(int groupID, int status);
}
