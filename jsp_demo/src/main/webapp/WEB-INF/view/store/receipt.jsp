<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款收據</title>
<style type="text/css">
body{background-color: whitesmoke;}
	table { border: 3px #cccccc solid;
			width: 350px; 
			background-color:lightcyan; }
	table td { padding: 5px; }
</style>
</head>
<body>
	<div align="center">
		<h1>付款完成。 感謝您購買我們的產品</h1>
		<br />
		
		<table>
			<tr>
				<td colspan="2"align="center"><h2>收據明細:</h2></td>
				
			</tr>
			<tr>
				<td><b>賣家:</b></td>
				<td>鴨鴨商城</td>
			</tr>
			<tr>
				<td><b>付款人:</b></td>
				<td>${payer.firstName}${payer.lastName}</td>
			</tr>			
			<tr>
				<td><b>商品名稱:</b></td>
				<td>${transaction.description}</td>
			</tr>
			<tr>
				<td><b>小計:</b></td>
				<td>${transaction.amount.details.subtotal}TWD</td>
			</tr>
			<tr>
				<td><b>運費:</b></td>
				<td>${transaction.amount.details.shipping}TWD</td>
			</tr>
			<tr>
				<td><b>稅:</b></td>
				<td>${transaction.amount.details.tax}TWD</td>
			</tr>
			<tr>
				<td><b>總金額:</b></td>
				<td>${transaction.amount.total}TWD</td>
			</tr>

			<tr>			
			<td colspan="2" align="center">
			<button onclick="window.location.href='index';">返回首頁</button></td>
			<!-- <td><a href="index">返回首頁</a></td> -->
			</tr>

		</table>
	</div>
</body>
</html>