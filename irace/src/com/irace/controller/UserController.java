package com.irace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.UserEntity;
import com.irace.service.UserService;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserController extends SController {

	@Resource(name="userService")
	UserService userService;
	
	/**
	 * 这是一个测试控制器
	 * @return
	 */
	@RequestMapping("test")
	public @ResponseBody String test() {
		
		UserEntity user = userService.getUser(1);
		String res = JsonUtil.listToJSONString(userService.getUserList(1));
		String res2 = JsonUtil.objectToJSONString(user);
		return  res;
	}
	
	
	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping("login")
	public View loginPage() {
		return new View("home", "user", "login", "登录");
	}
	
	/**
	 * 验证登录操作
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping("login.act")
	public @ResponseBody String loginAction(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="pwd",required=true)String pwd) {
		
		//这里进行登录验证的逻辑处理，返回处理结果
		
		return "Hello";
	}
	
	
}
