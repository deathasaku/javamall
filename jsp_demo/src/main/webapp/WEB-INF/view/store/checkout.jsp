<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>結帳</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/assets/img/favicon.ico">

<!-- CSS 
    ========================= -->
<!--bootstrap min css-->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!--owl carousel min css-->
<link rel="stylesheet" href="${ctx}/assets/css/owl.carousel.min.css">
<!--slick min css-->
<link rel="stylesheet" href="${ctx}/assets/css/slick.css">
<!--magnific popup min css-->
<link rel="stylesheet" href="${ctx}/assets/css/magnific-popup.css">
<!--font awesome css-->
<link rel="stylesheet" href="${ctx}/assets/css/font.awesome.css">
<!--animate css-->
<link rel="stylesheet" href="${ctx}/assets/css/animate.css">
<!--jquery ui min css-->
<link rel="stylesheet" href="${ctx}/assets/css/jquery-ui.min.css">
<!--slinky menu css-->
<link rel="stylesheet" href="${ctx}/assets/css/slinky.menu.css">
<!--plugins css-->
<link rel="stylesheet" href="${ctx}/assets/css/plugins.css">

<!-- Main Style CSS -->
<link rel="stylesheet" href="${ctx}/assets/css/style.css">

<!--modernizr min js here-->
<script src="${ctx}/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>

	<!--header area start-->

	<!--offcanvas menu area start-->
	<c:import url="header.jsp"></c:import>
	<!--header area end-->

	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>結帳</h3>
						<ul>
							<li><a href="index">首頁</a></li>
							<li>結帳</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--Checkout page section-->
	<div class="Checkout_section mt-100">
		<div class="container">
			<!-- 			<div class="row"> -->
			<!-- 				<div class="col-12"> -->
			<!-- 					<div class="user-actions"> -->
			<!-- 						<h3> -->
			<!-- 							<i class="fa fa-file-o" aria-hidden="true"></i> 請問是會員嗎<a class="Returning" href="#" data-toggle="collapse" -->
			<!-- 								data-target="#checkout_login" aria-expanded="true">點這進行登入</a> -->

			<!-- 						</h3> -->
			<!-- 						<div id="checkout_login" class="collapse" data-parent="#accordion"> -->
			<!-- 							<div class="checkout_info"> -->
			<!-- 								<p>請輸入以下資訊進行登入，如不是會員，請去申辦一個</p> -->
			<!-- 								<form action="#"> -->
			<!-- 									<div class="form_group"> -->
			<!-- 										<label>帳號或email <span>*</span></label> <input -->
			<!-- 											type="text"> -->
			<!-- 									</div> -->
			<!-- 									<div class="form_group"> -->
			<!-- 										<label>密碼 <span>*</span></label> <input type="text"> -->
			<!-- 									</div> -->
			<!-- 									<div class="form_group group_3 "> -->
			<!-- 										<button type="submit">登入</button> -->
			<!-- 										<label for="remember_box"> <input id="remember_box" -->
			<!-- 											type="checkbox"> <span> 記住我 </span> -->
			<!-- 										</label> -->
			<!-- 									</div> -->
			<!-- 									<a href="#">忘記密碼?</a> -->
			<!-- 								</form> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 					<div class="user-actions"> -->
			<!-- 						<h3> -->
			<!-- 							<i class="fa fa-file-o" aria-hidden="true"></i>有折價卷嗎？<a class="Returning" href="#" data-toggle="collapse" -->
			<!-- 								data-target="#checkout_coupon" aria-expanded="true">點這輸入折扣代碼</a> -->

			<!-- 						</h3> -->
			<!-- 						<div id="checkout_coupon" class="collapse" -->
			<!-- 							data-parent="#accordion"> -->
			<!-- 							<div class="checkout_info coupon_info"> -->
			<!-- 								<form action="#"> -->
			<!-- 									<input placeholder="折扣代碼" type="text"> -->
			<!-- 									<button type="submit">送出</button> -->
			<!-- 								</form> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="checkout_form">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<form action="${ctx}/store/sendcheckout" method="post"
							modelAttribute="order">
							<h3>帳單明細 如需更改資訊 直接在下方進行更改即可</h3>
							<div class="row">

								<div class="col-12 mb-20">
									<label>姓名<span></span></label> <input type="text"
										value='${username.name}'>
								</div>
								<!-- 								<div class="col-lg-6 mb-20"> -->
								<!-- 									<label>姓氏 <span>*</span></label> <input type="text"> -->
								<!-- 								</div> -->
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<label>公司名稱</label> <input type="text"> -->
								<!-- 								</div> -->
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<label for="country">縣市 <span>*</span></label> <select -->
								<!-- 										class="select_option" name="cuntry" id="country"> -->
								<!-- 										<option value="2">鄉下基隆市</option> -->
								<!-- 										<option value="3">台北市</option> -->
								<!-- 										<option value="4">新北市</option> -->
								<!-- 										<option value="5">桃園市</option> -->
								<!-- 										<option value="6">新竹縣</option> -->
								<!-- 										<option value="7">苗栗縣</option> -->
								<!-- 										<option value="8">台中市</option> -->
								<!-- 										<option value="9">彰化縣</option> -->

								<!-- 									</select> -->
								<!-- 								</div> -->

								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<label>街道 <span>*</span></label> <input placeholder="門牌號碼和街道名稱" -->
								<!-- 										type="text"> -->
								<!-- 								</div> -->
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<input placeholder="" -->
								<!-- 										type="text"> -->
								<!-- 								</div> -->
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<label>地區 <span>*</span></label> <input type="text"> -->
								<!-- 								</div> -->
								<div class="col-12 mb-20">
									<label>地址<span></span></label> <input type="text"
										value='${username.address}' id="address" name="address">

								</div>


								<div class="col-12 mb-20">
									<label>電話<span></span></label> <input type="text"
										value='${username.tel}'>

								</div>
								<div class="col-12 mb-20">
									<label> Email <span></span></label> <input type="text"
										value='${username.email}'>

								</div>
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<input id="account" type="checkbox" -->
								<!-- 										data-target="createp_account" /> <label for="account" -->
								<!-- 										data-toggle="collapse" data-target="#collapseOne" -->
								<!-- 										aria-controls="collapseOne">新建一個帳戶?</label> -->

								<!-- 									<div id="collapseOne" class="collapse one" -->
								<!-- 										data-parent="#accordion"> -->
								<!-- 										<div class="card-body1"> -->
								<!-- 											<label> 密碼 <span>*</span></label> <input -->
								<!-- 												placeholder="password" type="password"> -->
								<!-- 										</div> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<!-- 								<div class="col-12 mb-20"> -->
								<!-- 									<input id="address" type="checkbox" -->
								<!-- 										data-target="createp_account" /> <label class="righ_0" -->
								<!-- 										for="address" data-toggle="collapse" -->
								<!-- 										data-target="#collapsetwo" aria-controls="collapseOne">送到其他地址？</label> -->

								<!-- 									<div id="collapsetwo" class="collapse one" -->
								<!-- 										data-parent="#accordion"> -->
								<!-- 										<div class="row"> -->
								<!-- 											<div class="col-lg-6 mb-20"> -->
								<!-- 												<label>名字 <span>*</span></label> <input type="text"> -->
								<!-- 											</div> -->
								<!-- 											<div class="col-lg-6 mb-20"> -->
								<!-- 												<label>姓氏 <span>*</span></label> <input type="text"> -->
								<!-- 											</div> -->
								<!-- 											<div class="col-12 mb-20"> -->
								<!-- 												<label>公司名稱</label> <input type="text"> -->
								<!-- 											</div> -->
								<!-- 											<div class="col-12 mb-20"> -->
								<!-- 												<div class="select_form_select"> -->
								<!-- 													<label for="countru_name">縣市 <span>*</span></label> <select -->
								<!-- 														class="select_option" name="cuntry" id="countru_name"> -->
								<!-- 														<option value="2">鄉下基隆市</option> -->
								<!-- 														<option value="3">台北市</option> -->
								<!-- 														<option value="4">新北市</option> -->
								<!-- 														<option value="5">桃園市</option> -->
								<!-- 														<option value="6">新竹縣</option> -->
								<!-- 														<option value="7">苗栗縣</option> -->
								<!-- 														<option value="8">台中市</option> -->
								<!-- 														<option value="9">彰化縣</option> -->

								<!-- 													</select> -->
								<!-- 												</div> -->
								<!-- 											</div> -->

								<!-- 											<div class="col-12 mb-20"> -->
								<!-- 												<label>街道 <span>*</span></label> <input -->
								<!-- 													placeholder="House number and street name" type="text"> -->
								<!-- 											</div> -->
								<!-- 											<div class="col-12 mb-20"> -->
								<!-- 												<input placeholder="＊＊＊＊＊＊＊＊" -->
								<!-- 													type="text"> -->
								<!-- 											</div> -->
								<!-- 											<div class="col-12 mb-20"> -->
								<!-- 												<label>地區 <span>*</span></label> <input type="text"> -->
								<!-- 											</div> -->

								<!-- 											<div class="col-lg-6 mb-20"> -->
								<!-- 												<label>電話<span>*</span></label> <input type="text"> -->

								<!-- 											</div> -->
								<!-- 											<div class="col-lg-6"> -->
								<!-- 												<label> Email <span>*</span></label> <input -->
								<!-- 													type="text"> -->

								<!-- 											</div> -->
								<!-- 										</div> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div class="col-12">
									<div class="order-notes">
										<label for="order_note">訂單備註</label>
										<textarea id="order_note" placeholder="有關您訂單的備註以及特殊說明。"></textarea>
									</div>
								</div>
							</div>
							<div class="order_button">
							<button type="submit" action="${ctx}/store/sendcheckout">確認付款</button>
						</div>
						</form>
					</div>
					<div class="col-lg-6 col-md-6">
						<form action="#">
							<h3>您的訂單</h3>
							<div class="order_table table-responsive">

								<table>
									<thead>
										<tr>
											<th>商品</th>
											<th>金額</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="sum" value="0"></c:set>
										<c:forEach var="aaa" items="${shopcheck}">

											<tr>
												<td>${aaa.productsku.product.productName}<strong>
														×${aaa.buyNumber} </strong></td>
												<td>$${aaa.productsku.originalPrice*aaa.buyNumber}</td>
												<c:set var="sum"
													value="${sum+aaa.productsku.originalPrice*aaa.buyNumber}"></c:set>
											</tr>
										</c:forEach>
										<!-- 										<tr> -->
										<!-- 											<td>ENRICH iphone 11 手機殼 <strong> × 1</strong></td> -->
										<!-- 											<td>$900</td> -->
										<!-- 										</tr> -->
										<!-- 										<tr> -->
										<!-- 											<td>moshi iphone 11 玻璃貼 <strong> × 2</strong></td> -->
										<!-- 											<td>$1600</td> -->
										<!-- 										</tr> -->
									</tbody>
									<tfoot>
										<tr>
											<th>購物車總金額</th>
											<td>$${sum}</td>
										</tr>
										<tr id="birchange">
											<th>運費</th>
											<td><strong>$60</strong></td>
										</tr>
										<tr id="birchange">
											<th>稅金</th>
											<td><strong>${sum*0.05}</strong></td>
										</tr>

										<tr class="order_total">
											<th>訂單總金額</th>
											<td>$<strong id="countDis">${sum*1.05+60}</strong></td>
										</tr>
									</tfoot>
								</table>


							</div>
							<div class="payment_method">
								<!-- 								<div class="panel-default"> -->
								<!-- 									<input id="payment" name="check_method" type="radio" -->
								<!-- 										data-target="createp_account" /> <label for="payment" -->
								<!-- 										data-toggle="collapse" data-target="#method" -->
								<!-- 										aria-controls="method">建立帳號?</label> -->

								<!-- 									<div id="method" class="collapse one" data-parent="#accordion"> -->
								<!-- 										<div class="card-body1"> -->
								<!-- 											<p>Please send a check to Store Name, Store Street, Store -->
								<!-- 												Town, Store State / County, Store Postcode.</p> -->
								<!-- 										</div> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div class="panel-default">
									<input id="payment_defult" name="check_method" type="radio" checked="checked"
										data-target="createp_account" /> <label for="payment_defult"
										data-toggle="collapse" data-target="#collapsedefult"
										aria-controls="collapsedefult">PayPal <img
										src="${ctx}/assets/img/icon/papyel.png" alt=""></label>

									<div id="collapsedefult" class="collapse one"
										data-parent="#accordion">
										<div class="card-body1">
											<p>Pay via PayPal; you can pay with your credit card if
												you don’t have a PayPal account.</p>
										</div>
									</div>
								</div>
								<%-- <div class="order_button">
									<button type="submit" action="${ctx}/store/sendcheckout">確認付款</button>
								</div> --%>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Checkout page section end-->

	<!--brand area start-->
	<div class="brand_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="brand_container owl-carousel">
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand1.png"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand2.jpg"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand3.jpg"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand4.jpg"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand5.jpg"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand6.jpeg"
								alt=""></a>
						</div>
						<div class="single_brand">
							<a href="#"><img src="${ctx}/assets/img/brand/brand7.png"
								alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--brand area end-->

	<!--footer area start-->
	<c:import url="footer.jsp"></c:import>
	<!--footer area end-->


	<!-- JS
