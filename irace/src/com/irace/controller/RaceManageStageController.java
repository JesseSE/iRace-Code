package com.irace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.irace.view.View;


@Controller
@RequestMapping("/race/*")
public class RaceManageStageController extends SController{
	
	@RequestMapping("RaceManageStage")
	public View RaceManageStage(){
		View view = new View("home","race","racemanage_stage","比赛管理");
		return view;	
	}

}
