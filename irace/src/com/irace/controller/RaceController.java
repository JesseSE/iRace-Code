/**
 * 
 */
package com.irace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.GroupRaceEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.TeamEntity;
import com.irace.entity.UserEntity;
import com.irace.service.BigTypeService;
import com.irace.service.GroupRaceService;
import com.irace.service.RaceService;
import com.irace.service.RewardService;
import com.irace.service.StageService;
import com.irace.service.TeamService;
import com.irace.service.UserService;
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
	
	@RequestMapping("apply_race")
	public View applyRace() {
		View view = new View("home","race", "apply_race", "报名比赛");		
		return view;
	}
	/**
	 * 
	 * @param username
	 * @param emailad
	 * @param education
	 * @param school
	 * @return 报名是否成功
	 */
	@RequestMapping("applyRace.act")
	public @ResponseBody String applyRace(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="emailad",required=true)String emailad,
			@RequestParam(value="education",required=true)String education,
			@RequestParam(value="school",required=true)String school){
		
		
		
		return null;
	}
	
	@RequestMapping("applyRace.act")
	public @ResponseBody String createTeam(
			@RequestParam(value="teamname",required=true)String teamname,
			@RequestParam(value="slogan",required=true)String slogan,
			HttpSession session){
		
		TeamEntity teamEntity = new TeamEntity();
		teamEntity.setName(teamname);
		teamEntity.setSlogan(slogan);
		
		UserEntity userEntity = userService.getUser((String)session.getAttribute("username"));
		
		//teamEntity.setLeader(userEntity.getUsername());
		
		return null;
	}
	
	@RequestMapping("getRaceList.act")
	public @ResponseBody String getTeamList(){
		
		String teamList = teamService.getTeamList(1);
		//teamEntity.setLeader(userEntity.getUsername());
		
		return teamList;
	}
	
}
