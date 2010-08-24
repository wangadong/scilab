<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
<!--
td #N1 {
	border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
td #N2 {
	border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:300px;
}
td #N3 {
	border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
td #N4 {
	border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
td #N5 {
    border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #000;
	height:20px;
	width:100px;
}
#TaskListBottom {
	border-top-width: 1px;
	border-right-width: 2px;
	border-left-width: 2px;
	
	border-top-style: solid;
	border-right-style: solid;
	border-left-style: solid;
	
	border-top-color: #000;
	border-right-color: #000;
	border-left-color: #000;
	
	  border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #000;
	
	width:730px;
}
-->
</style>
<script type="text/javascript">
<!--
	$(function(){
		var name = $("input[type=hidden][name=taskName_h]:eq(0)").val();
		$("div[name="+name+"]:eq(1)").remove();
		$("a.taskResult:eq(0)").colorbox({contentWidth:"800px", contentHeight:"450px", contentIframe:true});
		$("a.taskSave:eq(0)").colorbox({contentWidth:"150px", contentHeight:"100px", contentIframe:true});
		$("a.taskStatue:eq(0)").colorbox({contentWidth:"150px", contentHeight:"100px", contentIframe:true});
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
<div name="<s:property value='taskname'/>" id="TaskListBottom">
 <input type="hidden" name="taskName_h" value="<s:property value='taskname'/>"/>
 <table border="0" height="20" cellspacing="0">
  <tr>
     <td><div id="N1">任务名称：</div></td>
     <td width="300"><div id="N2"><s:property value="taskname"/></div></td>
     <td><div id="N3"><a href='<s:url value='/CheckTask!getResult'/>?taskname=<s:property value="taskname"/>' class="taskResult" title="<s:property value="taskname"/>" >查看结果</a></div></td>
     <td><div id="N4"><a href='<s:url value='/CheckTask!saveTask'/>?taskname=<s:property value="taskname"/>' class="taskSave">保存任务</a></div></td>
     <td><div id="N5"><a href='<s:url value='/CheckTask!getStatue'/>?taskname=<s:property value="taskname"/>' clase="taskStatue">查询状态</a></div>
  </tr>
 </table>
</div>
<!--<s:property value="message"/>-->

