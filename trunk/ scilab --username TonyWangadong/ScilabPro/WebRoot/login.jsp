<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

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
   	<div id="loginDiv">
    	<s:form action="LoginAction" method="post" onsubmit="return login()" id="loginForm">
    		<s:textfield name="user.userName" id="userName" label="帐户" cssStyle="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"/>
    		<s:password name="user.password" id="password" label="密码" cssStyle="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;"/>
    		<s:submit value="登陆" method="login" cssStyle="height:30px; width:50px; font-size:16px;"/>
    	</s:form>
    </div>