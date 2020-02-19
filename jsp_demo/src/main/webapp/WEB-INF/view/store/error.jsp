<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{background-color: whitesmoke;}
</style>
<meta charset="UTF-8">
<title>付款錯誤</title>
</head>
<body>
<div align="center">
	<h1>喔喔!出錯了</h1>
	<br/>
	<h3>錯誤訊息:</h3>	
	<br/>
	${errorMessage}
	<br/>
	<button style="width:120px;height:40px;font-size:20px;"
	onclick="window.location.href='index';">返回首頁</button>
	<!-- <a href="index">返回首頁</a> -->
		
</div>
</body>
</html>