<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<div>任务名称：<s:property value="taskname"/>&nbsp;&nbsp;
<a href='<s:url value='/CheckTask!getResult'/>?taskname=<s:property value="taskname"/>' title="<s:property value="taskname"/>" class="taskResult">查看结果</a>&nbsp;&nbsp;
<a href='<s:url value='/CheckTask!saveTask'/>?taskname=<s:property value="taskname"/>' class="taskSave">保存任务</a></div>
<!--<s:property value="message"/>-->
