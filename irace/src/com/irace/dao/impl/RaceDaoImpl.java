/**
 * 
 */
package com.irace.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.irace.dao.RaceDao;
import com.irace.entity.OrganizerEntity;
import com.irace.entity.RaceEntity;

/**
 * @author Tracy
 *
 */
public class RaceDaoImpl extends SDao implements RaceDao {
	
	@Override
	public Integer addRace(RaceEntity race) {
		return (Integer)this.sessionFactory.getCurrentSession().save(race);
	}
		
	@Override
	public boolean delRace(Integer id) {
		this.hql = "DELETE FROM RaceEntity AS r WHERE r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}
	
	@Override
	public boolean delRaceByType(int type) {
		this.hql = "DELETE FROM RaceEntity AS r WHERE r.type=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, type);
		return query.executeUpdate() > 0;
	}
		
	@Override
	public boolean updateRace(RaceEntity race) {
		sessionFactory.getCurrentSession().update(race);
		return true;
	}
	
	@Override
	public List getRaceList(Integer pageNo, Integer pageItemNum) {
		this.hql = "FROM RaceEntity";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceList(Integer pageNo, Integer pageItemNum, String keyword) {
		this.hql = "FROM RaceEntity AS r WHERE r.name like ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0,"%"+keyword+"%");
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}
	
	@Override
	public List getRaceList(Integer pageNo, Integer pageItemNum, int type) {
		this.hql = "FROM RaceEntity AS r WHERE r.type=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0,type);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}
	
	@Override
	public List getRaceListByGrade(Integer pageNo, Integer pageItemNum,String grade) {
		this.hql = "FROM RaceEntity AS r WHERE r.grade=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, grade);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}
	
	@Override
	public List getRaceListByTime(Integer pageNo, Integer pageItemNum,Date startTime,Date endTime) {
		this.hql = "FROM RaceEntity AS r WHERE r.startTime <=? and r.endTime >=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setDate(0,startTime);
		query.setDate(1, endTime);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}
	

	@Override
	public RaceEntity getRace(Integer id) {
		this.hql = "FROM RaceEntity AS r WHERE r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0,id);
		return (RaceEntity) query.uniqueResult();
		
	}
	
	@Override
	public RaceEntity getRaceDetail(int id){
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o where r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (RaceEntity)query.uniqueResult();	
	}
	
	@Override
	public List getRaceListDetail(int pageNo,int pageItemNum){
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListDetail(int pageNo, Integer pageItemNum,
			String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedStartTime(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedEndTime(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedHotPoint(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedStartTime(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedEndTime(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getRaceListBySortedHotPoint(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
