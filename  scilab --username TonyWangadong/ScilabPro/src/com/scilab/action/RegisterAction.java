package com.scilab.action;

import java.util.Date;
import com.scilab.action.BaseAction;
import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;
import com.scilab.pojo.UserInfo;

public class RegisterAction extends BaseAction{
	private IBaseDao dao = new BaseDao();
	private UserInfo userInfo;
	private String msg;
	public UserInfo getUserInfo(){
		return userInfo;
		}
	public void setUserInfo(UserInfo userInfo){
		this.userInfo = userInfo;
		}
	public String register(){
		
		Date registerTime = new Date();
		userInfo.setRegisterTime(registerTime);
		boolean valid = true;
	    if (userInfo.getUserName() == null || userInfo.getUserName().equals(""))
	      valid = false;
	    if (userInfo.getPassword()== null || userInfo.getPassword().equals(""))
	        valid = false;
	    if(valid){
		boolean b=dao.saveObj(userInfo);
		if(b){
			msg = "“"+userInfo.getUserName()+"”注册成功！";
			}else{
				msg = "“"+userInfo.getUserName()+"”注册失败！";
				}
	    }else{
	    	msg="用户名密码均不能为空";
	    }
			return "Registersucc";
		}
	public String getMsg(){
		return msg;
		}
	}