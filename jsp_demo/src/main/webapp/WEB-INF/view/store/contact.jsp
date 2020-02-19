<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>服務據點及聯絡我們</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/assets/img/favicon.ico">
<link rel="stylesheet"
	href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css">

	
	

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

<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>  

</head>

<body>

	<!--header area start-->

	<!--offcanvas menu area start-->
	<c:import url="header.jsp" />
	<!--header area end-->

	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>服務據點及聯絡我們</h3>
						<ul>
							<li><a href="index">主頁</a></li>
							<li>服務據點及聯絡我們</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--contact map start-->
	<div class="contact_map mt-100">
		<div class="map-area">
			<div id="googleMap"></div>
		</div>
	</div>
	<!--contact map end-->

	<!--contact area start-->
	<div class="contact_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<div class="contact_message content">

						<p>您有任何需求要與本網站聯繫，請利用右列表單填妥後！點選 [送出表單] 即可。我們有專人會儘速為您提供服務。</p>
						<ul>
							<li><i class="fa fa-fax"></i> 地址 : 106台北市大安區復興南路一段390號
								2,3號2樓</li>
							<li><i class="fa fa-phone"></i> <a>0975-191-190</a></li>
							<li><i class="fa fa-envelope-o"></i><a>eeit11019@gmail.com</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
					<div class="contact_message form">
						<h3>聯絡我們</h3>
						<form id="contact-form" method="POST"
							action="${ctx}/store/sendemail">
							<p>
								<label> 您的姓名 (必填)</label> <input name="name" placeholder="姓名*"
									type="text">
							</p>
							<p>
								<label> 您的 Email (必填)</label> <input name="email"
									placeholder="Email *" type="email">
							</p>
							<p>
								<label> 標題</label> <input name="mailsubject" placeholder="標題 *"
									type="text">
							</p>
							<div class="contact_textarea">
								<label> 您的問題</label>
								<textarea placeholder="問題 *" name="mailmessage"
									class="form-control2"></textarea>
							</div>
							<button type="submit" onclick="test()">送出表單</button>
							<!--                             <p class="form-messege"></p> -->
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!--contact area end-->

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
	<c:import url="footer.jsp" />
	<!--footer area end-->



	<!-- JS
============================================ -->

	<!--map js code here-->
	<script
		src="http://www.google.com/maps/api/js?sensor=false&amp;libraries=geometry&amp;v=3.22&amp;key=AIzaSyBYBKrlDk3U8F_gFcRobRVqfvS8PmF_m8o&q=資策會"></script>
	<!-- <script  src="http://www.google.com/jsapi"></script> -->
	<script src="${ctx}/assets/js/map.js"></script>

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
function test(){
// 	if(!document.getElementByName('name').value){
// 		Swal.fire({text:'名字不能為空白',type:'error'});
// 	}
	Swal.fire({text:'表單已送出,將會有專人盡快與您聯繫',type:'success'});
// 	Swal.fire('表單已送出,將會有專人盡快與您聯繫','success')
}
</script>




</body>

</html>