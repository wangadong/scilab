package com.scilab.manager;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;

public class Scheduler implements Runnable {
	final ExecutorService exec;
	Task currentTask;

	public Scheduler() {
		exec = Executors.newSingleThreadExecutor();
		System.out.println("Executor Started");
	}

	public void run() {

		while (!exec.isShutdown()) {
			while (!ScilabTaskHost.getInstance().getTaskList().isEmpty()) {
				currentTask = (Task) ScilabTaskHost.getInstance().getTaskList().pop();
				if (currentTask != null) {
					exec.execute(currentTask);
				}
				ScilabTaskHostService.setTaskMap(currentTask);
				currentTask = null;
			}
		}
	}
}
