package com.irace.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.dao.impl.RaceDaoImpl;
import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
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
		
		if(sortKeyWords == "" || pageNum < 0 || (orderByXX != 1 && orderByXX != 2 &&
				orderByXX != 3 && orderByXX != 4) || (orderByAD !=1 && orderByAD !=2) ){
			return null;
		}else{
			System.out.println(sortKeyWords);
			System.out.println(pageNum);
			System.out.println(orderByXX);
			System.out.println(orderByAD);
			System.out.println("开始在数据库中查询");
			
			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum, sortKeyWords);
			List<RaceEntity> raceEntityList1 = new ArrayList<RaceEntity>();		
			Iterator<RaceEntity> iter = raceEntityList.iterator();  
			
			
			 while(iter.hasNext()) {  				
			 	RaceEntity d= iter.next();	
	            
	            RaceEntity mRace = new RaceEntity(d.getId(),
	            		d.getOrganizer(),d.getName(),d.getType(),d.getGrade(),d.getPicUrl(),
	            		d.getStartTime(),d.getEndTime(),d.getNumRest(),d.getContent());
	            
	            raceEntityList1.add(mRace);
	        } 
			 
			return JsonUtil.listToJSONString(raceEntityList1);
		}
	}
	
}
