<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.Order" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>OrderUp</title>
    
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
  <iframe src = "queryOrderByuid.jsp" height="70%" scrolling="no"></iframe>
  <iframe src = "queryOrderByoid.jsp" height="70%" scrolling="no"></iframe>
  <a href="order/query.action" target = "orderdown"><input type = "button" value = "查询全部订单"></a>
  </body>
</html>
