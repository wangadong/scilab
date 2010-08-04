<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  	<s:if test="#session.user!=null">用户“${sessionScope.user.userName}”登陆成功！</s:if>
  	<s:else>登陆失败！</s:else>
  	<div id=signoutDiv>
    	<s:form action="SignoutAction" method="post" id="signoutForm" onsubmit="return signout()">
    		<s:submit value="退出" method="signout"/>
    	</s:form>
    </div>
  	<s:a href="./ScilabExecute/ScilabTask.jsp"></>Click Here TO Run Scilab Online!<br>
  	<a href="fun_getAllFunctions">查看我的函数列表</a><br/>
  <a href="fun_getReleasedFunList">查看所有函数列表</a><br/>
  <a href="task_getAllTask?id=${task.taskId}">查看任务</a>
  </s:a>
