<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Orderdetail" import="cn.com.lsq.po.Express"
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

		<title>确认下单</title>

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
			List<Orderdetail> list = (List<Orderdetail>) request
					.getAttribute("allOrderdetail");

			List<Express> listexpress = (List<Express>) request
					.getAttribute("allExpress");

			User user = (User) session.getAttribute("userlogin");
			Double totalcost = 0.0;
		%>


		<form action="order/add.action" method="post">
			<input type="hidden" name="id"
				value="<%=request.getAttribute("orderId")%>" readonly="readonly" />
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
				</tr>

				<%
					for (Orderdetail o : list) {
						totalcost = totalcost + o.getTotalprice();
				%>
				<tr>
					<td>
						<%=o.getName()%>
					</td>
					<td align="center">
						<%=o.getGoodsNumber()%>
					</td>
					<td>
						<%=o.getTotalprice()%>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="3">
						请选择收货地址：
						<select name="address">
							<%
								if (user.getFirstaddress() != null) {
							%>
							<option><%=user.getFirstaddress()%></option>
							<%
								}
							%>
							<%
								if (user.getSecondaddress() != null) {
							%>
							<option><%=user.getSecondaddress()%></option>
							<%
								}
							%>
							<%
								if (user.getThirdaddress() != null) {
							%>
							<option><%=user.getThirdaddress()%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						请选择快递类型：
						<select name="expressId">
							<%
								for (Express e : listexpress) {
							%>
							<option value="<%=e.getId()%>"><%=e.getName()%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						备注：
						<input type="text" name="note" height="20" width="40">
					</td>
				</tr>
				<tr>
					<td>
						总价格：（元）
						<%
						if (user.getIsvip() == true) {
							totalcost = totalcost * 0.9;
							totalcost = Double.parseDouble(String.format("%.1f",totalcost));
						}
					%>
						<input type="text" name="totalcost" value="<%=totalcost%>"
							readonly=readonly />
					</td>
					<td colspan="4">
						<input type="submit" value="确认下单" />
						<!--
    				<font size = "2" color = "red">，其中运费：（元）</font>
    				-->
					</td>
				</tr>
			</table>
			<%
				if (user.getIsvip()) {
			%>

			<font size="2" color="red">尊敬的VIP用户，我们已经自动为您享受<b>九折</b>优惠</font>
			<%
				}
			%>

		</form>
	</body>
</html>
