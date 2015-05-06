package com.irace.dao.impl;


import java.util.List;

import org.hibernate.Query;

import com.irace.dao.UserDao;
import com.irace.entity.UserEntity;

public class UserDaoImpl extends SDao implements UserDao {

	
	@Override
	public Integer addUser(UserEntity user) {
		// TODO Auto-generated method stub
		return (Integer)this.sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public boolean delUser(Integer id) {
		// TODO Auto-generated method stub
		this.hql = "DELETE FROM UserEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public UserEntity getUser(Integer id) {
		// TODO Auto-generated method stub
		this.hql = "FROM UserEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (UserEntity) query.uniqueResult();
	}

	@Override
	public UserEntity getUser(String username) {
		// TODO Auto-generated method stub
		this.hql = "FROM UserEntity AS u WHERE u.username=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, username);
		return (UserEntity) query.uniqueResult();
	}

	@Override
	public UserEntity getUser(String username, String pwd) {
		// TODO Auto-generated method stub
		this.hql = "FROM UserEntity AS u WHERE u.username=? AND u.pwd=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, username);
		query.setString(1, pwd);
		return (UserEntity) query.uniqueResult();
	}
	
	@Override
	public List getUserList(Integer pageNo, Integer pageItemNum) {
		// TODO Auto-generated method stub
		this.hql = "FROM UserEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateUser(UserEntity user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(user);
		return true;
	}

	@Override
	public List getTeamMemberListByUser(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

}
