<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<style>
* {
	font-family: 微軟正黑體;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #eee;
}

button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>

<body>

	<div class="row">
		<h2>會員資料</h2>

		<form action="${ctx}/admin/update" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="account">帳號:</label> <input type="text"
					class="form-control" name="email" value="${one.email}"> <label
					for="password">密碼:</label> <input type="password"
					class="form-control" name="password" value="${one.password}">

				<label for="createDate">創辦日期:</label> <input type="date"
					class="form-control" value="${one.createDate}"> <label
					for="tel">電話:</label> <input type="text" class="form-control"
					name="tel" value="${one.tel}"> <label for="memberAddress">圖片上傳:</label>
				<input type="file" class="form-control" name="file"
					value="${one.image}" required="required"> <label
					for="block">黑名單:</label> <input type="text" class="form-control" required="required"
					name="block" placeholder="目前狀態:${one.block?'正常':'已封鎖'}     輸入1為解鎖 輸入0為封鎖">

			</div>
			<div class="button">
				<input type="hidden" name="id" value="${one.id}" />
				<button type="submit" class="btn btn-outline-secondary">送出</button>

				<a href="${pageContext.request.contextPath}/admin/user">
					<button type="button" class="btn btn-outline-secondary">會員管理</button>
				</a>
			</div>
		</form>
	</div>
</body>
</html>

