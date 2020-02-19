<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>結帳</title>
	<style type="text/css">
		table { border: 0; }
		table td { padding: 10px; }
	</style>
</head>
<body>
<div align="center">
	<h1>結帳</h1>
	<br/>
	<form action="authorize_payment" method="post">
	<table>
		<tr>
			<td>商品/服務:</td>
			<td><input type="text" name="product" value="Next iPhone" /></td>
		</tr>
		<tr>
			<td>小計:</td>
			<td><input type="text" name="subtotal" value="100" /></td>
		</tr>
		<tr>
			<td>運費:</td>
			<td><input type="text" name="shipping" value="10" /></td>
		</tr>		
		<tr>
			<td>稅:</td>
			<td><input type="text" name="tax" value="10" /></td>
		</tr>		
		<tr>
			<td>總金額:</td>
			<td><input type="text" name="total" value="120" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="結帳" />
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>