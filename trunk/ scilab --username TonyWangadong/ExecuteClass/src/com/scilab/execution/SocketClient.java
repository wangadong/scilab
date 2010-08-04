package com.scilab.execution;

import java.io.*;
import java.net.*;

public class SocketClient extends Thread {
	protected String hostIp = "127.0.0.1";
	protected int hostPort = 3000;
	InputStream fis;
	DataOutputStream ps;
	File fi;
	DataInputStream dis;
	String path;
	Socket client;

	public SocketClient() {
	}

	public SocketClient(String path) {
		this.path = path;
	}

	public SocketClient(String path, String aHostIp) {
		this.path = path;
		this.hostIp = aHostIp;
	}

	public void run() {
		sendMessage();
	}

	public void setUpConnection() {
		try {
			client = new Socket(hostIp, hostPort);
			fis = new FileInputStream(path);
			ps = new DataOutputStream(client.getOutputStream());
			fi = new File(path);
		} catch (UnknownHostException e) {
			System.out
					.println("Error setting up socket connection: unknown host at "
							+ hostIp + ":" + hostPort);
		} catch (IOException e) {
			System.out.println("Error setting up socket connection: " + e);
		}

	}

	public void sendMessage() {
		setUpConnection();
		if (client == null)
			return;
		try {
			// ���ļ��������ȴ����ͻ��ˡ�
			ps.writeUTF(path);
			ps.flush();

			ps.writeLong((long) fi.length());
			ps.flush();
			int bufferSize = 8192;
			byte[] buf = new byte[bufferSize];
			while (true) {
				int read = 0;
				if (fis != null) {
					read = fis.read(buf);
				}
				if (read == -1) {
					break;
				}
				ps.write(buf, 0, read);
			}
			ps.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// ע��ر�socket����Ŷ����Ȼ�ͻ��˻�ȴ�server�����ݹ�����
			// ֱ��socket��ʱ���������ݲ�������
			try {
				ps.close();
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
