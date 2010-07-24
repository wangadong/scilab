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

	private String content;
	private String taskQueryId;
	private String resultFolder;

	public Task(String taskname, String content, long userId,
			String resultFolder) {
		this.taskName = taskname;
		this.content = content;
		this.taskQueryId = userId + taskname;
		this.resultFolder = resultFolder;
		System.out.println("Create Task-" + taskname + " belong to " + userId);
	}

	public String getTaskQueryId() {
		return this.taskQueryId;
	}

	public void run() {

		try {
			File myFilePath = new File(resultFolder).getParentFile();
			if (!myFilePath.exists()) {
				myFilePath.mkdirs();
				System.out.println("成功创建" + resultFolder);
			} else {
				if(deleteFile(myFilePath))
					System.out.println("删除成功");;
				if (!myFilePath.exists())
					System.out.println("成功更新");
				myFilePath.mkdirs();
			}

			System.out.println("tres bien!");
			// ScilabService.executeCodes(content, resultPath);
			ExecuteServiceStub stub = new ExecuteServiceStub();
			ExecuteServiceStub.ExecuteCodes host = new ExecuteServiceStub.ExecuteCodes();
			host.setCodes(content);
			host.setSavePath(resultFolder);
			System.out.println(content + resultFolder);
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

	public String getResultFolder() {
		return this.resultFolder;
	}

	public boolean deleteFile(File f) {
		if (f.exists()) {
			if (f.isFile())
				return f.delete();
			else if (f.isDirectory()) {
				File[] files = f.listFiles();
				for (int i = 0; i < files.length; i++) {
					if (!deleteFile(files[i]))
						return false;
				}
				return f.delete();
			} else
				return false;
		} else
			return true;
	}
}