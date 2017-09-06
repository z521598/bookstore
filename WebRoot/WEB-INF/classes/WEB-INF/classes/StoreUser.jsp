<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src = "js/jquery-2.0.2.js"></script>
<script type="text/javascript" >
		//封装正确/错误效验
		function right(){
			return "<img src = 'image/sign-check-icon.png' alt = 'right' height = '15' width = '15'/>";
		}
		function wrong(){
			return "<img src = 'image/sign-error-icon.png' alt = 'wrong' height = '15' width = '15'/>";
		}
		/*
		 *@封装test方法
		 *require代表效验标准，lab代表label标签的id
		 */
		function test(require,lab){
			if(require){
				$(lab).html(right());
				return true;
			}else{
				$(lab).html(wrong());
				return false;
			}
		}
		function testPassword(){
			return test($("#password").val().trim().length >= 6,"#plab");
		}
		function testRepeatPassword(){
			return test($("#reapeatpassword").val() == $("#password").val() && $("#password").val().trim().length >= 6,"#rlab");
		}
		function testIdCard(){
			return test($("#idCard").val().trim().match("^\\d{10}|\\d{13}|\\d{15}|\\d{18}$"),"#iclab");
		}
		function testName(){
			return test($("#name").val().trim() != "","#nlab");
		}
		function testEmail(){
			return test($("#email").val().trim().match("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$"),"#elab");
		}
		function testPhotoNumber(){
			return test($("#photoNumber").val().trim().match("^[0-9]*[1-9][0-9]*$") && $("#photoNumber").val().trim().length == 11,"#phlab");
		}
		function testSex(){
			return test($(":radio:checked").size() == 1,"#slab");
		}
		function testFirstAddress(){
			return test($("#firstaddress").val().trim() != "","#flab");
		}
		function testOldPassword(){
			return test($("#oldpassword").val().trim() != "");
		}
		
		function AJAXTestOldPassword(){
				$.post("user/queryforupdateuser.action",{id:$("#id").val(),password:$("#oldpassword").val()},function(data){
				test(data == 1,"#olab");
		}				
		);
		}
		function testAll(){
			if(
			testPassword()&&testRepeatPassword()&&testIdCard()&&testName()&&testEmail()&&testPhotoNumber()&&testSex()&&testFirstAddress()
			&&testOldPassword()
			){
				return true;
			}else{
				return false;
			}
		}
		
		
	</script>
  </head>
  
  <body>

  <form action="user/updateForUser.action" method = "post" onsubmit = "return testAll()">
    <table border = "1" cellspacing="0">
    	<tr>
    		<td>用户名：</td>
    		<td><input type = "text" value = "${userlogin.id }" name = "id" id="id" readonly = "readonly"/></td>
    	</tr>
    	<tr>
    		<td>新密码：</td>
    		<td><input type = "password" value = "${userlogin.password }" name = "password"  id = "password" onblur = "testPassword()"/><label id = "plab"></label></td>
    	</tr>
    	<tr>
    		<td>再次输入新密码：</td>
    		<td><input type = "password" value = "${userlogin.password }" name = "reapeatpassword"  id = "reapeatpassword" onblur = "testRepeatPassword()"/><label id = "rlab"></label></td>
    	</tr>
    	<tr>
    		<td>姓名：</td>
    		<td><input type = "text" value = "${userlogin.name }" name = "name"  id = "name" onblur="testName()"/><label id = "nlab"></label></td>
    	</tr>
    	<tr>
    		<td>身份证号：</td>
    		<td><input type = "text" value = "${userlogin.idcard }" id = "idCard" name = "idcard" onblur="testIdCard()"/><label id = "iclab"></label></td>
    	</tr>
    	<tr>
    		<td>性别：</td>
    		<td>
    			<input type = "radio" name = "sex" value = "男" 
    			<%
    				if(((User)session.getAttribute("userlogin")).getSex().equals("男")){
      			 %>
      			 	checked = "checked"
      			 <%
      			 }
      			  %>
    			 onblur="testSex()"/>男
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		<input type = "radio" name = "sex" value = "女"
	    		<%
    				if(((User)session.getAttribute("userlogin")).getSex().equals("女")){
      			 %>
      			 	checked = "checked"
      			 <%
      			 }
      			  %>
	    		 onblur="testSex()"/>女
    			<label id = "slab"></label>
    		</td>
    	</tr>
    	<!-- 
    	<tr>
    		<td>出生日期：</td>
    		<td><input type = "text" value = "${userlogin.birthday }" name = "birthday" /></td>
    	</tr>
    	 -->
    	
    	<!--<tr>
    		<td>固定电话：</td>
    		<td><input type = "text" value = "${userlogin.homephone }" name = "homephone" /></td>
    	</tr>
    	--><tr>
    		<td>电子邮箱：</td>
    		<td><input type = "text" value = "${userlogin.email }" id = "email" name = "email" onblur="testEmail()"/><label id = "elab"></label></td>
    	</tr>
    	<tr>
    		<td>手机号码：</td>
    		<td><input type = "text" value = "${userlogin.phonenumber }" id = "photoNumber" name = "phonenumber" onblur="testPhotoNumber()" /><label id = "phlab"></label></td>
    	</tr>
    	<tr>
    		<td>第一个收货地址：</td>
    		<td><input type = "text" value = "${userlogin.firstaddress }" name = "firstaddress" id = "firstaddress" onblur = "testFirstAddress()"/><label id="flab"></label></td>
    	</tr>
    	<tr>
    		<td>第二个收货地址：</td>
    		<td><input type = "text" value = "${userlogin.secondaddress }" name = "secondaddress" /></td>
    	</tr>
    	<tr>
    		<td>第三个收货地址：</td>
    		<td><input type = "text" value = "${userlogin.thirdaddress }" name = "thirdaddress" /></td>
    	</tr>
    	<!--
    	<tr>
    		<td>会员：</td>
    		<td><input type = "text" value = "${userlogin.isvip }" name = "isvip" /></td>
    	</tr>
    	
    	<tr>
    		<td>注册时间：</td>
    		<td><input type = "text" value = "${userlogin.registrationtime }" name = "registrationtime" /></td>
    	</tr>
    	-->
    	<tr>
    		
    		<td colspan = "2">
    			密码：
    			<input type = "password" name = "oldpassword" id = "oldpassword" onblur = "AJAXTestOldPassword()"/><label id = "olab"></label>
    			<input type = "submit" id = "submit" value = "修改"/>
    		</td>		
      	</tr>
    </table>
  </form>
	<input type = "button" value = "点击完善更多资料" onclick="window.location.href='StoreUserAdd.jsp'"/>
  </body>
</html>
