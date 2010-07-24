package com.scilab.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.scilab.action.BaseAction;
import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;
import com.scilab.pojo.FunctionInfo;
import com.scilab.pojo.UserInfo;



public class FunInputAction extends BaseAction {
	private IBaseDao dao = new BaseDao();
	private FunctionInfo functionInfo;
	private String msg;
	private String Username;
	private UserInfo user;
	
	public String getUsername() {
		return Username;
	}



	

	public FunctionInfo getFunctionInfo() {
		return functionInfo;
	}

	public void setFunctionInfo(FunctionInfo functionInfo) {
		this.functionInfo = functionInfo;
	}

	public String Input() {
		functionInfo.setFunStatue(0);
		Date saveTime = new Date();
		functionInfo.setSaveTime(saveTime);
		
		HttpServletRequest request = ServletActionContext.getRequest();			
		HttpSession sess=request.getSession();
		user=(UserInfo)sess.getAttribute("user");
		long uid = user.getUserId();
		functionInfo.setUserId(uid);
		
		Username=user.getUserName();
		
		boolean valid = true;
		if (functionInfo.getFunName() == null
				|| functionInfo.getFunName().equals(""))
			valid = false;
		if (functionInfo.getFunContent() == null
				|| functionInfo.getFunContent().equals(""))
			valid = false;
		if (functionInfo.getFunExample() == null
				|| functionInfo.getFunExample().equals(""))
			valid = false;
		if (functionInfo.getFunHelp() == null
				|| functionInfo.getFunHelp().equals(""))
			valid = false;
		if (valid) {
			boolean b = dao.saveObj(functionInfo);

			if (b) {
				msg = "恭喜您！"+Username +"“" +functionInfo.getFunName() + "”上传成功！请等待审核LoL!"
						+ " 上传时间为： " + functionInfo.getSaveTime();
			} else {
				msg = "“" + functionInfo.getFunName()
						+ "”上传失败！可能是数据库出现错误请您稍后再试~：（" + " 错误发生时间为： "
						+ functionInfo.getSaveTime();
			}
		} else {
			msg = "框体不能为空！";
		}
		return "Inputsucc";
	}

	

	public String getMsg() {
		return msg;
	}

}