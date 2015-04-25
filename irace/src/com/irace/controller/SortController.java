package com.irace.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class SortController {	
	public SortController() {}

	@Resource(name="raceService")
	RaceService raceService;	
	
	/**
	 * 查询比赛页面
	 * @return
	 */
	@RequestMapping("sort")
	public View sortPage(
			@RequestParam(value="sortKeyWords",required=true)String keyword) {
		View view = new View("home","user", "sort", "查询");
		view.addObject("keyword", keyword);
		
		return view;
	}
	
	/**
	 * 查询处理方法
	 * @param sortKeyKords	
	 * @param pageNum
	 * @return
	 */
	@RequestMapping("sortRace.act")
	public @ResponseBody String sortAction(
			@RequestParam(value="sortKeyWords",required=true)String sortKeyWords,
			@RequestParam(value="pageNum",required=true)int pageNum){
		if(sortKeyWords == "" || pageNum < 0 ){
			return null;
		}else{
			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum, sortKeyWords);
			return JsonUtil.listToJSONString(raceEntityList);
		}
	}
}
