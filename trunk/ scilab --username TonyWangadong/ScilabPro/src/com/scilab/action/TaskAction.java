package com.scilab.action;

import java.io.File;

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
		taskname = task.getTaskName();
		content = task.getTaskContent();
		userId = userinfo.getUserId();
		resultFolder=getRequest().getRealPath("/")+"ScilabResult"+File.separatorChar+userId+File.separatorChar+taskname+File.separatorChar+userId+taskname+".txt";
		// userId=1;
		System.out.println(resultFolder);
		boolean bool = ScilabTaskHostService.submitTask(taskname, content
				.replaceAll("\r\n", ""), userId, resultFolder);
		getSession().setAttribute("task", task);
		setMessage("任务名称：" + taskname + "  " + "scilab代码：" + content);
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
