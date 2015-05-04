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
import com.irace.service.BigTypeService;
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
	@Resource(name="bigTypeService")
	BigTypeService bigTypeService;
	
	@RequestMapping("index")
	public View RacePage() {
		View view = new View("home","user", "index", "主页");		
		return view;
	}
	
	@RequestMapping("homepageShow.act")
	public @ResponseBody String loadAction(
			@RequestParam(value="currentpagenum",required=true)int pageNum){
		if( pageNum < 0 ){
			return null;
		}else{         
			return raceService.getRaceListDetail(pageNum);
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
		}
		return null;
	}
		
	@RequestMapping("homepageJump.act")
	public @ResponseBody String jumpAction(
            @RequestParam(value="orderByType",required=true)int orderByType,
			@RequestParam(value="orderByAD",required=true)int orderByAD)
	{
		System.out.println(" "+orderByType+" "+orderByAD);
		int pageNum =1;
		String returnString = "";
		switch(orderByType){
		case 1:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedHotPoint(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedHotPoint(pageNum, false);
			break;
		case 2:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedStartTime(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedStartTime(pageNum, false);
			break;
		case 3:
			if(orderByAD == 1)
				returnString = raceService.getRaceListBySortedEndTime(pageNum, true);		
			else
				returnString = raceService.getRaceListBySortedEndTime(pageNum, false);
			break;
		case 4:
			if(orderByAD == 1)
				returnString = raceService.getRaceListDetail(pageNum);		
			else
				returnString = raceService.getRaceListDetail(pageNum);	
			break;
		default :
			returnString = raceService.getRaceListDetail(pageNum);	
			break;
	
		}
			return returnString;
	}
	
	@RequestMapping("single")
	public View singlePage() {
		View view = new View("home","user", "single", "详细信息");		
		return view;
	}
}
