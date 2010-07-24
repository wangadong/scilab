<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>My JSP 'FunInput.jsp' starting page</title>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    
<style type="text/css">
<!--
#grandbackground{
	background-color:#666;
	height: 870px;
	width: 100%;
}
#global{
	width:1024px;
	height:870px;
	background-color:#fff;
}
#logo {
	height: 100px;
	width: 1024px;
}
#中法LOGO {
	float: right;
}
#导航 {
	height: 60px;
	width: 1024px;
}
#导航蓝栏    {
	height: 45px;
	width: 1000px;
}
#大图 {
	height: 220px;
}
#NewFonction {
	height: 196px;
	width: 200px;
	margin-top: 7px;
	margin-left: 10px;
	border: 2px solid #B8D4E8;
	background-color: #F0F5F8;
	float: left;
}
#NewFonction table tr td    {
	font-size: 18px;
	font-weight: normal;
	color: #043950;
	height: 20px;
}
#大图 #NewFonction table tr td #form3 #NewFonction1 {
	height: 20px;
}
#大图 #NewFonction table tr td #form4 #NewFonction2 {
	height: 20px;
}
#大图 #NewFonction table tr td #form5 #NewFonction3 {
	height: 20px;
}
#大图 #NewFonction table tr td #form6 #NewFonction4 {
	height: 20px;
}
#大图右    {
	width: 790px;
	float: right;
	height: 200px;
	margin-top: 8px;
	margin-right: 10px;
}
#登陆 {
	float: left;
	height: 435px;
	width: 200px;
	background-color: #f0f5f8;
	border: thin solid #b8d4e8;
	font-size: 20px;
	font-style: normal;
	font-weight: bolder;
	font-variant: normal;
	color: #333;
	margin-top: 15px;
	margin-left: 10px;
}
#登陆 #LoginTop {
	background-image: url(images/loginTop.jpg);
	height: 30px;
	padding-top: 10px;
}
#刷新页面 {
	height: 467px;
	width: 800px;
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	border-top-color: #B8D4E8;
	border-bottom-color: #B8D4E8;
	border-left-color: #B8D4E8;
	float: right;
}
#SharePage {
	margin-top: 15px;
	margin-left: 10px;
	margin-right: 10px;
	height: 450px;
	width: 550px;
	background-color: #F0F5F8;
	border: 1px ridge #B8D4E8;
	float: left;
}
#刷新页面 #SharePage #form1 table {
	font-family: Tahoma, Geneva, sans-serif;
	margin-top: 30px;
}
#刷新页面 #SharePage #form1 table tr td #FonctionName {
	height: 30px;
	width: 200px;
}
#刷新页面 #SharePage #form1 table tr td #Code {
	height: 90px;
	width: 400px;
}
#刷新页面 #SharePage #form1 table tr td #Help {
	height: 90px;
	width: 400px;
}
#刷新页面 #SharePage #form1 table tr td #Exemple {
	height: 90px;
	width: 400px;
}
#Explication {
	width: 200px;
	float: right;
	margin-top: 15px;
	margin-right: 10px;
	height: 450px;
	background-color: #F0F5F8;
	border: 1px solid #B8D4E8;
}
#InfoTable {
	height: 180px;
	width: 200px;
	margin-top: 10px;
	padding-top: 10px;
}
#登陆 #LoginTop hr {
	margin-right: 10px;
	margin-left: 10px;
	margin-top: -30px;
}
#Welcome {
	height: 30px;
	width: 200px;
	font-size: 16px;
	font-style: italic;
	font-weight: bolder;
	color: #009;
	background-image: url(images/loginTop.jpg);
	background-repeat: no-repeat;
	padding-top: 10px;
}
-->
</style>
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
</head>

<body>
<div id="grandbackground"  align="center">
<div id="global">
  <img src="images/上条框.gif" width="1010" height="8" hspace="5" align="top" />
  <div id="logo"><img src="images/LOGO.png" name="项目LOGO" width="318" height="86" hspace="7" vspace="7" align="left" id="项目LOGO" /><img src="images/中法LOGO.png" name="中法LOGO" width="254" height="84" hspace="10" vspace="7" align="right" id="中法LOGO" /></div>
