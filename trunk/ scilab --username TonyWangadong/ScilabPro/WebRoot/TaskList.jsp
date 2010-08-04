<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TaskList.jsp' starting page</title>
    
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
   	    <table width="500"  border="2"  valign="top">
  <tr><td height="25" width="250" align="left" class="title">任务名称列表</td><td width="250">查看任务信息</td></tr> 
  <c:if test="${empty list}"><tr height="25"><td width="500"align="left"class="title">
     对不起，暂时还没有任务，请提交后查看　　　　　　　　　　
  </td></tr></c:if>
  <c:forEach var="task" items="${list}"> 
  <tr height="10"><td width="250"align="left"class="title">${task.taskName}</td><td width="250"><a href="task_getDetail?id=${task.taskId}">查看</a></td></tr>
  <br/>
  </c:forEach>
  </table>
	   <br><br>
	   　<a href="ScilabExecute/ScilabTask.jsp">继续上传任务</a>　　　<a href="loginsucc.jsp">返回资源首页</a>
  </body>
</html>
