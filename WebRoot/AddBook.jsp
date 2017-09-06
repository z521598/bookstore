<%@ page language="java" import="java.util.*" import="cn.com.lsq.po.Type" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上架图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="introduce"]', {
				cssPath : 'kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : 'kindeditor-4.1.10/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor-4.1.10/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
  </head>
  
  <body>
    	<form action="goods/add.action" method="post" enctype ="multipart/form-data">
    	<table border = "1" cellspacing="0">
    	<tr>
    		<td>书名：</td>
    		<td><input type = "text" id = "name" name = "name"/></td>
    	</tr>
    	<tr>
    		<td>书号：</td>
    		<td><input type = "text" id = "bookNumber"  name = "booknumber"/></td>
    	</tr>
    	<tr>
    		<td>作者：</td>
    		<td><input type = "text" id = "author"  name = "author"/></td>
    	</tr>
    	<!-- 选择框 -->
    	<tr>
    		<td>类型：</td>
    		<td>
    			<select id = "type"  name = "type">
    				
    				<%	
    					List<Type> list = (List<Type>)request.getAttribute("allType");
    					for(Type t: list){
    				 %>
    				<option value = "<%=t.getName()%>"><%=t.getName()%></option>
    			<%
    				}
    			 %>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td>出版社：</td>
    		<td><input type = "text" id = "press"  name = "press"/></td>
    	</tr>
    	<tr>
    		<td>封面：</td>
    		<td><input type = "file" id = "cover2"  name = "cover2"/></td>
    	</tr>
    	<!-- 文件上传中，po类的成员变量不能和元素name属性重名 -->
    	<tr>
    		<td>页数：</td>
    		<td><input type = "text" id = "pagination"  name = "pagination"/></td>
    	</tr>
    	<tr>
    		<td>出版日期：</td>
    		<td><input type = "text" id = "publishDate"  name = "publishdate"/></td>
    	</tr>
    	<tr>
    		<td>售价(RMB)：</td>
    		<td><input type = "text" id = "salePrice"  name = "saleprice"/></td>
    	</tr>
    	<tr>
    		<td>进价(RMB)：</td>
    		<td><input type = "text" id = "storePrice"  name = "storeprice"/></td>
    	</tr>
    	<tr>
    		<td>重量(kg)：</td>
    		<td><input type = "text" id = "weight"  name = "weight"/></td>
    	</tr>
    	<tr>
    		<td>库存：</td>
    		<td><input type = "text" id = "inventory"  name = "inventory"/></td>
    	</tr>
    	</table>
    	<br>
		简介：<br>
		<textarea name="introduce" id = "introduce" cols="100" rows="8"  name = "introduce" style="width:700px;height:200px;visibility:hidden;"></textarea>
		<br/>
    	<input type = "submit" value = "上架图书"/>
    </form>
  </body>
</html>
