<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>种类查询页面</title>
    
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
 	//String id = (String)request.getParameter(&quot;id&quot;); 
 	//String name = (String)request.getParameter(&quot;name&quot;); 
 	//name = new String(name.getBytes(&quot;ISO-5589-1&quot;),&quot;UTF-8&quot;); 
   %>
   <form action="type/update.action" method = "post">
   	<table border = "1" cellspacing="0">
    	<tr>
	    	<td>编号:</td>
	    	<td>类型名:</td>
    	</tr>
    	<tr>
	    	<td><input type = "text" value = "${oneType.id}" name = "id" readonly = "readonly"/></td>
	    	<td><input type = "text" value = "${oneType.name}" name = "name" /></td>
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
