<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户信息</title>
    
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
   	<form action="user/update.action" method = "post">
   		<table border = "1" cellspacing="0">
    	<tr>
    		<td>用户名：</td>
    		<td><input type = "text" value = "${oneUser.id }" name = "id" /></td>
    	</tr>
    	<tr>
    		<td>密码：</td>
    		<td><input type = "text" value = "${oneUser.password }" name = "password" /></td>
    	</tr>
    	<tr>
    		<td>姓名：</td>
    		<td><input type = "text" value = "${oneUser.name }" name = "name" /></td>
    	</tr>
    	<tr>
    		<td>身份证号：</td>
    		<td><input type = "text" value = "${oneUser.idcard }" name = "idcard" /></td>
    	</tr>
    	<tr>
    		<td>性别：</td>
    		<td>
				<input type = "radio" name = "sex" value = "男" 
    			<%
    				if(((User)request.getAttribute("oneUser")).getSex().equals("男")){
      			 %>
      			 	checked = "checked"
      			 <%
      			 }
      			  %>
    			 onblur="testSex()"/>男
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		<input type = "radio" name = "sex" value = "女"
	    		<%
    				if(((User)request.getAttribute("oneUser")).getSex().equals("女")){
      			 %>
      			 	checked = "checked"
      			 <%
      			 }
      			  %>
	    		 onblur="testSex()"/>女
			</td>
    	</tr>
    	<!-- 
    	<tr>
    		<td>出生日期：</td>
    		<td><input type = "text" value = "${oneUser.birthday }" name = "birthday" /></td>
    	</tr>
    	<tr>
    		<td>固定电话：</td>
    		<td><input type = "text" value = "${oneUser.homephone }" name = "homephone" /></td>
    	</tr>
    	-->
    	<tr>
    		<td>电子邮箱：</td>
    		<td><input type = "text" value = "${oneUser.email }" name = "email" /></td>
    	</tr>
    	<tr>
    		<td>手机号码：</td>
    		<td><input type = "text" value = "${oneUser.phonenumber }" name = "phonenumber" /></td>
    	</tr>
    	<tr>
    		<td>第一个收货地址：</td>
    		<td><input type = "text" value = "${oneUser.firstaddress }" name = "firstaddress" /></td>
    	</tr>
    	<tr>
    		<td>第二个收货地址：</td>
    		<td><input type = "text" value = "${oneUser.secondaddress }" name = "secondaddress" /></td>
    	</tr>
    	<tr>
    		<td>第三个收货地址：</td>
    		<td><input type = "text" value = "${oneUser.thirdaddress }" name = "thirdaddress" /></td>
    	</tr>
    	<!--
    	<tr>
    		<td>会员：</td>
    		<td><input type = "text" value = "${oneUser.isvip }" name = "isvip" /></td>
    	</tr>
    	
    	<tr>
    		<td>注册时间：</td>
    		<td><input type = "text" value = "${oneUser.registrationtime }" name = "registrationtime" /></td>
    	</tr>
    	-->
    	<tr>
    		<td colspan = "2"><input type = "submit" value = "修改"/></td>		
      	</tr>
    </table>
   	</form> 
  </body>
</html>
