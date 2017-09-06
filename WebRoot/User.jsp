<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.User" pageEncoding="UTF-8"%>
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

		<title>用户管理</title>

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
		<form action="user/queryById.action" method="post">
			用户名：
			<input type="text" name="id" />
			&nbsp;&nbsp;&nbsp;
			<input type="submit" value="查询">
		</form>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					用户名
				</td>
				<td>
					姓名
				</td>
				<td>
					身份证号
				</td>
				<td>
					性别
				</td>
				<td>
					手机号码
				</td>
				<td>
					会员
				</td>
				<td align="center">
					操作
				</td>
			</tr>
			<%
				List<User> User = (List<User>) request.getAttribute("allUser");
				for (User u : User) {
			%>
			<tr>
				<td><%=u.getId()%></td>
				<td><%=u.getName()%></td>
				<td><%=u.getIdcard()%></td>
				<td><%=u.getSex()%></td>
				<td><%=u.getPhonenumber()%></td>
				<td><%if(u.getIsvip()){ %>
					已经是会员
					<%} else{%>
					<a href="user/updatevip.action?id=<%=u.getId() %>">升级为会员</a>
					<%} %>
				</td>
				<td>
					<a href="user/delete.action?id=<%=u.getId()%>" target="_self">删除</a>
					&nbsp;
					<a href="user/queryBeforeUpdate.action?id=<%=u.getId()%>"
						target="_self">修改</a> &nbsp;
					<a href="user/queryById.action?id=<%=u.getId()%>" target="_self">查看详细信息</a>
				</td>
			</tr>
			<%
				}
			%>
			<!-- 
	 	jstl可以做循环，el不能做循环 
	  -->
		</table>
		<br />

	</body>
</html>
