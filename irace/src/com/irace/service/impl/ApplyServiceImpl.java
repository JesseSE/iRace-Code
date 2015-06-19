/**
 * 
 */
package com.irace.service.impl;

import javax.servlet.http.HttpSession;

import com.irace.dao.ApplyDao;
import com.irace.dao.MessageDao;
import com.irace.entity.ApplyEntity;
import com.irace.entity.MessageEntity;
import com.irace.service.ApplyService;
import com.irace.util.Constants;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;

/**
 * @author Tracy
 *
 */
public class ApplyServiceImpl implements ApplyService {

	private ApplyDao applyDao;
	private MessageDao messageDao;
	
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	@Override
	public Integer addApply(ApplyEntity apply) {
		// TODO Auto-generated method stub
		return applyDao.addApply(apply);
	}

	@Override
	public boolean delApply(int id) {
		// TODO Auto-generated method stub
		return applyDao.delApply(id);
	}

	@Override
	public ApplyEntity getApply(int id) {
		// TODO Auto-generated method stub
		return applyDao.getApply(id);
	}

	@Override
	public ApplyEntity getApplyDetail(int id) {
		// TODO Auto-generated method stub
		return applyDao.getApplyDetail(id);
	}

	@Override
	public String getApplyList(int pageNo) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(applyDao.getApplyList(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), new String[]{"sUserEntity","rUserEntity"});
	}

	@Override
	public String getApplyListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		return JsonUtil.listToJSONString(applyDao.getApplyListDetail(pageNo, Constants.DEFAULT_PAGE_ITEM_NUM), null);
	}

	@Override
	public boolean updateApply(ApplyEntity apply) {
		// TODO Auto-generated method stub
		return applyDao.updateApply(apply);
	}

	@Override
	public String reviewMember(HttpSession session, int applyID, boolean isPass, int teamID) {
		// TODO Auto-generated method stub
		ApplyEntity apply = applyDao.getApply(applyID);
		if(isPass) {
			apply.setTeam(teamID);
			apply.setStatus(InfoCode.APPLY_STATUS_REVIEW_PASS);
		} else {
			apply.setTeam(null);
			apply.setStatus(InfoCode.APPLY_STATUS_REGISTERED);
		}
		if(applyDao.updateApply(apply)) {
			MessageEntity msg = new MessageEntity();
			
			
			
			
			
			messageDao.addMessage(msg);
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "审核队员时更新错误！");
		}
		
	}

	@Override
	public String applyJoinTeam(HttpSession session, int applyID, int teamID) {
		// TODO Auto-generated method stub
		ApplyEntity apply = applyDao.getApply(applyID);
		apply.setTeam(teamID);
		apply.setStatus(InfoCode.APPLY_STATUS_APPLYED);
		if(applyDao.updateApply(apply)) {
			MessageEntity msg = new MessageEntity();
			
			
			
			
			
			messageDao.addMessage(msg);
			
			
			return JsonUtil.getJsonInfoOK();
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "审核队员时更新错误！");
		}
	}

	@Override
	public String getTeamDetail(int userId, int raceId) {
		String[] filterStr = {"groupRaceEntity","raceEntity","userEntity"};
		//return JsonUtil.listToJSONString(applyDao.getTeamDetail(userId, raceId), filterStr);
		return JsonUtil.getJsonByMapList(applyDao.getTeamDetail(userId, raceId));
	}

	@Override
	public boolean hasApplyed(int userId, int raceId) {
		// TODO Auto-generated method stub
		return applyDao.getTeamDetail(userId, raceId) != null;
	}

	@Override
	public ApplyEntity getApply(int uid, int groupId) {
		// TODO Auto-generated method stub
		return applyDao.getApply(uid, groupId);
	}
}
