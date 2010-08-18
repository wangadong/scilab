package com.scilab.execution;

import java.io.File;

import javasci.*;

/**
 * 执行scilab代码，并输出结果同时向服务器传送结果文件
 * 
 * @author wangadong
 * @version 1.0
 * @see SocketClient
 * @see String2file
 * 
 */
public class Execution {
	public static void main(String[] args) throws InterruptedException {
		// 将代码保存为sci文件等待执行
		File filepath = new File(args[1]);
		String2file.string2File(args[0], filepath.getParentFile()
				+ File.separator + "Codes.sci");
		System.out.println("The Result is:");
		// 执行sci文件，lines(10000,100)预先设定结果显示大小
		Scilab.Exec("lines(10000,100);" + "exec('" + filepath.getParentFile()
				+ File.separator + "Codes.sci" + "');");
		//捕获scilab错误代码
		int errorCode = Scilab.GetLastErrorCode();
		if (errorCode == 0) {
			System.out.println("Executed Successfully");
		} else {
			System.out.println("Scilab Run Error Code:" + errorCode);
		}
		//判断是否有图像生成，并保存
		int i = 0;
		if (Scilab.HaveAGraph()) {
			Scilab.Exec("xs2png(get_figure_handle(" + i + "),'"
					+ filepath.getParentFile() + File.separator + "figure" + i
					+ ".png" + "');delete(gcf());");
			new SocketClient(filepath.getParentFile() + File.separator
					+ "figure" + i + ".png", args[2]).run();//向服务器回传图像文件
		}
		Scilab.Finish();//结束scilab进程
		new SocketClient(args[1], args[2]).run();//向服务器返回结果文件

	}
}
