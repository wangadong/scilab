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
	  <table border="1" width="1077" height="463px" >
	  <tr>
	  <td width 100%>
	  	任务名称 ${taskInfo.taskName}
	    </br>
	           任务内容	${taskInfo.taskContent} 
	    </br>
	   	任务状态 <c:choose>
	   	<c:when test="${taskInfo.taskStatue==1}">排队中</c:when>
	   	<c:otherwise>已完成</c:otherwise>	
	   	</c:choose>   	      
	    </br>
	  	 提交时间 ${taskInfo.saveTime}
	     </br>
	  <c:if test="${sessionScope.user.userId == taskInfo.userId}">
	  <a href="task_deleteById?id=${taskInfo.taskId}">删除</a>
	  </c:if>
	   <br>
	  </td>
	  </tr>
	  </table>
  </body>
</html>
