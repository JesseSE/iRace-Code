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
	 * 查看组队状态
	 * @param userId
	 * @param raceId
	 * @return
	 */
	@RequestMapping("isJoinTeam.act")
	public @ResponseBody String isJoinTeam(
			@RequestParam(value="userId", required=true)int userId,
			@RequestParam(value="raceId", required=true)int raceId){
		System.out.println("======"+applyService.getTeamDetail(userId, raceId));
		return applyService.getTeamDetail(userId, raceId);
	}
	
	/**
	 * 按照热度获取推介内容
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("getReconmmendation.act")
	public @ResponseBody String getReconmmendation(		
			@RequestParam(value="currentpagenum",required=true)int pageNum){		
		
		//System.out.println("按照热度获取推介内容----" + pageNum);		
		return raceService.getRaceListBySortedHotPoint(pageNum, true);	
	}
	
	/**
	 * 账号管理提交修改
	 * @param 
	 * @return
	 */
	@RequestMapping("userPasswordChange.act")
	public @ResponseBody String passwordChange(		
			@RequestParam(value="oldpassword",required=true)String oldpassword,
			@RequestParam(value="newpassword",required=true)String newpassword,
			HttpSession session){
		
		System.out.println(oldpassword+"-----------"+newpassword);
		int uid = (int) session.getAttribute("uid");
		UserEntity user = userService.getUser(uid);
		if(user == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}else{
			boolean flagPassword = oldpassword.equals(user.getPwd());
			System.out.println(flagPassword);
			if(flagPassword){
				user.setPwd(newpassword);
				boolean flag = userService.updateUser(user);
				if(flag){
					return JsonUtil.getJsonInfoOK();
				}else{
					return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败，请重新操作！");
				}
			}else{
				return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败，请重新操作！");
			}
		}
	}
	
	/**
	 *账号管理
	 */
	@RequestMapping("userAccount")
	public @ResponseBody View userAccount(HttpSession session) {
		View view = new View("home", "user", "user_account", "账号管理");
		
		int uid = (int) session.getAttribute("uid");
		UserEntity user = userService.getUser(uid);
		System.out.println(user);
		view.addObject("user", user);
		
		return view;
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
			@RequestParam(value="major",required=true)String major,
			HttpSession session){
		
		int uid = (int) session.getAttribute("uid");
		UserEntity user = userService.getUser(uid);
		System.out.println(user.toString());
		
		if(user == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}else{
			user.setEmail(email);
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
	public @ResponseBody View userInfo(HttpSession session) {
		View view = new View("home", "user", "user_info", "用户信息");
		
		int uid = (int) session.getAttribute("uid");
		UserEntity user = userService.getUser(uid);
		System.out.println(user);
		view.addObject("user", user);
		
		return view;
	}
	
	/**
	 * 获取用户信息
	 * @param userId
	 * @return
	 */
	@RequestMapping("getUserInfo.act")
	public @ResponseBody String getUserInfo(		
			@RequestParam(value="userId",required=true)int userId){		
		
		UserEntity user = userService.getUser(userId);
		if(user == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败，请重新操作！");
		}else{
			System.out.println(user.toString());
			return user.toString();
		}
	}
	
}
