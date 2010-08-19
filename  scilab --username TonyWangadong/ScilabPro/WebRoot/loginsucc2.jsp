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
    <p>管理我的帐户：</p>
  	<a href="./PageRun.jsp">Click Here TO Run Scilab Online!</a><br/>
  	<a href="fun_getAllFunctions">查看我的函数列表</a><br/>
  <a href="fun_getReleasedFunList">查看所有函数列表</a><br/>
  <a href="task_getAllTask?id=${task.taskId}">查看任务</a>
  
