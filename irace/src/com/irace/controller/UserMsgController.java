package com.irace.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irace.entity.MessageEntity;
import com.irace.entity.UserEntity;
import com.irace.service.MessageService;
import com.irace.util.Constants;
import com.irace.util.JsonUtil;
import com.irace.view.View;

@Controller
@RequestMapping("/user/*")
public class UserMsgController {
	@Resource(name="messageService")
	MessageService messageService;
	
	/**
	 *用户消息管理
	 */
	@RequestMapping("usermsg")
	public View userMsgPage() {
		return new View("home", "user", "user_msg", "消息管理");
	}
	
	/**
	 * 获取还未阅读的比赛
	 * @param 	pageNum
	 * @param userId
	 */
	@RequestMapping("getNewMsg.act")
	public @ResponseBody String getNewMsg(		
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="userId",required=true)int userId){
				
		System.out.println("新消息管理" + pageNum);	
		return messageService.getMessageList(userId,pageNum, false);
		//return mkMsg();
	}
	
	/**
	 * 获取已经阅读过的比赛
	 * @param pageNum
	 * @param userId 
	 * @return
	 */
	@RequestMapping("getOldMsg.act")
	public @ResponseBody String getOldMsg(		
			@RequestParam(value="currentpagenum",required=true)int pageNum,
			@RequestParam(value="userId",required=true)int userId){
				
		System.out.println("旧消息管理" + pageNum);		
		return messageService.getMessageList(userId,pageNum,true);
		//return mkMsg();
	}

	@RequestMapping("setMsgStatus.act")
	public @ResponseBody String setMsgStatus(
			@RequestParam(value="msgId",required=true)int msgId){
		//System.out.println(msgId);
		if(messageService.readMessage(msgId))
			return "YES";
		else
			return "NO";
	}
	
	
	public String mkMsg(){
		MessageEntity me = new MessageEntity();
		UserEntity se = new UserEntity("王场", "dsdssd", "哈哈哈哈", 1, "18811439834",
				"88888", "555", "as.jpg");
		se.setId(1);
		me.setId(1);
		me.setSender(se.getId());
		me.setsUserEntity(se);
		me.setContent("dfsdfffffffffffffffffffffffffffffffffffffdddddddddddddddd");
		me.setStatus(1);
		me.setTime(new Date());
		
		List<MessageEntity> li = new ArrayList<MessageEntity>();
		li.add(me);
		MessageEntity me1 = new MessageEntity();
		me1.setId(2);
		me1.setSender(se.getId());
		me1.setsUserEntity(se);
		me1.setContent("sfwgthtjtyyuky");
		me1.setStatus(1);
		me1.setTime(new Date());
		li.add(me1);
		
		return JsonUtil.listToJSONString(li,null);
	}
}
