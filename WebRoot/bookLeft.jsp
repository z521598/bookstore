<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Type" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 
	ctrl+shift+f 一键规范代码
 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>类型</title>

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
		<form action="goods/queryLike.action" method="post" target="bookRight">
			<input type="text" name="queryname" id="queryname" size="10" />
			<input type="submit" value="查询" />
		</form>
		<br />
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="goods/storequerypage.action" target="bookRight"> <input
				type="button" value="查询全部图书" size="10" /> </a>
		<br />
		<br />
		<%
			List<Type> type = (List<Type>) request.getAttribute("allType");
			for (Type t : type) {
		%>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a name="type" href="goods/queryByType.action?type=<%=t.getName()%>"
			target="bookRight"><%=t.getName()%></a>
		<br />
		<%
			}
		%>
		<br />
		<br />
		<br />
	</body>
</html>
