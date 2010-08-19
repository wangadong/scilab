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
   
  	<s:if test="#session.user!=null">User“${sessionScope.user.userName}”login successfully!</s:if>
  	<s:else>Login failed!</s:else>
  	<p>Please click on the upper right corner exit login box, and refresh the page!</p>
