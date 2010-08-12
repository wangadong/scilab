package com.scilab.execution;

import java.io.File;

import javasci.*;

public class Execution {
	public static void main(String[] args) throws InterruptedException {
		File filepath = new File(args[1]);
		String2file.string2File(args[0], filepath.getParentFile()+File.separator+"Codes.sci");
		System.out.println("The Result is:");
		Scilab.Exec("lines(10000,100);" + "exec('" + filepath.getParentFile()+File.separator+"Codes.sci" + "');");
		int errorCode = Scilab.GetLastErrorCode();
		if (errorCode == 0) {
			System.out.println("Executed Successfully");
		} else {
			System.out.println("Scilab Run Error Code:" + errorCode);
		}
		
		int i = 0;
		if (Scilab.HaveAGraph()) {
			Scilab.Exec("xs2png(get_figure_handle(" + i + "),'"
					+ filepath.getParentFile() + File.separator + "figure" + i
					+ ".png" + "');delete(gcf());");
		}
		Scilab.Finish();
		new SocketClient(args[1],args[2]).run();
		new SocketClient(filepath.getParentFile() + File.separator + "figure" + i
				+ ".png",args[2]).run();
	
	}
}
