package com.irace.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.irace.entity.UserEntity;

public interface UserService {

	/**
	 * 注册操作
	 * @param user	携带注册信息的实体
	 * @return
	 */
	public boolean register(UserEntity user);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public boolean delUser(Integer id);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public UserEntity getUser(Integer id);
	
	/**
	 * 
	 * @param username
	 * @return
	 */
	public UserEntity getUser(String username);
	
	/**
	 * 登录操作 把用户的username,nickname和uid存入session
	 * @param username
	 * @param pwd
	 * @param session
	 * @return	登录是否成功
	 */
	public boolean login(String username, String pwd, HttpSession session);
	
	/**
	 * 
	 * @param pageNo
	 * @return
	 */
	public List getUserList(Integer pageNo);
	
	/**
	 * 吧查询的userlist用json的格式返回
	 * @param pageNo
	 * @return
	 */
	public String getUserListJson(Integer pageNo);
	
	/**
	 * 修改用户信息 修改密码是不要调用
	 * @param user
	 * @return
	 */
	public boolean updateUser(UserEntity user);
	
	/**
	 * 修改密码
	 * @param id
	 * @param oldPwd
	 * @param newPwd
	 * @return json格式字符串有两个属性code和msg, code=200表示操作成功  code等于其他表示失败 此时可查看msg里的信息 
	 */
	public String modifyPassword(int id, String oldPwd, String newPwd);
}
