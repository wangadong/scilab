
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script> 
    <script type="text/javascript" src="js/common.js"></script>
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
<title>Index</title>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>  	
<script src="js/jqFancyTransitions.1.8.min.js" type="text/javascript"></script> 
<script>  
$('#slideshowHolder').jqFancyTransitions({ width: 350, height: 240});  
</script> 
<!-- InstanceEndEditable -->
</head>

<body>
  <div id="global">
  <div id="imageTop"><img src="images/ImageTop.gif" width="858" height="3" align="top" /></div>
  <div id="logo">
    <img src="images/LOGO.png" name="OurLogo" width="198" height="80" hspace="7" align="left" id="OurLogo" /></div>
  <div id="navigation">
    <table border="0" cellpadding="0" cellspacing="1" id="nav">
      <tr>
        <td width="90"><a href="PageIndex.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationIndex','',1)" onmouseover="MM_nbGroup('over','NavigationIndex','','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/NavigationIndex.png" alt="NavigationIndex" name="NavigationIndex" border="0" id="index"/></a></td>
        <td width="90" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationRun','',1)" onmouseover="MM_nbGroup('over','NavigationRun','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationRun.png" alt="NavigationRun" name="NavigationRun" border="0"id="operation" /></a></td>
        <td width="90" ><a href="PageFunctionInput.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationShare','',1)" onmouseover="MM_nbGroup('over','NavigationShare','','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/NavigationShare.png" alt="NavigationShare" name="NavigationShare" border="0"/></a></td>
        <td width="90" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationHow','',1)" onmouseover="MM_nbGroup('over','NavigationHow','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationHow.png" alt="NavigationHow" name="NavigationHow" border="0" /></a></td>
        <td width="90" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationLien','',1)" onmouseover="MM_nbGroup('over','NavigationLien','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationLien.png" alt="NavigationLien" name="NavigationLien" border="0"/></a></td>
        <td width="90"><a href="http://www.scilab.org.cn/bbs/" target="_top" onclick="MM_nbGroup('down','group1','NavigationCommunicate','',1)" onmouseover="MM_nbGroup('over','NavigationCommunicate','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationCommunicate.png" alt="NavigationCommunicate" name="NavigationCommunicate" border="0"/></a></td>
        <td width="90"><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationPresentation','',1)" onmouseover="MM_nbGroup('over','NavigationPresentation','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationPresentation.png" alt="NavigationPresentation" name="NavigationPresentation" border="0"/></a></td>
        <td width="90" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavigationContact','',1)" onmouseover="MM_nbGroup('over','NavigationContact','','',1)" onmouseout="MM_nbGroup('out')"><img src="images/NavigationContact.png" alt="NavigationContact" name="NavigationContact" border="0"/></a></td>
      </tr>
    </table>
    </div>
  <div id="NewfunctionAndGrandpicture">
    <div id="Bandpicture">
 <div class="fcnt" id="ppt">
    	<div class="mimg" id="mpc">
        	<div style="display:block"><a href="PageRun.jsp"><img src="images/Picture1.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture2.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture1.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture3.jpg" alt="" /></a></div>
        </div>
        <dl style="display:block">
        	<dt><a href="PageRun.jsp">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp">SciCloud</a></dt>
            <dd>TeleScilab</dd>
        </dl>
        <dl>
        	<dt><a href="PageRun.jsp">SciCloud</a></dt>
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
  <!-- InstanceBeginEditable name="EditRegion1" --><!-- InstanceEndEditable --><a href="PageModel.dwt">PageModel</a>    
  <div id="LoginPersonal" align="center">
   <p>登陆个人帐户：</p>
   <s:if test="#session.user!=null"><jsp:include page="loginsucc.jsp"></jsp:include></s:if>
   <s:else><jsp:include page="login.jsp"></jsp:include> </s:else>
   </div>
  <hr align="center" id="horizon" />
    <div id="registerIcon" align="center">
      <a href="PageRegister.jsp"><img src="images/Login.png" width="50" height="30" alt="Login" longdesc="images/Login.png" /></a></div>
  <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="黑白LOGO" align="center"><img src="images/SCILAB2.png" width="155" height="159" alt="ScilabLogo" longdesc="images/SCILAB2.png" /></div>
  </div>    
  <div id="RefreshDiv">
<!-- InstanceBeginEditable name="EditRegion2" -->
<div id="slideshowHolder">  
      <img src="images/img1.png" 
			 alt="<i>ScilabLogo<a href='http://sniperyu.deviantart.com/'>by Sophie</a></i>" width="170" height="120" />
      <a href='http://sniperyu.deviantart.com/'></a>
      <img src="images/img2.png" 
			 alt="ScilabLogo<i><a href='http://picasaweb.google.com/azzazel'>by Elise</a></i>" width="170" height="120" />
      <a href='http://picasaweb.google.com/azzazel'></a>
      <img src="images/img3.png" 
			 alt="Scilab online<i><a href='http://ivframes.com/'></a></i>" width="170" height="120" />
      <a href='http://ivframes.com/'></a>			 
      <img src="images/NOTE.JPG" 
             alt="The note of Sophie<i><a href='http://ivframes.com/'></a></i>" width="170" height="120" longdesc="images/NOTE.png" />
      </div>      
    <div id="select">
      <div id="try"><a href='PageRun.jsp'><img src="images/Try.png" width="250" height="60" alt="Try" longdesc="images/Try.png" /></a></div>
      <div id="share"><a href='PageFunctionInput.jsp'><img src="images/Share.png" width="250" height="60" alt="Share" longdesc="images/Share.png" /></a></div>
      <div id="presentation"><a href='PageRun.jsp'><img src="images/Presentation.png" width="250" height="60" alt="Presentation" longdesc="images/Presentation.png" /></a></div>
      <div id="How"><a href='PageRun.jsp'><img src="images/How.png" width="250" height="60" alt="How" longdesc="images/How.png" /></a></div>
      </div>
    <p><br clear="all" />
      <script> 
 	      $('#slideshowHolder').jqFancyTransitions({navigation:false,direction: 'random',links : true,effect: 'curtain' });
      </script>
      </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>模版固定了右下角页面的大小，因此这边需要加点什么<br clear="all" />
    </p>
<!-- InstanceEndEditable --><a href="PageModel.dwt">PageModel</a>     
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
