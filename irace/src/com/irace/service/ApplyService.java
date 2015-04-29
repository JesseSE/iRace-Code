/**
 * 
 */
package com.irace.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.irace.entity.ApplyEntity;

/**
 * @author Tracy
 *
 */
public interface ApplyService {

	public Integer addApply(ApplyEntity apply);
	
	public boolean delApply(int id);
	
	public ApplyEntity getApply(int id); //获取不包括外键实体
	
	public ApplyEntity getApplyDetail(int id); //获取包括外键实体
	
	public String getApplyList(int pageNo); //获取不包括外键实体
	
	public String getApplyListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateApply(ApplyEntity apply);
	
	/**
	 * 当提交报名表后，并且提交申请入队，队长审核是否通过入队 此操作会发送消息给相关用户
	 * 如果通过加入队伍，则把apply表中的team置为传入的teamID 并改变状态
	 * 如果拒绝加入队伍，则把apply表中的team置为null 并改变状态
	 * @param session
	 * @param applyID 报名表的ID
	 * @param isPass 是否通过入队请求
	 * @param teamID
	 * @return
	 */
	public String reviewMember(HttpSession session, int applyID, boolean isPass, int teamID);
	
	/**
	 * 当提交报名表后，进行申请入队操作， 此操作除了会把apply表中的team置为传入的teamID，还会发送消息给对应的team leader
	 * @param session
	 * @param applyID 报名表的ID
	 * @param isPass
	 * @return
	 */
	public String applyJoinTeam(HttpSession session, int applyID, int teamID);
}

