<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Goods" import="cn.com.lsq.po.Type"
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

		<title>其他状况统计</title>

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
			List<Type> typelist = (List<Type>) request.getAttribute("typelist");
			List<Goods> hotgoods = (List<Goods>) request
					.getAttribute("hotgoods");
			Integer allSale = (Integer) request.getAttribute("allSale");
		%>
		<fieldset>
			<legend>
				各种类图书销售情况
			</legend>
			<table>
				<tr>
					<td>种类</td>
					<td>件数</td>
					<td>百分比</td>
				</tr>
				<%
					for (Type t : typelist) {
				%>
				<tr>
					<td><%=t.getName()%></td>
					<td><%=request.getAttribute("" + t.getId())%>本</td>
					<td><%=(int)((((Integer)request.getAttribute("" + t.getId())+0.0)/allSale)*100)+"%" %></td>
				<tr>
						<%
							}
						%>
					
			</table>
		</fieldset>
		<br />
		<fieldset>
			<legend>
				热销图书排名
			</legend>
			<table>
				<%
					for (int i = 0; i < hotgoods.size(); i++) {
				%>
				<tr>
					<td>
						<%=i + 1%>、<%=hotgoods.get(i).getName()%>
					</td>
					<td>
						销量：<%=hotgoods.get(i).getBuycount()%>
					</td>
				</tr>

				<%
					}
				%>
			</table>
		</fieldset>
	</body>
</html>
