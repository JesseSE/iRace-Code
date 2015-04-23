package com.irace.dao.impl;

import org.hibernate.SessionFactory;

import com.irace.dao.UserDao;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {  
        this.sessionFactory = sessionFactory;  
    }
	
}
