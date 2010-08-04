package com.scilab.transferservice;

import java.io.*;
import java.net.*;

public class SocketClient extends Thread{
	 protected String hostIp;
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
	 public SocketClient(String path,String aHostIp, int aHostPort) {
	  this.path = path;
	  this.hostIp = aHostIp;
	  this.hostPort = aHostPort;
	 }

	 public static void main(String[] args) {
	
	  String path = "c:\\a\\b\\c\\d\\txt.txt";  //测试文件
	  SocketClient client = new SocketClient(path);
	  client.run();
	 }
	 public void run(){
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
	  if(client == null)
	   return ;
	  try {
	   // 将文件名及长度传给客户端。
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

	   System.out.println("文件传输完成");
	  } catch (IOException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  } finally {

	   // 注意关闭socket链接哦，不然客户端会等待server的数据过来，
	   // 直到socket超时，导致数据不完整。
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


