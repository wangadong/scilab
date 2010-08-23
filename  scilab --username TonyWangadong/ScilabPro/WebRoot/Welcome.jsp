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
	<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
	<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
	
<div id="LoginSucc">
<s:if test="#session.user!=null">您好，“${sessionScope.user.userName}”，欢迎体验ScilabOnline！</s:if>
<s:else>登陆失败！</s:else></div>
<div ><a href="SignoutAction!signout" class="SignOutTop">退出</a></div>  
