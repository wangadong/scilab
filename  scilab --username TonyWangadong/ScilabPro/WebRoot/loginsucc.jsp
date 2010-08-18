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
  	<s:if test="#session.user!=null">用户“${sessionScope.user.userName}”登陆成功！</s:if>
  	<s:else>登陆失败！</s:else>
  	<p>请点击右上角退出登录框，并刷新一次页面</p>
