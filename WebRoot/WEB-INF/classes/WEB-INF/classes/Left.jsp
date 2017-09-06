<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Left</title>
    
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
  	<font color = "red" size = "5">管理员,欢迎您！</font>
  	<hr width = "100%">
    <img src = "image/log.jpg" width = "100%" height = "20%">
    <hr width = "100%">
           图书相关信息管理：<br/>
    <center>
   			<a href = "goods/query.action" target = "showPage">图书信息管理</a><br/>
    		<a href = "type/query.action" target = "showPage">图书类型管理</a><br/>
    		<a href = "express/query.action" target = "showPage">快递类型管理</a><br/>
    </center>
           用户相关信息管理：<br/>
     <center>
            <a href = "user/query.action" target = "showPage">用户信息管理</a><br/>
            <a href = "comment/queryall.action" target = "showPage">用户评论管理</a><br/>
     </center>
   	 商城相关事物管理：<br/>
   	  <center>
   	     	<a href = "Order.jsp" target = "showPage">订单信息管理</a><br/>
      </center>
 	 站内相关情况统计：<br/>
   	  <center>
   	     	<a href = "SaleByTime.jsp" target = "showPage">销售明细统计</a><br/>
    		<a href = "SaleNumberByTime.jsp" target = "showPage">销售额统计</a><br/>
    		<a href = "goods/querysale.action" target = "showPage">整体情况统计</a><br/>
      </center>
  </body>
</html>
