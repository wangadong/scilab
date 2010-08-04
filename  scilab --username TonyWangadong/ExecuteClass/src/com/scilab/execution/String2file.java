package com.scilab.execution;

import java.io.*;

public class String2file {
	 public static boolean string2File(String res, String filePath) { 
         boolean flag = true; 
         BufferedReader bufferedReader = null; 
         BufferedWriter bufferedWriter = null; 
         try { 
                 File distFile = new File(filePath); 
                 if (!distFile.getParentFile().exists()) distFile.getParentFile().mkdirs(); 
                 bufferedReader = new BufferedReader(new StringReader(res)); 
                 bufferedWriter = new BufferedWriter(new FileWriter(distFile)); 
                 char buf[] = new char[1024];         //×Ö·û»º³åÇø 
                 int len; 
                 while ((len = bufferedReader.read(buf)) != -1) { 
                         bufferedWriter.write(buf, 0, len); 
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
