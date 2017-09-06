<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.Order"
	import="cn.com.lsq.po.Orderdetail" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
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

		<title>销售明细</title>

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
		<form action="order/salebytime.action" method="post">
			起始时间：
			<input type="date" name="starttime" value="2016-01-01" />
			终止时间：
			<input type="date" name="overtime" value="2017-01-01" />
			&nbsp;&nbsp;&nbsp;
			<input type="submit" value="查询">
		</form>
		<%	List<Order> orlist = (List<Order>) request.getAttribute("salelist");
			if(orlist != null){
			String pageNum = (String) request.getAttribute("pageNum");
			Integer pageNum1 = Integer.parseInt(pageNum);
			Integer lastPage = (Integer) request.getAttribute("lastPage");
			if (orlist != null && orlist.size() != 0) {
		%>
		<font size="2" color="bule">
			您好，尊敬的管理员，从${starttime}到${overtime}的销售明细如下:(以用户确认收货时间为准) </font>
		<br />
		<table border="1" cellspacing="0">
			<tr>
				<td>
					商品名称
				</td>
				<td>
					商品数量
				</td>
				<td>
					购买用户
				</td>
				<td>
					花费金额
				</td>
				<td>
					成交日期
				</td>
				<td>
					所属订单号
				</td>
			</tr>
			<%
				for (Order order : orlist) {
						List<Orderdetail> odlist = order.getOrderdetaillist();
						for (Orderdetail orderdetail : odlist) {
			%>
			<tr>
				<td><%=orderdetail.getGname()%></td>
				<td><%=orderdetail.getGoodsNumber()%></td>
				<td><%=orderdetail.getUserId()%></td>
				<td><%=orderdetail.getTotalprice()%></td>
				<td><%=DateFormat.getDateInstance().format(
										order.getReceivingtime())%></td>
				<td><%=order.getId()%></td>
			</tr>
			<%
				}
					}
			%>
		</table>
		<br>
		<a
			href="order/salebytime.action?pageNum=1&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">首页</a>||
		<a
			href="order/salebytime.action?pageNum=<%=pageNum1 - 1%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">上一页</a>||
		<a
			href="order/salebytime.action?pageNum=<%=pageNum1 + 1%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">下一页</a>||
		<a	
			href="order/salebytime.action?pageNum=<%=lastPage%>&starttime=<%=request.getAttribute("starttime")%>&overtime=<%=request.getAttribute("overtime")%>">尾页</a>
	
		<br/>
		<font size="2" color="grey"> 悄悄的告诉您，我们已经为您清除了冗余无效数据。 </font>
		<%
			} }else if (orlist == null) {
		%>
		<%=""%>
		<%
			} else {
		%>
		<font size="4" color="red">
			很抱歉，未查询到从${starttime}到${overtime}的销售记录。 </font>
		<%
			}
		%>

	</body>
</html>
