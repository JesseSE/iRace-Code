package com.irace.util;

public class Constants {

	// 默认值
	public static Integer DEFAULT_PAGE_ITEM_NUM = 6; //默认每页显示条目数
	public static String DEFAULT_PAGE_TITLE = "iRace个人竞赛管家"; //页面默认标题	
	
	public static Integer UPLOAD_FILE_SIZE_LIMIT = 5242880; //5M
	
	public static String DEFAULT_FILE_ABSOLUTE_ROOT = "E:/project/Java/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/irace/public/images";
	
	public static String DEFAULT_SUBMIT_FILE_ROOT = "/irace/public/allSubmit/";
	
	public static String DEFAULT_FILE_ROOT = "/irace/public/images";
	
	public static String DEDAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm";
	
	
	//team 状态
	/***未提交***/
	public static Integer TEAM_NOT_SUBMIT = 1;
	/***等待审核***/
	public static Integer TEAM_WAIT_REVIEW = 2;
	/***审核通过***/
	public static Integer TEAM_PASS_REVIEW = 3;
	/***审核拒绝***/
	public static Integer TEAM_NOT_PASS_REVIEW = 4;
	/***比赛正在进行 ***/
	public static Integer TEAM_RACE_BEING = 5;
	/***队伍被淘汰***/
	public static Integer TEAM_RACE_OBSOLETE = 6;
	/***比赛已结束***/
	public static Integer TEAM_RACE_OVER = 7;
	/**已获奖****/
	public static Integer TEAM_RACE_AWARD = 8;
	
//	//Group 状态
//	/***报名审核***/
//	public static Integer GROUP_WAIT_REVIEW = 0;
//	/***开始比赛***/
//	public static Integer GROUP_RACE_BEING = 1;
//	/***比赛结束***/
//	public static Integer GROUP_RACE_OVER = 2;
//	/***颁奖结束***/
//	public static Integer GROUP_AWARD_OVER = 3;
	
	//STAGE状态
	/***正在审查***/
	public static Integer STAGE_REVIEW_BEING = 0;
	/***正在进行***/
	public static Integer STAGE_BEING = 1;
	/***已结结束***/
	public static Integer STAGE_OVER = 2;
}
