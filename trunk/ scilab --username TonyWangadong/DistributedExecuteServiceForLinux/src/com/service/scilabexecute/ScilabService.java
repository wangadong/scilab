package com.service.scilabexecute;

import java.io.File;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Scilab分页式计算服务主体
 * 
 * @author wangadong
 * @version 1.0
 * @see Task
 * @see DistributedService
 */
public class ScilabService implements Executor {
	private static final ScilabService _INSTANCE = new ScilabService();// singleton模式
	final Queue<Runnable> tasks;// 分布式节点任务队列
	final Executor executor;// 任务执行器
	Runnable active;

	/**
	 * 构造函数
	 */
	public ScilabService() {
		tasks = new LinkedBlockingQueue<Runnable>();// 初始化任务队列
		int cpuCoreNumber = Runtime.getRuntime().availableProcessors();// 获取本机CPU核心数
		executor = Executors.newFixedThreadPool(cpuCoreNumber);// 创建以CPU核心数为准的任务执行线程池
	}

	/**
	 * 获取singleton实例
	 */
	public synchronized static ScilabService getInstance() {
		return _INSTANCE;
	}

	/**
	 * 执行队列中的任务
	 */
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

	/**
	 * 判断当前任务是否完成，若完成则执行下一个任务
	 */
	protected synchronized void scheduleNext() {
		if ((active = tasks.poll()) != null) {
			executor.execute(active);
		}
	}

	/**
	 * 提交任务到任务队列
	 * 
	 * @param codes
	 *            任务代码
	 * @param savePath
	 *            结果保存路径
	 * @param hostIP
	 *            服务器主机IP地址
	 */
	public void submitTask(String codes, String savePath, String hostIP) {
		if (System.getProperty("os.name").equals("Linux")) {
			savePath=System.getProperty("user.home")+"/ScilabDistribution"+savePath.split("webapps")[1];
		}
		Task currentTask = new Task(codes, savePath, hostIP);// 创建新任务
		// 创建保存路径目录
		
		File myFilePath = new File(savePath).getParentFile();
		if (!myFilePath.exists()) {
			if (myFilePath.mkdirs())
				System.out.println("创建文件目录" + myFilePath);
		} else {
			if (deleteFile(myFilePath))
				System.out.println("删除目录");
			if (!myFilePath.exists())
				System.out.println("更新成功");
			myFilePath.mkdirs();
		}
		execute(currentTask);// 执行当前任务
	}

	/**
	 * 获取当前分布式节点的任务数
	 * 
	 */
	public int getTaskNum() {
		return this.tasks.size();
	}

	// 删除文件及文件夹
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
