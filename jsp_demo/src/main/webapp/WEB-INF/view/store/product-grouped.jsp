<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Lukani - product grouped</title>
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
							<li><a href="index">home</a></li>
							<li>product grouped</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--product details start-->
	<div class="product_details product_grouped mt-100 mb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product-details-tab">
						<div id="img-1" class="zoomWrapper single-zoom">
							<a href="#"> <img id="zoom1"
								src="${ctx}/assets/img/product/productbig4.jpg"
								data-zoom-image="${ctx}/assets/img/product/productbig4.jpg" alt="big-1">
							</a>
						</div>
						<div class="single-zoom-thumb">
							<ul class="s-tab-zoom owl-carousel single-product-active"
								id="gallery_01">
								<li><a href="#" class="elevatezoom-gallery active"
									data-update="" data-image="${ctx}/assets/img/product/productbig4.jpg"
									data-zoom-image="${ctx}/assets/img/product/productbig4.jpg"> <img
										src="${ctx}/assets/img/product/productbig4.jpg" alt="zo-th-1" />
								</a></li>
								<li><a href="#" class="elevatezoom-gallery active"
									data-update="" data-image="${ctx}/assets/img/product/productbig1.jpg"
									data-zoom-image="${ctx}/assets/img/product/productbig1.jpg"> <img
										src="${ctx}/assets/img/product/productbig1.jpg" alt="zo-th-1" />
								</a></li>
								<li><a href="#" class="elevatezoom-gallery active"
									data-update="" data-image="${ctx}/assets/img/product/productbig2.jpg"
									data-zoom-image="${ctx}/assets/img/product/productbig2.jpg"> <img
										src="${ctx}/assets/img/product/productbig2.jpg" alt="zo-th-1" />
								</a></li>
								<li><a href="#" class="elevatezoom-gallery active"
									data-update="" data-image="${ctx}/assets/img/product/productbig3.jpg"
									data-zoom-image="${ctx}/assets/img/product/productbig3.jpg"> <img
										src="${ctx}/assets/img/product/productbig3.jpg" alt="zo-th-1" />
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product_d_right">
						<form action="#">

							<h1>
								<a href="#">commodo augue nisi</a>
							</h1>
							<div class="product_nav">
								<ul>
									<li class="prev"><a href="product-details"><i
											class="fa fa-angle-left"></i></a></li>
									<li class="next"><a href="product-sidebar"><i
											class="fa fa-angle-right"></i></a></li>
								</ul>
							</div>
							<div class=" product_ratting">
								<ul>
									<li><a href="#"><i class="icon-star"></i></a></li>
									<li><a href="#"><i class="icon-star"></i></a></li>
									<li><a href="#"><i class="icon-star"></i></a></li>
									<li><a href="#"><i class="icon-star"></i></a></li>
									<li><a href="#"><i class="icon-star"></i></a></li>
									<li class="review"><a href="#"> (customer review ) </a></li>
								</ul>

							</div>
							<div class="price_box">
								<span class="current_price">$70.00</span> <span
									class="old_price">$80.00</span>

							</div>
							<div class="product_desc">
								<p>eget velit. Donec ac tempus ante. Fusce ultricies massa
									massa. Fusce aliquam, purus eget sagittis vulputate, sapien
									libero hendrerit est, sed commodo augue nisi non neque. Lorem
									ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor,
									lorem et placerat vestibulum, metus nisi posuere nisl, in</p>
							</div>


							<div class="grouped_form table-responsive">
								<table>
									<tbody>
										<tr>
											<td class="grouped-product-list quantity"><input
												type="checkbox"></td>
											<td class="grouped-product-list label"><a href="#">Shave
													Brush</a></td>
											<td class="grouped-product-list price"><del>123.00</del>
												99.00</td>
										</tr>
										<tr>
											<td class="grouped-product-list quantity"><input min="1"
												value="1" max="100" type="number"></td>
											<td class="grouped-product-list label"><a href="#">Aftershave
													Lotion</a></td>
											<td class="grouped-product-list price">$80.00</td>
										</tr>
										<tr>
											<td class="grouped-product-list quantity"><input min="1"
												value="1" max="100" type="number"></td>
											<td class="grouped-product-list label"><a href="#">White
													Shave Brush</a></td>
											<td class="grouped-product-list price">$119.00
												<p>198 in stock</p>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
							<div class=" product_d_action">
								<ul>
									<li><a href="#" title="Add to wishlist">+ Add to
											Wishlist</a></li>
									<li><a href="#" title="Add to wishlist">+ Compare</a></li>
								</ul>
							</div>
							<div class="product_meta">
								<span>Category: <a href="#">Clothing</a></span>
							</div>

						</form>
						<div class="priduct_social">
							<ul>
								<li><a class="facebook" href="#" title="facebook"><i
										class="fa fa-facebook"></i> Like</a></li>
								<li><a class="twitter" href="#" title="twitter"><i
										class="fa fa-twitter"></i> tweet</a></li>
								<li><a class="pinterest" href="#" title="pinterest"><i
										class="fa fa-pinterest"></i> save</a></li>
								<li><a class="google-plus" href="#" title="google +"><i
										class="fa fa-google-plus"></i> share</a></li>
								<li><a class="linkedin" href="#" title="linkedin"><i
										class="fa fa-linkedin"></i> linked</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--product details end-->

	<!--product info start-->
	<div class="product_d_info mb-90">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_d_inner">
						<div class="product_info_button">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#info"
									role="tab" aria-controls="info" aria-selected="false">Description</a>
								</li>
								<li><a data-toggle="tab" href="#sheet" role="tab"
									aria-controls="sheet" aria-selected="false">Specification</a></li>
								<li><a data-toggle="tab" href="#reviews" role="tab"
									aria-controls="reviews" aria-selected="false">Reviews (1)</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="info" role="tabpanel">
								<div class="product_info_content">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam fringilla augue nec est tristique auctor. Donec non est at
										libero vulputate rutrum. Morbi ornare lectus quis justo
										gravida semper. Nulla tellus mi, vulputate adipiscing cursus
										eu, suscipit id nulla.</p>
									<p>Pellentesque aliquet, sem eget laoreet ultrices, ipsum
										metus feugiat sem, quis fermentum turpis eros eget velit.
										Donec ac tempus ante. Fusce ultricies massa massa. Fusce
										aliquam, purus eget sagittis vulputate, sapien libero
										hendrerit est, sed commodo augue nisi non neque. Lorem ipsum
										dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem
										et placerat vestibulum, metus nisi posuere nisl, in accumsan
										elit odio quis mi. Cras neque metus, consequat et blandit et,
										luctus a nunc. Etiam gravida vehicula tellus, in imperdiet
										ligula euismod eget.</p>
								</div>
							</div>
							<div class="tab-pane fade" id="sheet" role="tabpanel">
								<div class="product_d_table">
									<form action="#">
										<table>
											<tbody>
												<tr>
													<td class="first_child">Compositions</td>
													<td>Polyester</td>
												</tr>
												<tr>
													<td class="first_child">Styles</td>
													<td>Girly</td>
												</tr>
												<tr>
													<td class="first_child">Properties</td>
													<td>Short Dress</td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
								<div class="product_info_content">
									<p>Fashion has been creating well-designed collections
										since 2010. The brand offers feminine designs delivering
										stylish separates and statement dresses which have since
										evolved into a full ready-to-wear collection in which every
										item is a vital part of a woman's wardrobe. The result? Cool,
										easy, chic looks with youthful elegance and unmistakable
										signature style. All the beautiful pieces are made in Italy
										and manufactured with the greatest attention. Now Fashion
										extends to a range of accessories including shoes, hats, belts
										and more!</p>
								</div>
							</div>

							<div class="tab-pane fade" id="reviews" role="tabpanel">
								<div class="reviews_wrapper">
									<h2>1 review for Donec eu furniture</h2>
									<div class="reviews_comment_box">
										<div class="comment_thmb">
											<img src="${ctx}/assets/img/blog/comment2.jpg" alt="">
										</div>
										<div class="comment_text">
											<div class="reviews_meta">
												<div class="star_rating">
													<ul>
														<li><a href="#"><i class="icon-star"></i></a></li>
														<li><a href="#"><i class="icon-star"></i></a></li>
														<li><a href="#"><i class="icon-star"></i></a></li>
														<li><a href="#"><i class="icon-star"></i></a></li>
														<li><a href="#"><i class="icon-star"></i></a></li>
													</ul>
												</div>
												<p>
													<strong>admin </strong>- September 12, 2018
												</p>
												<span>roadthemes</span>
											</div>
										</div>

									</div>
									<div class="comment_title">
										<h2>Add a review</h2>
										<p>Your email address will not be published. Required
											fields are marked</p>
									</div>
									<div class="product_ratting mb-10">
										<h3>Your rating</h3>
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<div class="product_review_form">
										<form action="#">
											<div class="row">
												<div class="col-12">
													<label for="review_comment">Your review </label>
													<textarea name="comment" id="review_comment"></textarea>
												</div>
												<div class="col-lg-6 col-md-6">
													<label for="author">Name</label> <input id="author"
														type="text">

												</div>
												<div class="col-lg-6 col-md-6">
													<label for="email">Email </label> <input id="email"
														type="text">
												</div>
											</div>
											<button type="submit">Submit</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product info end-->

	<!--product area start-->
	<section class="product_area upsell_products">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>Related Products</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="product_carousel product_column4 owl-carousel">
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product7.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-4%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">sapien libero</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£69.00</span> <span
											class="old_price">£74.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product8.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-6%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">vulputate rutrum</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£64.00</span> <span
											class="old_price">£72.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product9.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-8%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">adipiscing cursus</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£60.00</span> <span
											class="old_price">£70.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product10.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-9%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">Donec eu cook</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£67.00</span> <span
											class="old_price">£77.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product1.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-7%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">commodo augue nisi</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£69.00</span> <span
											class="old_price">£74.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
					<div class="col-lg-3">
						<article class="single_product">
							<figure>
								<div class="product_thumb">
									<a class="primary_img" href="product-details"><img
										src="${ctx}/assets/img/product/product2.jpg" alt=""></a>
									<div class="label_product">
										<span class="label_sale">-9%</span>
									</div>
									<div class="action_links">
										<ul>
											<li class="add_to_cart"><a href="cart"
												title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
											<li class="compare"><a href="#" title="Add to Compare"><i
													class="icon-sliders"></i></a></li>
											<li class="wishlist"><a href="wishlist"
												title="Add to Wishlist"><i class="icon-heart"></i></a></li>
											<li class="quick_button"><a href="#" data-toggle="modal"
												data-target="#modal_box" title="quick view"> <i
													class="icon-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<figcaption class="product_content">
									<div class="product_rating">
										<ul>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
											<li><a href="#"><i class="icon-star"></i></a></li>
										</ul>
									</div>
									<h4 class="product_name">
										<a href="product-details">eget sagittis</a>
									</h4>
									<div class="price_box">
										<span class="current_price">£65.00</span> <span
											class="old_price">£70.00</span>
									</div>
								</figcaption>
							</figure>
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--product area end-->

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

	<!-- modal area start-->
	<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="icon-x"></i></span>
				</button>
				<div class="modal_body">
					<div class="container">
						<div class="row">
							<div class="col-lg-5 col-md-5 col-sm-12">
								<div class="modal_tab">
									<div class="tab-content product-details-large">
										<div class="tab-pane fade show active" id="tab1"
											role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="${ctx}/assets/img/product/productbig1.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab2" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="${ctx}/assets/img/product/productbig2.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab3" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="${ctx}/assets/img/product/productbig3.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab4" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="${ctx}/assets/img/product/productbig4.jpg" alt=""></a>
											</div>
										</div>
									</div>
									<div class="modal_tab_button">
										<ul class="nav product_navactive owl-carousel" role="tablist">
											<li><a class="nav-link active" data-toggle="tab"
												href="#tab1" role="tab" aria-controls="tab1"
												aria-selected="false"><img
													src="${ctx}/assets/img/product/product1.jpg" alt=""></a></li>
											<li><a class="nav-link" data-toggle="tab" href="#tab2"
												role="tab" aria-controls="tab2" aria-selected="false"><img
													src="${ctx}/assets/img/product/product2.jpg" alt=""></a></li>
											<li><a class="nav-link button_three" data-toggle="tab"
												href="#tab3" role="tab" aria-controls="tab3"
												aria-selected="false"><img
													src="${ctx}/assets/img/product/product3.jpg" alt=""></a></li>
											<li><a class="nav-link" data-toggle="tab" href="#tab4"
												role="tab" aria-controls="tab4" aria-selected="false"><img
													src="${ctx}/assets/img/product/product8.jpg" alt=""></a></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-12">
								<div class="modal_right">
									<div class="modal_title mb-10">
										<h2>Donec Ac Tempus</h2>
									</div>
									<div class="modal_price mb-10">
										<span class="new_price">$64.99</span> <span class="old_price">$78.99</span>
									</div>
									<div class="modal_description mb-15">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Mollitia iste laborum ad impedit pariatur esse optio
											tempora sint ullam autem deleniti nam in quos qui nemo ipsum
											numquam, reiciendis maiores quidem aperiam, rerum vel
											recusandae</p>
									</div>
									<div class="variants_selects">
										<div class="variants_size">
											<h2>size</h2>
											<select class="select_option">
												<option selected value="1">s</option>
												<option value="1">m</option>
												<option value="1">l</option>
												<option value="1">xl</option>
												<option value="1">xxl</option>
											</select>
										</div>
										<div class="variants_color">
											<h2>color</h2>
											<select class="select_option">
												<option selected value="1">purple</option>
												<option value="1">violet</option>
												<option value="1">black</option>
												<option value="1">pink</option>
												<option value="1">orange</option>
											</select>
										</div>
										<div class="modal_add_to_cart">
											<form action="#">
												<input min="1" max="100" step="2" value="1" type="number">
												<button type="submit">add to cart</button>
											</form>
										</div>
									</div>
									<div class="modal_social">
										<h2>Share this product</h2>
										<ul>
											<li class="facebook"><a href="#"><i
													class="fa fa-facebook"></i></a></li>
											<li class="twitter"><a href="#"><i
													class="fa fa-twitter"></i></a></li>
											<li class="pinterest"><a href="#"><i
													class="fa fa-pinterest"></i></a></li>
											<li class="google-plus"><a href="#"><i
													class="fa fa-google-plus"></i></a></li>
											<li class="linkedin"><a href="#"><i
													class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal area end-->



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