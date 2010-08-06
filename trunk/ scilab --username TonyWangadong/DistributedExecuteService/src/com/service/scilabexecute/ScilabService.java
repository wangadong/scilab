package com.service.scilabexecute;

import java.io.File;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

public class ScilabService implements Executor {
	private static final ScilabService _INSTANCE = new ScilabService();
	final Queue<Runnable> tasks;
	final Executor executor;
	Runnable active;

	public ScilabService() {
		tasks = new LinkedBlockingQueue<Runnable>();
		int cpuCoreNumber = Runtime.getRuntime().availableProcessors();   
        executor = Executors.newFixedThreadPool(cpuCoreNumber);		
	}

	public synchronized static ScilabService getInstance() {
		return _INSTANCE;
	}

	public synchronized void execute(final Runnable r) {
		tasks.offer(new Runnable() {
			public void run() {
				try {
					r.run();
				} finally {
					scheduleNext();
				}
			}
		});
		if (active == null) {
			scheduleNext();
		}
	}

	protected synchronized void scheduleNext() {
		if ((active = tasks.poll()) != null) {
			executor.execute(active);
		}
	}

	public void submitTask(String codes, String savePath, String hostIP) {
		Task currentTask = new Task(codes, savePath, hostIP);
		File myFilePath = new File(savePath).getParentFile();
		if (!myFilePath.exists()) {
			if (myFilePath.mkdirs())
				System.out.println("创建文件目录" + myFilePath);
		} else {
			if (deleteFile(myFilePath))
				System.out.println("删除目录");
			;
			if (!myFilePath.exists())
				System.out.println("更新成功");
			myFilePath.mkdirs();
		}
		execute(currentTask);
	}

	public int getTaskNum() {
		return this.tasks.size();
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
