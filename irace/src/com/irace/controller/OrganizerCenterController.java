package com.irace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.service.RaceService;
import com.irace.view.View;

@Controller
@RequestMapping("/organizer/*")
public class OrganizerCenterController extends SController {
	@Resource(name="raceService")
	RaceService raceService;
	
	/**
	 * 举办方中心，管理比赛
	 * @return
	 */
	@RequestMapping("orgcenter")
	public View loginPage() {
		return new View("home", "organizer", "organizer_center", "机构中心");
	}
	
	/**
	 * 通过举办方ID以及当前页码和用户选择比赛状态来查询比赛
	 * @param currentPageNum ：当前页吗
	 * @param pageStatus ：用户选择的比赛状态(1正在进行，2已经结束，3尚未发布)
	 * @param organizerId :举办方的Id
	 * @return 返回值是包含比赛信息的json字符串
	 */
	@RequestMapping("manageRaceInOC.act")
	public @ResponseBody String manageRaceInOC(
			@RequestParam(value="currentPageNum")int currentPageNum,
			@RequestParam(value="pageStatus")int pageStatus,
			@RequestParam(value="organizerId")int organizerId){
		
		System.out.println("页数："+ currentPageNum +"\n查看比赛状态：" + pageStatus +"\n机构ID:"+ organizerId);
		
		String resultRcaeList = null;
		if(pageStatus == 1){
			resultRcaeList = raceService.getRaceListBySortedHotPoint(currentPageNum, "服务", true);
		}else if(pageStatus == 2){
			resultRcaeList = raceService.getRaceListBySortedHotPoint(currentPageNum, "服务", true);
		}else if(pageStatus == 2){
			resultRcaeList = raceService.getRaceListBySortedHotPoint(currentPageNum, "服务", true);
		}else
			resultRcaeList = raceService.getRaceListBySortedHotPoint(currentPageNum, "服务", true);
		
		return resultRcaeList;		
	}
	

}
