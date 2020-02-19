<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>常見問題</title>
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
						<ul>
							<li><a href="index">首頁</a></li>
							<li>常見問題</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--faq area start-->
	<div class="faq_content_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="faq_content_wrapper">
						<h4>以下會有一些常見問題參考</h4>
						<p>詳情請看</p>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Accordion area-->
	<div class="accordion_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div id="accordion" class="card__accordion">
						<div class="card card_dipult">
							<div class="card-header card_accor" id="headingOne">
								<button class="btn btn-link" data-toggle="collapse"
									data-target="#collapseOne" aria-expanded="true"
									aria-controls="collapseOne">
									我有出貨之疑問，我應該要找誰處理? <i class="fa fa-plus"></i> <i class="fa fa-minus"></i>

								</button>

							</div>

							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="card-body">
									<p>若您有何出貨問題，請先與您所購買商品之店家客服中心聯絡。</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingTwo">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseTwo" aria-expanded="false"
									aria-controls="collapseTwo">
									請問訂購方式有:傳真訂購、劃撥訂購嗎? <i class="fa fa-plus"></i>
									<i class="fa fa-minus"></i>

								</button>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordion">
								<div class="card-body">
									<p>商店提供為網路訂購方式，目前暫無提供這些訂購方式，請見諒!
</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingThree">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseThree" aria-expanded="false"
									aria-controls="collapseThree">
									商店會員如何訂購? <i
										class="fa fa-plus"></i> <i class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordion">
								<div class="card-body">
									<p>若您是本商店會員，請先登入您的email帳號及密碼，即可進行購買。</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingfour">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseeight" aria-expanded="false"
									aria-controls="collapseeight">
									非本商店會員如何訂購? <i
										class="fa fa-plus"></i> <i class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapseeight" class="collapse"
								aria-labelledby="headingfour" data-parent="#accordion">
								<div class="card-body">
									<p>若您非本商店會員，請選擇「註冊會員 」，並填入您的個人資料，即可進行購買，訂購成功後我們會將您自動升級為本商店的會員。</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingfive">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapseseven" aria-expanded="false"
									aria-controls="collapseseven">
									如何查詢我的訂單資料呢? <i class="fa fa-plus"></i> <i
										class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapseseven" class="collapse"
								aria-labelledby="headingfive" data-parent="#accordion">
								<div class="card-body">
									<p>請您至本站「我的帳戶」-交易紀錄清單中，即可查詢您在本商店中的交易資料紀錄。</p>
								</div>
							</div>
						</div>

						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingsix">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapsefour" aria-expanded="false"
									aria-controls="collapsefour">
									訂購當時至付款網頁後一片空白，請問是否訂購成功?<i class="fa fa-plus"></i>
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapsefour" class="collapse"
								aria-labelledby="headingsix" data-parent="#accordion">
								<div class="card-body">
									<p>不一定成功，請至本商店「我的帳戶」功能中「交易紀錄清單」中再行確認購買資料。</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingseven">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapsefive" aria-expanded="false"
									aria-controls="collapsefive">
									請問線上分期付款的授權和額度如何計算？ <i
										class="fa fa-plus"></i> <i class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapsefive" class="collapse"
								aria-labelledby="headingseven" data-parent="#accordion">
								<div class="card-body">
									<p>銀行授權是以分期價總額授權，同樣的信用額度也是以分期價總額扣取，但是您付款是分期逐月付款，如六期是分六個月逐月付款。</p>
								</div>
							</div>
						</div>
						<div class="card  card_dipult">
							<div class="card-header card_accor" id="headingeight">
								<button class="btn btn-link collapsed" data-toggle="collapse"
									data-target="#collapsesix" aria-expanded="false"
									aria-controls="collapsesix">
									我是選擇分期付款，為什麼銀行簡訊通知總金額？ <i
										class="fa fa-plus"></i> <i class="fa fa-minus"></i>
								</button>
							</div>
							<div id="collapsesix" class="collapse"
								aria-labelledby="headingeight" data-parent="#accordion">
								<div class="card-body">
									<p>銀行通知消費總金額是沒錯，因為銀行需要對持卡者做授權額度控管，並且安全完善的通知消費者核對總金額，不過在信用卡帳單是會分期扣款，請您放心！</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Accordion area end-->
	<!--faq area end-->

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