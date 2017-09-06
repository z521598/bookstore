<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.Type" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>类型</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" src = "js/jquery-2.0.2.js"></script>
  <script type="text/javascript">
    $('a').click(
        function(){
            //this表示当前被点击元素，但是此时我们当做dom对象
            //window.alert(this.innerHTML);
            //$(this) 表示当前被点击元素，但是此时我们当做jquery对象
            window.alert($(this).html());
            //window.alert('ok');
        });
  
  	function AJAXTestExist(){
  	//怎么把ID或者name传过去
  		$.post("type/AJAXTestExist.action",{id:$("#id").val()},function(data){
			if(data == 0){
			return true;
			}else{
			alert("已存在该类型图书，不可删除或者修改");
			return false;
			}
			});
			alert(this);
			return false;
  	}
  	
  </script>
  <body>
    <table border = "1" cellspacing="0">
    	<tr>
    		<td>编号</td>
    		<td>类型名</td>
    		<td align = "center">操作</td>
    	</tr>
    	<%
    	List<Type> type = (List<Type>)request.getAttribute("allType");
    	for(Type t :type){
    	%>
    	<tr>
    		<td><%=t.getId()%></td>
    		<td><input type = "text" id="<%=t.getId()%>" value = "<%=t.getName()%>" readonly = "readonly"/></td>
    		<td>
    			<a href="type/delete.action?id=<%=t.getId()%>" target = "_self">删除</a>
    			&nbsp;
    			<a href="type/queryById.action?id=<%=t.getId()%>"  target = "_self">修改</a>	
    		</td>
    	</tr>
    	<%
    	}		
    	 %>
	 <!-- 
	 	jstl可以做循环，el不能做循环 
	  -->
    </table>
  	<br/>
  	<input type = "button" value = "添加新图书类型" onclick="window.location.href='AddType.jsp'" >
  	${falsemessage}
  </body>
</html>
