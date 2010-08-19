<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
        <p>Welcome Trial：</p>
  	<a href="./PageRun.jsp">Click Here TO Run Scilab Online!</a><br/>
  	<a href="fun_getReleasedFunList">View a list of all functions!</a><br/>
        <p>What's more after Login：</p>
  Create your own Function List!<br/>
  Create your own Task List!<br/>