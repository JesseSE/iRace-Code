package com.irace.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.UserEntity;
import com.irace.service.ApplyService;
import com.irace.service.BigTypeService;
import com.irace.service.RaceService;
import com.irace.service.UserService;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserCenterController extends SController {

	@Resource(name="applyService")
	ApplyService applyService;	
	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="userService")
	UserService userService;

	/**
	 *用户中心
	 */
	@RequestMapping("userCenter")
	public View userCenterPage() {
		return new View("home", "user", "user_center", "用户中心");
	}
	
	/**
	 * 获取正在参加的比赛
	 * @param sortKeyKords	
	 * @param userId
	 */
	@RequestMapping("getHedingRace.act")
	public @ResponseBody String getHedingRace(		
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="userId",required=true)int userId){
		
		//applyService.
		System.out.println("用户中心" + pageNum);
		//return raceService.getRaceListDetail(pageNum, "服务");
		return raceService.getRaceListByUser(pageNum, userId);
	}
	
	/**
	 * 获取已经结束的参加的比赛
	 * @param pageNum
	 * @param userId 
	 * @return
	 */
	@RequestMapping("getHeldedRace.act")
	public @ResponseBody String getHeldedRace(		
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="userId",required=true)int userId){
		
		//applyService.
		System.out.println("用户中心------" + pageNum);
		//return raceService.getRaceListDetail(pageNum, "服务");
		return raceService.getRaceListByUser(pageNum, userId);
		
	}
	
	/**
	 * 按照热度获取推介内容
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("getReconmmendation.act")
	public @ResponseBody String getReconmmendation(		
			@RequestParam(value="currentpagenum",required=true)int pageNum){		
		
		System.out.println("按照热度获取推介内容----" + pageNum);		
		return raceService.getRaceListBySortedHotPoint(pageNum, true);	
	}
	
	/**
	 * 账号管理提交修改
	 * @param 
	 * @return
	 */
	@RequestMapping("userPasswordChange.act")
	public @ResponseBody String passwordChange(		
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password",required=true)String password
			){
		
		UserEntity user = userService.getUser(username);
		if(user == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}else{
			
			
			boolean flag = userService.updateUser(user);
			if(flag){
				return JsonUtil.getJsonInfoOK();
			}else{
				return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败，请重新操作！");
			}
		}
	}
	
	/**
	 *账号管理
	 */
	@RequestMapping("userAccount")
	public View userAccount() {
		return new View("home", "user", "user_account", "账号管理");
	}
	
	/**
	 * 个人信息管理提交修改
	 * @param 
	 * @return
	 */
	@RequestMapping("userInfoChange.act")
	public @ResponseBody String infoChange(		
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="nickname",required=true)String nickname,
			@RequestParam(value="email",required=true)String email,
			@RequestParam(value="phone",required=true)String phone,
			@RequestParam(value="sexRadio",required=true)String sexRadio,
			@RequestParam(value="qq",required=true)String qq,
			@RequestParam(value="school",required=true)String school,
			@RequestParam(value="major",required=true)String major){
		
		UserEntity user = userService.getUser(username);
		if(user == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}else{
			user.setEmail(email);
			user.setNickname(nickname);
			user.setQq(qq);
			user.setTel(phone);
			user.setGender(sexRadio);
			
			boolean flag = userService.updateUser(user);
			if(flag){
				return JsonUtil.getJsonInfoOK();
			}else{
				return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败，请重新操作！");
			}
		}
	}
	
	/**
	 *用户信息
	 */

	@RequestMapping("userInfo")
	public View userInfo() {
		return new View("home", "user", "user_info", "用户信息");
	}
	
}
