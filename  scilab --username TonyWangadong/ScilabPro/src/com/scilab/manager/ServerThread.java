package com.scilab.manager;

import java.io.*;
import java.net.*;

/**
 * 文件传输服务线程 由SocketServer类调用，建立文件传输连接
 * 
 * @author wangadong
 * @version 1.0
 * 
 */
public class ServerThread extends Thread {
	private Socket socket;

	/**
	 * 线程构造函数
	 * 
	 * @param socket
	 */
	public ServerThread(Socket socket) {
		this.socket = socket;
	}

	/**
	 * 线程的run()方法
	 */
	public void run() {

		try {

			DataInputStream inputStream = null;
			try {
				inputStream = new DataInputStream(new BufferedInputStream(
						socket.getInputStream()));
			} catch (Exception e) {
				System.out.print("Connection Error!");
				return;
			}
			try {
				int bufferSize = 8192;
				byte[] buf = new byte[bufferSize];
				String savePath = inputStream.readUTF();
				DataOutputStream fileOut = new DataOutputStream(
						new BufferedOutputStream(new BufferedOutputStream(
								new FileOutputStream(savePath))));
				while (true) {
					int read = 0;
					if (inputStream != null) {
						read = inputStream.read(buf);
					}
					if (read == -1) {
						break;
					}
					// System.out.println(buf.toString());
					fileOut.write(buf, 0, read);
				}
				fileOut.flush();
				fileOut.close();
				inputStream.close();
				String taskQueryId = new File(savePath).getName();// 获取与传回结果相对应的任务查询ID
				if (taskQueryId.endsWith("txt")) {
					taskQueryId = taskQueryId.replaceAll(".txt", "");
					Task currentTask = ScilabTaskHostService
							.getTaskByQueryId(taskQueryId);
					currentTask.setStatue("FINISHED");
					ScilabTaskHostService.setTaskMap(currentTask);// 更新任务状态为已完成
					TaskDispatcher.getInstance().minusTaskToNode(
							currentTask.getNodesId());// 当前节点任务数减1
					System.out.println("任务完成");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return;
			}
		} catch (Exception e) {
			System.out.println("Error handling a client: " + e);
		}

	}

}
