<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>服務</title>
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
						<h3>Services</h3>
						<ul>
							<li><a href="index">home</a></li>
							<li>our services</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--services img area-->
	<div class="services_gallery mt-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single_services">
						<div class="services_thumb">
							<img src="${ctx}/assets/img/service/services1.jpg" alt="">
						</div>
						<div class="services_content">
							<h3>DESIGN THE COVER</h3>
							<p>Mirum est notare quam littera gothica, quam nunc putamus
								parum claram, anteposuerit litterarum formas humanitatis per
								seacula quarta decima et quinta decima.</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_services">
						<div class="services_thumb">
							<img src="${ctx}/assets/img/service/services2.jpg" alt="">
						</div>
						<div class="services_content">
							<h3>DESIGN THE COVER</h3>
							<p>Mirum est notare quam littera gothica, quam nunc putamus
								parum claram, anteposuerit litterarum formas humanitatis per
								seacula quarta decima et quinta decima.</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_services">
						<div class="services_thumb">
							<img src="${ctx}/assets/img/service/services3.jpg" alt="">
						</div>
						<div class="services_content">
							<h3>DESIGN THE COVER</h3>
							<p>Mirum est notare quam littera gothica, quam nunc putamus
								parum claram, anteposuerit litterarum formas humanitatis per
								seacula quarta decima et quinta decima.</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--services img end-->

	<!--our services area-->
	<div class="our_services">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="services_title">
						<h2>OUR SERVICES</h2>
						<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
							velit esse molestie consequat, vel illum dolore eu feugiat nulla
							facilisis at vero eros et accumsan et iusto odio dignissim qui
							blandit..</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-sliders" aria-hidden="true"></i>
						</div>
						<div class="services_desc">
							<h3>BRANDING</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-umbrella"></i>
						</div>
						<div class="services_desc">
							<h3>WEB DESIGN</h3>

							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">

							<i class="fa fa-camera"></i>

						</div>
						<div class="services_desc">
							<h3>PHOTOGRAPHY</h3>

							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-cog"></i>
						</div>
						<div class="services_desc">
							<h3>WEB DEVELOPMENT</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-file-code-o" aria-hidden="true"></i>
						</div>
						<div class="services_desc">
							<h3>CODING</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-bar-chart" aria-hidden="true"></i>
						</div>
						<div class="services_desc">
							<h3>MARKETING</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-headphones"></i>
						</div>
						<div class="services_desc">
							<h3>SUPPORT</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="services_item">
						<div class="services_icone">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="services_desc">
							<h3>GRAPHIC DESIGN</h3>
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--our services area end-->


	<!--services section area-->
	<div class="unlimited_services">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-12">
					<div class="services_section_thumb">
						<img src="${ctx}/assets/img/service/services4.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
					<div class="unlimited_services_content">
						<h1>UNLIMITED IDEAS</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Laudantium, suscipit dolorum ullam soluta voluptatem quasi
							molestias illum possimus, accusantium assumenda inventore debitis
							ducimus. Quis ducimus, consequatur corrupti, sunt rerum sit atque
							eum inventore. Autem excepturi reiciendis voluptate totam sit,
							sunt fugiat voluptatum beatae voluptas ab quia vitae accusamus
							assumenda facilis perferendis, quam itaque aliquid qui omnis
							culpa consectetur placeat ipsa quaerat.</p>
						<div class="view__work">
							<a href="#">MORE INFO <i class="fa fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--services section end-->

	<!--price table area -->
	<div class="priceing_table">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="single_priceing">
						<div class="priceing_title">
							<h1>Standard</h1>
						</div>
						<div class="priceing_list">
							<h1>
								<span>£19</span>/Month
							</h1>
							<ul>
								<li>2 GB Webspace</li>
								<li>1 Domain</li>
								<li>PHP 5 Enbled</li>
								<li>24H – Support</li>
							</ul>
							<a href="#">purchase now </a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single_priceing">
						<div class="priceing_title">
							<h1>Returns</h1>
						</div>
						<div class="priceing_list">
							<h1>
								<span>£23</span>/Month
							</h1>
							<ul>
								<li>2 GB Webspace</li>
								<li>1 Domain</li>
								<li>PHP 5 Enbled</li>
								<li>24H – Support</li>
							</ul>
							<a class="list_button" href="#">purchase now </a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single_priceing">
						<div class="priceing_title">
							<h1>Affiliate</h1>
						</div>
						<div class="priceing_list">
							<h1>
								<span>£20</span>/Month
							</h1>
							<ul>
								<li>2 GB Webspace</li>
								<li>1 Domain</li>
								<li>PHP 5 Enbled</li>
								<li>24H – Support</li>
							</ul>
							<a href="#">purchase now </a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single_priceing">
						<div class="priceing_title">
							<h1>Specials</h1>
						</div>
						<div class="priceing_list">
							<h1>
								<span>£25</span>/Month
							</h1>
							<ul>
								<li>2 GB Webspace</li>
								<li>1 Domain</li>
								<li>PHP 5 Enbled</li>
								<li>24H – Support</li>
							</ul>
							<a class="list_button" href="#">purchase now </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--price table  end-->

	<!--advantages wordpress -->
	<div class="advantages_ecommerce">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7 col-md-8 col-sm-12">
					<div class="advantages_content">
						<h3>Advantages of Mobile ecommerce theme</h3>
						<p>Build a professional website system and great user
							experience</p>
					</div>
				</div>
				<div class="col-lg-5 col-md-4 col-sm-12">
					<div class="advantages_button">
						<a href="#" title="MORE INFO ">MORE INFO <i
							class="fa fa-angle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--advantages wordpress end-->

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