package com.irace.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.irace.dao.UserDao;
import com.irace.entity.UserEntity;
import com.irace.service.UserService;
import com.irace.util.Constants;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;

public class UserServiceImpl implements UserService {

	private UserDao userDao = null;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
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
	public boolean updateUser(UserEntity user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public List getUserList(Integer pageNo) {
		// TODO Auto-generated method stub
		return userDao.getUserList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM);
	}


	@Override
	public boolean register(UserEntity user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user) > 0;
	}


	@Override
	public boolean login(String username, String pwd, HttpSession session) {
		// TODO Auto-generated method stub
		UserEntity user = userDao.getUser(username, pwd);
		if(user != null) {
			session.setAttribute("uid", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("nickname", user.getNickname());
			return true;
		} else {
			return false;
		}
	}


	@Override
	public String getUserListJson(Integer pageNo) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(userDao.getUserList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), null);
	}


	@Override
	public String modifyPassword(int id, String oldPwd, String newPwd) {
		// TODO Auto-generated method stub
		UserEntity user = userDao.getUser(id);
		if(user == null) {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "用户该用户不存在！");
		} else if(!user.getPwd().equals(oldPwd)) {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "原密码错误！");
		} else {
			user.setPwd(newPwd);
			userDao.updateUser(user);
			return JsonUtil.getJsonInfoOK();
		}
		
	}
	
	
}
