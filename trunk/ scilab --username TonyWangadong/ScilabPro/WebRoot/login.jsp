<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/js/plugin/jquery.form.js"/>"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function login(){
			var userName = $("#userName").val();
			userName = $.trim(userName);
			if(userName.length<1){
				alert("请输入用户名！");
				return false;
			}
			var password = $("#password").val();
			if(password.length<1){
				alert("请输入密码！");
				return false;
			}
			var options = {
				type: "post", url: "<s:url value='/LoginAction!login'/>",
				success:function(e){
					$("#loginDiv").html(e);
				}
			};
			$("#loginForm").ajaxSubmit(options);
			return false;
		}
	</script>
  </head>
  
  <body >
  	<div id="loginDiv">
    	<s:form action="LoginAction" method="post" onsubmit="return login()" id="loginForm">
    		<s:textfield name="user.userName" id="userName" label="帐户" cssStyle="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"/>
    		<s:password name="user.password" id="password" label="密码" cssStyle="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"/>
    		<s:submit value="登陆" method="login" cssStyle="height:30px; width:50px; font-size:16px;"/>
    	</s:form>
    </div>
  </body>
</html>
