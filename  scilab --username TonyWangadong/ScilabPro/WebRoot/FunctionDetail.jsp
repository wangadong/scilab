<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>My JSP 'FunctionDetail.jsp' starting page</title>
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
  
  <div id="NewfunctionAndGrandpicture">
    <div id="Bandpicture">
 <div class="fcnt" id="ppt">
    	<div class="mimg" id="mpc">
        	<div style="display:block"><a href="PageRun.jsp"><img src="images/Picture0.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture2.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture1.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture3.jpg" alt="" /></a></div>
        </div>
        <dl style="display:block">
        	<dt><a href="PageRun.jsp" class="TextInPic">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp" class="TextInPic">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp" class="TextInPic">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp" class="TextInPic">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <div id="tri"></div>
        <ul>
        	<li class="cur"><img src="images/s0.jpg" alt="" /></li>
            <li><img src="images/s2.jpg" alt="" /></li>
            <li><img src="images/s1.jpg" alt="" /></li>
            <li><img src="images/s3.jpg" alt="" /></li>
        </ul>
    </div>
    </div>
    </div>
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
<!-- InstanceBeginEditable name="EditRegion2" --><table width="1000" height="495" border="2"  valign="top" >
   
   <tr height="20"><td width="100"align="center"class="title">函数名</td><td width="900">${functionInfo.funName}</td></tr>
    
   <tr height="135"><td width="100"align="center"class="title">源码</td><td width="900"><div style="height:135;overflow:auto"> ${functionInfo.funContent}</div></td></tr>
   
   <tr height="135"><td width="100"align="center"class="title">实例</td><td width="900"><div style="height:135;overflow:auto"> ${functionInfo.funExample}</div><br></td></tr>
   
   <tr height="135"><td width="100"align="center"class="title">帮助</td><td width="900"><div style="height:135;overflow:auto">${functionInfo.funHelp}</div></td></tr>
  
   <tr height="20"><td width="100"align="center"class="title">发布状态</td><td width="900">
   <c:choose>
   <c:when test="${functionInfo.funStatue==0}">未发布
   </c:when>
   <c:otherwise>    已发布 
   </c:otherwise>
   </c:choose></td></tr>   
   <tr height="20"><td width="100"align="center"class="title">发布时间</td><td width="900">${functionInfo.saveTime}</td></tr>
   <tr height="20"><c:if test="${sessionScope.user.userId != functionInfo.userId}"><td width="100"align="center">发布者</td><td width="900">${userInfo.userName}</td></c:if></tr>
   
  </table>
  <c:if test="${sessionScope.user.userId == functionInfo.userId}">
  <br/><br/>
  <a href="fun_deleteById?id=${functionInfo.funId}">从空间中删除此函数</a></c:if><br/>
  <a href="fun_getAllFunctions">返回我的函数列表</a><br/>
  <a href="fun_getReleasedFunList">返回所有函数列表</a><br/>
  <br/><br/><br/><!-- InstanceEndEditable --><a href="PageModel.dwt"></a>     
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

