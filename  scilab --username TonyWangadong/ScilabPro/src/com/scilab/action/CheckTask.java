package com.scilab.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

import com.scilab.dao.impl.TaskDao;
import com.scilab.manager.ScilabTaskHost;
import com.scilab.manager.ScilabTaskHostService;
import com.scilab.manager.Task;
import com.scilab.pojo.TaskInfo;
import com.scilab.pojo.UserInfo;

public class CheckTask extends BaseAction {
	private String taskname;
	private String resultFolder;
	private String taskStatue;
	private UserInfo userinfo;
	private TaskDao dao = new TaskDao();
	private Long userId;
	private String resultContent;
	private File file;
	private String imgPath;

	public String getResult() {
		imgPath = null;
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		System.out.println(userId + taskname);
		if (ScilabTaskHostService.isExist(userId + taskname)) {
			resultFolder = ScilabTaskHostService.getResult(userId + taskname);
		} else
			return "resultFail";
		if (new File(getRequest().getRealPath("/") + "ScilabResult/" + userId
				+ "/" + taskname + "/" + "figure0.png").exists()) {
			System.out.println(getRequest().getRealPath("/") + "ScilabResult/"
					+ userId + "/" + taskname + "/" + "figure0.png");
			imgPath = "ScilabResult/" + userId + "/" + taskname + "/"
					+ "figure0.png";
		} else
			imgPath = null;
		if (resultFolder != null) {
			try {
				file = new File(resultFolder);
				InputStreamReader isr = new InputStreamReader(
						new FileInputStream(file), "UTF-8");
				BufferedReader br = new BufferedReader(isr);
				String line = null;
				StringBuffer result = new StringBuffer();
				while ((line = br.readLine()) != null) {
					result.append(line);
					result.append("<br>");
				}
				resultContent = result.toString();
				System.out.println(resultContent);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "resultSucc";
		}
		return "resultFail";
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getResultFolder() {
		return resultFolder;
	}

	public void setResultFolder(String resultFolder) {
		this.resultFolder = resultFolder;
	}

	public String getStatue() throws IOException {
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		System.out.println(userId + taskname);
		getResponse().setContentType("text/html; charset=utf-8");
		getResponse().setHeader("Cache-Control", "no-cache"); // 不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();

		if (!ScilabTaskHostService.isExist(userId + taskname))
			taskStatue = "无此任务,请先提交后再查询";
		else if (ScilabTaskHostService.getTaskStatue(userId + taskname)) {
			taskStatue = "任务已完成";

		} else {
			taskStatue = "任务排队中";
		}// ajax
		out.write(taskStatue);
		out.close();
		System.out.println(taskStatue);
		return null;
	}

	public String saveTask() throws IOException {
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		String saveStatue;
		if (userId<10000) {
			System.out.println(userId + taskname);
			System.out.println("save ici" + userId + taskname);
			saveStatue = "保存失败";
			if (ScilabTaskHost.getInstance().getTaskMap().containsKey(
					userId + taskname)) {
				Task task = ScilabTaskHostService.getTaskByQueryId(userId
						+ taskname);
				//判断该用户的该任务名是否存在
				TaskInfo taskinfo = dao.isExist(task.getTaskName(), userId);
				if(taskinfo == null){
					taskinfo = new TaskInfo();
				}
				taskinfo.setTaskName(task.getTaskName());
				taskinfo.setUserId(userId);
				taskinfo.setTaskStatue(1);
				taskinfo.setTaskContent(task.getContent());
				taskinfo.setResultFolder(task.getResultFolder());
				taskinfo.setSaveTime(new Date());
				TaskDao dao = new TaskDao();
				if (dao.saveOrUpdateTask(taskinfo)) {
					saveStatue = "保存成功";
				}
			}
		}else{
			saveStatue="对不起，游客无法保存任务";
		}
		getResponse().setContentType("text/html; charset=utf-8");
		getResponse().setHeader("Cache-Control", "no-cache"); // 不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();
		out.write(saveStatue);
		out.close();
		// ajax
		return null;
	}

	public String getTaskStatue() {
		return taskStatue;
	}

	public void setTaskStatue(String taskStatue) {
		this.taskStatue = taskStatue;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

}
