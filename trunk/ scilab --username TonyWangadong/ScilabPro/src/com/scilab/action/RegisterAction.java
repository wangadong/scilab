package com.scilab.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import com.scilab.dao.UserDao;
import com.scilab.dao.impl.UserDaoImpl;
import com.scilab.pojo.UserInfo;

public class RegisterAction extends BaseAction {
	private UserDao dao = new UserDaoImpl();
	private UserInfo userInfo;
	private String msg;

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String register() {

		Date registerTime = new Date();
		userInfo.setRegisterTime(registerTime);
		boolean valid = true;
		if (userInfo.getUserName() == null || userInfo.getUserName().equals(""))
			valid = false;
		if (userInfo.getPassword() == null || userInfo.getPassword().equals(""))
			valid = false;
		if (valid) {
			boolean b = dao.saveUser(userInfo);
			if (b) {
				msg = "“" + userInfo.getUserName() + "”注册成功！";
			} else {
				msg = "“" + userInfo.getUserName() + "”注册失败！";
			}
		} else {
			msg = "用户名密码均不能为空";
		}
		return "Registersucc";
	}

	public String getMsg() {
		return msg;
	}
	
	public String isRegister() throws IOException{
		getResponse().setContentType("text/html; charset=utf-8"); 
		getResponse().setHeader("Cache-Control", "no-cache"); //不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();
		//判断用户名是否存在
		boolean b = dao.userNameisExist(userInfo.getUserName());
		if(b){
			out.write("exist");
		}else{
			out.write("notexist");
		}
		out.close();
		return null;
	}
}