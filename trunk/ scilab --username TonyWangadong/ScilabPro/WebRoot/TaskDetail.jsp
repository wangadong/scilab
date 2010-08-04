<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TaskDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	  <table border=1 cellspacing=0 cellpadding=0 width="800" height="387">
	  <tr><td width="100">　任务名称 </td><td>　　　${taskInfo.taskName}</td></tr>
	    </br>
	  <tr><td width="100">　任务内容</td><td><div style="height:240;overflow:auto">${taskInfo.taskContent}</div></td></tr>
	    </br>
	  <tr><td width="100">　提交时间 </td><td>　　　${taskInfo.saveTime}</td></tr>
	  </table>
	  <br><br>
	    <div id="myResult">     
		<s:form action="CheckTask" method="post" id="checkForm"
			target="_blank" theme="simple" onsubmit="return validate1()">
			<p>	    <s:submit value='查看任务结果' method="getResult" />　　　<a href="task_deleteById?id=${taskInfo.taskId}">删除本项任务</a>　　　<a href="task_getAllTask">返回任务列表</a>
			</p><div id="myajaxdiv"></div><div id="myajaxdiv"></div>
		</s:form>
	</div>　  　　
  </body>
</html>
