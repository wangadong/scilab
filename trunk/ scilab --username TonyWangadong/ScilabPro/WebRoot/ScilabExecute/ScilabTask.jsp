<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'MyJsp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script language="Javascript" type="text/javascript"
			src="<%=basePath%>edit_area/edit_area_full.js"></script>
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
				submit_callback : "my_submit",
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
</script>
	</head>
	<body>
		<s:form action='TaskAction' method='post' id="myForm" target="_blank"
			theme="simple">
			<p>
				Task name:
				<input type="text" name="task.taskName" />
			</p>
			<textarea id="scilabtask_1" style="height: 500px; width: 700px;"
				name="task.taskContent">you can write scilab codes here!</textarea>
			<br />
			<s:submit value='提交任务' method="submitTask" />
		</s:form>
		<s:form action="CheckTask" method="post" id="checkForm"
			target="_blank" theme="simple">
			<p>
				taskname for check:
				<input type="text" name="taskname" />
				<s:submit value='查看结果' method="getResult" />
				<s:submit value='查询状态' method="getStatue" />
				<s:submit value='保存任务' method="saveTask" />
			</p>
		</s:form>
	</body>
</html>