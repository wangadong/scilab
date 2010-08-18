<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
  	<s:if test="#session.user!=null">您好，“${sessionScope.user.userName}”，欢迎体验ScilabOnline！</s:if>
  	<s:else>登陆失败！</s:else>
  	<div id=signoutDiv>
    	<s:form action="SignoutAction" method="post" id="signoutForm" onsubmit="return signout()">
    		<s:submit value="退出" method="signout"/>
    	</s:form>
    </div>
    <p>管理我的帐户：</p>
  	<a href="./PageRun.jsp">Click Here TO Run Scilab Online!</a><br/>
  	<a href="fun_getAllFunctions">查看我的函数列表</a><br/>
  <a href="fun_getReleasedFunList">查看所有函数列表</a><br/>
  <a href="task_getAllTask?id=${task.taskId}">查看任务</a>
  
