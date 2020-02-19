<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>購物車</title>
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
						<h3>購物車</h3>
						<ul>
							<li><a href="index">首頁</a></li>
							<li>購物車</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--shopping cart area start -->
	<div class="shopping_cart_area mt-100">
		<div class="container">
			<form action="#">
				<div class="row">
					<div class="col-12">
						<div class="table_desc">
							<div class="cart_page table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product_remove">刪除</th>
											<th class="product_thumb">照片</th>
											<th class="product_name">產品名稱</th>
											<th class="product-price">金額</th>
											<th class="product_quantity">數量</th>
											<th class="product_total">總金額</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="aaa" items="${cartList}">
											<tr id="cartitem${aaa.id}">
												<td class="product_remove"><a href="#"><i
														class="fa fa-trash-o" id="delete "
														onclick="deletCart(${aaa.id},${aaa.productsku.id})">
														<input type="hidden" id="skuid${aaa.id}" value="${aaa.productsku.id}">
														</i></a></td>
												<td class="product_thumb"><a href="#"><img
														src="${ctx}${aaa.productsku.product.productImage[0].src}" alt=""></a></td>
												<td class="product_name">
												<p>${aaa.productsku.product.productName}</p>
												<a href="#">${aaa.productsku.spec}
												</a></td>
												<td class="product-price" id="price${aaa.id}">${aaa.productsku.originalPrice}</td>
												<td class="product_quantity"><label>數量</label> <input
													min="1" max="${aaa.productsku.stockNum}"
													value="${aaa.buyNumber}" type="number" id="${aaa.id}"
													onchange="updatCartNum(this)"></td>
												<td class="product_total" id="totalPrice${aaa.id}">${aaa.productsku.originalPrice*aaa.buyNumber}</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
							<div class="cart_submit">
								<button type="button" onclick="javascript:history.back(-1);">繼續購物</button>
							</div>
						</div>
						<div class="checkout_btn" style="margin-top:-70px;">
							<a href="${ctx}/store/checkout">送出結帳</a>
					</div>
				</div>
				<!--coupon code area start-->
				<!-- <div class="coupon_area">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="coupon_code left">
								<h3>折價卷</h3>
								<div class="coupon_inner">
									<p>請輸入折扣代碼</p>
									<input placeholder="折扣代碼" type="text">
									<button type="submit">送出</button>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="coupon_code right">
								<h3>購物車總金額</h3>
								<div class="coupon_inner">
									<div class="cart_subtotal">
										<p>金額</p>
										<p class="cart_amount">$27400</p>
									</div>
									<div class="cart_subtotal ">
										<p>運費</p>
										<p class="cart_amount">
											<span>浮動費率:</span> $0
										</p>
									</div>
									<a href="#">計算運費</a>

									<div class="cart_subtotal">
										<p>總金額</p>
										<p class="cart_amount">$27400</p>
									</div>
									<div class="checkout_btn">
										<a href="http://localhost:8080/jsp_demo/store/checkout">送出結帳</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> -->
				<!--coupon code area end-->
			</form>
		</div>
		<input type="hidden" value="${username.id}" id="userId">
	</div>
	<!--shopping cart area end -->

	<!--brand area start-->
	<div class="brand_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="brand_container owl-carousel">
						<div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand1.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand2.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand3.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand4.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand5.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand6.jpeg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand7.png" alt=""></a>
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
	<script>
		function updatCartNum(e) {
			$.ajax({
				type : 'POST',
				url : '${ctx}/store/updateCart',
				data : {
					"cartItemId" : parseInt(e.id),
					"buyNumber" : parseInt(e.value)
				},
				success : function(data) {
					var price = parseInt($('#price' + e.id).html());
					$('#totalPrice' + e.id).html('');
					$('#totalPrice' + e.id).html(price * data);
				}
			})
		}
		
		function deletCart(c,e){
			$.ajax({
				type :'Post',
				url : '${ctx}/store/deletCart',
				data : {
					"skuId" : parseInt(e),
					"userId" :'${!empty username}'=='true'?parseInt('${username.id}'):null
				},
				success:function(){
					$('#cartitem'+c).remove();
				}
			})
		}
		

	</script>



</body>

</html>