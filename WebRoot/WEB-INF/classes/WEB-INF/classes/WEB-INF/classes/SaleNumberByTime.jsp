<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Order" import="cn.com.lsq.po.Orderdetail"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
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

		<title>销售量和营业额查询</title>

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
		<script type="text/javascript">
function testmonth() {
	//控制查询条件
	if ($("#month").val() == "1-12") {
		$("#day").hide();
		$("#ri").hide();
	} else {
		$("#day").show();
		$("#ri").show();
	}
}
</script>
	</head>

	<body>
		<form action="order/salenumberbytime.action" method="post">
			<select name="year" id="year">
				<%
					Date date = new Date();
					int year = date.getYear() + 1900;
					for (int i = year - 10; i <= year; i++) {
				%>
				<option><%=i%></option>
				<%
					}
				%>
			</select>
			年
			<select name="month" id="month" onmouseup="testmonth()">
				<%
					for (int i = 1; i <= 12; i++) {
				%>
				<option><%=i%></option>
				<%
					}
				%>
				<option>
					1-12
				</option>
			</select>
			月
			<select name="day" id="day">
				<%
					for (int i = 1; i <= 30; i++) {
				%>
				<option><%=i%></option>
				<%
					}
				%>
				<option>
					1-30
				</option>
			</select>
			<label id="ri">
				日
			</label>
			<br />
			<input type="submit" value="查询" onblur="test()">
			<label id="lab"></label>
		</form>
		<%
			List<Order> list = (List<Order>) request.getAttribute("salelist");
			if (list != null && list.size() != 0) {
		%>
		<font size="2" color="bule"> 您好，尊敬的管理员，${time
			}的销售情况如下:(以用户确认收货时间为准) </font>
		<br />
		<%
			int number = 0;
				Double money = 0.0;
				for (Order order : list) {
					List<Orderdetail> odlist = order.getOrderdetaillist();
					for (Orderdetail ol : odlist) {
						number = number + ol.getGoodsNumber();
						money = money + ol.getTotalprice();
					}
				}
		%>
		<table>
			<tr>
				<td>
					<font size="5"> 销售商品总量： </font>
				</td>
				<td>
					<font size="5" color="red"> <%=number%>本 </font>
				</td>
			</tr>
			<tr>
				<td>
					<font size="5"> 营业额： </font>
				</td>
				<td>
					<font size="5" color="red"> <%=money%>元 </font>
				</td>
			</tr>
		</table>
		<%
			} else if (list == null) {
		%>
		<%=""%>
		<%
			} else {
		%>
		<font size="4" color="red"> 很抱歉，未查询到${time}的销售记录。 </font>
		<%
			}
		%>
	</body>
</html>
