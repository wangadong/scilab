<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'FunInput.jsp' starting page</title>
    
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
  您好！ 欢迎来到函数发布页面！<br>
 <br>
    请将您要添加的函数的各项信息：函数名、函数本体、函数的帮助文档、以及适当的使用范例填写至对应框体内 <br>
    注意不要漏填！请您提供完整的函数信息以方便别人查看和管理员审核！若您上传的不符合基本要求，管理员将删除您的上传！<br>
    <br>
    您提交发布的函数网站管理员将在第一时间审核是否适合发布，审核完毕后将通过把结果通知给您，请确认您注册的邮箱地址是有效的！<br>
    <s:form action="FunInputAction" namespace="/" method="post">
    	<s:textfield name="functionInfo.funName" label="函数名" size="10"  maxlength="100" cssStyle="width:450px"></s:textfield><br/>
    	<s:textarea name="functionInfo.funContent" label="函数本体" cols="50" rows="20" ></s:textarea><br/>
    	<s:textarea name="functionInfo.funExample" label="使用范例" cols="50" rows="20"></s:textarea><br/>
    	<s:textarea name="functionInfo.funHelp" label="备注说明"cols="50" rows="20"></s:textarea><br/>
    	<s:submit value="提交发布" method="Input"></s:submit>
    </s:form>
  </body>
</html>