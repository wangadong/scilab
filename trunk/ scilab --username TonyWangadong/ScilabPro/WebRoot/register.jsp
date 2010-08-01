<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
		<script type="text/javascript">
			var b = false;
			function isRegister(){
				var username = $("#userName").val();
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
				var username = $("#userName").val();
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
	</head>

	<body>
		请填写注册信息：
		</br>
		<s:form action="RegisterAction" namespace="/" method="post" theme="simple" onsubmit="return register()" >
			<table>
				<tr>
					<td style="">
						请输入账号
					</td>
					<td>
						<s:textfield name="userInfo.userName" id="userName" label="账号" onblur="isRegister()" />
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
	</body>
</html>



