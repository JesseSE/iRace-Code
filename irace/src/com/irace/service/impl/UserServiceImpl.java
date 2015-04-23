package com.irace.service.impl;

import java.util.List;

import com.irace.dao.UserDao;
import com.irace.entity.UserEntity;
import com.irace.service.UserService;
import com.irace.util.Constants;

public class UserServiceImpl implements UserService {

	private UserDao userDao = null;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Integer addUser(UserEntity user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}

	@Override
	public boolean delUser(Integer id) {
		// TODO Auto-generated method stub
		return userDao.delUser(id);
	}

	@Override
	public UserEntity getUser(Integer id) {
		// TODO Auto-generated method stub
		return userDao.getUser(id);
	}

	@Override
	public UserEntity getUser(String username) {
		// TODO Auto-generated method stub
		return userDao.getUser(username);
	}

	@Override
	public UserEntity getUser(String username, String pwd) {
		// TODO Auto-generated method stub
		return userDao.getUser(username, pwd);
	}

	@Override
	public boolean updateUser(UserEntity user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public List getUserList(Integer pageNo) {
		// TODO Auto-generated method stub
		return userDao.getUserList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}
	
	
}
