package com.irace.dao;

import java.util.List;

import com.irace.entity.UserEntity;

public interface UserDao {

	public Integer addUser(UserEntity user);
	
	public boolean delUser(Integer id);
	
	public UserEntity getUser(Integer id);
	
	public UserEntity getUser(String username);
	
	public UserEntity getUser(String username, String pwd);
	
	public List getUserList(Integer pageNo, Integer pageItemNum);
	
	public boolean updateUser(UserEntity user);
	
	public List getTeamMemberListByUser(int uid);
	
	public List getTeamMemberListByTeamId(int teamId);
}
