/**
 * 
 */
package com.irace.service;

import java.util.List;

import com.irace.entity.OrganizerEntity;

/**
 * @author Tracy
 *
 */
public interface OrganizerService {

	public Integer addOrganizer(OrganizerEntity organizer);
	
	public boolean delOrganizer(int id);
	
	public OrganizerEntity getOrganizer(int id); //获取不包括外键实体
	
	public OrganizerEntity getOrganizerDetail(int id); //获取包括外键实体
	
	public List getOrganizerList(int pageNo); //获取不包括外键实体
	
	public List getOrganizerListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateOrganizer(OrganizerEntity organizer);
}
