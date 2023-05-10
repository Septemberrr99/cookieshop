<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>客户修改</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">

	<jsp:include page="/admin/header.jsp"></jsp:include>

	<br><br>

	<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/user_edit" method="post">
		<input type="hidden" name="id" value="${u.id }">
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">用户名</label>
			<div class="col-sm-5">${u.username }</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">邮箱</label>
			<div class="col-sm-5">${u.email }</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">收件人</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="name" value="${u.name }">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">电话</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="phone" value="${u.phone }" pattern="^[1][3-9][0-9]{9}$">
				<p id="phone-error" style="color:red; display:none;">请输入有效的手机号码</p>
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">地址</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="address" value="${u.address }">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交修改</button>
			</div>
		</div>
	</form>

	<script>
		const emailInput = document.querySelector('input[name="email"]');
		const emailError = document.querySelector('#email-error');
		emailInput.addEventListener('input', () => {
			if (!emailInput.validity.valid) {
				emailError.style.display = 'block';
			} else {
				emailError.style.display = 'none';
			}
		});

		const phoneInput = document.querySelector('input[name="phone"]');
		const phoneError = document.querySelector('#phone-error');
		phoneInput.addEventListener('input', () => {
			if (!phoneInput.validity.valid) {
				phoneError.style.display = 'block';
			} else {
				phoneError.style.display = 'none';
			}
		});
	</script>

	<span style="color:red;"></span>

</div>
</body>
</html>