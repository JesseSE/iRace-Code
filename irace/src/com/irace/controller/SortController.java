package com.irace.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.BigTypeEntity;
import com.irace.entity.OrganizerEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.TypeRaceEntity;
import com.irace.service.BigTypeService;
import com.irace.service.RaceService;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class SortController {	
	public SortController() {}

	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="bigTypeService")
	BigTypeService bigTypeService;
	
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
	 * @param orderByAD 按照升序降序排列（1 2）
	 * @param orderByXX 按照热度，时间，等级等排序（1 2 3 4）
	 * @return
	 */
	@RequestMapping("sortRace.act")
	public @ResponseBody String sortAction(
			@RequestParam(value="sortKeyWords",required=true)String sortKeyWords,
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="orderByXX",required=true)int orderByXX,
			@RequestParam(value="orderByAD",required=true)int orderByAD){
		
		String relult = "";
		
		if(sortKeyWords == "" || pageNum < 0 || (orderByXX != 1 && orderByXX != 2 &&
					orderByXX != 3 && orderByXX != 4) || (orderByAD !=1 && orderByAD !=2) ){
				//出现错误选择默认排序
			relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
		}else{
			System.out.println(sortKeyWords);
			System.out.println(pageNum);
			System.out.println(orderByXX);
			System.out.println(orderByAD);
			System.out.println("开始在数据库中查询");			
			
			if(orderByAD == 1){//升序排列				
				if(orderByXX == 1){//按照热度升序排列					
					relult = raceService.getRaceListBySortedHotPoint(pageNum, sortKeyWords,true);
				}else if(orderByXX == 2){//按时间升序排列
					relult = raceService.getRaceListBySortedStartTime(pageNum, sortKeyWords,true);
				}else if(orderByXX == 3){//按结束时间升序排列
					relult = raceService.getRaceListBySortedEndTime(pageNum, sortKeyWords,true);
				}else if(orderByXX == 4){//按照等级升序排列
					relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
				}else
					relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
			}else if(orderByAD == 2){//倒叙排列
				if(orderByXX == 1){//按照热度倒叙排列				
					relult = raceService.getRaceListBySortedHotPoint(pageNum, sortKeyWords,false);
				}else if(orderByXX == 2){//按时间倒叙排列
					relult = raceService.getRaceListBySortedStartTime(pageNum, sortKeyWords,false);
				}else if(orderByXX == 3){//按结束时间倒叙排列
					relult = raceService.getRaceListBySortedEndTime(pageNum, sortKeyWords,false);
				}else if(orderByXX == 4){//按照等级倒叙排列,目前默认
					relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
				}else//默认排序
					relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
			}else
				//错误选择，默认排序
				relult = raceService.getRaceListDetail(pageNum, sortKeyWords);
		}
		
		if(relult == "")
			return raceService.getRaceListDetail(pageNum, sortKeyWords);
		else
			return relult;
			
			//调用测试方法
			//return testRace();
		//}
		//return raceService.getRaceListDetail(pageNum, sortKeyWords);
	}
	
	/**
	 * 获取菜单
	 * @return
	 */
	@RequestMapping("getMenu.act")
	public @ResponseBody String getMenu(){
		System.out.println("开始去数据库获取菜单");
		
		//调用获取菜单的方法
		return bigTypeService.getBigTypeListDetail();
		
		//这个是测试
		//return testRace();
	}
	
	/**
	 * 通过菜单栏选择比赛,通过比赛的类型查询比赛
	 * @return
	 */
	@RequestMapping("getRaceByMenu.act")
	public @ResponseBody String getRaceByMenu(
			@RequestParam(value="raceType",required=true)int raceType,
			@RequestParam(value="currentpagenum",required=true)int pageNum){
		
		System.out.println("开始按照菜单栏查找比赛" + raceType);
		return raceService.getRaceList(pageNum, raceType);
			
	}
	
	
	/**
	 * 这是一个用来测试显示比赛的方法
	 */
	private String testRace(){
		Date d = new Date();		
		OrganizerEntity organizerEntity = new OrganizerEntity("北京交通大学", "ddvd", "北京交通大学", "北京", "中国", "dfdf");
		RaceEntity r1 = new RaceEntity();
		TypeRaceEntity type = new TypeRaceEntity("计算机", 1);
		List<RaceEntity> raceEntityList = new ArrayList<RaceEntity>();
		for(int i=0;i<15;i++){
			r1.setId(i);
			r1.setName("服务外包大赛");
			r1.setContent("这是一个测试用的比赛");
			r1.setFocusNum(200);
			r1.setGrade("国家级");
			r1.setNumRest(5);
			r1.setTypeRaceEntity(type);
			r1.setTypeId(1);
			r1.setStartTime(d);
			r1.setEndTime(d);
			r1.setPicUrl("/irace/public/images/pic2.jpg");
			r1.setOrganizerEntity(organizerEntity);
			raceEntityList.add(r1);
		}		
		JSONArray arr = new JSONArray();
		for(Object obj : raceEntityList) {
			arr.add(JSONObject.fromObject(obj));
		}		
		return arr.toString();
	}
}
