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
<title>確認</title>
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
	
	<form action="" method="post" name="reallypay">
	<table>
		<tr>
			
			<td>
				<input type="hidden" name="paymentId" value="${param.paymentId}" />
				<input type="hidden" name="PayerID" value="${param.PayerID}" />
				<input type="hidden" name="email" value="${payer.email}" />
				<input type="hidden" name=TotalAmount value="${transaction.amount.total}" />
				<input type="hidden" name="PayerfirstName" value="${payer.firstName}" />
				<input type="hidden" name="PayerlastName" value="${payer.lastName}" />
				
			</td>
		</tr>
		<tr>
			<td colspan="2"><img src="${ctx}/assets/img/logo/paypal.jpg"alt="wrong"></td>
			
		</tr>
		<tr>
			<td colspan="2"align="center"><h2>付款前請再確認一次</h2></td>
			
		</tr>
		
		<tr>
			<td>商品描述:</td>
			<td>${transaction.description}</td>
		</tr>
		<tr>
			<td>小計:</td>
			<td>${transaction.amount.details.subtotal} TWD</td>
		</tr>
		<tr>
			<td>運費:</td>
			<td>${transaction.amount.details.shipping} TWD</td>
		</tr>
		<tr>
			<td>稅:</td>
			<td>${transaction.amount.details.tax} TWD</td>
		</tr>
		<tr>
			<td>總金額:</td>
			<td>${transaction.amount.total} TWD</td>
		</tr>	
		<tr><td><br/></td></tr>
		<tr>
			<td colspan="2"><b>付款者資訊:</b></td>
		</tr>
		<!--下面是PayPal提供的客戶資訊，覺得違和可以把他藏起來  -->
		<tr>
			<td>名:</td>
			<td>${payer.firstName}</td>
		</tr>
		<tr>
			<td>姓:</td>
			<td>${payer.lastName}</td>
		</tr>
		<tr><td><br/></td></tr>
		<tr>
			<td colspan="2"><b>收件地址</b></td>
		</tr>
		<tr>
			<td>收件人:</td>
			<td>${shippingAddress.recipientName}</td>
		</tr>
		<tr>
			<td>街道路名號碼:</td>
			<td>${shippingAddress.line1}</td>
		</tr>
		<tr>
			<td>城市:</td>
			<td>${shippingAddress.city}</td>
		</tr>
		<tr>
			<td>州:</td>
			<td>${shippingAddress.state}</td>
		</tr>
		<tr>
			<td>國家地區代碼 :</td>
			<td>${shippingAddress.countryCode}</td>
		</tr>
		<tr>
			<td>郵遞區號:</td>
			<td>${shippingAddress.postalCode}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!--<input type="submit" value="付款" />  -->
				<button onclick="pay()">確認付款</button>
				<button onclick="cancel()">取消交易</button>	
			</td>
		</tr>	
	</table>
	</form>
</div>
</body>
<script>
function pay(){
//  document.("表單的name值").action
//  document.("表单的name值").submit
  document.reallypay.action="execute_payment";
  document.reallypay.submit();
  }
  
  function cancel(){
	//  document.("表單的name值").action
	//  document.("表單的name值").submit
	  document.reallypay.action="cancel";
	  document.reallypay.submit();
	  }


</script>
</html>