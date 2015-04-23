package com.irace.service;

import java.util.List;

import com.irace.entity.UserEntity;

public interface UserService {

	public Integer addUser(UserEntity user);
	
	public boolean delUser(Integer id);
	
	public UserEntity getUser(Integer id);
	
	public UserEntity getUser(String username);
	
	public UserEntity getUser(String username, String pwd);
	
	public List getUserList(Integer pageNo);
	
	public boolean updateUser(UserEntity user);
}
