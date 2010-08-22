<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>"/>
	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script language="Javascript" type="text/javascript" src="<%=basePath%>edit_area/edit_area_full.js"></script>
		<script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/js/plugin/jquery.form.js"/>"></script>
		<link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox.css'/>" />
		<link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox-custom.css'/>" />
		
		<script type="text/javascript" src="<s:url value="/js/plugin/colorbox/jquery.colorbox.js"/>"></script>
		<script type="text/javascript">
	
	$(function(){
		$("a.loginAction").colorbox({contentWidth:"300px", contentHeight:"150px", contentIframe:true});
		$("a.registerAction").colorbox({contentWidth:"450px", contentHeight:"180px", contentIframe:true});
			return false;
		});
		$(function(){
		$.fn.colorbox.settings.bgOpacity = "0.3";
		});

</script>
<div id="longinandregister" align="left">
     <a href="./login.jsp" class="loginAction" >Login</a> | <a href="./register.jsp" class="registerAction">Register</a>
</div>
<!--<s:property value="message"/>-->

