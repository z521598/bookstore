<%@ page language="java" import="java.util.*"
	import="java.text.DateFormat" import="cn.com.lsq.po.Comment"
	import="cn.com.lsq.po.Goods" pageEncoding="UTF-8"%>
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

		<title>图书详情</title>

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
		<table>
			<tr>
				<td colspan="2" rowspan="3" align="center">
					<img src="${oneGoods.cover }" height="200" width="200" />
				</td>
				<td>
					${oneGoods.name }
					<font size="2" color="grey">${oneGoods.type }</font>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${oneGoods.author } &nbsp;
					<font size="2" color="grey">著</font>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${oneGoods.saleprice }
					<font size="2" color="grey">元</font>
				</td>
			</tr>
			<tr>
				<td colspan=4>
					<fieldset>
						<legend>
							详细信息
						</legend>
						书号：${oneGoods.booknumber }
						<br />
						上架时间：<%=DateFormat.getDateInstance().format(
							((Goods) request.getAttribute("oneGoods"))
									.getCreatetime())%>
						<br />
						页数：${oneGoods.pagination }页
						<br />
						重量：${oneGoods.weight }kg
						<br>
						出版日期 ：${oneGoods.publishdate}
						<br />
						出版社：${oneGoods.press }
						<br>
						库存：${oneGoods.inventory }本
						<br>
						购买量：${oneGoods.buycount }
					</fieldset>
				</td>
			</tr>
			<tr>
				<td colspan=4>
					<fieldset>
						<legend>
							简介
						</legend>
						${oneGoods.introduce }
					</fieldset>
				</td>
			</tr>
			<tr>
				<td colspan=4>
					<fieldset>
						<legend>
							评论区
						</legend>
						<table>
							<%
								List<Comment> list = ((Goods) request.getAttribute("oneGoods"))
										.getCommentlist();
								for (Comment co : list) {
							%>
							<tr>
								<td>
									<font size="2" color="bule">用户：<%=co.getUserId().toString().substring(0, 3) + "****"%>发表于<%=DateFormat.getDateInstance().format(
						co.getContenttime())%> </font>
								</td>
							</tr>
							<tr>
								<td>
									<textarea rows="2" cols="100" readonly="readonly"><%=co.getContent()%>
									</textarea>
									<br />
									<%
										if (co.getResponsetime() != null) {
									%>
									<font size="2" color="green"> 管理员于<%=DateFormat.getInstance().format(
							co.getResponsetime())%>回复：<%=co.getResponse()%>
									</font>
									<%
										}
									%>
								</td>
							</tr>
							<%
								}
							%>
						</table>
						<form action="orderdetail/test.action" method="post">
							<input type="hidden" name="goodsId"
								value="<%=((Goods) request.getAttribute("oneGoods")).getId()%>" />
							<input type="submit" value="写评论" />
							<font size="2" color="grey">温馨提示：只有购买过这本书的亲，才可以写评论哟。</font>
							${falsemessage}
						</form>
					</fieldset>
				</td>
			</tr>
		</table>
	</body>
</html>
