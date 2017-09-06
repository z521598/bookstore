<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.Order"
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

		<title>OrderDown</title>

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
			List<Order> list = (List<Order>) request.getAttribute("AllOrder");
		%>
		<table border="1" cellspacing="0">

			<tr>
				<td>
					订单号
				</td>
				<td>
					买家ID
				</td>
				<td>
					下单时间
				</td>
				<td>
					发货地址
				</td>
				<td>
					快递名称
				</td>
				<td>
					总金额
				</td>
				<td>
					备注
				</td>
				<td colspan="2" align="center">
					操作
				</td>
			</tr>
			<%
				for (Order o : list) {
			%>
			<tr>
				<td><%=o.getId()%></td>
				<td><%=o.getUserId()%></td>
				<td><%=DateFormat.getDateInstance().format(o.getCreatetime())%></td>
				<td><%=o.getAddress()%></td>
				<td><%=o.getName()%></td>
				<td>
				<%if(o.getState().equals("0")){ %>
				<a href="UpdateTotalprice.jsp?id=<%=o.getId()%>&&oldtatolcost=<%=o.getTotalcost()%>"><%=o.getTotalcost()%></a>
				<%} else{%>
				<%=o.getTotalcost()%>
				<%} %>
				</td>
				<td><%=o.getNote()%></td>
				<td>

					<%
						if (o.getState().equals("0")) {
					%>
					<font size="2" color="black">等待买家付款</font>
					<%
						}
					%>
					<%
						if (o.getState().equals("1")) {
					%>
					<a href="Delivery.jsp?id=<%=o.getId()%>"> <font size="2"
						color="red">发货</font> </a>
					<%
						}
					%>
					<%
						if (o.getState().equals("2")) {
					%>
					<font size="2" color="blue">等待买家确认收货</font>
					<%
						}
					%>
					<%
						if (o.getState().equals("3")) {
					%>
					<font size="2" color="grey">买家已收货,交易已结束</font>
					<%
						}
					%>
					<%
						if (o.getState().equals("4")) {
					%>
					<font size="2" color="grey">交易被取消</font>
					<%
						}
					%>
				</td>
				<td>
					<a href="order/AdminqueryOrderdetailById.action?id=<%=o.getId()%>">订单详情</a>
				</td>
			</tr>
			<%
				}
			%>

		</table>
		<%
			if (list.size() == 0) {
		%>
		<font size="4" color="red">没找到此用户的订单，或者没有此用户</font>
		<br />
		<a href="JavaScript:history.go(-1)"><input type="button"
				value="返回" /> </a>
		<%
			}
		%>
	</body>
</html>
