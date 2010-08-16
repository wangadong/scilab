package com.scilab.manager;

import java.util.*;

public class ScilabTaskHost {
	private static final ScilabTaskHost _INSTANCE = new ScilabTaskHost();
	private static LinkedList<Task> TaskList;
	private static HashMap<String, Task> TaskMap;

	private ScilabTaskHost() {
		TaskList = new LinkedList<Task>();
		TaskMap = new HashMap<String, Task>();
		System.out.println("LIST AND MAP CREATE SUCCESSFULLLY!");
		new Thread(new Scheduler()).start();
		new Thread(new SocketServer()).start();
	}

	public synchronized static ScilabTaskHost getInstance() {
		return _INSTANCE;
	}

	public LinkedList<Task> getTaskList() {
		return TaskList;
	}

	public boolean setTaskMap(Task task) {
		if (TaskMap.containsValue(task)) {
			TaskMap.remove(task);
			TaskMap.put(task.getTaskQueryId(), task);
			System.out.println("update statue!");
		} else {
			TaskMap.put(task.getTaskQueryId(), task);
			System.out.println("this task is over and saved!");
		}
		return true;
	}

	public synchronized boolean submitTask(String taskname, String content,
			long userId, String resultFolder) {
		Task tasktmp = new Task(taskname, content, userId, resultFolder);
		if (ScilabTaskHostService.setTaskMap(tasktmp)) {
			System.out.println("set task map success!");
		}
		return TaskList.add(tasktmp);
	}

	public boolean deleteTask(String taskQueryId) {
		if (TaskMap.containsKey(taskQueryId)) {
			TaskMap.remove(taskQueryId);
			return true;
		}

		return false;
	}

	public Task getTaskByQueryId(String taskQueryId) {
		if (TaskMap.containsKey(taskQueryId)) {
			System.out.println("Get the task \"" + taskQueryId + "\""
					+ "successfully");
			return TaskMap.get(taskQueryId);
		} else {
			System.out.println(taskQueryId + " is not saved..");
		}
		return null;

	}

	public String getTaskStatue(String taskQueryId) {
		System.out.println("people want to get the statue of task "
				+ taskQueryId);
		if (TaskMap.containsKey(taskQueryId)) {
			System.out.println("people want to get the statue of task "
					+ taskQueryId);
			return TaskMap.get(taskQueryId).getStatue();
		}
		return "TASKERROR ";
	}

	public String getResult(String taskQueryId) {
		System.out.println("taskmap arrive");
		if (TaskMap.get(taskQueryId) != null)
			return TaskMap.get(taskQueryId).getResultFolder();
		return null;
	}

	public HashMap<String, Task> getTaskMap() {
		return TaskMap;
	}

	public boolean isExist(String taskQueryId) {
		return TaskMap.containsKey(taskQueryId);
	}

}
