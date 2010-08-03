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
    
    <title>登陆提示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
		function signout(){
			
			var options = {
				type: "post", url: "<s:url value='/SignoutAction!signout'/>",
				success:function(e){
					$("#LoginPersonal").html(e);
				}
			};
			$("#signoutForm").ajaxSubmit(options);
			return false;
		}
	</script>
  </head>
  
  <body>
  	<s:if test="#session.user!=null">用户“${sessionScope.user.userName}”登陆成功！</s:if>
  	<s:else>登陆失败！</s:else>
  	<div id=signoutDiv>
    	<s:form action="SignoutAction" method="post" id="signoutForm" onsubmit="return signout()">
    		<s:submit value="退出" method="signout"/>
    	</s:form>
    </div>
  	<s:a href="./ScilabExecute/ScilabTask.jsp"></>Click Here TO Run Scilab Online!<br>
  	<a href="fun_getAllFunctions">查看资源</a></br><a href="fun_getReleasedFunList">查看所有资源</a></br><a href="task_getAllTask?id=${task.taskId}">查看任务</a></s:a>
  </body>
</html>
