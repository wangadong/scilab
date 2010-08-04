package com.service.scilabexecute;

import java.io.File;

public class Task implements Runnable {
	private String codes;
	private String savePath;
	private String hostIP;
	public Task(String codes, String savePath, String hostIP) {
		this.codes = codes;
		this.savePath = savePath;
		this.hostIP=hostIP;
	}

	public void run() {
		try {
			Process process = Runtime.getRuntime().exec("cmd /c java -jar C:/ScilabDistribution/execute.jar"+ " \"" + codes+ "\" "+"\"" + savePath + "\" " + "\""
					+ hostIP + "\">\"" +savePath+"\"" );

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
