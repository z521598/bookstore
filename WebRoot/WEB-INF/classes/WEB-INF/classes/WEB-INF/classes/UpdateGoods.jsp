<%@ page language="java" import="java.util.*"
	import="cn.com.lsq.po.Type" import="cn.com.lsq.po.Goods"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<link rel="stylesheet"
			href="kindeditor-4.1.10/themes/default/default.css" />
		<link rel="stylesheet"
			href="kindeditor-4.1.10/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js">
</script>
		<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js">
</script>
		<script charset="utf-8"
			src="kindeditor-4.1.10/plugins/code/prettify.js">
</script>
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
		<%
			List<Type> typelist = (List<Type>) request.getAttribute("types");
			Goods oneGoods = (Goods) request.getAttribute("oneGoods");
		%>
		<form action="goods/update.action" method="post"
			enctype="multipart/form-data">
			<table border="1" cellspacing="0">
				<tr>
					<td>
						编号：
					</td>
					<td>
						<input type="text" value="${oneGoods.id }" name="id"
							readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						书名：
					</td>
					<td>
						<input type="text" value="${oneGoods.name }" name="name" />
					</td>
				</tr>
				<tr>
					<td>
						书号：
					</td>
					<td>
						<input type="text" value="${oneGoods.booknumber }"
							name="booknumber" />
					</td>
				</tr>
				<tr>
					<td>
						作者：
					</td>
					<td>
						<input type="text" value="${oneGoods.author }" name="author" />
					</td>
				</tr>
				<tr>
					<td>
						类型：
					</td>
					<td>
						<select name="type">
							<%
								for (Type t : typelist) {
							%>
							<option <%if (t.getName().equals(oneGoods.getType())) {%>
								selected="selected" <%}%>>
								<%=t.getName()%>
								<%
									}
								%>
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						出版社：
					</td>
					<td>
						<input type="text" value="${oneGoods.press }" name="press" />
					</td>
				</tr>
				<tr>
					<td>
						封面：
					</td>
					<td>
						<img src="${oneGoods.cover }" height="200" width="200" />
						<br />
						<input type="file" name="cover2">
					</td>
				</tr>
				<tr>
					<td>
						页数：
					</td>
					<td>
						<input type="text" value="${oneGoods.pagination }"
							name="pagination" />
					</td>
				</tr>
				<tr>
					<td>
						出版日期 ：
					</td>
					<td>
						<input type="text" value="${oneGoods.publishdate}"
							name="publishdate" />
					</td>
				</tr>
				<tr>
					<td>
						出售价格：
					</td>
					<td>
						<input type="text" value="${oneGoods.saleprice }" name="saleprice" />
					</td>
				</tr>
				<tr>
					<td>
						进货价格：
					</td>
					<td>
						<input type="text" value="${oneGoods.storeprice }"
							name="storeprice" />
					</td>
				</tr>
				<tr>
					<td>
						简介：
					</td>
					<td>
						<textarea name="introduce" id="introduce" cols="100" rows="8"
							style="width: 700px; height: 200px; visibility: hidden;">${oneGoods.introduce }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						购买量：
					</td>
					<td>
						<input type="text" value="${oneGoods.buycount }" name="buycount"
							readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						重量：
					</td>
					<td>
						<input type="text" value="${oneGoods.weight }" name="weight" />
					</td>
				</tr>
				<tr>
					<td>
						上架时间：
					</td>
					<td>
						<input type="text" value="${oneGoods.createtime }"
							name="createtime2" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						库存：
					</td>
					<td>
						<input type="text" value="${oneGoods.inventory }" name="inventory" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="确认修改" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
