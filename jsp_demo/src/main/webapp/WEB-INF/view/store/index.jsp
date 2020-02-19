<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>鴨鴨商城</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/assets/img/favicon.ico">
	<link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 

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

	<!--slider area start-->
	<section class="slider_section">
		<div class="slider_area owl-carousel">
<c:forEach var="carousel" items="${carouselAll}">
				<div class="single_slider d-flex align-items-center"
					data-bgimg="${ctx}${carousel.imageSrc}">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="slider_content">
								<h1 style="margin-top: 65px;"> </h1>
									<a class="button" href="${carousel.hyperlink}">立即前往 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
</c:forEach>
		</div>
	</section>
	<!--slider area end-->

	<!--shipping area start-->
	<div class="shipping_area" style="margin-left: 180px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single_shipping">
						<div class="shipping_icone">
							<img src="${ctx}/assets/img/about/shipping1.png" alt="">
						</div>
						<div class="shipping_content">
							<h3>免費運送</h3>
							<p>
								全台免費送貨 <br> 訂單超過 3000NT
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_shipping col_2">
						<div class="shipping_icone">
							<img src="${ctx}/assets/img/about/shipping2.png" alt="">
						</div>
						<div class="shipping_content">
							<h3>安全付款</h3>
							<p>
								使用我們的網站付款 <br> 不必擔心您的資料外洩
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_shipping col_3">
						<div class="shipping_icone">
							<img src="${ctx}/assets/img/about/shipping3.png" alt="">
						</div>
						<div class="shipping_content">
							<h3>友善服務</h3>
							<p>
								您的訂單保證7天 <br> 免費退費
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--shipping area end-->

	<!--banner area start-->
	<div class="banner_area">
		<div class="container">
			<div class="row">
<c:forEach var="priductDiscount" items="${priductDiscount}" end="0">			
				<div class="col-lg-6 col-md-6">
					<figure class="single_banner">
						<div class="banner_thumb" style="text-align:center;">
							<a href="product-details?id=${priductDiscount.product.id}"><img src="${ctx}/${priductDiscount.product.productImage[0].src}"
								alt="" style="height:350px;"></a>
							<div class="banner_content">
								<h2 style="color:red;">特價商品</h2>
								<h2>
									<br>
								</h2>
								<a href="product-details?id=${priductDiscount.product.id}">立即前往</a>
							</div>
						</div>
					</figure>
				</div>
</c:forEach>				
<c:forEach var="HotProduct" items="${orderItem}" end="0">
				<div class="col-lg-6 col-md-6">
					<figure class="single_banner">
						<div class="banner_thumb" style="text-align:center;">
							<a href="product-details?id=${HotProduct.id}"><img src="${ctx}/${HotProduct.productImage[0].src}"
								alt=""  style="height:350px;"></a>
							<div class="banner_content">
								<h2 style="color:red;">熱門商品</h2>
								<h2>
									<br>
								</h2>
								<a href="product-details?id=${HotProduct.id}">立即前往</a>
							</div>
						</div>
					</figure>
				</div>
</c:forEach>				
			</div>
		</div>
	</div>
	<!--banner area end-->

	<!--product area start-->
	<div class="product_area  mb-95">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_header">
						<div class="section_title">
							<h2>商品</h2>
						</div>
						<div class="product_tab_btn">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#plant1"
									role="tab" aria-controls="plant1" aria-selected="true"
									onclick="productCat('2')">  手機 </a></li>
								<li><a data-toggle="tab" href="#plant2" role="tab"
									aria-controls="plant2" aria-selected="false"
									onclick="productCat('5')"> 配件 </a></li>
								<li><a data-toggle="tab" href="#plant3" role="tab"
									aria-controls="plant3" aria-selected="false"> 數位週邊 </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="plant1" role="tabpanel">
					<div class="row" id="productCar">
						<div class="product_carousel product_column4 owl-carousel" id="productCar">
							
<c:forEach var="product" items="${productAll}" begin="0" end="9">

								<div class="col-lg-3">
									<div class="product_items" id="productDiv">
										<article class="single_product">
											<figure>
												<div class="product_thumb">
													<a class="primary_img"
														href="product-details?id=${product.id}"><img
														src="${ctx}/${product.productImage[0].src}" alt=""></a>
												</div>
												<figcaption class="product_content">
													<h4 class="product_name">
														<a href="product-details?id=${product.id}">${product.productName}</a>
													</h4>
													<div class="price_box">
														<span class="current_price">$${product.productSku[0].originalPrice}</span>
													</div>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>

</c:forEach>
				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product area end-->

	<!--product area start-->
	<div class="product_area product_deals ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>本月特惠</h2>
					</div>
				</div>
			</div>
			<div class="product_deals_container">
				<div class="row">
					<div class="product_carousel product_column5 owl-carousel">

