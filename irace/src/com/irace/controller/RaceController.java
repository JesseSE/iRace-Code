/**
 * 
 */
package com.irace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.aop.LoginVerify;
import com.irace.entity.ApplyEntity;
import com.irace.entity.ApplyInfoEntity;
import com.irace.entity.GroupRaceEntity;
import com.irace.entity.MessageEntity;
import com.irace.entity.PropertyEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.TeamEntity;
import com.irace.entity.UserEntity;
import com.irace.service.ApplyInfoService;
import com.irace.service.ApplyService;
import com.irace.service.BigTypeService;
import com.irace.service.GroupRaceService;
import com.irace.service.MessageService;
import com.irace.service.PropertyService;
import com.irace.service.RaceService;
import com.irace.service.RewardService;
import com.irace.service.StageService;
import com.irace.service.TeamService;
import com.irace.service.UserService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;
import com.irace.view.View;

/**
 * @author Tracy
 *
 */
@Controller
@RequestMapping("/race/*")
public class RaceController extends SController {
	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="bigTypeService")
	BigTypeService bigTypeService;
	@Resource(name="groupRaceService")
	GroupRaceService groupRaceService;
	@Resource(name="rewardService")
	RewardService rewardService;
	@Resource(name="stageService")
	StageService stageService;
	@Resource(name="teamService")
	TeamService teamService;
	@Resource(name="userService")
	UserService userService;
	@Resource(name="propertyService")
	PropertyService propertyService;
	@Resource(name="applyService")
	ApplyService applyService;
	@Resource(name="applyInfoService")
	ApplyInfoService applyInfoService;
	@Resource(name="messageService")
	MessageService messageService;
	
	
	@RequestMapping("index")
	public View RacePage() {
		View view = new View("home","user", "index", "主页");		
		return view;
	}
	
	@RequestMapping("homepageShow.act")
	public @ResponseBody String loadAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum){
		if( pageNum < 0 ){
			return null;
		}else{
			return raceService.getRaceListDetail(pageNum);
		}
	}
	
	@RequestMapping("homepageChoose.act")
	public @ResponseBody String chooseAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="chooseItem",required=true)int chooseItem)
	{
		if( pageNum < 0 ){
			return null;
		}else{			
		}
		return null;
	}
		
	@RequestMapping("homepageJump.act")
	public @ResponseBody String jumpAction(
            @RequestParam(value="orderByType",required=true)int orderByType,
			@RequestParam(value="orderByAD",required=true)int orderByAD)
	{
		System.out.println(" "+orderByType+" "+orderByAD);
		int pageNum =1;
		String returnString = "";
		switch(orderByType){
		case 1:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedHotPoint(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedHotPoint(pageNum, false);
			break;
		case 2:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedStartTime(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedStartTime(pageNum, false);
			break;
		case 3:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedEndTime(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedEndTime(pageNum, false);
			break;
		case 4:
			if(orderByAD == 1)
				returnString = raceService.getRaceListDetail(pageNum);		
			else
				returnString = raceService.getRaceListDetail(pageNum);	
			break;
		default :
			returnString = raceService.getRaceListDetail(pageNum);	
			break;
	
		}
		return returnString;
	}
	
	@RequestMapping("detail/{id}")
	public View raceDetailPage(@PathVariable(value = "id")Integer id) {
		
		RaceEntity race = raceService.getRaceDetail(id);
		List<GroupRaceEntity> groupList= groupRaceService.getGroupRaceList(id);
		List<Map<String,Object>> rewardList = new ArrayList<Map<String,Object>>();
		for(GroupRaceEntity g : groupList) {
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("gid", g.getId());
			m.put("gname", g.getName());
			m.put("rlist", rewardService.getRewardListByGroup(g.getId()));
			rewardList.add(m);
		}
		
		List<Map<String,Object>> stageList = new ArrayList<Map<String,Object>>();
		for(GroupRaceEntity g : groupList) {
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("gid", g.getId());
			m.put("gname", g.getName());
			m.put("slist", stageService.getStageList(g.getId()));
			stageList.add(m);
		}
		
		View view = new View("home","race", "detail", race.getName());
		view.addObject("race", race);
		view.addObject("groupList", groupList);
		view.addObject("rewardList", rewardList);
		view.addObject("stageList", stageList);
		return view;
	}
	
	@RequestMapping("apply_race/{rid}")
	@LoginVerify
	public View applyRace(@PathVariable(value="rid")Integer rid,
			@RequestParam(value="groupId")Integer groupId,
			@RequestParam(value="groupName")String groupName,
			@RequestParam(value="raceName")String raceName,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("uid");
		
		List teamList = teamService.getTeamEntityListByGroup(groupId,Constants.TEAM_NOT_SUBMIT);
		View view = new View("home","race", "apply_race", "报名比赛");
		view.addObject("propertyList", propertyService.getPropertyList(rid));
		view.addObject("hasApplyed", applyService.hasApplyed(userId, rid));
		view.addObject("rid", rid);
		view.addObject("groupId", groupId);
		view.addObject("groupName", groupName);
		view.addObject("raceName", raceName);
		view.addObject("teamList", teamList);
		return view;
	}
	
	
	/**
	 * 
	 * @param request
	 * @return 报名是否成功
	 */
	@RequestMapping("applyRace.act")
	@LoginVerify
	public @ResponseBody String applyRaceACtion(
			HttpServletRequest request){
		
//		@RequestParam(value="username",required=true)String username,
//		@RequestParam(value="emailad",required=true)String emailad,
//		@RequestParam(value="education",required=true)String education,
//		@RequestParam(value="school",required=true)String school
		Integer raceId = Integer.parseInt(request.getParameter("raceId"));
		Integer groupId = Integer.parseInt(request.getParameter("groupId"));
		HttpSession session = request.getSession();
		Integer uid = (Integer)session.getAttribute("uid");
		Integer applyId = applyService.addApply(new ApplyEntity(uid, raceId, groupId, 0));
		
		List<PropertyEntity> propertys = propertyService.getPropertyList(raceId);
		Map<Integer, String> propertyInfo = new HashMap<Integer, String>();
		for(PropertyEntity p:propertys) {
			String value = request.getParameter("property"+p.getId());
			if(value != null) {
				propertyInfo.put(p.getId(), value);
			} else {
				break;
			}
		}
		if(propertys.size() != propertyInfo.size()) {
			return JsonUtil.getJsonOtherError("参数错误！");
		} else {
			for(Entry<Integer, String> e : propertyInfo.entrySet()) {
				int res = applyInfoService.addApplyInfo(new ApplyInfoEntity(applyId, e.getKey(), e.getValue()));
				if(res <= 0) {
					return JsonUtil.getJsonOtherError("添加数据出错！");
				}
			}
			
			return JsonUtil.getJsonInfoOK();
		}
	}
	
	@RequestMapping("createTeam.act")
	@LoginVerify
	public @ResponseBody String createTeamAction(
			@RequestParam(value="name",required=true)String name,
			@RequestParam(value="slogan",required=true)String slogan,
			@RequestParam(value="groupId",required=true)Integer groupId,
			HttpSession session){
		
		TeamEntity teamEntity = new TeamEntity();
		teamEntity.setName(name);
		teamEntity.setSlogan(slogan);
		teamEntity.setLeader((Integer)session.getAttribute("uid"));
		teamEntity.setGroup(groupId);
		teamEntity.setStatus(Constants.TEAM_NOT_SUBMIT);
		if(teamService.addTeam(teamEntity) > 0) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonOtherError("增加队伍失败!");
		}
	}
	
	@RequestMapping("joinTeam.act")
	@LoginVerify
	public @ResponseBody String joinTeamAction(
			@RequestParam("teamId")Integer teamId,
			@RequestParam("groupId")Integer groupId,
			HttpSession session) {
		Integer uid = (Integer)session.getAttribute("uid");
		TeamEntity team = teamService.getTeam(teamId);
		ApplyEntity apply = applyService.getApply(uid, groupId);
		apply.setTeam(teamId);
		apply.setStatus(1);
		if(applyService.updateApply(apply)) {
			messageService.addMessage(new MessageEntity(uid, team.getLeader(), session.getAttribute("nickname")+"申请加入您创建的“"+team.getName()+"”队伍，请点击链接。。。。"));
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonOtherError("发送申请失败!");
		}
		
	}
	
	@RequestMapping("getRaceList.act")
	public @ResponseBody String getTeamList(){
		
		String teamList = teamService.getTeamList(1);
		//teamEntity.setLeader(userEntity.getUsername());
		
		return teamList;
	}
	
}
