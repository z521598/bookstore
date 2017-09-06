<%@ page language="java" import="java.util.*"
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
		<link type="text/css" rel="stylesheet" href="Css/reset.css" />
		<link type="text/css" rel="stylesheet" href="Css/1024_768.css" />
		<link type="text/css" rel="stylesheet"
			media="screen and (min-width:861px) and (max-width:960px)"
			href="Css/pad_heng.css" />
		<link type="text/css" rel="stylesheet"
			media="screen and (min-width:601px) and (max-width:860px)"
			href="Css/pad.css" />
		<link type="text/css" rel="stylesheet"
			media="screen and (min-width:481px) and (max-width:600px)"
			href="Css/tel_heng.css" />
		<link type="text/css" rel="stylesheet"
			media="screen and (max-width:480px)" href="Css/tel.css" />
	</head>
	<body>
		<fieldset>
			<img src="Images/img_lives.jpg" height="40" width="40" />
			<img src="image/1465287929_123085.png" height="50" width="600" />
		</fieldset>
		<fieldset>
			<%
				List<Goods> list = (List<Goods>) request.getAttribute("Books");
			%>
			<div class="content">

				<ul>
					<%
						for (Goods g : list) {
					%>
					<li>
						<dl>
							<dd>
								<a href="goods/storeQueryById.action?id=<%=g.getId()%>"><img
										src="<%=g.getCover()%>" alt="book" heitht="100" width="100" />
								</a>
							</dd>
							<dt>
								<p class="book_title">
									<a href="goods/storeQueryById.action?id=<%=g.getId()%>"><%=g.getName()%></a>
								</p>
								<p class="book_inline"><%=g.getSaleprice()%>元
									&nbsp;&nbsp;&nbsp;
									<%=g.getAuthor()%>&nbsp;著
								</p>

								<%
									if (g.getIsonsale() == 1 && g.getInventory() != 0) {
								%>
								<a class="book_buy"
									href="orderdetail/AddShoppingCar.action?goodsId=<%=g.getId()%>">加入购物车</a>
								<%
									} else {
								%>
								<font color="grey" size="3">图书已下架</font>
								<%
									}
								%>
								<%
									if (g.getInventory() <= 10 && g.getInventory() > 0
												&& g.getIsonsale() == 1) {
								%>
								<font size="2" color="red">库存紧张</font>
								<%
									}
								%>
								<p class="book_inline">
									销量：<%=g.getBuycount() %>
								</p>
							</dt>
						</dl>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</fieldset>

	</body>
</html>
