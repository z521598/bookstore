<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.Comment"
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

		<title>用户评论管理</title>

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
			List<Comment> list = (List<Comment>) request
					.getAttribute("comment");
		%>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					商品名称
				</td>
				<td>
					用户ID
				</td>
				<td>
					评论内容
				</td>
				<td>
					评论时间
				</td>
				<td>
					回复内容
				</td>
				<td>
					回复时间
				</td>
				<td>
					操作
				</td>
			</tr>
			<%
				for (Comment c : list) {
			%>
			<tr>
				<td><%=c.getName()%></td>
				<td><%=c.getUserId()%></td>
				<td>
					<font color="red" size="2"> <%=c.getContent()%> </font>
				</td>
				<td><%=DateFormat.getInstance().format(c.getContenttime())%></td>
				<td>
					<%
						if (c.getResponse() != null) {
					%>
					<font color="bule" size="2"> <%=c.getResponse()%> </font>
					<%
						} else {
					%>
					<a href="AddResponse.jsp?id=<%=c.getId()%>">回复</a>
					<%
						}
					%>
				</td>
				<td>
					<%
						if (c.getResponsetime() != null) {
					%>
					<%=DateFormat.getInstance().format(
							c.getResponsetime())%>
					<%
						} else {
					%>
					<font color="grey" size="2">暂无回复</font>
					<%
						}
					%>
				</td>
				<td>
					<a href="comment/delete.action?id=<%=c.getId()%>">删除</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>
