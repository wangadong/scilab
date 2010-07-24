<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
	</head>

	<body>
		请填写注册信息：
		</br>
		<s:form action="RegisterAction" namespace="/" method="post">
			<table>
				<tr>
					<td style="">
						请输入账号
					</td>
					<td>
						<s:textfield name="userInfo.userName" label="账号" />
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