============================================ -->
	<!--jquery min js-->
	<script src="${ctx}/assets/js/vendor/jquery-3.4.1.min.js"></script>
	<!--popper min js-->
	<script src="${ctx}/assets/js/popper.js"></script>
	<!--bootstrap min js-->
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!--owl carousel min js-->
	<script src="${ctx}/assets/js/owl.carousel.min.js"></script>
	<!--slick min js-->
	<script src="${ctx}/assets/js/slick.min.js"></script>
	<!--magnific popup min js-->
	<script src="${ctx}/assets/js/jquery.magnific-popup.min.js"></script>
	<!--counterup min js-->
	<script src="${ctx}/assets/js/jquery.counterup.min.js"></script>
	<!--jquery countdown min js-->
	<script src="${ctx}/assets/js/jquery.countdown.js"></script>
	<!--jquery ui min js-->
	<script src="${ctx}/assets/js/jquery.ui.js"></script>
	<!--jquery elevatezoom min js-->
	<script src="${ctx}/assets/js/jquery.elevatezoom.js"></script>
	<!--isotope packaged min js-->
	<script src="${ctx}/assets/js/isotope.pkgd.min.js"></script>
	<!--slinky menu js-->
	<script src="${ctx}/assets/js/slinky.menu.js"></script>
	<!-- Plugins JS -->
	<script src="${ctx}/assets/js/plugins.js"></script>

	<!-- Main JS -->
	<script src="${ctx}/assets/js/main.js"></script>

	<!-- <script>
		window.onload = function() {
			if ('${LoginOK}' == "ok"
					&& '${fn:substring(username.birthdate,5,7)}' == "01") {
				$('#birchange').html('');
				$('#birchange').append(
						'<th>生日優惠九折</th><td><strong>-'
								+ parseFloat($('#countDis').html()) * 0.1
								+ '</strong></td>');
				$('#countDis').html(parseFloat($('#countDis').html()) * 0.9);
			}
		}
	</script>
 -->

</body>

</html>