<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
    <form action="login/user.action" method="post" target="_top">
			<table border="1" cellspacing="0">
				<tr>
					<td>
						用户名：
					</td>
					<td>
						<input type="text" name="id" id="id" />
					</td>
				</tr>
				<tr>
					<td>
						密码：
					</td>
					<td>
						<input type="password" name="password" id="password" />
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="登录" />
						&nbsp;
						<input type="button" value="注册"
							onclick="window.location.href='Registration.jsp'" />
						${wrongMessage}
					</td>
				</tr>
			</table>
		</form>
  </body>
</html>
