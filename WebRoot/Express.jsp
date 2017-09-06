<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>快递类型</title>
    
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
    		<td>ID</td>
    		<td>快递名称</td>
    		<td>价格</td>
    		<td>操作</td>
    	</tr>
		<%
    	List<Express> type = (List<Express>)request.getAttribute("allExpress");
    	for(Express e :type){
    	%>
    	<tr>
    		<td><%=e.getId()%></td>
    		<td><%=e.getName()%></td>
    		<td><%=e.getStartingprice()%></td>
    		<td>
    			<a href="express/delete.action?id=<%=e.getId()%>" target = "_self">删除</a>
    			&nbsp;
    			<a href="express/queryById.action?id=<%=e.getId()%>" target = "_self">修改</a>	
    		</td>
    	</tr>
    	<%
    	}		
    	 %>
    </table>
	<br/>
  	<input type = "button" value = "添加新快递类型" onclick="window.location.href='AddExpress.jsp'" >
  </body>
</html>
