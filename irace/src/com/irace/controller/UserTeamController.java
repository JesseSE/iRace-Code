package com.irace.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.service.RaceService;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserTeamController extends SController{
	
	@Resource(name="raceService")
	RaceService raceService;	
	
	@RequestMapping("userTeam")
	public View UserTeamPage() {
		View view = new View("home","user", "user_team", "个人中心");		
		return view;
	}
	
	@RequestMapping("getTeam.act")
	public @ResponseBody String getHeldedRace(		
			@RequestParam(value="userId",required=true)int userId){		
		return null;			
	}
	
}
