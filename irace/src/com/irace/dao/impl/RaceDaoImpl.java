/**
 * 
 */
package com.irace.dao.impl;

import java.util.Date;
import java.util.Iterator;
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
		this.hql = "DELETE FROM RaceEntity AS r WHERE r.typeId=?";
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
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t WHERE r.typeId=?";
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
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t where r.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);				
		return (RaceEntity)query.uniqueResult();	
	}
	
	@Override
	public List getRaceListDetail(int pageNo,int pageItemNum){
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListDetail(int pageNo, Integer pageItemNum,
			String keyword) {
		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0,"%"+keyword+"%");
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		Test(query.list());
		return query.list();
	}

	@Override
	public List getRaceListBySortedStartTime(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t ORDER BY r.startTime ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t ORDER BY r.startTime DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListBySortedEndTime(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t ORDER BY r.endTime ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t ORDER BY r.endTime DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListBySortedHotPoint(int pageNo, Integer pageItemNum,
			boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t ORDER BY r.focusNum ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t ORDER BY r.focusNum DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListBySortedStartTime(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.startTime ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.startTime DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, "%"+keyword+"%");
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListBySortedEndTime(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.endTime ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.endTime DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, "%"+keyword+"%");
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListBySortedHotPoint(int pageNo, Integer pageItemNum,
			String keyword, boolean isAsc) {
		if(isAsc){
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.focusNum ASC";
		}
		else{
			this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity inner join fetch r.typeRaceEntity AS t WHERE r.name like ? ORDER BY r.focusNum DESC";
		}
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setString(0, "%"+keyword+"%");
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		return query.list();
	}

	@Override
	public List getRaceListByUser(Integer pageNo, Integer pageItemNum,
			int userID) {
		this.hql = "SELECT r FROM RaceEntity AS r, UserEntity AS u ,ApplyEntity AS a inner join fetch r.organizerEntity  inner join fetch r.typeRaceEntity WHERE a.user=u.id and a.race=r.id and u.id = ?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userID);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);
		Test(query.list());
		return query.list();
	}
	
	public List getTeamMemberListByUser(int userID){
		this.hql = "SELECT r.name FROM RaceEntity AS r,UserEntity AS u ,ApplyEntity AS,";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userID);
		return query.list();		
	}
	

	public void Test(List list){
		if(list.isEmpty())
			System.out.print("null");
		Iterator<RaceEntity> it = list.iterator();
		while(it.hasNext()){
		    RaceEntity race = it.next();
		    System.out.println(race.getId());
			System.out.println(race.getName());
			System.out.println(race.getStartTime());
			System.out.println(race.getOrganizerEntity().getName());
			System.out.println(race.getTypeRaceEntity().getName());
			System.out.println(" ");
			
		}
	}

	@Override
	public List getRaceListByUser(Integer pageNo, Integer pageItemNum,
			int userID, int status) {

		this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity WHERE r.organizer = ? and r.status = ?";
        this.hql = "FROM RaceEntity AS r inner join fetch r.organizerEntity AS o inner join fetch r.typeRaceEntity AS t where r.id=? and r.status = ?";

		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, userID);
		query.setInteger(1, status);
		query.setFirstResult((pageNo - 1) * pageItemNum);
		query.setMaxResults(pageItemNum);

		Test(query.list());

		return query.list();
	}
}
