<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加图书类型</title>
    
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
    <form action="type/add.action" method="post" enctype="multipart/form-data">
    	<table border = "1" cellspacing="0">
    	<tr>
    		<td>类型名：</td>
    		<td><input type = "text" id = "name" name = "name" /></td>
    	</tr>
    	<tr>
    		<td colspan = "2" align = "center">
    			<input type = "submit" id = "submit" value = "提交" >
    		</td>
    	</tr>
    	</table>
    </form>
  </body>
</html>
