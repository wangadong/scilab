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
    
    <title>My JSP 'FunctionList.jsp' starting page</title>
    
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
  <table cellspacing=0 cellpadding=0 border=1 width="1088" height="363px">
  
  
  <c:if test="${empty list}">
    对不起，暂时还没有相关资源
  </c:if>
  
  <c:forEach var="fun" items="${list}"> 
  <tr><td>${fun.funName}</td> 
  <td><a href="fun_getReleasedFunDetail?id=${fun.funId}">查看</a></td></tr>
  <br>
  </c:forEach>
 
  
  </table>
  </body>
</html>
