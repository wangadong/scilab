<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
<!--
td #N1 {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
td #N2 {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:300px;
}
td #N3 {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
td #N4 {
	height:20px;
	width:100px;
}
#TaskListBottom {
	border-top-width: 1px;
	border-right-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-left-style: solid;
	border-top-color: #000;
	border-right-color: #000;
	border-left-color: #000;
	width:605px;
}
-->
</style>
<script type="text/javascript">
<!--
	$(function(){
		$("a.taskResult").colorbox({contentWidth:"800px", contentHeight:"450px", contentIframe:true});
		$("a.taskSave").click(function(){
			$.ajax({
				type: "post", url: $(this).attr("href"), data: "&date="+new Date(),
				success:function(e){
					$("#myajaxdiv").html(e);
				}
			});
			return false;
		});
	});
//-->
</script>
<div id="TaskListBottom">
 <table border="0" height="20" cellspacing="0">
  <tr>
     <td><div id="N1">任务名称：</div></td>
     <td width="300"><div id="N2"><s:property value="taskname"/></div></td>
     <td><div id="N3"><a href='<s:url value='/CheckTask!getResult'/>?taskname=<s:property value="taskname"/>' class="taskResult" title="<s:property value="taskname"/>" >查看结果</a></div></td>
     <td><div id="N4"><a href='<s:url value='/CheckTask!saveTask'/>?taskname=<s:property value="taskname"/>' class="taskSave">保存任务</a></div></td>
  </tr>
 </table>
</div>
<!--<s:property value="message"/>-->

