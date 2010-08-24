package com.service.scilabexecute;

/**
 * 可执行任务实体，调用命令行管道命令保存任务结果到文本文件
 * 
 * @author wangadong
 * @version 1.2
 * @see ScilabService
 */
public class Task implements Runnable {
	private String codes;// scilab任务代码
	private String savePath;// 结果保存路径
	private String hostIP;// 服务器主机IP地址

	/**
	 * 任务构造函数
	 * 
	 * @param codes
	 *            scilab任务代码
	 * @param savePath
	 *            结果保存路径
	 * @param hostIP
	 *            服务器主机IP地址
	 */
	public Task(String codes, String savePath, String hostIP) {
		this.codes = codes;
		this.savePath = savePath;
		this.hostIP = hostIP;
	}

	/**
	 * 调用windows命令行的管道命令保存scilab执行结果<br>
	 * 运行execute.jar计算包，并传入必要参数
	 */
	public void run() {
		try {
			@SuppressWarnings("unused")
			String[] cmd={"/bin/sh","-c","java -jar "+System.getProperty("user.home")+"/ScilabDistribution/execute.jar"
				+ " \"" + codes + "\" " + "\"" + savePath + "\" "
				+ "\"" + hostIP + "\">\"" + savePath + "\""};
			Process process = Runtime.getRuntime().exec(cmd);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
