package com.irace.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.dao.impl.UserDaoImpl;
import com.irace.entity.UserEntity;
import com.irace.service.UserService;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserController extends SController {

	@Resource(name="userService")
	UserService userService;
	
	/**
	 * 控制器测试
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
		return new View("home", "user", "login", "登陆");
	}
	
	/**
	 * 登录处理方法
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping("login.act")
	public @ResponseBody String loginAction(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password",required=true)String password){
		
		
		
		//userService = new UserService(username);
		UserEntity user = userService.getUser(username);
		
		//int result=InfoCode.OK;
		//PrintWriter out = response.getWriter();
		
		if(user == null){
			//out.print("{\"username\":"+username+", \"password\":\""+password+"\"}");
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"UNKNOWN");
		}else{
			if(!user.getPwd().equals(password)){
				//out.print("{\"username\":"+username+", \"password\":\""+password+"\"}");
				return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"OTHER_ERROR");
			}else{
				//out.print(result);
				return JsonUtil.getJsonInfo(InfoCode.OK,"OK");
			}
		}
	}
	
	/**
	 * 注册页面
	 * @return
	 */
	@RequestMapping("register")
	public View registPage() {
		return new View("home", "user", "regist", "注册");
	}
	
	/**
	 * 注册处理方法
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping("register.act")
	public @ResponseBody String registAction(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password",required=true)String password,
			@RequestParam(value="nickname",required=true)String nickname,
			@RequestParam(value="email",required=true)String email,
			@RequestParam(value="phone",required=true)String phone,
			@RequestParam(value="sexRadioOptions",required=true)String sexRadioOptions,
			@RequestParam(value="qq",required=true)String qq,
			@RequestParam(value="school",required=true)String school,
			@RequestParam(value="major",required=true)String major){
		
		
		UserEntity userentity = new UserEntity();
		userentity.setUsername(username);
		userentity.setPwd(password);
		userentity.setNickname(nickname);
		userentity.setEmail(email);
		userentity.setTel(phone);
		userentity.setQq(qq);
		
		UserDaoImpl userdao = new UserDaoImpl();
		int flag = userdao.addUser(userentity);
		
		//int result=InfoCode.OK;
		//PrintWriter out = response.getWriter();
		
		if(flag != 0){
			//out.print(result);
			return JsonUtil.getJsonInfo(InfoCode.OK,"OK");
		}else{
			//out.print("{\"username\":"+username+", \"password\":\""+password+"\",\"repassword\":\""+password+"\", "
			//		+ "\"nickname\":\""+nickname+"\",\"email\":\""+email+"\",\"phone\":\""+phone+"\",\"qq\":\""+qq+"\","
			//				+ "\"school\":\""+school+"\",\"major\":\""+major+"\"}");
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"OTHER_ERROR");
		}
	}
	
	
}
