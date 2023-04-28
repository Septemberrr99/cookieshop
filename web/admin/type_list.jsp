<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>类目列表</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">

	<jsp:include page="/admin/header.jsp"></jsp:include>

	<br>

	<div>
		<form class="form-inline" method="post" action="${pageContext.request.contextPath}/admin/type_add">
			<input type="text" class="form-control" id="input_name" name="name" placeholder="输入类目名称" required="required" style="width: 500px">
			<input type="submit" class="btn btn-warning" value="添加类目"/>
		</form>
	</div>
	<br/>
	<c:if test="${!empty msg }">
		<div class="alert alert-success">${msg }</div>
	</c:if>
	<c:if test="${!empty failMsg }">
		<div class="alert alert-danger">${failMsg }</div>
	</c:if>
	<br>

	<table class="table table-bordered table-hover">

		<tr>
			<th width="5%">ID</th>
			<th width="10%">名称</th>
			<th width="10%">操作</th>
		</tr>

		<c:forEach items="${list }" var="t">
			<tr>
				<td><p>${t.id }</p></td>
				<td><p>${t.name }</p></td>
				<td>
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/type_edit.jsp?id=${t.id }&name=${t.encodeName }">修改</a>
					<a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/type_delete?id=${t.id }" onclick="confirmDelete(${t.id})">删除</a>
				</td>
			</tr>
		</c:forEach>

		<script>
			function confirmDelete(id) {
				// 弹出提示框，并获取用户点击的按钮
				var confirmed = confirm("确认删除吗？");

				// 如果用户点击了确定按钮，执行删除操作
				if (confirmed) {
					// 构造删除分类的 URL
					var deleteUrl = "${pageContext.request.contextPath}/admin/type_delete?id=" + id;

					// 执行删除操作
					window.location.href = deleteUrl;
				}
			}
		</script>


	</table>

</div>
</body>
</html>