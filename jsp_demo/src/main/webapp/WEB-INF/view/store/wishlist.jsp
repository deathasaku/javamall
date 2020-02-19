<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>願望清單</title>
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
						<h3>願望清單</h3>
						<ul>
							<li><a href="index">主頁</a></li>
							<li>願望清單</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->


	<!--wishlist area start -->
	<div class="wishlist_area mt-100">
		<div class="container">
			<form action="#">
				<div class="row">
					<div class="col-12">
						<div class="table_desc wishlist">
							<div class="cart_page table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product_remove">刪除</th>
											<th class="product_thumb">照片</th>
											<th class="product_name">商品</th>
											<th class="product-price">價錢</th>
											<th class="product_quantity">庫存</th>
											<th class="product_total">添加至購物車</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="product_remove"><a href="#">X</a></td>
											<td class="product_thumb"><a href="#"><img
													src="${ctx}/assets/img/s-product/product.jpg" alt=""></a></td>
											<td class="product_name"><a href="#">Handbag
													fringilla</a></td>
											<td class="product-price">£65.00</td>
											<td class="product_quantity">In Stock</td>
											<td class="product_total"><a href="#">添加</a></td>


										</tr>

										<tr>
											<td class="product_remove"><a href="#">X</a></td>
											<td class="product_thumb"><a href="#"><img
													src="${ctx}/assets/img/s-product/product2.jpg" alt=""></a></td>
											<td class="product_name"><a href="#">Handbags justo</a></td>
											<td class="product-price">£90.00</td>
											<td class="product_quantity">In Stock</td>
											<td class="product_total"><a href="#">添加</a></td>


										</tr>
										<tr>
											<td class="product_remove"><a href="#">X</a></td>
											<td class="product_thumb"><a href="#"><img
													src="${ctx}/assets/img/s-product/product3.jpg" alt=""></a></td>
											<td class="product_name"><a href="#">Handbag elit</a></td>
											<td class="product-price">£80.00</td>
											<td class="product_quantity">In Stock</td>
											<td class="product_total"><a href="#">添加</a></td>


										</tr>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>

			</form>
			<div class="row">
				<div class="col-12">
					<div class="wishlist_share">
						<h4>分享</h4>
						<ul>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
							<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
							<li><a href="#"><i class="fa fa-tumblr"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--wishlist area end -->

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



</body>

</html>