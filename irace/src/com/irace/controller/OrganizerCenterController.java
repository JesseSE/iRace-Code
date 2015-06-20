package com.irace.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.OrganizerEntity;
import com.irace.service.OrganizerService;
import com.irace.service.RaceService;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/organizer/*")
public class OrganizerCenterController extends SController {
	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="organizerService")
	OrganizerService organizerService;
	
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
		
		//System.out.println("页数："+ currentPageNum +"\n查看比赛状态：" + pageStatus +"\n机构ID:"+ organizerId);
		
//		String resultRcaeList = null;
//		if(pageStatus == 1 || pageStatus == 2 || pageStatus == 3){
//			resultRcaeList = raceService.getRaceListByUser(organizerId, currentPageNum, pageStatus);
//		}else
//			resultRcaeList = raceService.getRaceListByUser(organizerId, currentPageNum, 1);
		if(pageStatus < 0 || pageStatus > 3) {
			pageStatus = 0;
		}
		List raceList = raceService.getRaceListByOrganizer(organizerId, currentPageNum, pageStatus);
		//-------------------------------------
		return JsonUtil.listToJSONString(raceList, new String[] {"typeEntities"});
	}
	
	/**
	 * 举办方中心，账号管理
	 * @return
	 */
	@RequestMapping("orgaccount")
	public View accountPage() {
		return new View("home", "organizer", "organizer_account", "机构账号管理");
	}
	
	/**
	 * 显示举办方信息
	 * @param organizerId :举办方的Id
	 * @return 返回值是比赛方信息的字符串
	 */
	@RequestMapping("orgaccount.act")
	public @ResponseBody String manageRaceAccount(
			@RequestParam(value="organizerId")int organizerId){
		
		OrganizerEntity organizer = organizerService.getOrganizerDetail(organizerId);
		if(organizer == null){
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}else{
			System.out.println(organizer.toString());
			return organizer.toString();
		}
	}
	
	/**
	 * 修改比赛方密码
	 * @param organizerId :举办方的Id
	 * @param oldPassword :原密码
	 * @param newPassword :新密码
	 * @return 返回值成功或者失败
	 */
	@RequestMapping("orgaccountPass.act")
	public @ResponseBody String manageAccountPassword(
			@RequestParam(value="organizerId")int organizerId,
			@RequestParam(value="oldPassword")String oldPassword,
			@RequestParam(value="newPassword")String newPassword){
		
		OrganizerEntity organizer = organizerService.getOrganizerDetail(organizerId);
		if(organizer!=null){
			String password = organizer.getPwd();
			if(password.equalsIgnoreCase(oldPassword)){
				organizer.setPwd(newPassword);
				organizerService.updateOrganizer(organizer);
				return JsonUtil.getJsonInfoOK();
			}else{
				return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"操作失败！");
			}
		}else{
			return JsonUtil.getJsonInfo(InfoCode.UNKNOWN,"用户不存在！");
		}
	}

}
