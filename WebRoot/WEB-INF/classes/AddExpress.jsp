<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加快递</title>
    
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
    <form action="express/add.action" method="post" enctype="multipart/form-data">
    	<table border = "1" cellspacing="0">
    	<tr>
    		<td>快递名称</td>
    		<td><input type = "text" id = "name" name = "name"/></td>
    	</tr>
    	<tr>
    		<td>起步价格(1kg以下)</td>
    		<td><input type = "text" id = "startingPrice"  name = "startingprice"/></td>
    	</tr>
    	<tr>
    		<td>递增价格(kg/元)</td>
    		<td><input type = "text" id = "increasingPrice" name = "increasingprice" /></td>
    	</tr>
    	
    	<tr>
    		<td colspan = "2" align = "center"><input type = "submit" id = "submit" value = "添加快递模版" ></td>
    	</tr>
    	</table>
    </form>
  </body>
</html>
