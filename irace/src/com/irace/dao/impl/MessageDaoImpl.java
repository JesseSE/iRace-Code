package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.MessageDao;
import com.irace.entity.MessageEntity;
import com.irace.entity.RaceEntity;

public class MessageDaoImpl extends SDao implements MessageDao{

	@Override
	public Integer addMessage(MessageEntity message) {
		return (Integer) this.sessionFactory.getCurrentSession().save(message);
	}

	@Override
	public boolean delMessage(int id) {
		this.hql = "DELETE FROM MessageEntity AS m WHERE m.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);			
		return query.executeUpdate() > 0;
	}

	@Override
	public MessageEntity getMessage(int id) {
		this.hql = "FROM MessageEntity AS m WHERE m.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (MessageEntity)query.uniqueResult();
	}

	@Override
	public MessageEntity getMessageDetail(int id) {
		this.hql = "FROM MessageEntity AS m inner join fetch sUserEntity AS s inner join fetch rUserEntity AS r where m.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (MessageEntity)query.uniqueResult();	
	}

	@Override
	public List getMessageList(int pageNo, int pageItemNum) {
		this.hql = "FROM MessageEntity AS m WHERE m.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getMessageListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM MessageEntity AS m inner join fetch sUserEntity AS s inner join fetch rUserEntity AS r";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateMessage(MessageEntity message) {
		sessionFactory.getCurrentSession().update(message);
		return true;
	}

}
