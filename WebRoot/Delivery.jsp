<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发货</title>
    
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
    int id = Integer.parseInt(request.getParameter("id"));
     %>
     <form action="order/updatestate2.action" method = "post">
     <table border = "1" cellspacing="0">
     	<tr>
     		<td>请核对订单号</td>
     		<td>
     			<input type = "text" name = "id" value = "<%=id %>" readonly = "readonly"/>
     		</td>
     	</tr>
     	<tr>
     		<td>请输入运单号</td>
     		<td>
     			<input type = "text" name = "trackingnumber"/>
     		</td>
     	</tr>
     	<tr>
     		<td colspan = "2">
     			<input type = "submit" value = "确认发货"/>
     		</td>
     	</tr>
     </table>
     </form>
     
     
  </body>
</html>
