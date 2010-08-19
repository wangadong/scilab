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
    <p>Manage my account：</p>
  	<a href="./PageRun.jsp">Click Here TO Run Scilab Online!</a><br/>
  	<a href="fun_getAllFunctions">View my function list</a><br/>
  <a href="fun_getReleasedFunList">View a list of all functions</a><br/>
  <a href="task_getAllTask?id=${task.taskId}">Check out the Task</a>
  
