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

import com.irace.entity.OrganizerEntity;
import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
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
			//出现错误选择默认排序
			return raceService.getRaceListDetail(pageNum, sortKeyWords);
		}else{
			System.out.println(sortKeyWords);
			System.out.println(pageNum);
			System.out.println(orderByXX);
			System.out.println(orderByAD);
			System.out.println("开始在数据库中查询");
			
//			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum, sortKeyWords);
//			List<RaceEntity> raceEntityList1 = new ArrayList<RaceEntity>();		
//			Iterator<RaceEntity> iter = raceEntityList.iterator();  
//			
//			
//			 while(iter.hasNext()) {  				
//			 	RaceEntity d= iter.next();	
//	            
//	            RaceEntity mRace = new RaceEntity(d.getId(),
//	            		d.getOrganizer(),d.getName(),d.getType(),d.getGrade(),d.getPicUrl(),
//	            		d.getStartTime(),d.getEndTime(),d.getNumRest(),d.getContent());
//	            
//	            raceEntityList1.add(mRace);
//	        } 
//			 
//			return JsonUtil.listToJSONString(raceEntityList1);
			//这个地方为了简化你们控制层  我把从list到json串的封装写到了Service层
			
			
			/*if(orderByAD == 1){//升序排列				
				if(orderByXX == 1){//按照热度升序排列					
					return raceService.getRaceListBySortedHotPoint(pageNum, sortKeyWords,true);
				}else if(orderByXX == 2){//按时间升序排列
					return raceService.getRaceListBySortedStartTime(pageNum, sortKeyWords,true);
				}else if(orderByXX == 3){//按结束时间升序排列
					return raceService.getRaceListBySortedEndTime(pageNum, sortKeyWords,true);
				}else if(orderByXX == 4){//按照等级升序排列
					return raceService.getRaceListDetail(pageNum, sortKeyWords);
				}else
					return raceService.getRaceListDetail(pageNum, sortKeyWords);
			}else if(orderByAD == 2){//倒叙排列
				if(orderByXX == 1){//按照热度倒叙排列				
					return raceService.getRaceListBySortedHotPoint(pageNum, sortKeyWords,false);
				}else if(orderByXX == 2){//按时间倒叙排列
					return raceService.getRaceListBySortedStartTime(pageNum, sortKeyWords,false);
				}else if(orderByXX == 3){//按结束时间倒叙排列
					return raceService.getRaceListBySortedEndTime(pageNum, sortKeyWords,false);
				}else if(orderByXX == 4){//按照等级倒叙排列,目前默认
					return raceService.getRaceListDetail(pageNum, sortKeyWords);
				}else//默认排序
					return raceService.getRaceListDetail(pageNum, sortKeyWords);
			}else
				//错误选择，默认排序
				return raceService.getRaceListDetail(pageNum, sortKeyWords);
		}*/
			
			
			
			Date d = new Date();
			
			OrganizerEntity organizerEntity = new OrganizerEntity("ddddd", "ddvd", "fsvfs", "dfsd", "fdgfd", "dfdf");
			RaceEntity r1 = new RaceEntity();
			r1.setId(1);
			r1.setName("dfdfdfdfdf");
			r1.setStartTime(d);
			r1.setEndTime(d);
			r1.setPicUrl("/irace/public/images/pic2.jpg");
			r1.setOrganizerEntity(organizerEntity);
			RaceEntity r2 = new RaceEntity();
			r2.setId(2);
			r2.setName("dfdfdfdfdf");
			r2.setStartTime(d);
			r2.setEndTime(d);
			List<RaceEntity> raceEntityList = new ArrayList<RaceEntity>();
			raceEntityList.add(r1);
			raceEntityList.add(r2);
			r2.setName("dfdfdfdfdf");
			r2.setOrganizerEntity(organizerEntity);
			
			JSONArray arr = new JSONArray();
			for(Object obj : raceEntityList) {
				arr.add(JSONObject.fromObject(obj));
			}
			
			return arr.toString();
		}
	}
	
	/**
	 * 获取菜单
	 * @return
	 */
	@RequestMapping("getMenu.act")
	public @ResponseBody String getMenu(){
		System.out.println("开始去数据库获取菜单");
		
		Date d = new Date();
		
		OrganizerEntity organizerEntity = new OrganizerEntity("ddddd", "ddvd", "fsvfs", "dfsd", "fdgfd", "dfdf");
		RaceEntity r1 = new RaceEntity();
		r1.setId(1);
		r1.setName("dfdfdfdfdf");
		r1.setStartTime(d);
		r1.setEndTime(d);
		r1.setOrganizerEntity(organizerEntity);
		RaceEntity r2 = new RaceEntity();
		r2.setId(2);
		r2.setName("dfdfdfdfdf");
		r2.setStartTime(d);
		r2.setEndTime(d);
		r2.setOrganizerEntity(organizerEntity);
		List<RaceEntity> raceEntityList = new ArrayList<RaceEntity>();
		raceEntityList.add(r1);
		raceEntityList.add(r2);		
		
		RaceEntity r3 = new RaceEntity();
		r3.setId(3);
		r3.setName("dfdfdfdfdf");
		r3.setStartTime(d);
		r3.setEndTime(d);
		r3.setOrganizerEntity(organizerEntity);
		RaceEntity r4 = new RaceEntity();
		r4.setId(4);
		r4.setName("dfdfdfdfdf");
		r4.setStartTime(d);
		r4.setEndTime(d);
		r4.setOrganizerEntity(organizerEntity);
		raceEntityList.add(r3);
		raceEntityList.add(r4);
		
		
		JSONArray arr = new JSONArray();
		for(Object obj : raceEntityList) {
			arr.add(JSONObject.fromObject(obj));
		}
		
		
		
		
		
		return arr.toString();
	}
	
}
