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

	
        <p>
        <div id="LeftOperation"><a href="./PageRun.jsp" ><img src="images/LeftOperation.png" width="250" height="64" alt="LeftOperation" longdesc="images/LeftOperation.png" /></a></div>
        <div id="LeftFunction"><a href="fun_getReleasedFunList" ><img src="images/LeftFunction.png" width="250" height="64" alt="LeftFunction" longdesc="images/LeftFunction.png" /></a></div>
        <div id="LeftShow"><img src="images/LeftShow.png" width="250" height="64" alt="LeftShow" longdesc="images/LeftShow.png" /></div>
        <div id="LeftTeam"><img src="images/LeftTeam.png" width="250" height="64" alt="LeftTeam" longdesc="images/LeftTeam.png" /></div>
        <div id="LeftLinks"><img src="images/LeftLinks.png" width="250" height="64" alt="LeftLinks" longdesc="images/LeftLinks.png" /></div>
        </p>