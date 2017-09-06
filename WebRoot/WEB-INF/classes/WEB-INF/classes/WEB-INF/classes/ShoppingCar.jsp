<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Orderdetail" pageEncoding="UTF-8"%>
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

		<title>购物车</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="js/jquery-2.0.2.js">
</script>
	</head>
	<body>
		<%
			List<Orderdetail> list = (List<Orderdetail>) request
					.getAttribute("allOrderdetail");
		%>
		<form action="orderdetail/addorder.action" method="post">
			<table border="1" cellspacing="0">
				<tr>
					<td>
						商品
					</td>
					<td align="center">
						数量
					</td>
					<td>
						总价
					</td>
					<td>
						操作
					</td>
				</tr>

				<%
					for (Orderdetail o : list) {
				%>
				<tr>
					<td>
						<input type="checkbox" name="id" value="<%=o.getId()%>"
							onblur="totalprice()" />
						<a href="goods/storeQueryById.action?id=<%=o.getGoodsId()%>"><%=o.getName()%></a>
					</td>
					<td align="center">
						<a href="orderdetail/subtartGoods.action?id=<%=o.getId()%>"><img
								src="image/subtract.jpg" height="10" width="10" /> </a>
						<%=o.getGoodsNumber()%>
						<a href="orderdetail/addGoods.action?id=<%=o.getId()%>"><img
								src="image/add.jpg" height="10" width="10" /> </a>
					</td>
					<td>
						<%=o.getTotalprice()%>
					</td>
					<td>
						<a href="orderdetail/delete.action?id=<%=o.getId()%>">删除</a>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="5" align="center">
						<%
							if (list.size() != 0) {
						%>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="submit" value="确认购买" />
					</td>
				</tr>
				<%
					} else {
				%>
				<font size="4" color="red">您的购物车竟然是空的！快去买买买吧！</font>
				</td>
				<%
					}
				%>

			</table>
		</form>
	</body>
</html>
