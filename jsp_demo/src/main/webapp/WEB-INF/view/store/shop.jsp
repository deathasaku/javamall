<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商品</title>
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
	<c:import url="header.jsp" />
	<!--header area end-->


	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>商品</h3>
						<ul>
							<li><a href="index">主頁</a></li>
							<li>商品</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--shop  area start-->
	<div class="shop_area shop_reverse mt-100 mb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-12">
					<!--sidebar widget start-->
					<aside class="sidebar_widget">
						<div class="widget_inner">
							<div class="widget_list widget_categories">
								<h3>手機與手機配件</h3>
								<ul>
<c:forEach var="category" items="${categoryAll}" varStatus="number">
									<li class="widget_sub_categories sub_categories${number.count}"><a
										href="javascript:void(0);javascript:test(${category.id});">${category.name}</a>
										<ul class="widget_dropdown_categories dropdown_categories${number.count}" id="categoryLevel${category.id}">
										</ul></li>
</c:forEach>								
										
								</ul>
							</div>
							<div class="widget_list widget_filter">
								<h3>價格篩選</h3>
								<form action="${ctx}/store/shop?page=0" method="post">
									<div id="slider-range"></div>
									<button type="submit">確定</button>
									<input type="text" name="price" id="amount" />
								</form>
							</div>
							<div class="widget_list widget_manu">
								<h3>廠商</h3>
								<ul>
									<c:forEach var="brandAlls" items="${brandAll}">
										<li><a
											href="${ctx}/store/shop?page=0&brand=${brandAlls.id}">${brandAlls.brandName}
										</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="widget_list">
								<h3>熱銷</h3>
								<div class="shop_sidebar_product">
<c:forEach var="hotProduct" items="${orderItem}">
										<article class="single_product">
											<figure>
												<div class="product_thumb" >
													<a class="primary_img"
														href="product-details?id=${hotProduct.id}">
<c:forEach var="hotProductImage" items="${hotProduct.productImage}">
	<c:if test="${hotProductImage.firstPic == true }">
								<img src="${ctx}/${hotProduct.productImage[0].src}" style="width:100px;height:100px" alt=""> 
	</c:if>
</c:forEach>																												
														</a>
												</div>
												<figcaption class="product_content">
													<h4 class="product_name">
														<a href="product-details?id=${hotProduct.id}">${hotProduct.productName}</a>
													</h4>
													<div class="price_box">
														<c:choose>
															<c:when
																test="${hotProduct.productSku[0].sellingPrice==100}">
																<span class="current_price">$${hotProduct.productSku[0].originalPrice}</span>
															</c:when>
															<c:otherwise>
																<span class="current_price">$<fmt:formatNumber
																		type="number"
																		value="${(hotProduct.productSku[0].originalPrice*hotProduct.productSku[0].sellingPrice)/100}"
																		pattern="#0" /></span>
																<span class="old_price">$${hotProduct.productSku[0].originalPrice}</span>
															</c:otherwise>
														</c:choose>
													</div>
												</figcaption>
											</figure>
										</article>
</c:forEach>

								</div>
							</div>
						</div>
					</aside>
					<!--sidebar widget end-->
				</div>
				<div class="col-lg-9 col-md-12">
					<!--shop wrapper start-->
					<!--shop toolbar start-->
					<div class="shop_toolbar_wrapper">
						<div class="shop_toolbar_btn">
							<button data-role="grid_3" type="button" class="active btn-grid-3" data-toggle="tooltip" title="3"></button>
                            <button data-role="grid_list" type="button"  class="btn-list" data-toggle="tooltip" title="List"></button>
                        </div>
						<form action="${ctx}/store/shop?page=0" method="POST">
							<div class=" niceselect_option">
								<select class="select_option" name="sort"
									onchange="this.form.submit();">
									<c:choose>
										<c:when test="${sel ==3}">
											<option selected value="3">價格從低到高</option>
											<option value="2">價格從高到低</option>
											<option value="1">最新商品</option>
										</c:when>
										<c:when test="${sel ==2}">
											<option selected value="2">價格從高到低</option>
											<option value="3">價格從低到高</option>
											<option value="1">最新商品</option>
										</c:when>
										<c:otherwise>
											<option selected value="1">最新商品</option>
											<option value="2">價格從高到低</option>
											<option value="3">價格從低到高</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</form>
						<div class="page_amount">
							<p>${page.totalElements}個結果${page.number+1}–${page.totalPages}</p>
						</div>
					</div>
					<!--shop toolbar end-->
					<c:if test="${empty allProduct }"><div style="text-align:center;"><h2>查無此商品</h2></div></c:if>
