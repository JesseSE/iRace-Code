package com.irace.dao;

import java.util.List;

import com.irace.entity.MessageEntity;

public interface MessageDao {

	public Integer addMessage(MessageEntity message);
	
	public boolean delMessage(int id);
	
	public MessageEntity getMessage(int id); //获取不包括外键实体
	
	public MessageEntity getMessageDetail(int id); //获取包括外键实体
	
	public List getMessageList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getMessageListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateMessage(MessageEntity message);
}
