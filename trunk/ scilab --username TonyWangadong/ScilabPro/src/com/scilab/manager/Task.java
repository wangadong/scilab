package com.scilab.manager;

import java.io.File;
import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;
import org.apache.commons.lang.Validate;

import client.DistributedServiceStub;

public class Task implements Runnable {
	boolean statue = true;
	private String taskName;
	private String nodesIp;
	private String hostIP;

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

	public void run() {

		try {
			File myFilePath = new File(resultFolder).getParentFile();
			if (!myFilePath.exists()) {
				myFilePath.mkdirs();
				System.out.println("成功创建" + resultFolder);
			} else {
				if (deleteFile(myFilePath))
					System.out.println("删除成功");
				;
				if (!myFilePath.exists())
					System.out.println("成功更新");
				myFilePath.mkdirs();
			}

			System.out.println("tres bien!");
			// ScilabService.executeCodes(content, resultPath);
			DistributedServiceStub stub = new DistributedServiceStub(
					"http://"+nodesIp+":8080/axis2/services/DistributedService.DistributedServiceHttpSoap12Endpoint/");
			DistributedServiceStub.SubmitTask host = new DistributedServiceStub.SubmitTask();
			host.setCodes(content.replaceAll("\r\n", "NewLineChar"));
			host.setSavePath(resultFolder);
			host.setHostIP(hostIP);
			stub.submitTask(host);
			System.out.println(content + resultFolder);
		} catch (AxisFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
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

	public String getNodesIp() {
		return nodesIp;
	}

	public void setNodesIp(String nodesIp) {
		this.nodesIp = nodesIp;
	}

	public String getHostIP() {
		return hostIP;
	}

	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}

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

	public String getTaskQueryId() {
		return this.taskQueryId;
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