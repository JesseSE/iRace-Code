/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.MessageEntity;

/**
 * @author Tracy
 *
 */
public interface MessageService {

	public Integer addMessage(MessageEntity message);
	
	public boolean delMessage(int id);
	
	public MessageEntity getMessage(int id); //获取不包括外键实体
	
	public MessageEntity getMessageDetail(int id); //获取包括外键实体
	
	public List getMessageList(int pageNo); //获取不包括外键实体
	
	public List getMessageListDetail(int pageNo); //获取包括外键实体
	
	public String getMessageList(int userId,int pageNo,boolean isRead);
	
	public boolean readMessage(int msgId);
	
	public boolean updateMessage(MessageEntity message);
}
