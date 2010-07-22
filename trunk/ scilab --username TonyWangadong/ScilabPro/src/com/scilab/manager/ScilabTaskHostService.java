package com.scilab.manager;

public class ScilabTaskHostService {
	public static boolean setTaskMap(Task task) {
		return ScilabTaskHost.getInstance().setTaskMap(task);
	}

	public static boolean submitTask(String taskname, String content,
			long userId) {
		return ScilabTaskHost.getInstance().submitTask(taskname, content,
				userId);
	}

	public static boolean deleteTask(String taskQueryId) {
		return ScilabTaskHost.getInstance().deleteTask(taskQueryId);
	}

	public static Task getTaskByQueryId(String taskQueryId) {
		return ScilabTaskHost.getInstance().getTaskByQueryId(taskQueryId);
	}

	public static boolean getTaskStatue(String taskQueryId) {
		return ScilabTaskHost.getInstance().getTaskStatue(taskQueryId);
	}

	public static String getResult(String taskQueryId) {
		String result = ScilabTaskHost.getInstance().getResult(taskQueryId);
		if (result != null) {
			return ScilabTaskHost.getInstance().getResult(taskQueryId);
		}
		return null;
	}
}
