package com.irace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.view.View;


@Controller
@RequestMapping("/race/*")
public class RaceManageStageController extends SController{
	
	@RequestMapping("RaceManageStage")
	public View raceManageStage(){
		View view = new View("home","race","racemanage_stage","比赛管理");
		return view;	
	}
	
	//载入比赛名字
	@RequestMapping("manageStageLoadRaceName.act")
	public @ResponseBody String loadRaceName(
			@RequestParam(value="raceID",required=true) int raceID){
		return null;		
	}
	
	//载入组别
	@RequestMapping("manageStageLoadGroup.act")
	public @ResponseBody String loadRace(
			@RequestParam(value="raceID",required=true) int raceID){
		return null;	
	}
	
	//载入报名审核里的小组 
	@RequestMapping("manageStageLoadGroupTeam.act")
	public @ResponseBody String loadGroupTeam(
			@RequestParam(value="groupID",required=true) int groupID ){
		return null;	
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
