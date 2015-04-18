package com.irace.service.impl;

import com.irace.dao.UserDao;
import com.irace.service.UserService;

public class UserServiceImpl implements UserService {

	UserDao userDao = null;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
}