<c:if test="${! empty allProduct}">	
				
					<div class="row shop_wrapper" style="height:100%;">
<c:forEach var="product" items="${allProduct}">
	<c:set var="countPrice" value="100000000" />
	<c:forEach var="priceDis" items="${product.productSku}">
		<c:if test="${priceDis.sellingPrice*priceDis.originalPrice < countPrice && priceDis.productStatus != false}">
			<c:set var="countPrice" value="${priceDis.sellingPrice*priceDis.originalPrice}" />
 			<c:set var="price" value="${priceDis}" /> 
		</c:if>
	</c:forEach>
							<div class="col-lg-4 col-md-4 col-12 " >
								<article class="single_product">
									<figure>
										<div class="product_thumb"  style="text-align:center;">
											<a class="primary_img"
												href="product-details?id=${product.id}">
<c:forEach var="productImage" items="${product.productImage}">
	<c:if test="${productImage.firstPic == true }">
											<img src="${ctx}/${productImage.src}" style="width:200px;height:200px;" alt="">
	</c:if>										
</c:forEach>																					
												 </a>
											<div class="label_product">
												<c:if test="${price.sellingPrice < 100}">
													<span class="label_sale">${price.sellingPrice/10}折</span>
												</c:if>
											</div>
											<div class="action_links">
												<ul>
													<li class="quick_button"><a href="#"
														data-toggle="modal" data-target="#modal_box"
														title="quick view" onclick="view(this)" id="${product.id}"><input
															type="hidden"><i class="icon-eye"></i></a></li>
												</ul>
											</div>
											<!-- <div class="action_links list_action">
												<ul>
													<li class="quick_button"><a href="#"
														data-toggle="modal" data-target="#modal_box"
														title="quick view"> <i class="icon-eye"></i></a></li>
												</ul>
											</div> -->
										</div>
										<div class="product_content grid_content">
											<div class="product_price_rating">
												<h4 class="product_name">
													<a href="product-details?id=${product.id}">${product.productName}</a>
												</h4>
												<div class="price_box">
													<c:choose>
														<c:when test="${price.sellingPrice==100}">
															<span class="current_price">$${price.originalPrice}</span>
														</c:when>
														<c:otherwise>
															<span class="current_price">$<fmt:formatNumber
																	type="number"
																	value="${(price.originalPrice*price.sellingPrice)/100}"
																	pattern="#0" /></span>
															<span class="old_price">$${price.originalPrice}</span>
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
										<div class="product_content list_content">
											<!-- <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div> -->
											<h4 class="product_name">
												<a href="product-details?id=${product.id}">${product.productName}</a>
											</h4>
											<div class="price_box">
												
<c:choose>
														<c:when test="${price.sellingPrice==100}">
															<span class="current_price">${price.originalPrice}</span>
														</c:when>
														<c:otherwise>
															<span class="current_price"><fmt:formatNumber
																	type="number"
																	value="${(price.originalPrice*price.sellingPrice)/100}"
																	pattern="#0" /></span>
															<span class="old_price">${price.originalPrice}</span>
														</c:otherwise>
</c:choose>
											</div>
											<div class="product_desc">
												<p>${product.productIntro}</p>
											</div>
											<div class="action_links list_action_right">
												<ul>
													<li class="add_to_cart"><a href="product-details?id=${product.id}"
														>立即購買</a></li>
												</ul>
											</div>
										</div>
									</figure>
								</article>
							</div>
						</c:forEach>					
					</div>
					<div class="shop_toolbar t_bottom">
						<div class="pagination">
							<ul>
								<c:forEach var="pag" begin="0" end="${page.totalPages-1}">
									<c:choose>
										<c:when test="${pag == page.number}">
											<li class="current">${pag+1}</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${ctx}/store/shop?page=${pag}${searchContent}${brand}${categoryId}${prices}${sort}${categoryLevelId}">${pag+1}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li><a
									href="${ctx}/store/shop?page=${page.totalPages-1}${searchContent}${brand}${categoryId}${prices}${sort}${categoryLevelId}">>></a></li>
							</ul>
						</div>
					</div>
