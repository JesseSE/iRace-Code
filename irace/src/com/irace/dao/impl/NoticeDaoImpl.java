package com.irace.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.irace.dao.NoticeDao;
import com.irace.entity.NoticeEntity;
import com.irace.entity.RaceEntity;
import com.irace.entity.UserEntity;

public class NoticeDaoImpl extends SDao implements NoticeDao {

	public NoticeDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Integer addNotice(NoticeEntity notice) {
		// TODO Auto-generated method stub
		return (Integer)this.sessionFactory.getCurrentSession().save(notice);
	}

	@Override
	public boolean delNotice(int id) {
		// TODO Auto-generated method stub
		this.hql = "DELETE FROM NoticeEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);	
		return query.executeUpdate() > 0;
	}

	@Override
	public NoticeEntity getNotice(int id) {
		// TODO Auto-generated method stub
		this.hql = "FROM NoticeEntity AS u WHERE u.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (NoticeEntity) query.uniqueResult();
	}

	
	@Override
	public NoticeEntity getNoticeDetail(int id) {
		this.hql = "FROM NoticeEntity AS n inner join fetch n.raceEntity AS r where n.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (NoticeEntity)query.uniqueResult();	
	}


	@Override
	public List getNoticeList(int pageNo, int pageItemNum) {
		// TODO Auto-generated method stub
		this.hql = "FROM NoticeEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		
		return query.list();
	}

	@Override
	public List getNoticeListDetail(int pageNo, int pageItemNum) {
		this.hql = "FROM NoticeEntity AS n inner join fetch n.raceEntity AS r";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public boolean updateNotice(NoticeEntity notice) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(notice);
		return true;
	}

}
