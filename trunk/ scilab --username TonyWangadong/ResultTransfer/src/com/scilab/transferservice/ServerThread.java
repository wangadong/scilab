package com.scilab.transferservice;

import java.io.*;
import java.net.*;
public class ServerThread extends Thread {
	 private Socket socket;

	 public ServerThread(Socket socket)
	 {
	  this.socket = socket;
	 }


	 public void run(){

	  try {

	   DataInputStream inputStream = null;
	   try {
	    inputStream = new DataInputStream(new BufferedInputStream(
	      socket.getInputStream()));
	   } catch (Exception e) {
	    System.out.print("接收消息缓存错误\n");
	    return;
	   }
	   try {
	    // 本地保存路径，文件名会自动从服务器端继承而来最好是web工程里的一个路径。
	    int bufferSize = 8192;
	    byte[] buf = new byte[bufferSize];
	    long len = 0;
	    String savePath = inputStream.readUTF();
	    DataOutputStream fileOut = new DataOutputStream(
	      new BufferedOutputStream(new BufferedOutputStream(
	        new FileOutputStream(savePath))));
	    len = inputStream.readLong();
	    System.out.println("文件的长度为:" + len + "\n");
	    System.out.println("开始接收文件!" + "\n");
	    while (true) {
	     int read = 0;
	     if (inputStream != null) {
	      read = inputStream.read(buf);
	     }
	     if (read == -1) {
	      break;
	     }
	     //System.out.println(buf.toString());
	     fileOut.write(buf, 0, read);
	    }
	    System.out.println("接收完成，文件存为" + savePath + "\n");
	    fileOut.flush();
	    fileOut.close();
	    inputStream.close();
	   } catch (Exception e) {
	    System.out.println("接收消息错误" + "\n");
	    return;
	   }
	  } catch (Exception e) {
	   System.out.println("Error handling a client: " + e);
	  }
	  
	 }

	}


