<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
      	 <table border = "1" cellspacing="0">
    	<tr>
    		<td>编号：</td>
    		<td>${oneGoods.id }</td>
    	</tr>
    	<tr>
    		<td>书名：</td>
    		<td>${oneGoods.name }</td>
    	</tr>
    	<tr>
    		<td>书号：</td>
    		<td>${oneGoods.booknumber }</td>
    	</tr>
    	<tr>
    		<td>作者：</td>
    		<td>${oneGoods.author }</td>
    	</tr>
    	<tr>
    		<td>类型：</td>
    		<td>${oneGoods.type }</td>
    	</tr>
    	<tr>
    		<td>出版社：</td>
    		<td>${oneGoods.press }</td>
    	</tr>
    	<tr>
    		<td>封面：</td>
    		<td><img src = "${oneGoods.cover }" height = "200" width = "200"/></td>
    	</tr>
    	<tr>
    		<td>页数：</td>
    		<td>${oneGoods.pagination }</td>
    	</tr>
    	<tr>
    		<td>出版日期	：</td>
    		<td>${oneGoods.publishdate}</td>
    	</tr>
    	<tr>
    		<td>出售价格：</td>
    		<td>${oneGoods.saleprice }</td>
    	</tr>
    	<tr>
    		<td>进货价格：</td>
    		<td>${oneGoods.storeprice }</td>
    	</tr>
    	<tr>
    		<td>简介：</td>
    		<td>${oneGoods.introduce }</td>
    	</tr>
    	<tr>
    		<td>点击量：</td>
    		<td>${oneGoods.readcount}</td>
    	</tr>
    	<tr>
    		<td>购买量：</td>
    		<td>${oneGoods.buycount }</td>
    	</tr>
    	<tr>
    		<td>重量：</td>
    		<td>${oneGoods.weight }</td>
    	</tr>
			<tr>
    		<td>上架时间：</td>
    		<td>${oneGoods.createtime }</td>
    	</tr>    
    	<tr>
    		<td>库存：</td>
    		<td>${oneGoods.inventory }</td>
    	</tr>
    	<tr>
    		<td colspan = "2" align = "center"><input type = "button" value = "返回图书列表" onclick = "window.location.href='goods/queryByType.action?type=${oneGoods.type}'"/></td>
    	</tr>
    </table>
  </body>
</html>
