<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.Orderdetail"
	import="cn.com.lsq.po.Order" pageEncoding="UTF-8"%>
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

		<title>用户订单</title>

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
			List<Order> list = (List<Order>) request
					.getAttribute("OneUserOrder");
		%>

		<table border="1" cellspacing="0">
			<tr>
				<td>
					订单号
				</td>
				<td>
					发货地址
				</td>
				<td>
					快递
				</td>
				<td>
					快递单号
				</td>
				<td>
					金额
				</td>
				<td>
					下单时间
				</td>
				<td>
					发货时间
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
				<td><%=o.getAddress()%></td>
				<td><%=o.getName()%></td>
				<td>
					<%
						if (o.getTrackingnumber() != null) {
					%>
					<%=o.getTrackingnumber()%>
					<%
						} else {
					%>
					<font size="2" color="grey">暂无</font>
					<%
						}
					%>
				</td>
				<td><%=o.getTotalcost()%>元
				</td>
				<td>
					<%=DateFormat.getInstance().format(o.getCreatetime())%>
				</td>
				<td>
					<%
						if (o.getState().equals("2") || o.getState().equals("3")) {
					%>
					<%=DateFormat.getInstance().format(
							o.getDeliverytime())%>
					<%
						} else if (o.getState().equals("1") || o.getState().equals("0")) {
					%>
					<font size="2" color="grey">暂未发货</font>
					<%
						} else {
					%>
					<font size="2" color="grey">订单被取消</font>
					<%
						}
					%>
				</td>
				<td>
					<font size="2" color="purple"> <%=o.getNote()%> </font>
				</td>
				<td>
					<%
						if (o.getState().equals("0")) {
					%>
					<a href="order/updatestate1.action?id=<%=o.getId()%>"><font
						size="2" color="red">确认付款</font> </a>
					<%
						}
					%>
					<%
						if (o.getState().equals("1")) {
					%>
					<font size="2" color="black">等待卖家发货</font>
					<%
						}
					%>
					<%
						if (o.getState().equals("2")) {
					%>
					<a href="Confromreceving.jsp?id=<%=o.getId()%>"><font
						size="2" color="red">确认收货</font> </a>
					<%
						}
					%>
					<%
						if (o.getState().equals("3")) {
					%>
					<font size="2" color="grey">已收货,交易结束</font>
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
					<a href="order/AdminqueryOrderdetailById.action?id=<%=o.getId()%>"><font
						size="2">订单详情</font> </a>
					<%
						if (o.getState().equals("0")) {
					%>
					<a href="order/updatestate4.action?id=<%=o.getId()%>"><font
						size="2">取消订单</font> </a>
					<%
						}
					%>
				</td>
			</tr>
			<%
				}
			%>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="7" align="center">
					<font color="red" size="4">您还没有订单，快去去买买买吧！</font>
				</td>
			</tr>

			<%
				}
			%>
		</table>

	</body>
</html>
