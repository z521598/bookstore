<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加评论</title>
    
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
  <form action="comment/add.action" method = "post">
    <table>
    	<tr>
    		<td><input type = "hidden" name = "goodsId" value = "${goodsId}" readonly = "readonly"></td>
    	</tr>
    	<tr>
    		<td>请输入您的评论：(300字以内)</td>
    	</tr>
    	<tr>
    		<td>
    			<textarea rows="10" cols="100" name="content" >在这里发表你的评论吧。</textarea>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<input type = "submit" value = "确认发表">
    		</td>
    		
    	</tr>
    </table>
  </form>
  </body>
</html>
