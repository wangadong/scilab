package com.scilab.manager;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.dom4j.DocumentException;

public class Scheduler implements Runnable {
	final ExecutorService exec;
	private Task currentTask;
	private String hostIP;

	public Scheduler() {
		exec = Executors.newSingleThreadExecutor();
		System.out.println("Executor Started");
		try {
			hostIP = NodesManager.getHostIP();
			if (hostIP.length() < 7)
				hostIP = InetAddress.getLocalHost().getHostAddress().toString();
		} catch (DocumentException e) {

		} catch (UnknownHostException e) {
			System.out
					.println("Please check your Host IPAddress configuration");
			e.printStackTrace();
		}
	}

	public void run() {

		while (!exec.isShutdown()) {

			while (!ScilabTaskHost.getInstance().getTaskList().isEmpty()) {
				currentTask = (Task) ScilabTaskHost.getInstance().getTaskList()
						.pop();

				if (currentTask != null) {
					SciNode currentNode=TaskDispatcher.getInstance().getCurrentNode();
					currentTask.setNodesId(currentNode.getID());
					currentTask.setNodesIp(currentNode.getIPAddress());
					currentTask.setHostIP(hostIP);
					exec.execute(currentTask);
					TaskDispatcher.getInstance().addTaskToNode(currentNode.getID());
					System.out.println("任务节点号"+currentTask.getNodesId());
					System.out.println("nodeiP"+currentTask.getNodesIp());
					System.out.println("currentNodesTaskNum:"+currentNode.getTaskNumCnt());
				}
				System.out.println(currentTask.getStatue());
				currentTask = null;
			}
		}
	}
}
