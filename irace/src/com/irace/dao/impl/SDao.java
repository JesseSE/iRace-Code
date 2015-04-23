/**
 * 
 */
package com.irace.dao.impl;

import org.hibernate.SessionFactory;

/**
 * @author Tracy
 *
 */
public class SDao {

	protected SessionFactory sessionFactory;
	
	protected String hql;
	
	public SDao() {
		hql = null;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {  
        this.sessionFactory = sessionFactory;  
    }
}
