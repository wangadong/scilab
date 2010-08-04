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
  <table width="1000" height="495" border="2"  valign="top" >
   
   <tr height="20"><td width="100"align="center"class="title">函数名</td><td width="900">${functionInfo.funName}</td></tr>
    
   <tr height="135"><td width="100"align="center"class="title">源码</td><td width="900"><div style="height:135;overflow:auto"> ${functionInfo.funContent}</div></td></tr>
   
   <tr height="135"><td width="100"align="center"class="title">实例</td><td width="900"><div style="height:135;overflow:auto"> ${functionInfo.funExample}</div><br></td></tr>
   
   <tr height="135"><td width="100"align="center"class="title">帮助</td><td width="900"><div style="height:135;overflow:auto">${functionInfo.funHelp}</div></td></tr>
  
   <tr height="20"><td width="100"align="center"class="title">发布状态</td><td width="900">
   <c:choose>
   <c:when test="${functionInfo.funStatue==0}">未发布
   </c:when>
   <c:otherwise>    已发布 
   </c:otherwise>
   </c:choose></td></tr>   
   <tr height="20"><td width="100"align="center"class="title">发布时间</td><td width="900">${functionInfo.saveTime}</td></tr>
   <tr height="20"><c:if test="${sessionScope.user.userId != functionInfo.userId}"><td width="100"align="center">发布者</td><td width="900">${userInfo.userName}</td></c:if></tr>
   
  </table>
  <c:if test="${sessionScope.user.userId == functionInfo.userId}">
  <br/><br/>
  <a href="fun_deleteById?id=${functionInfo.funId}">从空间中删除此函数</a></c:if><br/>
  <a href="fun_getAllFunctions">返回我的函数列表</a><br/>
  <a href="fun_getReleasedFunList">返回所有函数列表</a><br/>
  <br/><br/><br/>
  </body>
</html>

