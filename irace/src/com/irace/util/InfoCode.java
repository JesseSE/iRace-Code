/**
 * 定义系统的操作代码，以进行错误处理
 */
package com.irace.util;

/**
 * @author Tracy
 *
 */
public class InfoCode {

	/************************通用的code定义*************************/
	public static final Integer OK = 200; //正确
	public static final Integer UNKNOWN = -1; //未知的错误
	public static final Integer OTHER_ERROR = 0; //其他信息
	public static final Integer PERMISSION_DENIED = 201; //权限不足
	public static final Integer LOGIN_TIMEOUT = 202; //登录超时
	
	/************************报名状态*************************/
	
	/**************报名状态：已报名 **************/
	public static final Integer APPLY_STATUS_REGISTERED = 0;
	/**************报名状态：已提交入队申请 **************/
	public static final Integer APPLY_STATUS_APPLYED = 1;
	/**************报名状态：已加入队伍 **************/
	public static final Integer APPLY_STATUS_REVIEW_PASS = 2; 
	
}
