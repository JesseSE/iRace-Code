/**
 * 
 */
package com.irace.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.RaceEntity;
import com.irace.service.RaceService;
import com.irace.util.JsonUtil;
import com.irace.view.View;

/**
 * @author Tracy
 *
 */
@Controller
@RequestMapping("/user/*")
public class RaceController extends SController {
	@Resource(name="raceService")
	RaceService raceService;
	
	@RequestMapping("index")
	public View sortPage() {
		View view = new View("home","user", "sort", "主页");		
		return view;
	}
	
	@RequestMapping("homepageShow.act")
	public @ResponseBody String loadAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum){
		if( pageNum < 0 ){
			return null;
		}else{
			System.out.println("开始在数据库中查询");
			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum);
			System.out.println(pageNum);  
			List<RaceEntity> raceEntityList1 = new ArrayList<RaceEntity>();		
			Iterator<RaceEntity> iter = raceEntityList.iterator();  			 
			
			 while(iter.hasNext()) {  				
			 	RaceEntity d= iter.next();	
			 	System.out.println(d.getId());  
		 	    System.out.println(d.getOrganizer());
                System.out.println(d.getName()); 
	            System.out.println(d.getContent());  
	            System.out.println(d.getStartTime());  
	            System.out.println(d.getEndTime());  
	            
	            RaceEntity mRace = new RaceEntity(d.getId(),
	            		d.getOrganizer(),d.getName(),d.getType(),d.getGrade(),d.getPicUrl(),
	            		d.getStartTime(),d.getEndTime(),d.getNumRest(),d.getContent());
	            
	            raceEntityList1.add(mRace);
	        } 
			 
			return JsonUtil.listToJSONString(raceEntityList1);
		}
	}
	
	@RequestMapping("homepageChoose.act")
	public @ResponseBody String chooseAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="chooseItem",required=true)int chooseItem)
	{
		if( pageNum < 0 ){
			return null;
		}else{
			System.out.println("开始在数据库中查询");
			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum,chooseItem);
			List<RaceEntity> raceEntityList1 = new ArrayList<RaceEntity>();		
			Iterator<RaceEntity> iter = raceEntityList.iterator();  			 
			
			 while(iter.hasNext()) {  				
			 	RaceEntity d= iter.next();	
			 	System.out.println(d.getId());  
		 	    System.out.println(d.getOrganizer());
                System.out.println(d.getName()); 
	            System.out.println(d.getContent());  
	            System.out.println(d.getStartTime());  
	            System.out.println(d.getEndTime());  
	            
	            RaceEntity mRace = new RaceEntity(d.getId(),
	            		d.getOrganizer(),d.getName(),d.getType(),d.getGrade(),d.getPicUrl(),
	            		d.getStartTime(),d.getEndTime(),d.getNumRest(),d.getContent());
	            
	            raceEntityList1.add(mRace);
	        } 
			 
			return JsonUtil.listToJSONString(raceEntityList1);
		}
	}
	
	@RequestMapping("homepageJump.act")
	public @ResponseBody String jumpAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="orderByType",required=true)int orderByType,
			@RequestParam(value="orderByAD",required=true)int orderByAD)
	{
		if( pageNum < 0 ){
			return null;
		}else{
			System.out.println("开始在数据库中查询");
			List<RaceEntity> raceEntityList = raceService.getRaceList(pageNum);
			List<RaceEntity> raceEntityList1 = new ArrayList<RaceEntity>();		
			Iterator<RaceEntity> iter = raceEntityList.iterator();  			 
			
			 while(iter.hasNext()) {  				
			 	RaceEntity d= iter.next();	
			 	System.out.println(d.getId());  
		 	    System.out.println(d.getOrganizer());
                System.out.println(d.getName()); 
	            System.out.println(d.getContent());  
	            System.out.println(d.getStartTime());  
	            System.out.println(d.getEndTime());  
	            
	            RaceEntity mRace = new RaceEntity(d.getId(),
	            		d.getOrganizer(),d.getName(),d.getType(),d.getGrade(),d.getPicUrl(),
	            		d.getStartTime(),d.getEndTime(),d.getNumRest(),d.getContent());
	            
	            raceEntityList1.add(mRace);
	        } 
			 
			return JsonUtil.listToJSONString(raceEntityList1);
		}
	}
}
