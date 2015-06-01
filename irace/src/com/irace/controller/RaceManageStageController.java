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

import com.irace.entity.GroupRaceEntity;
import com.irace.entity.StageRaceEntity;
import com.irace.service.GroupRaceService;
import com.irace.service.MessageService;
import com.irace.service.RaceService;
import com.irace.service.RewardService;
import com.irace.service.StageService;
import com.irace.service.SubmitService;
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
	@Resource(name = "stageService")
	StageService stageService;
//	@Resource(name = "submitService")
//	SubmitService submitService;
	@Resource(name = "rewardService")
	RewardService rewardService;
	@Resource(name = "messageService")
	MessageService messageService;
	
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
		JSONArray array = JSONArray.fromObject(stageService.getStageList(groupID));
		return array.toString();	
	}
	
	//载入阶段标题
	@RequestMapping("manageStageGetPhaseTitle.act")
	public @ResponseBody String getPhaseTitle(
			@RequestParam(value="phaseId", required = true) int phaseID){
		StageRaceEntity stage =  stageService.getStageDetail(phaseID);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", Integer.toString(stage.getId()));
		map.put("name", stage.getName());
		map.put("status", Integer.toString(stage.getStatus()));
		map.put("startTime", stage.getStartTime().toString());
		map.put("endTime",stage.getEndTime().toString());
		map.put("groupName", stage.getGroupRaceEntity().getName());
		JSONArray array = JSONArray.fromObject(map);
		return array.toString();
	}
	
	//提交物再审 status 
	@RequestMapping("manageGetStagePhase.act")
	public @ResponseBody String phaseDoing(
			@RequestParam(value="phaseID",required=true) int phaseID){	
	//	submitService.getSubmitByStage(phaseID);
		return null;		
	}
	
	//得到阶段的标题
	@RequestMapping("manageStageGetPraiseTitle.act")
	public @ResponseBody String getPraiseTitle(
			@RequestParam(value = "groupID", required = true)int groupID){
		GroupRaceEntity group = groupRaceService.getGroupRace(groupID);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", Integer.toString(group.getId()));
		map.put("name", group.getName());
		map.put("status", Integer.toString(group.getStatus()));
		JSONArray array = JSONArray.fromObject(map);
		return array.toString();
	}
	
	//颁奖
	@RequestMapping("manageStageGetPraise.act")
	public @ResponseBody String getPraise(
			@RequestParam(value = "groupID",required = true)int groupID,
			@RequestParam(value = "isFinished", required = true) boolean isFinished){
		String praise= null;
		if(!isFinished){
			praise = teamservice.getTeamListByGroup(groupID,0);
		}
		else{
			praise = teamservice.getTeamListByGroup(groupID,0);
		}
		return praise;
	}
	
	
	@RequestMapping("getPraiseSelect.act")
	public @ResponseBody String getPraiseSelect(
			@RequestParam(value = "groupID", required = true)int groupID){
		JSONArray array = JSONArray.fromObject(rewardService.getRewardListByGroup(groupID));
		return array.toString();
	}
	
	//获取发送消息的队伍
	@RequestMapping("manageStageselectMessageTeam.act")
	public @ResponseBody String selectMessageTeam(
			@RequestParam(value = "groupID",required = true)int groupID){
		//返回的状态更改
		return teamservice.getTeamListByGroup(groupID,0);
	}
	
	@RequestMapping("manageStageMessage.act")
	public @ResponseBody String message(
			@RequestParam(value = "leader",required = true)int leader,
			@RequestParam(value = "message",required = true)String message){
		messageService.getMessage(leader);
		System.out.println(" " + leader + message);
		return "1";
	}


}
