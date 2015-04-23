package com.irace.dao;

import java.util.List;

import com.irace.entity.NoticeEntity;

public interface NoticeDao {

	public Integer addNotice(NoticeEntity notice);
	
	public boolean delNotice(int id);
	
	public NoticeEntity getNotice(int id); //获取不包括外键实体
	
	public NoticeEntity getNoticeDetail(int id); //获取包括外键实体
	
	public List getNoticeList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getNoticeListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateNotice(NoticeEntity notice);
}
