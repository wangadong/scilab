package com.scilab.action;

import java.io.File;
import java.util.Random;

import com.opensymphony.xwork2.ActionSupport;
import com.scilab.manager.ScilabTaskHost;
import com.scilab.manager.ScilabTaskHostService;
import com.scilab.manager.Task;
import com.scilab.pojo.TaskInfo;
import com.scilab.pojo.UserInfo;

public class TaskAction extends BaseAction {
	TaskInfo task;
	private String taskname;
	private String content;
	private long userId;
	private String resultFolder;

	public String submitTask() {
		UserInfo userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null)
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		taskname = task.getTaskName();
		content = task.getTaskContent();
		if (userinfo == null) {
			UserInfo userinfo_tmp = new UserInfo();
			userinfo_tmp.setUserId((long) new Random().nextInt(10000) + 10000);
			System.out.println(userinfo_tmp.getUserId());
			userinfo_tmp.setUserName("usertmp");
			getSession().setAttribute("usertmp", userinfo_tmp);
			userId = userinfo_tmp.getUserId();

		} else {
			userId = userinfo.getUserId();
		}
		resultFolder = getRequest().getRealPath("/") + "ScilabResult"
				+ File.separatorChar + userId + File.separatorChar + taskname
				+ File.separatorChar + userId + taskname + ".txt";
		// userId=1;
		System.out.println(resultFolder);
		boolean bool = ScilabTaskHostService.submitTask(taskname, content,
				userId, resultFolder);
		// setMessage("任务名称：" + taskname + "  " + "scilab代码：" + content);
		setMessage("任务名称：" + taskname
				+ "<a href='./CheckTask!getResult?taskname=" + taskname
				+ "'>查看结果</a>     <a href='./CheckTask!saveTask?taskname="
				+ taskname + "'>保存任务</a>");
		// ajax
		if (bool)
			return SUCCESS;
		else
			return ERROR;
	}

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public TaskInfo getTask() {
		return task;
	}

	public void setTask(TaskInfo task) {
		this.task = task;
	}

	public String getResultFolder() {
		return resultFolder;
	}

	public void setResultFolder(String resultFolder) {
		this.resultFolder = resultFolder;
	}

}
