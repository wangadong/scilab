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
	  <table border="1" width="1077" height="463px" >
	  <tr>
	  <td width="100%">
	  <c:if test="${empty list}">
		 对不起，暂时还没有任务，请提交后查看</br>
	  <a href="ScilabExecute/ScilabTask.jsp">提交任务</a></c:if>
	  
	  <c:forEach var="task" items="${list}"> 
	    ${task.taskName} 
	  <a href="task_getDetail?id=${task.taskId}">查看详情</a>
	   <br>
	  </c:forEach>
	  </td>
	  </tr>
	  </table>
  </body>
</html>
