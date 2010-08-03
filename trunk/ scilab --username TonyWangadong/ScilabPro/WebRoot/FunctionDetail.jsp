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
    
    <title>My JSP 'FunctionDetail.jsp' starting page</title>
    
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
  <table border=1 cellspacing=0 cellpadding=0 width="500" height="387">
  
  
   <tr><td>发布者</td><td>${userInfo.userName}</td></tr>
    
   <tr><td>源码</td><td>${functionInfo.funContent}</td></tr> 
   
   <tr><td>实例</td><td> ${functionInfo.funExample}</td></tr>
   
   <tr><td>帮助</td><td>${functionInfo.funHelp}</td></tr>
  
   <tr><td>发布状态</td><td>
   <c:choose>
   <c:when test="${functionInfo.funStatue==0}">未发布
   </c:when>
   <c:otherwise>    已发布 
   </c:otherwise>
   </c:choose></td></tr>   
   <tr><td>发布时间</td><td>${functionInfo.saveTime}</td></tr>
  <tr><td><c:if test="${sessionScope.user.userId == functionInfo.userId}">
  <a href="fun_deleteById?id=${functionInfo.funId}">删除</a></c:if></td></tr>
  
  </table>
  </body>
</html>

