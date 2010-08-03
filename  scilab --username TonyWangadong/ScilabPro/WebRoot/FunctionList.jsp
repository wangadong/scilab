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
  <table border="1" width="1077" height="463px" >
  <tr>
  <td width="100%">
  <c:if test="${empty list}">
     对不起，暂时还没有相关资源
  <a href="FunInput.jsp">上传</a></c:if>
  
  <c:forEach var="fun" items="${list}"> 
  <tr>${fun.funName}<a href="fun_getDetail?id=${fun.funId}">查看</a></tr>
  <br>
  </c:forEach>
  </td>
  </tr>
  </table>
  </body>
</html>
