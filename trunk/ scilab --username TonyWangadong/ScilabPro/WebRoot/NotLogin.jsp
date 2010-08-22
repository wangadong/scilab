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

	
        <p><a class="Theme"><strong> Have a try：</strong></a></p>
    <p><a class="Big" href="./PageRun.jsp">Operation</a><br/>Run ScilabOnline    </p>
    <p><a class="Big" href="fun_getReleasedFunList">Function</a><br/>See all the functions shared
    </p><br/>
<p><a class="Theme"><strong> If you login：</strong></a></p>
  <p>you can also </p>
  <p><br/>
    Set up your own function list<br/>
    Save and check your task list<br/>
  </p>
	