
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
<title>My JSP 'MyJsp.jsp' starting page</title>
		<script language="Javascript" type="text/javascript" src="<%=basePath%>edit_area/edit_area_full.js"></script>
		<script type="text/javascript">
	editAreaLoader
			.init( {
				id : "scilabtask_1", // id of the textarea to transform					
				start_highlight : true,
				font_size : "10",
				font_family : "verdana, monospace",
				allow_resize : "y",
				allow_toggle : false,

				language : "zh",
				syntax : "php",
				toolbar : "new_document, save, load, |, search, go_to_line, |, undo, redo, |, select_font, |, highlight",
				load_callback : "my_load",
				save_callback : "my_save",
				plugins : "charmap",
				charmap_default : "arrows",
				is_multi_files : false

			});
	function my_save(id, content) {
		document.getElementById("myForm").submit();
	}

	function my_load(id) {
		editAreaLoader
				.setValue(id,
						"The content is loaded from the load_callback function into EditArea");
	}
	function validate(){
		var taskName = $("#myForm_taskName").val();
		taskName = $.trim(taskName);
		var taskContent = $("#scilabtask_1").val();
		taskContent = $.trim(taskContent);
		if (taskName.length==0) {
			alert("请输入任务名");
			return false;
		}
		if (taskContent.length==0) {
			alert("请输入SCILAB代码");
			return false;
		}
		var options = {
				type: "post", url: "<s:url value='/TaskAction!submitTask'/>",
				success:function(e){
					$("#myTask").html(e);
				}
			};
			$("#myForm").ajaxSubmit(options);
			return false;
	}
	function validate1(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		var options = {
				type: "post", url: "<s:url value='/CheckTask!getResult'/>",
				success:function(e){
					$("#myResult").html(e);
				}
			};
			$("#checkForm").ajaxSubmit(options);
			return false;
	}
	
	function statueAjax(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		$.ajax({
			type: "post", url: "CheckTask!getStatue", data: "taskname="+taskname+"&date="+new Date(),
			success:function(e){
				$("#myajaxdiv").html(e);
			}
		});
	}
	function saveAjax(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		$.ajax({
			type: "post", url: "CheckTask!saveTask", data: "taskname="+taskname+"&date="+new Date(),
			success:function(e){
			$("#myajaxdiv").html(e);
		}
	});
	}
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
        	<div style="display:block"><a href="PageRun.jsp"><img src="images/Picture0.jpg" alt="" /></a></div>
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
  <!-- InstanceBeginEditable name="EditRegion1" -->
   	<!-- InstanceEndEditable --><a href="PageModel.dwt">PageModel</a>    
  <div id="LoginPersonal" align="center">
   <p>登陆个人帐户：</p>
  <jsp:include page="login.jsp"></jsp:include> 
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
<div id="myTask">
		<s:form action='TaskAction' method='post' id="myForm" target="_blank"
			theme="simple" onsubmit="return validate()">
			<p>
				Task name:
				<input type="text" name="task.taskName" id="myForm_taskName" />
			</p>
			<textarea id="scilabtask_1" style="height: 300px; width: 636px;"
				name="task.taskContent">you can write scilab codes here!</textarea>
			<br />
			<s:submit value='提交任务' method="submitTask"/>
		</s:form>
    </div>

     <div id="myResult">     
		<s:form action="CheckTask" method="post" id="checkForm"
			target="_blank" theme="simple" onsubmit="return validate1()">
			<p>
				taskname for check:
				<input type="text" name="taskname" id="checkForm_taskname"/>
				<s:submit value='查看结果' method="getResult" />
				<input type="button" value='查询状态' onclick="statueAjax()" />
				<input type="button" value='保存任务' onclick="saveAjax()" />
			</p><div id="myajaxdiv"></div><div id="myajaxdiv"></div>
		</s:form>
	</div>
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
