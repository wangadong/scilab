package com.scilab.dao;

import com.scilab.pojo.UserInfo;


public interface UserDao {
	
	public abstract void saveUser(UserInfo uinfo);
	
	public abstract UserInfo getUserInfo(long id);
	
	public abstract UserInfo login(String userName, String password);
}
