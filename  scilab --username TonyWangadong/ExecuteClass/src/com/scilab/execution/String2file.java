package com.scilab.execution;

import java.io.*;

/**
 * 字符串保存为文件
 * 
 * @author wangadong
 * @version 1.0
 * @see Execution
 */
public class String2file {
	/**
	 * 将字符串保存成指定文件
	 * 
	 * @param res
	 *            保存的字符串
	 * @param filePath
	 *            保存的文件路径
	 * @return boolean 是否保存成功
	 */
	public static boolean string2File(String res, String filePath) {
		boolean flag = true;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		try {
			String tmp;
			File distFile = new File(filePath);
			if (!distFile.getParentFile().exists())
				distFile.getParentFile().mkdirs();
			bufferedReader = new BufferedReader(new StringReader(res
					.replaceAll("NewLineChar", "\r\n")));
			bufferedWriter = new BufferedWriter(new FileWriter(distFile));
			while ((tmp = bufferedReader.readLine()) != null) {
				bufferedWriter.write(tmp);
				bufferedWriter.newLine();
			}
			bufferedWriter.flush();
			bufferedReader.close();
			bufferedWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
			flag = false;
			return flag;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
}
