package com.irace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.ApplyEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.TeamEntity;
import com.irace.service.ApplyService;
import com.irace.service.RaceService;
import com.irace.service.TeamService;
import com.irace.service.UserService;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserTeamController extends SController{
	
	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="teamService")
	TeamService teamService;
	@Resource(name="userService")
	UserService userService;
	@Resource(name="applyService")
	ApplyService applyService;
	
	@RequestMapping("userTeam")
	public View UserTeamPage() {
		View view = new View("home","user", "user_team", "个人中心");		
		return view;
	}
	
	//通过UserID检索我创建的比赛
	@RequestMapping("getTeamCreate.act")
	public @ResponseBody String getTeamCreate(
			@RequestParam(value="userID",required=true)int userID){
		//test
		ApplyEntity apply = new ApplyEntity();
		apply.setId(1);
		RaceEntity race = new RaceEntity();
		race.setName("aaa");
		TeamEntity team = new TeamEntity();
		team.setName("bbb");
		apply.setRaceEntity(race);
		
		teamService.getCreatedTeamList(1, 1);
		
		return teamService.getCreatedTeamList(1, 1);	
	}
	
	//通过UserID检索我加入的比赛
	@RequestMapping("getTeamJoin.act")
	public @ResponseBody String getTeamJoin(
			@RequestParam(value="userID",required=true)int userID){
		return teamService.getJoinedTeamList(1, 1);	
	}
	
	//通过UserID检索我申请的比赛
	@RequestMapping("getTeamWait.act")
	public @ResponseBody String getTeamWait(
			@RequestParam(value="userID",required=true)int userID){
		return teamService.getApplyingTeamList(1, 1);	
	}
	
	//通过teamID检索出team成员
	@RequestMapping("getTeamMember.act")
	public @ResponseBody String getTeamMember(
			@RequestParam(value="teamID",required=true)int teamID){
		return userService.getTeamMemberListByUser(teamID);	
	}
	
	//通过teamID检索出team成员 且对team成员进行操作	
	@RequestMapping("getTeamMemberLeader.act")
	public @ResponseBody String getTeamMemberLeader(
			@RequestParam(value="teamID",required=true)int teamID){
		return userService.getTeamMemberListByUser(teamID);		
	}
	
	//通过对队员的审核，准许入队 返回 teamID
	@RequestMapping("getTeamChooseAgree.act")
	public @ResponseBody ApplyEntity getTeamChooseAgree(
			@RequestParam(value="applyID",required=true)int applyID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		apply.setStatus(3);
		applyService.updateApply(apply);
		return applyService.getApplyDetail(applyID);	
	}
	
	//拒绝该队员 返回teamID
	@RequestMapping("getTeamchooseRefuse.act")
	public @ResponseBody ApplyEntity getTeamchooseRefuse(
			@RequestParam(value="applyID",required=true)int applyID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		apply.setStatus(1);
		applyService.updateApply(apply);
		return applyService.getApplyDetail(applyID);		
	}
	
	//删除该队员 返回teamID
	@RequestMapping("getTeamchooseDelete.act")
	public @ResponseBody ApplyEntity getTeamchooseDelete(
			@RequestParam(value="applyID",required=true)int applyID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		apply.setStatus(1);
		applyService.updateApply(apply);
		return applyService.getApplyDetail(applyID);			
	}
	
}
