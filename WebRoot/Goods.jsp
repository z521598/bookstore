<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书</title>
    
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
	${message}
    <table border = "1" cellspacing="0">
    	<tr>
    		<td>编号</td>
    		<td>书名</td>
    		<td>类型</td>
    		<td>作者</td>
    		<td>出版社</td>
    		<td>出售价格</td>
    		<td>进货价格</td>
    		<td>购买量</td>
    		<td>库存</td>
    		<td align = "center">操作</td>
    	</tr>
    	<%
    	List<Goods> Goods = (List<Goods>)request.getAttribute("allGoods");
    	for(Goods g :Goods){
    	%>
    	<tr>
    		<td><%=g.getId()%></td>
    		<td><%=g.getName()%></td>
    		<td><%=g.getType()%></td>
    		<td><%=g.getAuthor() %></td>
    		<td><%=g.getPress() %></td>
    		<td><%=g.getSaleprice() %></td>
    		<td><%=g.getStoreprice() %></td>
    		<td><%=g.getBuycount() %></td>
    		<td><%=g.getInventory() %></td>
    		<td>
    			<a href="goods/queryBeforeUpdate.action?id=<%=g.getId()%>" target = "_self">修改</a>	
    			&nbsp;
    			<a href="goods/queryById.action?id=<%=g.getId()%>" target = "_self">查看详细信息</a>
    			&nbsp;
    			<%if(g.getIsonsale() == 0) {%>
    			<a href="goods/up.action?id=<%=g.getId()%>">上架</a>
    			<%}else{%>
    			<a href="goods/down.action?id=<%=g.getId()%>"><font color = "grey">下架</font></a>
    			<%} %>
    		</td>
    	</tr>
    	<%
    	}		
    	 %>
	 <!-- 
	 	jstl可以做循环，el不能做循环 
	  -->
    </table>
    <br/>
  	<input type = "button" value = "添加新图书" onclick="window.location.href='type/queryForGoods.action'" >
  	<input type = "button" value = "查询库存不足的图书" onclick="window.location.href='goods/queryLess.action'" > 
  </body>
</html>
