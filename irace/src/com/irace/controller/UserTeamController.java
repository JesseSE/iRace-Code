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
import com.irace.util.Constants;
import com.irace.util.InfoCode;

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
		String aaaa = teamService.getCreatedTeamList(1, 1);
		System.out.println(aaaa);
		
		return teamService.getCreatedTeamList(userID, 1);	
		//return null;
	}
	
	//通过UserID检索我加入的比赛
	@RequestMapping("getTeamJoin.act")
	public @ResponseBody String getTeamJoin(
			@RequestParam(value="userID",required=true)int userID){
		//return teamService.getCreatedTeamList(userID, 1);	
		return teamService.getJoinedTeamList(userID, 1);
		// null;
	}
	
	//通过UserID检索我申请的比赛
	@RequestMapping("getTeamWait.act")
	public @ResponseBody String getTeamWait(
			@RequestParam(value="userID",required=true)int userID){
		//return teamService.getCreatedTeamList(userID, 1);	
		return teamService.getApplyingTeamList(userID, 1);	
		//return null;
	}
	
	//通过teamID检索出team成员
	@RequestMapping("getTeamMember.act")
	public @ResponseBody String getTeamMember(
			@RequestParam(value="teamID",required=true)int teamID){
		return userService.getTeamMemberListByUser(teamID);
		//return null;
	}
	
	//通过teamID检索出team成员 且对team成员进行操作	
	@RequestMapping("getTeamMemberLeader.act")
	public @ResponseBody String getTeamMemberLeader(
			@RequestParam(value="teamID",required=true)int teamID){
		return userService.getTeamMemberListByUser(teamID);
		//return null;
	}
	
	//通过对队员的审核，准许入队 返回 teamID
	@RequestMapping("getTeamChooseAgree.act")
	public @ResponseBody String getTeamChooseAgree(
			@RequestParam(value="applyID",required=true)int applyID,
			@RequestParam(value="teamID",required=true)int teamID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		apply.setStatus(InfoCode.APPLY_STATUS_REVIEW_PASS);
		applyService.updateApply(apply);
		//return applyService.getApplyDetail(applyID);	
		return userService.getTeamMemberListByUser(teamID);
	}
	
	//拒绝该队员 返回teamID
	@RequestMapping("getTeamchooseRefuse.act")
	public @ResponseBody String getTeamchooseRefuse(
			@RequestParam(value="applyID",required=true)int applyID,
			@RequestParam(value="teamID",required=true)int teamID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		System.out.println("applyID"+applyID+"teamID"+teamID);
		apply.setStatus(InfoCode.APPLY_STATUS_REGISTERED);
		applyService.updateApply(apply);
		return userService.getTeamMemberListByUser(teamID);
	}
	
	//删除该队员 返回teamID
	@RequestMapping("getTeamchooseDelete.act")
	public @ResponseBody String getTeamchooseDelete(
			@RequestParam(value="applyID",required=true)int applyID,
			@RequestParam(value="teamID",required=true)int teamID){
		ApplyEntity apply = new ApplyEntity();
		apply.setId(applyID);
		apply.setStatus(InfoCode.APPLY_STATUS_REGISTERED);
		applyService.updateApply(apply);
		System.out.println("applyID"+applyID+"teamID"+teamID+"status"+InfoCode.APPLY_STATUS_REGISTERED);
		return userService.getTeamMemberListByUser(teamID);
	}
	
}
