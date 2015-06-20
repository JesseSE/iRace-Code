package com.irace.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.GroupRaceEntity;
import com.irace.entity.MessageEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.StageRaceEntity;
import com.irace.entity.TeamEntity;
import com.irace.service.ApplyInfoService;
import com.irace.service.GroupRaceService;
import com.irace.service.MessageService;
import com.irace.service.RaceService;
import com.irace.service.RewardService;
import com.irace.service.StageService;
import com.irace.service.SubmitService;
import com.irace.service.TeamService;
import com.irace.service.UserService;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/race/*")
public class RaceManageStageController extends SController{
	 
	@Resource(name = "raceService")
	RaceService raceService;
	@Resource(name = "groupRaceService")
	GroupRaceService groupRaceService;
	@Resource(name = "teamService")
	TeamService teamService;
	@Resource(name = "stageService")
	StageService stageService;
	@Resource(name = "submitService")
	SubmitService submitService;
	@Resource(name = "rewardService")
	RewardService rewardService;
	@Resource(name = "messageService")
	MessageService messageService;
	@Resource(name = "applyInfoService")
	ApplyInfoService applyInfoService;
	@Resource(name = "userService")
	UserService userService;
	
	@RequestMapping("RaceManageStage")
	public View raceManageStage(
			@RequestParam(value = "raceID",required = true)int raceID,
			HttpSession session){
		View view = new View("home","race","racemanage_stage","比赛管理");
		view.addObject("raceIDHTML",raceID);
		if(session.getAttribute("oid") != null)
			return view;
		else
			return new View("home", "user", "login", "登陆");	
	}
	
	//载入比赛名字
	@RequestMapping("manageStageLoadRaceName.act")
	public @ResponseBody String loadRaceName(
			@RequestParam(value="raceID",required=true) int raceID){
		System.out.println(raceService.getRace(raceID).getName());
		Map<String,Object> map = new HashMap<String, Object>();
		RaceEntity race = raceService.getRace(raceID);
		map.put("name", race.getName());
		map.put("status", race.getStatus());
		System.out.println(race.getStatus());
		JSONArray array = JSONArray.fromObject(map);
		return array.toString();		
	}
	
	//结束比赛
	@RequestMapping("managerStageFinishRace.act")
	public @ResponseBody String finishRace(
			@RequestParam(value = "raceId" , required = true) int raceId){	
		RaceEntity race = raceService.getRace(raceId);
		int status = race.getStatus();
		if(status < 3)
			race.setStatus(status + 1);	
		raceService.updateRace(race);
		return "1";
	}
	
	//载入组别
	@RequestMapping("manageStageLoadGroup.act")
	public @ResponseBody String loadRace(
			@RequestParam(value="raceID",required=true) int raceID){
		JSONArray array = JSONArray.fromObject(myGroupList(groupRaceService.getGroupRaceList(raceID)));
		return array.toString();	
	}
	
	//载入报名审核里的小组 
	@RequestMapping("manageStageLoadGroupTeam.act")
	public @ResponseBody String loadGroupTeam(
			@RequestParam(value="groupID",required=true) int groupID ){	
		return teamService.getTeamListByGroup(groupID);	
	}
	
	
	//同意或拒绝队伍
	@RequestMapping("sendTeamStatus.act")
	public @ResponseBody String sendTeamStatus(
			@RequestParam(value="teamId",required = true) int teamID,
			@RequestParam(value="status",required = true) boolean status){
		TeamEntity team = teamService.getTeamDetail(teamID);
		if(status){
			team.setStatus(2);
		}else{
			team.setStatus(3);
		}
		teamService.updateTeam(team);		
		return teamService.getTeamListByGroup(team.getGroup());	
	}
	
	//载入报名审核小组里成员的详细信息
	@RequestMapping("managerStageShowSpecific.act")
	public @ResponseBody String loadGroupTeamMember(
			@RequestParam(value="applyId",required=true) int applyId,
			@RequestParam(value = "raceId",required = true)int raceID){	
		return applyInfoService.getApplyInfoListByAR(applyId, raceID);	
	}

	
	//载入阶段选项框
	@RequestMapping("manageStageLoadPhase.act")
	public @ResponseBody String loadPhase(
			@RequestParam(value="groupID",required=true) int groupID){
		JSONArray array = JSONArray.fromObject(myStage(stageService.getStageList(groupID)));
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
	
	//提交物
	@RequestMapping("manageGetStagePhase.act")
	public @ResponseBody String phaseDoing(
			@RequestParam(value="phaseID",required=true) int phaseID){	
//		JSONArray array = JSONArray.fromObject(submitService.getSubmitByStage(phaseID));
//		return array.toString();	
		return JsonUtil.getJsonByMapList(submitService.getSubmitByStage(phaseID));
	}
	
	//确定队伍是否淘汰
	@RequestMapping("manageStageTeamGoOrOut.act")
	public @ResponseBody String setStageTeamGoOrOut(
			@RequestParam(value="teamId",required=true) int teamId){
		TeamEntity team = teamService.getTeam(teamId);
		team.setStatus(3);
		teamService.updateTeam(team);	
		return "1";		
	}
	
	//完成阶段
	@RequestMapping("manageStageFinishPhase.act")
	public @ResponseBody String finishPhase(
			@RequestParam(value = "phaseId",required = true)int phaseId,
			@RequestParam(value = "status",required = true)int status){
		System.out.println(phaseId + " " + status);
		StageRaceEntity stage = stageService.getStage(phaseId);
		System.out.print(stage.getName() + stage.getStatus());
		stage.setStatus(status);
		stageService.updateStage(stage);
		return "1";
	}
	
	//得到奖项的标题
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
	
	//颁奖的队伍
	@RequestMapping("manageStageGetPraise.act")
	public @ResponseBody String getPraise(
			@RequestParam(value = "groupID",required = true)int groupID){
		return teamService.getTeamListByGroup(groupID,0);
	}
	
	//得到组别的奖项
	@RequestMapping("getPraiseSelect.act")
	public @ResponseBody String getPraiseSelect(
			@RequestParam(value = "groupID", required = true)int groupID){
		return JsonUtil.getJsonByMapList(rewardService.getRewardListByGroup(groupID));
//		JSONArray array = JSONArray.fromObject(rewardService.getRewardListByGroup(groupID));
//		return array.toString();
	}
	
	//给队伍颁奖
	@RequestMapping("mamageStageSendPraise.act")
	public @ResponseBody String sendPraise(
			@RequestParam(value = "teamId",required = true)int teamId,
			@RequestParam(value = "praiseId",required = true)int praiseId){
		TeamEntity team = teamService.getTeam(teamId);
		team.setReward(praiseId);
		team.setStatus(7);
		teamService.updateTeam(team);
		return "1";
	}
	
	//完成颁奖
	@RequestMapping("manageStageFinishPraise.act")
	public @ResponseBody String finishPraise(
			@RequestParam(value = "groupId",required = true)int groupId){
		GroupRaceEntity group = groupRaceService.getGroupRace(groupId);
		group.setStatus(3);
		groupRaceService.updateGroupRace(group);
		return "1";
	}
	
	//获取发送消息的队伍
	@RequestMapping("manageStageselectMessageTeam.act")
	public @ResponseBody String selectMessageTeam(
			@RequestParam(value = "groupID",required = true)int groupID){
		//返回的状态更改
		return teamService.getTeamListByGroup(groupID);
	}
	
	//发送消息
	@RequestMapping("manageStageMessage.act")
	public @ResponseBody String message(
			@RequestParam(value = "leader",required = true)int leader,
			@RequestParam(value = "message",required = true)String message){
		MessageEntity messageEntity = new MessageEntity();
		//messageEntity.setrUserEntity(userService.getUser(leader));
		messageEntity.setReceiver(leader);
		messageEntity.setStatus(0);
		messageEntity.setTime(new Date());
		messageEntity.setContent(message);
		messageEntity.setSender(2);
		messageService.addMessage(messageEntity);
		System.out.println(" " + leader + message);
		return "1";
	}
	
	private List myGroupList(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<GroupRaceEntity> it = list.iterator();
		while(it.hasNext()){
			GroupRaceEntity group = it.next();
			Map<String,String> map = new HashMap<String,String>();
			map.put("id", Integer.toString(group.getId()));
			map.put("name",group.getName());
			map.put("status", Integer.toString(group.getStatus()));
			listMap.add(map);
		}
		return listMap;
	}
	
	private List myStage(List list){
		List<Map> listMap = new ArrayList<Map>();
		Iterator<StageRaceEntity> it = list.iterator();
		while(it.hasNext()){
			StageRaceEntity stage = it.next();
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", Integer.toString(stage.getId()));
			map.put("name", stage.getName());
			map.put("status", Integer.toString(stage.getStatus()));
			//map.put("startTime", stage.getStartTime().toString());
			//map.put("endTime",stage.getEndTime().toString());
			//map.put("groupName", stage.getGroupRaceEntity().getName());
			listMap.add(map);
		}
		return listMap;
	}

}
