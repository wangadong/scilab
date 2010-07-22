<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page language="java" import = "com.scilab.action.FunctionDetailAction,com.scilab.dao.*,com.scilab.pojo.FunctionInfo,java.util.*" %>

<%!   
public void jspInit() {
   getServletContext().setAttribute("funlist", FunctionDetailAction.getAllFunctions());
}
 
public void jspDestroy() {
   getServletContext().removeAttribute("funlist");
}
%>
<html>
<head>
<title>client resources</title>
</head>

<body>


<table border="1" width="1077" height="463px" align="">
<tr>
<td>
<%
   List funlist = (List) application.getAttribute("funlist");
   for (int i=0; i< funlist.size(); i++) {
         FunctionInfo finfo=(FunctionInfo)funlist.get(i);
%>
<a href="<%= request.getRequestURL() + "?funId=" + finfo.getFunId() %>">
         <%=  finfo.getFunName() %>
</a>
<br/>
<%
} 
%>
</td>
<td>
<h1></h1>
<%
   String selectedfun = request  .getParameter("funId");
   if (selectedfun == null) 
     selectedfun = "1";
     long bd=Integer.parseInt(selectedfun);
   FunctionInfo fun = (FunctionInfo)FunctionDetailAction.getFunInfoById(bd);
%>

<table border="1" width="817" height="436">
<tr><td align="left">源码</td><td><%= fun.getFunContent().replace("\r\n","<br>")%></td></tr>
<tr><td align="left">帮助</td><td><%= fun.getFunHelp().replace("\r\n","<br>")  %></td></tr>
<tr><td align="left">实例</td><td><%= fun.getFunExample().replace("\r\n","<br>")  %></td></tr>
<tr><td align="left">上传时间</td><td><%= fun.getSaveTime()  %></td></tr>
</table>
</td>
</tr>
</table>


</body>
</html>