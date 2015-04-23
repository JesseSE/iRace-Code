package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.RoleDao;
import com.irace.entity.RaceEntity;
import com.irace.entity.RoleEntity;

public class RoleImpl extends SDao implements RoleDao{

	@Override
	public Integer addRole(RoleEntity role) {
		return (Integer)this.sessionFactory.getCurrentSession().save(role);
	}

	@Override
	public boolean delRole(int id) {
		this.hql = "DELETE FROM RoleEntity AS r WHERE r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public RoleEntity getRole(int id) {
		this.hql = "FROM RoleEntity AS r WHERE r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (RoleEntity) query.uniqueResult();
	}

	@Override
	public RoleEntity getRoleDetail(int id) {
		this.hql = "FROM RaceEntity AS r inner join fetch organizerEntity AS o where r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (RoleEntity)query.uniqueResult();	
	}

	@Override
	public List getRoleList(int pageNo, int pageItemNum) {
		this.hql = "FROM RoleEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRoleListDetail(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateRole(RoleEntity role) {
		sessionFactory.getCurrentSession().update(role);
		return true;
	}

}
