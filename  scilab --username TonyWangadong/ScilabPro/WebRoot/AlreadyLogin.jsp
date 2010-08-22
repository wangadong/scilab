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
  	<p><a class="Big" href="./PageRun.jsp">Operation</a><br/>Run ScilabOnline </p>
    <p><a class="Big" href="fun_getReleasedFunList">Function</a><br/>See all the functions shared</p><br/>
  	<p><a href="fun_getAllFunctions">查看我的函数列表</a><br/></p>
  
  <a href="task_getAllTask?id=${task.taskId}">查看任务</a>
  
