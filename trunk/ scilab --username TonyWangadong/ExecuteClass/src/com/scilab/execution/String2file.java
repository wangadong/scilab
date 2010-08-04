package com.scilab.execution;

import java.io.*;

public class String2file {
	public static boolean string2File(String res, String filePath) {
		boolean flag = true;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		try {
			String tmp;
			File distFile = new File(filePath);
			if (!distFile.getParentFile().exists())
				distFile.getParentFile().mkdirs();
			bufferedReader = new BufferedReader(new StringReader(res.replaceAll("NewLineChar", "\r\n")));
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

	public static void main(String[] args) {
		string2File("sdf\r\n;lsdkfs\r\\n", "c:/2.sci");
	}
}
