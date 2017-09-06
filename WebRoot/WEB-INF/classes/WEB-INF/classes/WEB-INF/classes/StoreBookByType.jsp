<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.Goods" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分类查看图书</title>
    
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
    List<Goods> list = (List<Goods>)request.getAttribute("Books");
     %>
     <form action="" method = "post">
     	 <table border = "1" cellspacing="0">
     		<tr>
     			<td>书名</td>
     			<td>作者</td>
     			<td>类型</td>
     			<td>价格</td>
     			<td>出版社</td>
     			<td>库存</td>
     			<td align="center">操作</td>
     		</tr>
     	<%
     		for(Goods g : list){
     	 %>
     		<tr>
     			<td><%=g.getName() %></td>
     			<td><%=g.getAuthor() %></td>
     			<td><%=g.getType() %></td>
     			<td><%=g.getSaleprice() %></td>
     			<td><%=g.getPress() %></td>
     			<td><%=g.getInventory() %></td>
     			<td>
     				<a href="goods/storeQueryById.action?id=<%=g.getId() %>">查询图书的详细信息</a>
     				<%if(g.getIsonsale() == 1){ %>
     				<a href="orderdetail/AddShoppingCar.action?goodsId=<%=g.getId() %>">加入购物车</a>
     				<%} else {%>
     				<font color = "grey" size = "3">图书已下架</font>
     				<%} %>
     			</td>
     		</tr>
     		<%
     		}
     		 %>
     	 </table>
     </form>
  </body>
</html>
