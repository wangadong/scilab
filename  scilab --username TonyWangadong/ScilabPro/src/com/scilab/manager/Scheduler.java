package com.scilab.manager;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

public class Scheduler implements Runnable {
	final ExecutorService exec;
	private Task currentTask;
	private String hostIP;

	public Scheduler() {
		exec = Executors.newSingleThreadExecutor();
		System.out.println("Executor Started");
		try {
			hostIP = InetAddress.getLocalHost().getHostAddress().toString();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void run() {

		while (!exec.isShutdown()) {

			while (!ScilabTaskHost.getInstance().getTaskList().isEmpty()) {
				currentTask = (Task) ScilabTaskHost.getInstance().getTaskList()
						.pop();

				if (currentTask != null) {
					currentTask.setNodesIp(hostIP);
					currentTask.setHostIP(hostIP);
					exec.execute(currentTask);
				}
				System.out.println(currentTask.getStatue());
				ScilabTaskHostService.setTaskMap(currentTask);
				currentTask = null;
			}
		}
	}
}
