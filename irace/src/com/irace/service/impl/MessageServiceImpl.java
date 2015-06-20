/**
 * 
 */
package com.irace.service.impl;

import java.util.List;

import com.irace.dao.MessageDao;
import com.irace.entity.MessageEntity;
import com.irace.service.MessageService;
import com.irace.util.Constants;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;

/**
 * @author Tracy
 *
 */
public class MessageServiceImpl implements MessageService {

	private MessageDao messageDao;

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.irace.service.MessageService#addMessage(com.irace.entity.MessageEntity
	 * )
	 */
	@Override
	public Integer addMessage(MessageEntity message) {
		// TODO Auto-generated method stub
		return messageDao.addMessage(message);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.irace.service.MessageService#delMessage(int)
	 */
	@Override
	public boolean delMessage(int id) {
		// TODO Auto-generated method stub
		return messageDao.delMessage(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.irace.service.MessageService#getMessage(int)
	 */
	@Override
	public MessageEntity getMessage(int id) {
		// TODO Auto-generated method stub
		return messageDao.getMessage(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.irace.service.MessageService#getMessageDetail(int)
	 */
	@Override
	public MessageEntity getMessageDetail(int id) {
		// TODO Auto-generated method stub
		return messageDao.getMessageDetail(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.irace.service.MessageService#getMessageList(int)
	 */
	@Override
	public List getMessageList(int pageNo) {
		// TODO Auto-generated method stub
		return messageDao.getMessageList(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.irace.service.MessageService#getMessageListDetail(int, int)
	 */
	@Override
	public List getMessageListDetail(int pageNo) {
		// TODO Auto-generated method stub
		return messageDao.getMessageListDetail(pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.irace.service.MessageService#updateMessage(com.irace.entity.MessageEntity
	 * )
	 */
	@Override
	public boolean updateMessage(MessageEntity message) {
		// TODO Auto-generated method stub
		return messageDao.updateMessage(message);
	}

	@Override
	public String getMessageList(int userId, int pageNo, boolean isRead) {
		// TODO Auto-generated method stub
		//List res = messageDao.getMessageList(userId, pageNo,Constants.DEFAULT_PAGE_ITEM_NUM, isRead);
		//return JsonUtil.listToJSONString(res, new String[] { "userEntity","groupRaceEntity", "raceEntity", "teamEntity" });
		return JsonUtil.getJsonByMapList(messageDao.getMessageList(userId, pageNo,
				Constants.DEFAULT_PAGE_ITEM_NUM, isRead));
	}

	@Override
	public boolean readMessage(int msgId) {
		// TODO Auto-generated method stub
		MessageEntity msg = messageDao.getMessage(msgId);
		msg.setStatus(InfoCode.MSG_READED);
		return messageDao.updateMessage(msg);
	}

}
