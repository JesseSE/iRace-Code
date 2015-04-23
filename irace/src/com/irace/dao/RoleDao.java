package com.irace.dao;

import java.util.List;

import com.irace.entity.RoleEntity;

public interface RoleDao {

	public Integer addRole(RoleEntity role);
	
	public boolean delRole(int id);
	
	public RoleEntity getRole(int id); //获取不包括外键实体
	
	public RoleEntity getRoleDetail(int id); //获取包括外键实体
	
	public List getRoleList(int pageNo, int pageItemNum); //获取不包括外键实体
	
	public List getRoleListDetail(int pageNo, int pageItemNum); //获取包括外键实体
	
	public boolean updateRole(RoleEntity role);
}