<div id="导航">
  <div id="导航蓝栏"><table border="0" cellpadding="0" cellspacing="1">
    <tr>
      <td width="90" height="20"><a href="homepage.html" target="_top" onclick="MM_nbGroup('down','group1','index','images/icon/导航按钮按下首页.png',1)" onmouseover="MM_nbGroup('over','index','images/icon/导航按钮停留首页.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/icon/导航按钮平常首页.png" alt="首页" name="index" width="125" height="45" border="0" id="index" onload="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onclick="MM_nbGroup('down','group1','operation','images/icon/导航按钮按下在线运算.png',1)" onmouseover="MM_nbGroup('over','operation','images/icon/导航按钮停留在线运算.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/icon/导航按钮平常在线运算.png" alt="在线运算" name="operation" width="125" height="45" border="0"id="operation" onload="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','share','images/icon/导航按钮按下函数分享.png',1)" onMouseOver="MM_nbGroup('over','share','images/icon/导航按钮停留函数分享.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常函数分享.png" alt="函数分享" name="share" width="125" height="45" border="0" onload="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','application','images/icon/导航按钮按下应用演示.png',1)" onMouseOver="MM_nbGroup('over','application','images/icon/导航按钮停留应用演示.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常应用演示.png" alt="应用演示" name="application" width="125" height="45" border="0" onLoad="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','lien','images/icon/导航按钮按下友情链接.png',1)" onMouseOver="MM_nbGroup('over','lien','images/icon/导航按钮停留友情链接.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常友情链接.png" alt="友情链接" name="lien" width="125" height="45" border="0" onLoad="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','communicate','images/icon/导航按钮按下交流平台.png',1)" onMouseOver="MM_nbGroup('over','communicate','images/icon/导航按钮停留交流平台.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常交流平台.png" alt="交流平台" name="communicate" width="125" height="45" border="0" onLoad="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','presentation','images/icon/导航按钮按下团队介绍.png',1)" onMouseOver="MM_nbGroup('over','presentation','images/icon/导航按钮停留团队介绍.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常团队介绍.png" alt="团队介绍" name="presentation" width="125" height="45" border="0" onLoad="" /></a></td>
      <td width="90" height="20"><a href="javascript:;" target="_top" onClick="MM_nbGroup('down','group1','contact','images/icon/导航按钮按下联系我们.png',1)" onMouseOver="MM_nbGroup('over','contact','images/icon/导航按钮停留联系我们.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/icon/导航按钮平常联系我们.png" alt="联系我们" name="contact" width="125" height="45" border="0" onLoad="" /></a></td>
    </tr>
  </table>
</div></div>
<div id="大图">
  <div id="NewFonction">
    <table width="189" height="180" border="0" cellspacing="0">
      <tr>
        <td>最新方程：</td>
      </tr>
      <tr>
        <td><form id="form3" name="form3" method="post" action="">
          <input type="text" name="NewFonction1" id="NewFonction1" />
        </form></td>
      </tr>
      <tr>
        <td><form id="form4" name="form4" method="post" action="">
          <input type="text" name="NewFonction2" id="NewFonction2" />
        </form></td>
      </tr>
      <tr>
        <td><form id="form5" name="form5" method="post" action="">
          <input type="text" name="NewFonction3" id="NewFonction3" />
        </form></td>
      </tr>
      <tr>
        <td><form id="form6" name="form6" method="post" action="">
          <input type="text" name="NewFonction4" id="NewFonction4" />
        </form></td>
      </tr>
    </table>
  </div>
  <div id="大图右"></div>
</div>
<div id="登陆">
  <div id="LoginTop">管理我的帐户
   </div>
   <div id="InfoTable">
      <table width="200" height="178" border="0">
        <tr>
          <td align="center">用户名：</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center">性别：</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center">注册日期：</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
   </div>
   <hr />
   <br/>
    <div id="registerIcon" align="center">
      <form id="form2" name="form2" method="post" action="">
      <p>
        <input type="submit" name="Icon" id="Icon" value="分享我的方程" />
      </p>
      <p>
        <input type="submit" name="AllMine" id="AllMine" value="我的方程库" />
      </p>
    </form>
  </div>
  <div id="黑白LOGO" align="center"></div>
  </div>    
<div id="刷新页面">
  <div id="SharePage">
    <s:form action="FunInputAction" namespace="/" method="post">
    	<s:textfield name="functionInfo.funName" label="函数名" size="10"  maxlength="100" cssStyle="width:420px"></s:textfield><br/>
    	<s:textarea name="functionInfo.funContent" label="函数本体" cols="50" rows="6" ></s:textarea><br/>
    	<s:textarea name="functionInfo.funExample" label="使用范例" cols="50" rows="6"></s:textarea><br/>
    	<s:textarea name="functionInfo.funHelp" label="备注说明"cols="50" rows="6"></s:textarea><br/>
    	<s:submit value="提交发布" method="Input"></s:submit>
    </s:form>
  </div>
  <div id="Explication">
  <div id="Welcome">欢迎来到函数发布页面！</div>
  <table width="205" height="401" border="0">
    <tr>
      <td height="132">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请将您要添加的函数的各项信息：函数名、函数本体、函数的帮助文档、以及适当的使用范例填写至对应框体内 。</td>
    </tr>
    <tr>
      <td height="145">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注意不要漏填！请您提供完整的函数信息以方便别人查看和管理员审核！若您上传的不符合基本要求，管理员将删除您的上传！</td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您提交发布的函数网站管理员将在第一时间审核是否适合发布，审核完毕后将通过把结果通知给您，请确认您注册的邮箱地址是有效的！</td>
    </tr>
  </table>
  </div>
</div>
</div>
</div>
</body>
</html>
