package com.irace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.service.ApplyService;
import com.irace.service.BigTypeService;
import com.irace.service.RaceService;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserCenterController extends SController {

	@Resource(name="applyService")
	ApplyService applyService;	
	@Resource(name="raceService")
	RaceService raceService;	

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
}
