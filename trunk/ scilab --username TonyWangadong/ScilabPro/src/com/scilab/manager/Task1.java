/*package com.scilab.manager;

import java.io.File;
import java.util.concurrent.Callable;

import com.scilab.scilabexecute.ScilabService;

public class Task1 implements Callable<String> {
	volatile boolean statue = false;
	private int taskId;
	private String content;
	private String resultPath;
	private String taskQueryId;
	private String resultFolder;

	public Task1(int taskId, String content, String userName) {
		this.taskId = taskId;
		this.content = content;
		this.taskQueryId = userName + taskId;
		this.resultPath = "c:/ScilabResult/" + userName + "/" + taskId + "/"
				+ taskQueryId + ".txt";
		this.resultFolder = "c:/ScilabResult/" + userName + "/" + taskId + "/";
		System.out.println("Create Task-" + taskId + " belong to " + userName);
	}

	public String getTaskQueryId() {
		return this.taskQueryId;
	}

	public void run() {
		
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
	@Override
	public String call() throws Exception {
		String msg = null;
		try {
			try {
				File myFilePath = new File(resultFolder);
				if (!myFilePath.exists()) {
					myFilePath.mkdirs();
					System.out.println("新建目录操作成功" + resultFolder);
				}
			} catch (Exception e) {
				System.out.println("新建目录操作出错");
				e.printStackTrace();
			}
	    	System.out.println("tres bien!");
	    	msg=ScilabService.executeCodes(content, resultPath);

		} catch (Exception e) {
			System.out.println("Task interrupted...");
		}
		statue = true;
		//ScilabTaskHost.getInstance().setTaskMap(this);
		System.out.println(Thread.currentThread().toString() + "execute Task-"
				+ taskId + " is " + "completed ");
		return msg;
	}

}
*/