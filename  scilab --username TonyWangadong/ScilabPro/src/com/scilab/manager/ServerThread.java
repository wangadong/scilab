package com.scilab.manager;

import java.io.*;
import java.net.*;

public class ServerThread extends Thread {
	private Socket socket;

	public ServerThread(Socket socket) {
		this.socket = socket;
	}

	public void run() {

		try {

			DataInputStream inputStream = null;
			try {
				inputStream = new DataInputStream(new BufferedInputStream(
						socket.getInputStream()));
			} catch (Exception e) {
				System.out.print("������Ϣ�������\n");
				return;
			}
			try {
				// ���ر���·�����ļ�����Զ��ӷ������˼̳ж��������web�������һ��·����
				int bufferSize = 8192;
				byte[] buf = new byte[bufferSize];
				long len = 0;
				String savePath = inputStream.readUTF();
				DataOutputStream fileOut = new DataOutputStream(
						new BufferedOutputStream(new BufferedOutputStream(
								new FileOutputStream(savePath))));
				len = inputStream.readLong();
				System.out.println("�ļ��ĳ���Ϊ:" + len + "\n");
				System.out.println("��ʼ�����ļ�!" + "\n");
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
				System.out.println("������ɣ��ļ���Ϊ" + savePath + "\n");
				fileOut.flush();
				fileOut.close();
				inputStream.close();
				String taskQueryId=new File(savePath).getName();
				if(taskQueryId.endsWith("txt")){
					taskQueryId=taskQueryId.replaceAll(".txt", "");
					Task currentTask=ScilabTaskHostService.getTaskByQueryId(taskQueryId);
					currentTask.setStatue("FINISHED");
					ScilabTaskHostService.setTaskMap(currentTask);
					TaskDispatcher.getInstance().minusTaskToNode(currentTask.getNodesId());
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
