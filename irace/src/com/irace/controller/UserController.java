package com.irace.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.dao.impl.UserDaoImpl;
import com.irace.entity.OrganizerEntity;
import com.irace.entity.UserEntity;
import com.irace.service.OrganizerService;
import com.irace.service.UserService;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserController extends SController {

	@Resource(name="userService")
	UserService userService;
	@Resource(name="organizerService")
	OrganizerService organizerService;
	/**
	 * 鎺у埗鍣ㄦ祴璇�
	 * @return
	 */
	@RequestMapping("test")
	public @ResponseBody String test() {
		
//		UserEntity user = userService.getUser(1);
//		String res = JsonUtil.listToJSONString(userService.getUserList(1));
//		String res2 = JsonUtil.objectToJSONString(user);
//		return  res;
		return null;
	}
	
	
	/**
	 * 鐧诲綍椤甸潰
	 * @return
	 */
	@RequestMapping("login")
	public View loginPage() {
		return new View("home", "user", "login", "登陆");
	}
	
	/**
	 * 鐧诲綍澶勭悊鏂规硶
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping("login.act")
	public @ResponseBody String loginAction(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password",required=true)String password,
			@RequestParam(value="type",required=true)String type,
			HttpSession session){
		
		boolean flag = true;
		if(type.equals("2")){
			
			//flag = userService.login(username, password, session);
			
			/*UserEntity user = userService.getUser(username);
			System.out.println(username+"     "+password);
			flag = userService.login(username, password, session);*/
			
		}else{
			UserEntity user = userService.getUser(username);
			System.out.println(username+"     "+password);
			flag = userService.login(username, password, session);
		}
		//userService = new UserService(username);
		
		if(flag){
			System.out.println("1111111111111111");
			return JsonUtil.getJsonInfoOK();
		}else{
			System.out.println("2222222222222222222");
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户名或者密码错误，请重新登录！");
		}
		
		
		//int result=InfoCode.OK;
		//PrintWriter out = response.getWriter();
		
		/*if(user == null){
			//out.print("{\"username\":"+username+", \"password\":\""+password+"\"}");
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"UNKNOWN");
		}else{
			if(!user.getPwd().equals(password)){
				//out.print("{\"username\":"+username+", \"password\":\""+password+"\"}");
				return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"OTHER_ERROR");
			}else{
				//out.print(result);
				return JsonUtil.getJsonInfoOK();
			}
		}*/
	}
	
	/**
	 * 娉ㄥ唽椤甸潰
	 * @return
	 */
	@RequestMapping("register")
	public View registPage() {
		return new View("home", "user", "register", "用户注册");
	}
	
	/**
	 * 娉ㄥ唽澶勭悊鏂规硶
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping("register.act")
	public @ResponseBody String registAction(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password",required=true)String password,
			@RequestParam(value="repassword",required=true)String repassword,
			@RequestParam(value="nickname",required=true)String nickname,
			@RequestParam(value="email",required=true)String email,
			@RequestParam(value="phone",required=true)String phone,
			@RequestParam(value="sexRadio",required=true)String sexRadioOptions,
			@RequestParam(value="qq",required=true)String qq,
			@RequestParam(value="school",required=true)String school,
			@RequestParam(value="major",required=true)String major,
			@RequestParam(value="image",required=true)String image,
			HttpSession session){
		
		System.out.println("test!!!!!!!");
		
		UserEntity userentity = new UserEntity();
		userentity.setUsername(username);
		userentity.setPwd(password);
		userentity.setNickname(nickname);
		userentity.setEmail(email);
		userentity.setTel(phone);
		userentity.setQq(qq);
		userentity.setPicUrl(image);
		userentity.setRole(1);
		
		//System.out.println(userentity.toString());
		
		UserEntity userTest = userService.getUser(username);
		
		//System.out.println(userTest.getNickname()+"123123");
		
		if(userTest != null){
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"UserName has been taken!");
		}
		
		if(!password.equals(repassword)){
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"密码输入不一致！");
		}
		
		boolean flag = userService.register(userentity);
		
		//UserDaoImpl userdao = new UserDaoImpl();
		//int flag = userdao.addUser(userentity);
		
		//int result=InfoCode.OK;
		//PrintWriter out = response.getWriter();
		System.out.println(flag);
		
		if(flag){
			//out.print(result);
			userService.login(username, password, session);
			System.out.println("成功登陆！！");
			return JsonUtil.getJsonInfoOK();
		}else{
			//out.print("{\"username\":"+username+", \"password\":\""+password+"\",\"repassword\":\""+password+"\", "
			//		+ "\"nickname\":\""+nickname+"\",\"email\":\""+email+"\",\"phone\":\""+phone+"\",\"qq\":\""+qq+"\","
			//				+ "\"school\":\""+school+"\",\"major\":\""+major+"\"}");
			System.out.println("登陆失败！！！");
			return JsonUtil.objectToJSONString(userentity, null);
		}
	}
	
	/**
	 * 注销方法，清楚缓存
	 */
	
	@RequestMapping("logout.act")
	public @ResponseBody View logoutAction(HttpSession session){
		session.removeAttribute("nickname");
		session.removeAttribute("uid");
		session.removeAttribute("username");
		
		return new View("home", "user", "login", "登陆");
	}
	
	
}
