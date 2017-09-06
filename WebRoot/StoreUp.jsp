<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书城Title</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="Css/reset.css" />
	<link type="text/css" rel="stylesheet" href="Css/1024_768.css" />
	<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="Css/pad_heng.css" />
	<link type="text/css" rel="stylesheet" media="screen and (min-width:601px) and (max-width:860px)" href="Css/pad.css" />
	<link type="text/css" rel="stylesheet" media="screen and (min-width:481px) and (max-width:600px)" href="Css/tel_heng.css" />
	<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="Css/tel.css" />
  </head>
  
  <body>
<div class="w_100_l">
   <div class="main">
   	 <div class="top_banner">
            <div class="top_logo"><img src="Images/top_logo.jpg" alt="A BOOK APART LOGO" /></div>
            <div class="top_menu">
            <br/>
            <br/>
            <br/>
            <br/>
            	<ul>
                	<li class="sel"><a href="goods/queryhome.action" target = "down">主页</a></li>
                	<li><a href="StoreBook.jsp" target = "down">图书</a></li>
                	<li><a href="order/queryByUserId.action" target = "down">订单管理</a></li>
                	<li><a href="user/storeuser.action" target = "down">个人信息</a></li>
                </ul>
            </div>
            
            <br/><br/><br/><br/>
            <a href="AdminLogin.jsp" target = "_blank"><font size = "2" color = "blue">管理员入口</font></a>   
            <br/>
            
            <a href="UserLogin.jsp" target = "_parent">
            	<font size = "2">
            	<% if(session.getAttribute("userlogin") == null ){%>
            		登录
            	</font>
            </a>
            <a href="Registration.jsp" target = "_blank"><font size = "2">注册</font></a>
            	<% } else {%>
         	  	 尊敬的${userlogin.name}，您好！
            	<% }%>
            </font></a>
        
              
            <div class="top_shop_cur">
            	<a href="orderdetail/queryByUserId.action" target = "down">
            		<br/>
            		<img src="Images/top_shop_cur.jpg" alt="shopping car" />
            	</a>
            </div>
        </div>
    </div>
</div>
  </body>
</html>
