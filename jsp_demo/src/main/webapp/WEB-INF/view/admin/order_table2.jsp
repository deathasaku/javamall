<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="ctx" value="${pageContext.request.contextPath}" />

<table class="table table-striped">
	<tbody>
		<tr>
			<th scope="row">PAYPAL交易ID</th>
			<td>${payment.paymentId}</td>
		</tr>
		<tr>
			<th scope="row">付款人姓名</th>
			<td>${payment.payerFirstName}&nbsp;${payment.payerLastName}</td>
		</tr>
		<tr>
			<th scope="row">信箱</th>
			<td>${payment.payeremail}</td>
		</tr>
		<tr>
			<th scope="row">PAYPAL用戶ID</th>
			<td>${payment.payerID}</td>
		</tr>
		<tr>
			<th scope="row">付款狀態</th>
			<td>${payment.status}</td>
		</tr>
		<tr>
			<th scope="row">寄件地址</th>
			<td id="ship">${payment.shipping_address}</td>
		</tr>

	</tbody>
</table>



<!-- </div> -->