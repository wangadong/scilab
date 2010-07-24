package com.scilab.dao.impl;

import org.hibernate.HibernateException;  
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.scilab.dao.UserDao;
import com.scilab.pojo.UserInfo;
import com.scilab.hibernate.HibernateSessionFactory;

public class UserDaoImpl implements UserDao {

	public UserInfo getUserInfo(long id) {
		Session session = null;
		UserInfo uinfo = null;
		try{
			session = HibernateSessionFactory.getSession();
			uinfo = (UserInfo)session.get(UserInfo.class, id);
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return uinfo;
	}

	public void saveUser(UserInfo uinfo) {
		Session session = null;
		Transaction tx = null;
		try{
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(uinfo);
			tx.commit();
		}catch(HibernateException e){
			if(tx!=null) tx.rollback();
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
	}

	
	public UserInfo login(String userName, String password) {
		Session session = null;
		UserInfo user = null;
		try{
			session = HibernateSessionFactory.getSession();
			user = (UserInfo)session.createQuery("from UserInfo u where u.userName=:userName and u.password=:password").setString("userName", userName).setString("password", password).uniqueResult();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return user;
	}
	
}
