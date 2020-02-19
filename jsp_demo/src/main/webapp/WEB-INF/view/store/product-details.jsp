<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商品詳情</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

</head>

<body>

	<!--header area start-->
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
							<li>商品詳情</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--product details start-->
	<div class="product_details mt-100 mb-100">
		<div class="container">

			<div class="row">
				<div class="col-lg-6 col-md-6">

					<div class="product-details-tab">
						<c:forEach var="productImage" items="${product.productImage}">
							<c:if test="${productImage.firstPic == true }">
								<div id="img-1" class="zoomWrapper single-zoom">
									<a href="#"> <img id="zoom1"
										src="${ctx}/${productImage.src}"
										data-zoom-image="${ctx}/${productImage.src}" alt="big-1">
									</a>
								</div>
							</c:if>
						</c:forEach>

						<div class="single-zoom-thumb">
							<ul class="s-tab-zoom owl-carousel single-product-active"
								id="gallery_01">
								<c:forEach var="productImage" items="${product.productImage}">
									<li><a href="#" class="elevatezoom-gallery active"
										data-update="" data-image="${ctx}/${productImage.src}"
										data-zoom-image="${ctx}/${productImage.src}"> <img
											src="${ctx}/${productImage.src}" style="height:100px;" alt="zo-th-1" />
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product_d_right">

						<c:set var="countPrice" value="100000000" />
	<c:forEach var="priceDis" items="${product.productSku}">
		<c:if test="${priceDis.sellingPrice*priceDis.originalPrice < countPrice && priceDis.productStatus != false}">
			<c:set var="countPrice" value="${priceDis.sellingPrice*priceDis.originalPrice}" />
 			<c:set var="price" value="${priceDis}" /> 
		</c:if>
	</c:forEach>
						<h1>
							<font size="6"><b>${product.productName}</b></font>
						</h1>
					</div>
					<div class="price_box">
						<div id="price">
							$
							<fmt:formatNumber type="number"
								value="${(price.originalPrice*price.sellingPrice)/100}"
								pattern="#0" />
							起
						</div>
					</div>
					<div class="product_desc">
						<p>${product.productIntro}</p>
					</div>
					<form action="${ctx}/store/cart" method="post">
						<div class="product_variant color">
							<select name="productSkuId" id="productSkuId" onchange="stock()"
								style="width: 360px; text-align: center; text-align-last: center;">
								<option value="none" selected="selected" id="selectOne">請選擇</option>
								<c:forEach var="i" begin="0"
									end="${product.productSku.size()-1}">
									<c:if
										test="${product.productSku[i].stockNum != 0 &&product.productSku[i].productStatus==true}">
										<option value="${product.productSku[i].id}">${product.productSku[i].spec}</option>
									</c:if>
								</c:forEach>
							</select>
							<div id="selectCheak" style="opacity: 0;">
								<span style="color: red;">請選擇規格</span>
							</div>
						</div>
						<div class="product_variant quantity">
							<label>數量:</label> <input min="1" max="100" value="1"
								type="number" name="skuNumber" id="skuNumber">
							<button class="button" type="button" onclick="addCar()">加入購物車</button>
						</div>
					</form>
					<div class=" product_d_action">
						<!-- <ul>
							<li><a href="#" title="Add to wishlist">+ 加入願望清單</a></li>
							<li><a href="#" title="Add to wishlist">+ Compare</a></li>
						</ul> -->
					</div>
					<div class="product_meta">
						<span>Category: <a
							href="${ctx}/store/shop?page=0&categoryId=${product.category.id}">${product.category.name}</a></span>
					</div>


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

	<!--product details end-->
	<c:forEach var="review" items="${reviewall}" varStatus="status">
		<c:set var="revmenber" value="${status.count}" />
	</c:forEach>
	<!--product info start-->
	<div class="product_d_info mb-90">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_d_inner">
						<div class="product_info_button">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#info"
									role="tab" aria-controls="info" aria-selected="false">描述</a></li>
								<li><a data-toggle="tab" href="#reviews" role="tab"
									aria-controls="reviews" aria-selected="false">評論 (<span
										id="reviewsnumber">${revmenber}</span>)
								</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="info" role="tabpanel">
								<div class="product_info_content">
									<p>${product.description}</p>
								</div>
							</div>

							<div class="tab-pane fade" id="reviews" role="tabpanel">
								<div class="reviews_wrapper">
									<c:forEach var="review" items="${reviewall}">
										<div class="reviews_comment_box" id="ReviewDiv${review.id}">
											<div class="comment_thmb">
												<img src="${ctx}/${review.user.image}" alt=""
													style="width: 120px; height: 120px;">
											</div>
											<div class="comment_text">
												<div class="reviews_meta">
													<c:if test="${review.user.id == username.id}">
														<div style="position: absolute; right: 0px; top: 0px;">
															<button type="button"
																onclick="delectButton(${review.id})">x</button>
														</div>
													</c:if>
													<p>
														<strong>${review.user.name}</strong>:
													</p>
													<span>${review.review}</span>
												</div>
											</div>
										</div>
										<c:if test="${review.reply != null }">
											<div class="reviews_comment_box">
												<div class="comment_text">
													<div class="reviews_meta">
														<span style="float: right; line-height: 40px;">
															客服人員：<br> ${review.reply}
														</span>
													</div>
												</div>
												<div class="comment_thmb">
													<img src="${ctx}/assets/img/bg/banner1.jpg"
														style="width: 120px; height: 120px; border-radius: 999em;">
												</div>
											</div>
										</c:if>
									</c:forEach>
									<div id="reviewDiv"></div>
									<div class="product_review_form">
										<form action="#" id="reviewAction">
											<div class="row">
												<div class="col-12">
													<input type="hidden" id="userId" value="${username.id}">
													<input type="hidden" id="productId" value="${product.id}">
													<label for="review_comment">您的留言</label>
													<textarea name="comment" id="reviewCmment"></textarea>
												</div>
											</div>
											<input type="button" value="送出" onclick="sub()" />
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
	<!--product area end-->

	<!--product area start-->
	<!--product area end-->

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

	<!-- modal area start-->
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
		function stock() {
			$.ajax({
				url : '${ctx}/store/prodkus',
				dataType : "json",
				data : {
					"productSkuId" : $('#productSkuId').val()
				},
				type : "GET",
				success : function(data) {
					$('#skuNumber').attr("max", data['stockNum']);
					$('#price').html('$ '+Math.floor(data.originalPrice*data.sellingPrice/100));
				}
			})
		};
		function sub() {
			var useId = $('#userId').val();
			$.ajax({
						type : 'POST',
						url : "${ctx}/store/addReview",
						data : {
							review : $('#reviewCmment').val(),
							products :parseInt($('#productId').val()),
							users :!useId ? 1:parseInt(useId)
						},
						dataType : "json",
						success : function(data) {
							$('#reviewDiv')
									.append(
											'<div class="reviews_comment_box" id="ReviewDiv'
											+data.id+
											'"><div class="comment_thmb"><img src="${ctx}/'
											+ data.user.image +
											'" alt="" style="width: 120px; height: 120px;"></div><div class="comment_text"><div class="reviews_meta"><div style="position:absolute;right:0px;top:0px;"><button type="button" onclick="delectButton('
											+data.id+
											')">x</button></div><p><strong>'
											+ data.user.name +
											'</strong>:</p><span>'
											+ data['review'] + 
											'</span></div></div></div>');
							$('#reviewCmment').val('');
							$('#reviewsnumber').html(
									parseInt($('#reviewsnumber').html()) + 1);
						}

					})
		};
		function addCar(){
			$.ajax({
				type : 'post',
				url : '${ctx}/store/addCartItem',
				data : {
					"productId" : parseInt($('#productSkuId').val()),
					"userId" : 0,
					"BuyNumber" : parseInt($('#skuNumber').val())
				},
				success : function(data) {
					$('#productSkuId').css("border-color","black");
					$('#selectCheak').css("opacity","0");
					Swal.fire('加入成功');
				},
				error: function(){
					$('#productSkuId').css("border-color","red");
					$('#selectCheak').css("opacity","100");
					Swal.fire('請點選產品');
				}
			})
		}
		
		function delectButton(e){
			Swal.fire({
				 title: '確定要刪除麼?',
				 text: "刪除後將無法回復!",
				 type: 'warning',
				 showCancelButton: true,
				 confirmButtonColor: '#3085d6',
				 cancelButtonColor: '#d33',
				 confirmButtonText: '確定',
				 cancelButtonText:'取消'
				 }).then((result) => {
				 if (result.value) {
				 Swal.fire(
				 '刪除成功!',
				 '文件已被刪除',
				 'success'
				 )
				 $.ajax({
						type:'post',
						url:'${ctx}/store/delectReview',
						data:{
							"reviewId":parseInt(e)
							},
						success:function(data){
							$('#ReviewDiv'+e).html('');
							$('#ReviewDiv'+e).css('margin-bottom','0px');
							$('#reviewsnumber').html(parseInt($('#reviewsnumber').html())-1);
						}
					}) 
				 }
				 })
		};
		
		
		/* function delectButton(e){
			if(confirm("確實要刪除嗎?")){
				$.ajax({
					type:'post',
					url:'${ctx}/store/delectReview',
					data:{
						"reviewId":parseInt(e)
						},
					success:function(data){
						swal("刪除！");
						$('#ReviewDiv'+e).html('');
						$('#ReviewDiv'+e).css('margin-bottom','0px');
						$('#reviewsnumber').html(parseInt($('#reviewsnumber').html())-1);
					}
				}) 
			}
		}  */
	</script>

</body>

</html>