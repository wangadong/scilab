<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/PageModel.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<base href="<%=basePath%>"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="Scilab,Cloud,Online"/>
	<meta http-equiv="description" content="Scilab Cloud Online"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script> 
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/js/plugin/jquery.form.js"/>"></script>
    <script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>


<!-- InstanceBeginEditable name="doctitle" -->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<title>Register Page</title>
<script type="text/javascript">
			var b = false;
			function isRegister(){
				var username = $("#userName2").val();
				username = $.trim(username);
				if(username.length>0){
					$.ajax({
						type: "post", url: "<s:url value='/RegisterAction!isRegister'/>", data: "userInfo.userName="+username,
						success: function(e){
							if(e=='exist'){
								b = false;
								$("#isExist").text("用户名“"+username+"”已存在，请重新输入！").attr("color", "red");
							}else if(e=="notexist"){
								b = true;
								$("#isExist").text("用户名“"+username+"”可以使用！").attr("color", "green");
							}
						}
					});
				}
			}
			function register(){
				var username = $("#userName2").val();
				username = $.trim(username);
				if(username.length<1){
					$("#isExist").text("请输入用户名！").attr("color", "red");
					return false;
				}
				if(b){
					return true;
				}
				return false;
			}
		</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('images/HomeMouseOn.png','images/OperationMouseOn.png','images/FunctionMouseOn.png','images/ShowMouseOn.png','images/TeamMouseOn.png','images/ContactMouseOn.png')">
  <div id="global">
  <div id="BlueTopImage">
  <div id="LoginAndRegister" align="left"><a class="LoginAndRegister" href="Login.jsp">Login</a> | <a class="LoginAndRegister" href="Register.jsp">Register</a></div>
  <div id="navigation">
    <table width="558" border="0" cellpadding="0" cellspacing="1" id="nav">
      <tr>
        <td width="80"><a href="index.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationHome','',1)" onmouseover="MM_nbGroup('over','NavigationHome','images/HomeMouseOn.png','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/HomeNormal.png" alt="NavigationHome" name="NavigationHome" width="80" height="43" border="0" id="index"/></a></td>
        <td width="110" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationOperation','',1)" onmouseover="MM_nbGroup('over','NavigationOperation','images/OperationMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/OperationNormal.png" alt="NavigationOperation" name="NavigationOperation" border="0"id="operation" /></a></td>
        <td width="106" ><a href="PageFunctionInput.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationFunction','',1)" onmouseover="MM_nbGroup('over','NavigationFunction','images/FunctionMouseOn.png','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/FunctionNormal.png" alt="NavigationFunction" name="NavigationFunction" border="0"/></a></td>
        <td width="80" ><a href="PageShow.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationShow','',1)" onmouseover="MM_nbGroup('over','NavigationShow','images/ShowMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/ShowNormal.png" alt="NavigationShow" name="NavigationShow" border="0" /></a></td>
        <td width="80"><a href="PageTeam.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationTeam','',1)" onmouseover="MM_nbGroup('over','NavigationTeam','images/TeamMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/TeamNormal.png" alt="NavigationTeam" name="NavigationTeam" border="0"/></a></td>
        <td width="215" ><a href="PageContact.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationContact','',1)" onmouseover="MM_nbGroup('over','NavigationContact','images/ContactMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/ContactNormal.png" alt="NavigationContact" name="NavigationContact" border="0"/></a></td>
      </tr>
    </table>
    </div></div>
  
 
  <div id="LoginDiv">
  <!-- InstanceBeginEditable name="EditRegion1" --><!-- InstanceEndEditable --><a href="PageModel.dwt"></a>    
  <div id="LoginPersonal" align="center">
   <p>登陆个人帐户：</p>
  <s:if test="#session.user!=null"><jsp:include page="loginsucc.jsp"></jsp:include></s:if>
<s:else><jsp:include page="login.jsp"></jsp:include></s:else>
    </div>
  <hr align="center" id="horizon" />
    <div id="registerIcon" align="center">
      <a href="register.jsp"><img src="images/Login.png" width="50" height="30" alt="Login" longdesc="images/Login.png" /></a></div>
  <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="黑白LOGO" align="center"><img src="images/SCILAB2.png" width="155" height="159" alt="ScilabLogo" longdesc="images/SCILAB2.png" /></div>
  </div>    
  <div id="RefreshDiv">
<!-- InstanceBeginEditable name="EditRegion2" -->
请填写注册信息：
		</br>
		<s:form action="RegisterAction" namespace="/" method="post" theme="simple" onsubmit="return register()" >
			<table>
				<tr>
					<td style="">
						请输入账号
					</td>
					<td>
						<s:textfield name="userInfo.userName" id="userName2" label="账号" onblur="isRegister()" />
						<span id="isExist"></span>
					</td>
				</tr>
				<tr>
					<td style="">
						请输入密码
					</td>
					<td>
						<s:password name="userInfo.password" label="密码" />
					</td>
				</tr>

				</tr>
				<tr>
					<td style="">
						<s:submit value="注册" method="register"></s:submit>
					</td>
					<td style="">
						<s:reset value="取消" />
					</td>
				</tr>
			</table>
		</s:form>
		<s:fielderror cssStyle="color:red" />
<!-- InstanceEndEditable --><a href="PageModel.dwt"></a>     
  </div>
<div id="aboutUs">
    <table width="437" height="97" border="0" align="right">
      <tr>
        <td width="179" height="23">&nbsp;</td>
        <td width="219">电话:***********</td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>邮箱:**********@gmail.com</td>
      </tr>
      <tr>
        <td height="23">Copyright 2010©www.****.com</td>
        <td>地址:北京市海淀区学院路37号中法工程师学院</td>
      </tr>
      <tr>
        <td height="22">&nbsp;</td>
        <td>邮编：100191</td>
      </tr>
    </table>
  </div>
  </div>
<div id="EcpknLogo"><img src="images/ecpknLOGO.png" width="200" height="59" alt="ecpknLOGO" longdesc="images/ecpknLOGO.png" /></div>
</body>
<!-- InstanceEnd --></html>

