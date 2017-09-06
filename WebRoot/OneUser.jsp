<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.User"
	pageEncoding="UTF-8"%>
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

		<title>用户信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<body>
	<%
	if(request.getAttribute("oneUser")!= null ){
	 %>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					用户名：
				</td>
				<td>
					${oneUser.id }
				</td>
			</tr>
			<tr>
				<td>
					密码：
				</td>
				<td>
					${oneUser.password }
				</td>
			</tr>
			<tr>
				<td>
					姓名：
				</td>
				<td>
					${oneUser.name }
				</td>
			</tr>
			<tr>
				<td>
					身份证号：
				</td>
				<td>
					${oneUser.idcard }
				</td>
			</tr>
			<tr>
				<td>
					性别：
				</td>
				<td>
					${oneUser.sex }
				</td>
			</tr>
			<!--<tr>
				<td>
					出生日期：
				</td>
				<td>
					${oneUser.birthday }
				</td>
			</tr>
			-->
			<!--<tr>
				<td>
					固定电话：
				</td>
				<td>
					${oneUser.homephone }
				</td>
			</tr>
			-->
			<tr>
				<td>
					电子邮箱：
				</td>
				<td>
					${oneUser.email }
				</td>
			</tr>
			<tr>
				<td>
					手机号码：
				</td>
				<td>
					${oneUser.phonenumber }
				</td>
			</tr>
			<tr>
				<td>
					第一个收货地址：
				</td>
				<td>
					${oneUser.firstaddress }
				</td>
			</tr>

			<tr>
				<td>
					第二个收货地址：
				</td>
				<td>
					${oneUser.secondaddress }
				</td>
			</tr>
			<tr>
				<td>
					第三个收货地址：
				</td>
				<td>
					${oneUser.thirdaddress }
				</td>
			</tr>
			<tr>
				<td>
					会员：
				</td>
				<td>
					${oneUser.isvip }
				</td>
			</tr>
			<tr>
				<td>
					注册时间：
				</td>
				<td>
					<%=DateFormat.getDateInstance().format(((User)request.getAttribute("oneUser")).getRegistrationtime()) %>
				</td>
			</tr>
	<%
	}else{
	 %>
	 <font size = "4" color = "red">无此用户。</font>
	 <%
	 }
	  %>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="返回用户列表"
						onclick="window.location.href='user/query.action'" />
				</td>
			</tr>
		</table>
	</body>
</html>
