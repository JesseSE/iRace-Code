package com.irace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserTeamController extends SController{
	@RequestMapping("user_team")
	public View RacePage() {
		View view = new View("home","user", "user_team", "个人中心");		
		return view;
	}
}
