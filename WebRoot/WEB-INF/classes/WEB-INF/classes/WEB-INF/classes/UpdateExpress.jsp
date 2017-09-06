<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改快递类型</title>
    
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
    <form action="express/update.action" method = "post">
   	<table border = "1" cellspacing="0">
    	<tr>
	    	<td>编号:</td>
	    	<td>快递类型:</td>
	    	<td>起步价格(1kg以下)：</td>
	    	<td>递增价格(kg/元):</td>
	    	
    	</tr>
    	<tr>
	    	<td><input type = "text" value = "${oneExpress.id}" name = "id" readonly = "readonly"/></td>
	    	<td><input type = "text" value = "${oneExpress.name}" name = "name" /></td>
	    	<td><input type = "text" value = "${oneExpress.startingprice}" name = "startingprice" /></td>
	    	<td><input type = "text" value = "${oneExpress.increasingprice}" name = "increasingprice" /></td>	    	
    	</tr>
    	<tr>
    		<td colspan = "2" align = "center">
    			<input type = "submit" value = "确认修改">
    		</td>
    	</tr>
    </table>
   </form>
  </body>
</html>
