/**
 * 此控制器用于测试  没有实际用途
 */
package com.irace.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.GroupRaceEntity;
import com.irace.entity.PropertyEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.RewardEntity;
import com.irace.entity.StageRaceEntity;
import com.irace.service.BigTypeService;
import com.irace.service.GroupRaceService;
import com.irace.service.PropertyService;
import com.irace.service.RaceService;
import com.irace.service.RewardService;
import com.irace.service.StageService;
import com.irace.service.TypeRaceService;
import com.irace.util.Constants;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;
import com.irace.util.TimeUtil;
import com.irace.view.View;

/**
 * @author Tracy
 *
 */

@Controller
@RequestMapping("/organizer/*")
public class RaceManageController {

	@Resource(name="raceService")
	RaceService raceService;
	@Resource(name="groupRaceService")
	GroupRaceService groupRaceService;
	@Resource(name="rewardService")
	RewardService rewardService;
	@Resource(name="stageService")
	StageService stageService;
	@Resource(name="propertyService")
	PropertyService propertyService;
	@Resource(name="bigTypeService")
	BigTypeService bigTypeService;
	@Resource(name="typeRaceService")
	TypeRaceService typeRaceService;
	
	@RequestMapping("test")
	public @ResponseBody String test() {
		
		//return raceService.getRaceList(1);
		return raceService.getRaceListDetail(1);
	}
	
	
	@RequestMapping("detail/demo")
	public View demo() {
		return new View("home","race","detail01","比赛详情 demo");
	}
	
	
	@RequestMapping("/racemanage_detail/{id}")
	public View racemanage_detail(@PathVariable(value="id")Integer id) {
		
		RaceEntity race = raceService.getRaceDetail(id);
		List<PropertyEntity> propertyList = propertyService.getPropertyList(id);
		List<GroupRaceEntity> groupList= groupRaceService.getGroupRaceList(id);
		List<Map<String,Object>> rewardList = new ArrayList<Map<String,Object>>();
		for(GroupRaceEntity g : groupList) {
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("gid", g.getId());
			m.put("gname", g.getName());
			m.put("rlist", rewardService.getRewardListByGroup(g.getId()));
			rewardList.add(m);
		}
		
		List<Map<String,Object>> stageList = new ArrayList<Map<String,Object>>();
		for(GroupRaceEntity g : groupList) {
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("gid", g.getId());
			m.put("gname", g.getName());
			m.put("slist", stageService.getStageList(g.getId()));
			stageList.add(m);
		}
		
		View view = new View("home","organizer", "racemanage_detail", race.getName());
		view.addObject("race", race);
		view.addObject("groupList", groupList);
		view.addObject("rewardList", rewardList);
		view.addObject("propertyList", propertyList);
		view.addObject("stageList", stageList);
		view.addObject("bigTypeList",bigTypeService.getBigTypeList());
		view.addObject("raceID",id);
		return view;
	}
	
	@RequestMapping("addProperty")
	@ResponseBody
	public String addProperty(
			@RequestParam(value="raceId")Integer raceId,
			@RequestParam(value="name")String name,
			@RequestParam(value="desc")String desc) {
		PropertyEntity p = new PropertyEntity();
		p.setRace(raceId);
		p.setName(name);
		p.setRequires(desc);
		int res = propertyService.addProperty(p);
		if(res > 0) {
			return JsonUtil.getJsonInfo(InfoCode.OK, String.valueOf(res));
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("delProperty")
	@ResponseBody
	public String delProperty(
			@RequestParam(value="id")Integer id) {
		
		if(propertyService.delProperty(id)) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	
	@RequestMapping("addGroup")
	@ResponseBody
	public String addGroup(
			@RequestParam(value="raceId")Integer raceId,
			@RequestParam(value="name")String name,
			@RequestParam(value="desc")String desc) {
		GroupRaceEntity g = new GroupRaceEntity();
		g.setRace(raceId);
		g.setName(name);
		g.setRequires(desc);
		int res = groupRaceService.addGroupRace(g);
		if(res > 0) {
			return JsonUtil.getJsonInfo(InfoCode.OK, String.valueOf(res));
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("delGroup")
	@ResponseBody
	public String delGroup(
			@RequestParam(value="id")Integer id) {
		
		if(groupRaceService.delGroupRace(id)) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("addReward")
	@ResponseBody
	public String addReward(
			@RequestParam(value="groupId")Integer groupId,
			@RequestParam(value="name")String name,
			@RequestParam(value="content")String content) {
		RewardEntity r = new RewardEntity();
		r.setGroupId(groupId);
		r.setName(name);
		r.setContent(content);;
		int res = rewardService.addReward(r);
		if(res > 0) {
			return JsonUtil.getJsonInfo(InfoCode.OK, String.valueOf(res));
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("delReward")
	@ResponseBody
	public String delReward(
			@RequestParam(value="id")Integer id) {
		
		if(rewardService.delReward(id)) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("addStage")
	@ResponseBody
	public String addStage(
			@RequestParam(value="groupId")Integer groupId,
			@RequestParam(value="name")String name,
			@RequestParam(value="content")String content,
			@RequestParam(value="startTime")String startTime,
			@RequestParam(value="endTime")String endTime) {
		
		try {
			Date start = TimeUtil.formatStrToDate(startTime, Constants.DEDAULT_DATE_FORMAT);
			Date end = TimeUtil.formatStrToDate(endTime, Constants.DEDAULT_DATE_FORMAT);
			StageRaceEntity s = new StageRaceEntity(groupId, name, content, start, end);
			
			int res = stageService.addStage(s);
			if(res > 0) {
				return JsonUtil.getJsonInfo(InfoCode.OK, String.valueOf(res));
			} else {
				return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"日期格式错误！");
		}
		
	}
	
	@RequestMapping("delStage")
	@ResponseBody
	public String delStage(
			@RequestParam(value="id")Integer id) {
		
		if(stageService.delStage(id)) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"增加失败！");
		}
	}
	
	@RequestMapping("updateRaceAvatar")
	@ResponseBody
	public String updateRaceAvatar (@RequestParam(value="id")Integer id,
			@RequestParam(value="imgName")String imgName) {
		RaceEntity race = raceService.getRace(id);
		race.setPicUrl(Constants.DEFAULT_FILE_ROOT+"/"+imgName);
		if(raceService.updateRace(race)) {
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"更新图片失败！");
		}
		
	}
	
	@RequestMapping("getRaceType")
	@ResponseBody
	public String getRaceType (@RequestParam(value="bigTypeId")Integer bigTypeId) {
		
		if(bigTypeId > 0) {
			List l = typeRaceService.getTypeRaceList(bigTypeId);
			return JsonUtil.listToJSONString(l, new String[]{ "bigTypeEntity" });
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR,"ID非法！");
		}
		
	}
	
}
