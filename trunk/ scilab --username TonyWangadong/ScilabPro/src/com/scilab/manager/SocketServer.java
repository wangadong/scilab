package com.scilab.manager;

import java.io.*;
import java.net.*;

public class SocketServer extends Thread{
	 protected int listenPort = 3000;

	 public void run(){
	  SocketServer server = new SocketServer();
	  server.acceptConnections();
	 }
	 /**
	  * ½¨Á¢Á´½Ó
	  *
	  */
	 public void acceptConnections() {
	  try {
	   ServerSocket server = new ServerSocket(listenPort);
	   Socket socket = null;
	   while (true) {
	    socket = server.accept();
	    //handleConnection(socket);
	    new ServerThread(socket).start();
	   }
	  } catch (BindException e) {
	   System.out.println("Unable to bind to port " + listenPort);
	  } catch (IOException e) {
	   System.out.println("Unable to instantiate a ServerSocket on port: "
	     + listenPort);
	  }

	 }
	}

