<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Order" import="java.text.DateFormat"
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

		<title>订单详情</title>

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
			Order o = (Order) request.getAttribute("OneOrder");
		%>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					订单号:
				</td>
				<td><%=o.getId()%></td>
			</tr>
			<tr>
				<td>
					买家ID:
				</td>
				<td><%=o.getUserId()%></td>
			</tr>
			<tr>
				<td>
					地址：
				</td>
				<td><%=o.getAddress()%></td>
			</tr>
			<tr>
				<td>
					快递：
				</td>
				<td><%=o.getEname()%></td>
			</tr>
			<tr>
				<td>
					运单号：
				</td>
				<td>
				<%if(o.getTrackingnumber() != null ) {%>
				<%=o.getTrackingnumber()%>
				<%}%>
				</td>
			</tr>
			<tr>
				<td>
					总金额：
				</td>
				<td><%=o.getTotalcost()%></td>
			</tr>
			<tr>
				<td>
					下单时间：
				</td>
				<td><%if(o.getCreatetime() != null ) {%>
				<%=DateFormat.getDateInstance().format(o.getCreatetime()) %>
				<%}%>
				</td>
			</tr>
			<tr>
				<td>
					付款时间
				</td>
				<td>
				<%if(o.getPaytime() != null ) {%>
				<%=DateFormat.getDateInstance().format(o.getPaytime())%>
				<%}%>
				</td>
			</tr>
			<tr>
				<td>
					收货时间
				</td>
				<td>
				<%if(o.getReceivingtime() != null ) {%>
				<%=DateFormat.getDateInstance().format(o.getReceivingtime())%>
				<%}%>
				</td>
			</tr>
			<tr>
				<td>
					买家备注
				</td>
				<td><%=o.getNote()%></td>
			</tr>
			<tr>
				<td>
					订单详情
				</td>
				<td>
					<%
						List<Orderdetail> arr = o.getOrderdetaillist();

						for (Orderdetail od : arr) {
					%>
					《<%=od.getGname()%>》图书<%=od.getGoodsNumber()%>本，价格为<%=od.getTotalprice()%>元。
					<br />
					<%
						}
					%>
				</td>
			</tr>
		</table>

		<a href="JavaScript:history.go(-1)"><input type="button"
				value="返回" /> </a>
	</body>
</html>
