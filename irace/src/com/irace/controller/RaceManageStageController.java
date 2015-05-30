package com.irace.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.service.GroupRaceService;
import com.irace.service.RaceService;
import com.irace.service.TeamService;
import com.irace.view.View;


@Controller
@RequestMapping("/race/*")
public class RaceManageStageController extends SController{
	 
	@Resource(name = "raceService")
	RaceService raceService;
	@Resource(name = "groupRaceService")
	GroupRaceService groupRaceService;
	@Resource(name = "teamService")
	TeamService teamservice;
	
	@RequestMapping("RaceManageStage")
	public View raceManageStage(){
		View view = new View("home","race","racemanage_stage","比赛管理");
		return view;	
	}
	
	//载入比赛名字
	@RequestMapping("manageStageLoadRaceName.act")
	public @ResponseBody String loadRaceName(
			@RequestParam(value="raceID",required=true) int raceID){
		System.out.println(raceService.getRace(raceID).getName());
		Map<String,String> map = new HashMap<String, String>();
		map.put("name", raceService.getRace(raceID).getName());
		JSONArray array = JSONArray.fromObject(map);
		return array.toString();		
	}
	
	//载入组别
	@RequestMapping("manageStageLoadGroup.act")
	public @ResponseBody String loadRace(
			@RequestParam(value="raceID",required=true) int raceID){
		JSONArray array = JSONArray.fromObject(groupRaceService.getGroupRaceList(raceID));
		return array.toString();	
	}
	
	//载入报名审核里的小组 
	@RequestMapping("manageStageLoadGroupTeam.act")
	public @ResponseBody String loadGroupTeam(
			@RequestParam(value="groupID",required=true) int groupID ){	
		return teamservice.getTeamListByGroup(groupID);	
	}
	
	
	//同意或拒绝队伍
	@RequestMapping("sendTeamStatus.act")
	public @ResponseBody String sendTeamStatus(
			@RequestParam(value="teamId",required = true) int teamID,
			@RequestParam(value="status",required = true) boolean status){
				return null;	
	}
	
	//载入报名审核小组里的成员
	@RequestMapping("manageStageLoadGroupTeamMember.act")
	public @ResponseBody String loadGroupTeamMember(
			@RequestParam(value="teamID",required=true) int teamID){
				return null;	
	}

	
	//载入阶段选项框
	@RequestMapping("manageStageLoadPhase.act")
	public @ResponseBody String loadPhase(
			@RequestParam(value="groupID",required=true) int groupID){
		return null;	
	}
	
	//提交物再审 status 
	@RequestMapping("manageStagePhaseDoing.act")
	public @ResponseBody String phaseDoing(
			@RequestParam(value="phaseID",required=true) int phaseID){	
		return null;		
	}
	
	//提交物审查结束 status
	@RequestMapping("manageStagePhaseDone.act")
	public @ResponseBody String phaseDone(
			@RequestParam(value="phaseID",required=true) int phaseID){	
		return null;		
   }
	
	//颁奖未结束
	@RequestMapping("manageStagepraiseDoing.act")
	public @ResponseBody String praiseDoing(
			@RequestParam(value="phaseID",required=true) int phaseID){	
		return null;		
   }
	
	//颁奖结束
	@RequestMapping("manageStagepraiseDone.act")
	public @ResponseBody String praiseDone(
			@RequestParam(value="phaseID",required=true) int phaseID){	
		return null;		
   }	

}