</c:if>
				</div>
			</div>
		</div>
	</div>
	<div id="test"  onclick="window.location='${ctx}/store/login'" style="width:100px;height:80px;font:center;position:fixed;right:0px;bottom:0px;z-index:20;background-color:green;opacity:0;">
		<a >商品:<span id="carNumber">0</span></a>
	</div>
	<input type="hidden" id="userID" value="${username.id}">
	<!--shop  area end-->

	<!--footer area start-->
	<c:import url="footer.jsp" />
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
											<div class="modal_tab_img" id="viewImg">
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
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-12">
								<div class="modal_right">
									<div class="modal_title mb-10">
										<h2 id="viewName"></h2>
									</div>
									<div class="modal_price mb-10">
										<span class="new_price" id="viewPrice"></span>
									</div>
									<div class="modal_description mb-15">
										<p id="viewDes"></p>
									</div>
									<div class="variants_selects">
										<div class="variants_size">
											<h3>規格</h3>
											<select name="productSkuId" id="productSkuId"
												onchange="stock()">
											</select>
										</div>
										<div class="modal_add_to_cart">

											<input min="1" max="100" step="1" value="1" type="number"
												name="skuNumber" id="viewNumber">
											<button onclick="addCart()">加入購物車</button>
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
	<script>
		function view(e) {
			$('#productSkuId').empty();
			$
					.ajax({
						url : '${ctx}/store/productView',
						dataType : "json",
						data : {
							"view" : e.id
						},
						type : "GET",
						success : function(data) {
							$('#viewImg').html('<a href="#"><img src="${ctx}/'+data.productImage[0].src+'" alt=""></a>')
							$('#viewName').html(data['productName']);
							$('#viewPrice').html(
									data['productSku'][0]['originalPrice']);
							$('#productSkuId')
									.append(
											'<option value="none" selected="selected">請選擇分類</option>');
							$
									.each(
											data['productSku'],
											function(i) {
												if (data['productSku'][i].stockNum != 0
														&& data['productSku'][i].productStatus == true) {
													$('#productSkuId')
															.append(
																	"<option value='"+data['productSku'][i].id+"'>"
																			+ data['productSku'][i].spec
																			+ "</option>");
												}
											})
						}
					})
		};
		function stock() {
			$.ajax({
				url : '${ctx}/store/prodkus',
				dataType : "json",
				data : {
					"productSkuId" : $('#productSkuId').val()
				},
				type : "GET",
				success : function(data) {
					$('#viewNumber').attr("max", data['stockNum']);
					$('#viewPrice').html(data['originalPrice']);
				}
			})
		};
		function addCart() {
			$.ajax({		
				type : 'post',
				url : '${ctx}/store/addCartItem',
				data : {
					"productId" : parseInt($('#productSkuId').val()),
					"userId" : !$('#userID').val() ? 0:parseInt($('#userID').val()),
					"BuyNumber" : parseInt($('#viewNumber').val())
				        },
				success : function(data) {
				$('#modal_box').modal('hide');
				if(data==0){
					$('#test').css("opacity","1.0");
					$('#carNumber').html(parseInt($('#carNumber').html()) + 1);
						    }
				                          }
			
			       });
			
		}
		function test(e){
			$.ajax({
				type:'get',
				url:'${ctx}/store/categoryAll',
				data:{
					"parentId":e
				},
				success:function(data){
					$('#categoryLevel'+e).html('');
					data.forEach(obj =>{
						$('#categoryLevel'+e).append(
						'<li><a href="${ctx}/store/shop?page=0&categoryLevelId='
						+obj.id+
						'">'
						+obj.name+
						'</a></li>'
						)
					})	
				}
			})
		}
	</script>
</body>

</html>