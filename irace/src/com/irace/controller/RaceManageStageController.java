package com.irace.controller;

import java.util.Date;
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
	
	//结束比赛
	@RequestMapping("finishRace.act")
	public @ResponseBody String finishRace(
			@RequestParam(value = "raceId" , required = true) int raceId){
		RaceEntity race = raceService.getRace(raceId);
		race.setStatus(1);
		raceService.updateRace(race);
		return "1";
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
		return teamService.getTeamListByGroup(groupID);	
	}
	
	
	//同意或拒绝队伍
	@RequestMapping("sendTeamStatus.act")
	public @ResponseBody String sendTeamStatus(
			@RequestParam(value="teamId",required = true) int teamID,
			@RequestParam(value="status",required = true) boolean status){
		TeamEntity team = teamService.getTeam(teamID);
		if(status){
			team.setStatus(3);
		}else{
			team.setStatus(4);
		}
		teamService.updateTeam(team);		
		System.out.print(team.getName());
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
	
	//提交物
	@RequestMapping("manageGetStagePhase.act")
	public @ResponseBody String phaseDoing(
			@RequestParam(value="phaseID",required=true) int phaseID){	
		JSONArray array = JSONArray.fromObject(submitService.getSubmitByStage(phaseID));
		return array.toString();		
	}
	
	//确定队伍是否淘汰
	@RequestMapping("manageStageTeamGoOrOut.act")
	public @ResponseBody String setStageTeamGoOrOut(
			@RequestParam(value="teamId",required=true) int teamId,
			@RequestParam(value = "isPassed",required = true)boolean isPassed){
		TeamEntity team = teamService.getTeam(teamId);
		if(isPassed){
			team.setStatus(5);
		}else
			team.setStatus(6);
		teamService.updateTeam(team);	
		return "1";		
	}
	
	//完成阶段
	@RequestMapping("manageStageFinishPhase.act")
	public @ResponseBody String finishPhase(
			@RequestParam(value = "phaseId",required = true)int phaseId){
		StageRaceEntity stage = stageService.getStage(phaseId);
		stage.setStatus(2);
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
			@RequestParam(value = "groupID",required = true)int groupID,
			@RequestParam(value = "isFinished", required = true) boolean isFinished){
		String praise= null;
		if(!isFinished){
			praise = teamService.getTeamListByGroup(groupID,2);
		}
		else{
			praise = teamService.getTeamListByGroup(groupID,2);
		}
		return praise;
	}
	
	//得到组别的奖项
	@RequestMapping("getPraiseSelect.act")
	public @ResponseBody String getPraiseSelect(
			@RequestParam(value = "groupID", required = true)int groupID){
		JSONArray array = JSONArray.fromObject(rewardService.getRewardListByGroup(groupID));
		return array.toString();
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
		messageEntity.setrUserEntity(userService.getUser(leader));
		messageEntity.setStatus(0);
		messageEntity.setTime(new Date());
		messageService.addMessage(messageEntity);
		System.out.println(" " + leader + message);
		return "1";
	}


}
