<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>客户列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	




	<jsp:include page="header.jsp"></jsp:include>

	<div class="text-right"><a class="btn btn-warning" href="user_add.jsp">添加客户</a></div>
	<c:if test="${!empty msg }">
		<div class="alert alert-success">${msg }</div>
	</c:if>
	<c:if test="${!empty failMsg }">
		<div class="alert alert-danger">${failMsg }</div>
	</c:if>
	<br>
	<br>
	
	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">用户名</th>
		<th width="10%">邮箱</th>
		<th width="10%">收件人</th>
		<th width="10%">电话</th>
		<th width="10%">地址</th>
		<th width="12%">操作</th>
	</tr>


		<c:forEach items="${p.list }" var="u">
			<tr>
				<td><p>${u.id }</p></td>
				<td><p>${u.username }</p></td>
				<td><p>${u.email }</p></td>
				<td><p>${u.name }</p></td>
				<td><p>${u.phone }</p></td>
				<td><p>${u.address }</p></td>
				<td>
					<a class="btn btn-info" href="${pageContext.request.contextPath}/admin/user_reset.jsp?id=${u.id }&username=${u.username }&email=${u.email }">重置密码</a>
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/user_editshow?id=${u.id }">修改</a>
					<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/user_delete?id=${u.id }" onclick="confirmDelete(${u.id})">删除</a>
				</td>
			</tr>
		</c:forEach>

		<script>
			function confirmDelete(id) {
				// 弹出提示框，并获取用户点击的按钮
				var confirmed = confirm("确认删除吗？");

				// 如果用户点击了确定按钮，执行删除操作
				if (confirmed) {
					// 构造删除用户的 URL
					var deleteUrl = "${pageContext.request.contextPath}/admin/user_delete?id=" + id;

					// 执行删除操作
					window.location.href = deleteUrl;
				}
			}
		</script>


</table>

<br>
	<jsp:include page="/page.jsp">
		<jsp:param value="/admin/user_list" name="url"/>
	</jsp:include>
<br>
</div>
</body>
</html>