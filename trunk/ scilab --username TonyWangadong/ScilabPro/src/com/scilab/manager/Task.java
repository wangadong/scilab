package com.scilab.manager;

import java.io.File;
import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;
import org.apache.commons.lang.Validate;

import client.ExceptionException;
import client.ExecuteServiceStub;

public class Task implements Runnable {
	boolean statue = true;
	private String taskName;

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setResultPath(String resultPath) {
		this.resultPath = resultPath;
	}

	private String content;
	private String resultPath;
	private String taskQueryId;
	private String resultFolder;

	public Task(String taskname, String content, long userId) {
		this.taskName = taskname;
		this.content = content;
		this.taskQueryId = userId + taskname;
		this.resultPath = "c:/ScilabResult/" + userId + "/" + taskname + "/"
				+ taskQueryId + ".txt";
		this.resultFolder = "c:/ScilabResult/" + userId + "/" + taskname + "/";
		System.out.println("Create Task-" + taskname + " belong to " + userId);
	}

	public String getTaskQueryId() {
		return this.taskQueryId;
	}

	public void run() {

		try {
			File myFilePath = new File(resultFolder);
			if (!myFilePath.exists()) {
				myFilePath.mkdirs();
				System.out.println("�½�Ŀ¼�����ɹ�" + resultFolder);
			}

			System.out.println("tres bien!");
			// ScilabService.executeCodes(content, resultPath);
			ExecuteServiceStub stub = new ExecuteServiceStub();
			ExecuteServiceStub.ExecuteCodes host = new ExecuteServiceStub.ExecuteCodes();
			host.setCodes(content);
			host.setSavePath(resultPath);
			System.out.println(content+resultPath);
			stub.executeCodes(host);
		} catch (AxisFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExceptionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		statue = true;
		System.out.println(Thread.currentThread().toString() + "execute Task-"
				+ taskName + " is " + "completed ");
	}

	public boolean getStatue() {
		return this.statue;
	}

	public String getResultPath() {
		return this.resultPath;
	}

	public String getResultFolder() {
		return this.resultFolder;
	}
}