<c:forEach var="priductDiscount" items="${priductDiscount}">
		<c:if test="${priductDiscount.productStatus == true }">						
						<div class="col-lg-3">
							<article class="single_product">
								<figure>
									<div class="product_thumb">
										<a class="primary_img" href="product-details?id=${priductDiscount.product.id}"><img
											src="${ctx}/${priductDiscount.product.productImage[0].src}" alt=""></a>
										<div class="label_product">
											<span class="label_sale">${priductDiscount.sellingPrice/10}折</span>
										</div>
									</div>
									<figcaption class="product_content">
										<h4 class="product_name">${priductDiscount.product.productName}</h4>
										<h4 class="product_name">${priductDiscount.spec}</h4>										
										<div class="price_box">
											<span class="current_price">$<fmt:formatNumber
																	type="number"
																	value="${(priductDiscount.originalPrice*priductDiscount.sellingPrice)/100}"
																	pattern="#0" /></span> <span
												class="old_price">$${priductDiscount.originalPrice}</span>
										</div>
									</figcaption>
								</figure>
							</article>
						</div>
					</c:if>	
</c:forEach>						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product area end-->

	<!--testimonial area start-->
	<%-- <div class="testimonial_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>客戶的評價</h2>
					</div>
				</div>
			</div>
			<div class="testimonial_container">
				<div class="row">
					<div class="testimonial_carousel owl-carousel">
						<div class="col-12">
							<div class="single-testimonial">
								<div class="testimonial-icon-img">
									<img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>
										“ When a beautiful design is combined with powerful
										technology, <br> it truly is an artwork. I love how my
										website operates and looks with this theme. Thank you for the
										awesome product. ”
									</p>
									<div class="testimonial_text_img">
										<a href="#"><img
											src="${ctx}/assets/img/about/testimonial1.png" alt=""></a>
									</div>
									<div class="testimonial_author">
										<p>
											<a href="#">Rebecka Filson</a> / <span>CEO of CSC</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="single-testimonial">
								<div class="testimonial-icon-img">
									<img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>
										“ When a beautiful design is combined with powerful
										technology, <br> it truly is an artwork. I love how my
										website operates and looks with this theme. Thank you for the
										awesome product. ”
									</p>
									<div class="testimonial_text_img">
										<a href="#"><img
											src="${ctx}/assets/img/about/testimonial2.png" alt=""></a>
									</div>
									<div class="testimonial_author">
										<p>
											<a href="#">Amber Laha</a> / <span>CEO of DND</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="single-testimonial">
								<div class="testimonial-icon-img">
									<img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>
										“ When a beautiful design is combined with powerful
										technology, <br> it truly is an artwork. I love how my
										website operates and looks with this theme. Thank you for the
										awesome product. ”
									</p>
									<div class="testimonial_text_img">
										<a href="#"><img
											src="${ctx}/assets/img/about/testimonial3.png" alt=""></a>
									</div>
									<div class="testimonial_author">
										<p>
											<a href="#">Lindsy Neloms</a> / <span>CEO of SFD</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<!--testimonial area end-->

	<!-- blog area start
    <section class="blog_section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                       <h2>最新消息</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="blog_carousel blog_column3 owl-carousel">
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details"><img src="${ctx}/assets/img/blog/blog1.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details">Libero lorem</a></h4>
                                   <div class="articles_date">
                                        <p>By <span>admin / July 16, 2019</span></p>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <footer class="blog_footer">
                                        <a href="blog-details">Continue Reading</a>
                                        <p><i class="icon-message-circle"></i> <span>0</span></p>
                                    </footer>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details"><img src="${ctx}/assets/img/blog/blog2.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details">Blog image post</a></h4>
                                   <div class="articles_date">
                                        <p>By <span>admin / July 16, 2019</span></p>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <footer class="blog_footer">
                                        <a href="blog-details">Continue Reading</a>
                                        <p><i class="icon-message-circle"></i> <span>0</span></p>
                                    </footer>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details"><img src="${ctx}/assets/img/blog/blog3.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details">Post with Gallery</a></h4>
                                   <div class="articles_date">
                                        <p>By <span>admin / July 16, 2019</span></p>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <footer class="blog_footer">
                                        <a href="blog-details">Continue Reading</a>
                                        <p><i class="icon-message-circle"></i> <span>0</span></p>
                                    </footer>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details"><img src="${ctx}/assets/img/blog/blog2.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details">Post with Audio</a></h4>
                                   <div class="articles_date">
                                        <p>By <span>admin / July 16, 2019</span></p>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <footer class="blog_footer">
                                        <a href="blog-details">Continue Reading</a>
                                        <p><i class="icon-message-circle"></i> <span>0</span></p>
                                    </footer>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
	<!--blog area end-->

	<!--newsletter area start-->
	<!-- <div class="newsletter_area_start">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>
							Get <span>20% Off</span> Your Next Order
						</h2>
					</div>
					<div class="newsletter_container">
						<div class="subscribe_form">
							<form id="mc-form" class="mc-form footer-newsletter">
								<input id="mc-email" type="email" autocomplete="off"
									placeholder="Enter you email" />
								<button id="mc-submit">Subscribe</button>
								<div class="email_icon">
									<i class="icon-mail"></i>
								</div>
							</form>
							mailchimp-alerts Start
							<div class="mailchimp-alerts text-centre">
								<div class="mailchimp-submitting"></div>
								mailchimp-submitting end
								<div class="mailchimp-success"></div>
								mailchimp-success end
								<div class="mailchimp-error"></div>
								mailchimp-error end
							</div>
							mailchimp-alerts end
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!--newsletter area end-->

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
										<h2>Google Pixel 4</h2>
									</div>
									<div class="modal_price mb-10">
										<span class="new_price">$21600</span> <span class="old_price">$24600</span>
									</div>
									<div class="modal_description mb-15">
										<p>透過 Titan M 晶片打造堅若磐石的防護。 專屬的 Titan M5
											安全防護晶片可保護你的重要機密資料安全無虞。 3 年的更新支援。 提供 3
											年的安全性和作業系統更新，讓你的手機保持最佳執行效能。6 內建應用程式保護機制 Google Play
											安全防護服務會自動掃描應用程式，確保你的資料和裝置安全無虞。</p>
									</div>
									<div class="variants_selects">
										<div class="variants_size">
											<h2>規格</h2>
											<select class="select_option">
												<option selected value="1">Google Pixel 4</option>
												<option value="1">Google Pixel 4 xl</option>
											</select>
										</div>
										<div class="variants_color">
											<h2>顏色</h2>
											<select class="select_option">
												<option selected value="1">紅色</option>
												<option value="1">黑色</option>
												<option value="1">白色</option>
												<option value="1">玫瑰金</option>
												<option value="1">深藍色</option>
											</select>
										</div>
										<div class="modal_add_to_cart">
											<form action="#">
												<input min="1" max="100" step="2" value="1" type="number">
												<button type="submit">加入購物車</button>
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

	<!--news letter popup start-->
	<!--  <div class="newletter-popup">
        <div id="boxes" class="newletter-container">
            <div id="dialog" class="window">
                <div id="popup2">
                    <span class="b-close"><span>close</span></span>
                </div>
                <div class="box">
                    <div class="newletter-title">
                        <h2>Newsletter</h2>
                    </div>
                    <div class="box-content newleter-content">
                        <label class="newletter-label">Enter your email address to subscribe our notification of our new post &amp; features by email.</label>
                        <div id="frm_subscribe">
                            <form name="subscribe" id="subscribe_popup">
                                    <span class="required">*</span><span>Enter you email address here...</span>
                                    <input type="text" value="" name="subscribe_pemail" id="subscribe_pemail" placeholder="Enter you email address here...">
                                    <input type="hidden" value="" name="subscribe_pname" id="subscribe_pname">
                                    <div id="notification"></div>
                                    <a class="theme-btn-outlined" onclick="email_subscribepopup()"><span>Subscribe</span></a>
                            </form>
                            <div class="subscribe-bottom">
                                <input type="checkbox" id="newsletter_popup_dont_show_again">
                                <label for="newsletter_popup_dont_show_again">Don't show this popup again</label>
                            </div>
                        </div>
                        /#frm_subscribe
                    </div>
                    /.box-content
                </div>
            </div>

        </div>
        /.box
    </div> -->
	<!--news letter popup start-->



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
	<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>

	<!-- <script>
		function productCat(catId){
			$.ajax({
				type:"GET",
				url:"${ctx}/store/productCat",
				dataType:"json",
				data:{
					"categoryId": parseInt(catId)
				},
				success:function(data){
					$('#productCar .owl-stage').html('');
					//var oDiv = $('<div>').addClass('owl-item style="width: 300px;');
				   data.forEach(obj => {
				    	 $('#productCar .owl-stage').append(
				    	 '<div class="owl-item" style="width: 300px;"><div class="col-lg-3"><div class="product_items"><article class="single_product"><figure><div class="product_thumb"><a class="primary_img" href="product-details?id='
							+obj.id+
						'"><img src="${ctx}/assets/img/product/product1.jpg" alt=""></a></div><figcaption class="product_content"><h4 class="product_name"><a href="product-details?id='
							+obj.id+
								'">'
							+ obj.productName +
								'</a></h4><div class="price_box"><span class="current_price">'
							+ obj.productSku[0].originalPrice +
							'</span></div></figcaption></figure></article></div></div></div>'
						 );	
				     })
				}	
			})
		};
	</script> -->
	<script>
		function productCat(catId){
			$.ajax({
				type:"GET",
				url:"${ctx}/store/productCat",
				dataType:"json",
				data:{
					"categoryId": parseInt(catId)
				},
				success:function(data){
					$('#productCar .owl-stage').html('');
				   data.forEach((obj,index) => {
					   if(index <=2){						   
						$('#productCar .owl-stage').append('<div class="owl-item action" style="width:300px;height:348px;padding-right:15px;padding-left:15px;"><div class="col-lg-3"><div class="product_items"><article class="single_product"><figure style="width:270px;height:348px;"><div class="product_thumb"><a class="primary_img" href="product-details?id='
								+obj.id+
								'"><img src="${ctx}/'
								+obj.productImage[0].src+
								'" style="width:270px;height:270px;" alt=""></a></div><figcaption class="product_content"><h4 class="product_name"><a href="product-details?id='
									+obj.id+
										'">'
									+ obj.productName +
										'</a></h4><div class="price_box"><span class="current_price">$'
									+ obj.productSku[0].originalPrice+
										'</span></div></figcaption></figure></article></div></div></div>')
					   }else if(index == 3){						
						$('#productCar .owl-stage').append('<div class="owl-item action last" style="width:300px;height:348px;padding-right:15px;padding-left:15px;"><div class="col-lg-3"><div class="product_items"><article class="single_product"><figure style="width:270px;height:348px;"><div class="product_thumb"><a class="primary_img" href="product-details?id='
								+obj.id+
								'"><img src="${ctx}/'
								+obj.productImage[0].src+
								'" style="width:270px;height:270px;" alt=""></a></div><figcaption class="product_content"><h4 class="product_name"><a href="product-details?id='
									+obj.id+
										'">'
									+ obj.productName +
										'</a></h4><div class="price_box"><span class="current_price">$'
									+ obj.productSku[0].originalPrice+
										'</span></div></figcaption></figure></article></div></div></div>');
					   }else{
						$('#productCar .owl-stage').append('<div class="owl-item" style="width:300px;height:348px;padding-right:15px;padding-left:15px;"><div class="col-lg-3"><div class="product_items"><article class="single_product"><figure style="width:270px;height:348px;"><div class="product_thumb"><a class="primary_img" href="product-details?id='
								+obj.id+
								'"><img src="${ctx}/'
								+obj.productImage[0].src+
								'" style="width:270px;height:270px;" alt=""></a></div><figcaption class="product_content"><h4 class="product_name"><a href="product-details?id='
									+obj.id+
										'">'
									+ obj.productName +
										'</a></h4><div class="price_box"><span class="current_price">$'
									+ obj.productSku[0].originalPrice+
										'</span></div></figcaption></figure></article></div></div></div>');
					   }
				     });
				   data.forEach((obj,index) => {
					   if(index <=4){
							$('#productCar .owl-stage').append('<div class="owl-item cloned" style="width:300px;height:348px;padding-right:15px;padding-left:15px;" id="two'+index+'"></div>')
					   }else{
							$('#productCar .owl-stage').prepend('<div class="owl-item cloned" style="width:300px;height:348px;padding-right:15px;padding-left:15px;" id="two'+index+'"></div>')
					   }
					   $('#productCar #two'+index).append(
						    	 '<div class="col-lg-3"><div class="product_items"><article class="single_product"><figure style="width:270px;height:348px;"><div class="product_thumb"><a class="primary_img" href="product-details?id='
									+obj.id+
								'"><img src="${ctx}/'
								+obj.productImage[0].src+
								'" style="width:270px;height:270px;" alt=""></a></div><figcaption class="product_content"><h4 class="product_name"><a href="product-details?id='
									+obj.id+
										'">'
									+ obj.productName +
										'</a></h4><div class="price_box"><span class="current_price">$'
									+ obj.productSku[0].originalPrice+
										'</span></div></figcaption></figure></article></div></div>'
								 )
				   })
				}	
			})
		};
	</script>  
<script>		
	
			window.onload = function(){							
				if('${LoginOK}'=="ok" && '${fn:substring(username.birthdate,5,7)}' == "02" && '${birthhh}'!=""){
					Swal.fire("${birthhh}")

					
				
				
					
				}
// 				if(num>1){
// 					window.onload= null;
// 				}
			}
</script>



</body>

</html>