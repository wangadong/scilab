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
  <table border="1" width="1077" height="463px" >
  <tr>
  <td width="100%">
    ${userInfo.userName }
    </br>
    ${functionInfo.funContent} 
    </br>
    ${functionInfo.funExample} 
    </br>
    ${functionInfo.funHelp} 
    </br>
    ${functionInfo.funStatue} 
    </br>
    ${functionInfo.saveTime}
     </br>
  <c:if test="${sessionScope.user.userId == functionInfo.userId}">
  <a href="fun_deleteById?id=${functionInfo.funId}">删除</a>
  </c:if>
   <br>
  </td>
  </tr>
  </table>
  </body>
</html>

