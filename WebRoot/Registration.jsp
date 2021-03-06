<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.com.lsq.tool.StringRegexUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上书城注册页面</title>
    
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
		function testId(){
		//注意加return
			return test($("#id").val().trim().length >= 5,"#ilab");
		}
		function testPassword(){
			return test($("#password").val().trim().length >= 6,"#plab");
		}
		function testRepeatPassword(){
			return test($("#repeatpassword").val() == $("#password").val() && $("#password").val().trim().length >= 6,"#rlab");
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
		function testHadRead(){
			return test($(":checkbox:checked").size() == 1 ,"#hlab");
		}
		function testBirthday(){
			return test($("#birthday").val().match("(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)"),"#blab");
		}
		function testFirstAddress(){
			return test($("#firstaddress").val().trim() != "","#flab");
		}
		function AJAXTestId(){
				$.post("user/registtest.action",{id:$("#id").val()},function(data){
				return test($("#id").val().trim().length >= 5 && data == 0,"#ilab");
		}				
		);
		}
		function testAll(){
			if(testId()&&testPassword()&&testRepeatPassword()&&testIdCard()&&testName()&&testEmail()&&testPhotoNumber()&&testSex()&&testBirthday()&&testHadRead()&&testFirstAddress()){
				return true;
			}else{
				
				return false;
			}
		}
		
	</script>
  </head>
  
  <body>
  <form action="user/add.action" onsubmit = "return testAll()" method ="post" >
    <table border = "1" cellspacing="0">
    	<tr>
    		<td>用户名：</td>
    		<td><input type ="text" name = "id" id = "id" onblur="AJAXTestId()"><label id = "ilab"></label></td>
    	</tr>
    	<tr>
    		<td>密码：</td>
    		<td><input type ="password" name = "password" id = "password" onblur = "testPassword()"><label id = "plab"></label></td>
    	</tr>
    	<tr>
    		<td>确认密码：</td>
    		<td><input type ="password" name = "repeatpassword" id = "repeatpassword" onblur = "testRepeatPassword()"><label id = "rlab"></label></td>
    	</tr>
    	<tr>
    		<td>姓名：</td>
    		<td><input type ="text" name = "name" id = "name" onblur="testName()"><label id = "nlab"></label></td>
    	</tr>
    	
    	<tr>
    		<td>性别：</td>
    		<td>
	    		<input type = "radio" name = "sex" value = "男" onblur="testSex()"/>男
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		<input type = "radio" name = "sex" value = "女" onblur="testSex()"/>女
	    		<label id = "slab"></label>
	    	</td>
    	</tr>
    	<tr>
    		<td>身份证号：</td>
    		<td><input type="text" id = "idCard" name = "idcard" onblur="testIdCard()"/><label id = "iclab"></label></td>
    	</tr>
    	<tr>
    		<td >出生日期：</td>
    		<td><input type="text" id = "birthday" name = "birthday" onblur="testBirthday()"/><label id = "blab"></label></td>
    	</tr>
    	<tr>
    		<td>电子邮箱：</td>
    		<td><input type ="text" id = "email" name = "email" onblur="testEmail()"/><label id = "elab"></label></td>
    	</tr>
    	<tr>
    		<td>手机号码：</td>
    		<td><input type ="text" id = "photoNumber" name = "phonenumber" onblur="testPhotoNumber()"/><label id = "phlab"></label></td>
    	</tr>
    	<tr>
    		<td>第一个收货地址：</td>
    		<td><input type = "text" name = "firstaddress" id = "firstaddress" onblur = "testFirstAddress()"/><label id="flab"></label></td>
    	</tr>
    	<tr>
    		<td colspan = "2">
    			<font size = 2 color = blue >我已阅读并同意《<a href="">网上书城服务条款和隐私政策</a>》</font>
    			<input type ="checkbox" id = "hadRead" onblur="testHadRead" onclick = "testHadRead()"/>
    			<label id = "hlab"></label>
    		</td>
    	</tr>
    	<tr>
    		<td colspan = "2" align = "center"><input type = "submit" id = "submit" value = "注册" ></td>
    	</tr>
    </table>
</form>
</body>
</html>
