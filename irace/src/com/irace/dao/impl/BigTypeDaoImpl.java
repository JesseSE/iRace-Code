package com.irace.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import com.irace.dao.BigTypeDao;
import com.irace.entity.BigTypeEntity;

public class BigTypeDaoImpl extends SDao implements BigTypeDao {

	@Override
	public Integer addBigType(BigTypeEntity bigType) {
		return (Integer) this.sessionFactory.getCurrentSession().save(bigType);
	}

	@Override
	public boolean delBigType(int id) {
		this.hql = "DELETE FROM BigTypeEntity AS b WHERE b.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return query.executeUpdate() > 0;
	}

	@Override
	public BigTypeEntity getBigType(int id) {
		this.hql = "FROM BigTypeEntity AS b WHERE b.id=?";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		query.setInteger(0, id);
		return (BigTypeEntity)query.uniqueResult();
	}

	@Override
	public List getBigTypeListDetail() {
		System.out.println("sdfdsf");
		this.hql = "FROM BigTypeEntity AS b left join fetch b.typeEntities";
		Query query = this.sessionFactory.getCurrentSession().createQuery(this.hql);
		System.out.println("esfsdf");
		Test(query.list());
		System.out.println("esfsdf");
		return query.list();
	}

	@Override
	public boolean updateBigType(BigTypeEntity bigType) {
		sessionFactory.getCurrentSession().update(bigType);
		return true;
	}
	
	public void Test(List list){
		Iterator<BigTypeEntity> it = list.iterator();
		while(it.hasNext()){
		    BigTypeEntity race = it.next();
		    System.out.println("sdfdsf");
		    System.out.println("bigType"+race.getId());
			System.out.println(race.getName());		
		}
	}

}
