<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<div class="off_canvars_overlay"></div>
<div class="offcanvas_menu">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="canvas_open">
					<a href="javascript:void(0)"><i class="icon-menu"></i></a>
				</div>
				<div class="offcanvas_menu_wrapper">
					<div class="canvas_close">
						<a href="javascript:void(0)"><i class="icon-x"></i></a>
					</div>
					<div class="welcome-text">
						<p>免運費: 快買</p>
					</div>
					<div class="language_currency text-center">
						<ul>
							<li class="currency"><a href="#"> USD <i
									class="fa fa-angle-down"></i></a>
								<ul class="dropdown_currency">
									<li><a href="#">EUR</a></li>
									<li><a href="#">GPB</a></li>
									<li><a href="#">RUP</a></li>
								</ul></li>
							<li class="language"><a href="#"> English <i
									class="fa fa-angle-down"></i></a>
								<ul class="dropdown_language">
									<li><a href="#">French</a></li>
									<li><a href="#">Spanish</a></li>
									<li><a href="#">Russian</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="search_container">
						<form action="#">
							<div class="hover_category">
								<select class="select_option" name="select" id="categori2">
									<option selected value="1">全部分類</option>
									<option value="2">Accessories</option>
									<option value="3">Accessories & More</option>
									<option value="4">Butters & Eggs</option>
									<option value="5">Camera & Video</option>
									<option value="6">Monitors</option>
									<option value="7">Tablets</option>
									<option value="8">Laptops</option>
									<option value="9">Handbags</option>
									<option value="10">Headphone & Speaker</option>
									<option value="11">Herbs & botanicals</option>
									<option value="12">Vegetables</option>
									<option value="13">Shop</option>
									<option value="14">Laptops & Desktops</option>
									<option value="15">Watchs</option>
									<option value="16">Electronic</option>
								</select>
							</div>
							<div class="search_box">
								<input placeholder="Search product..." type="text">
								<button type="submit">
									<i class="icon-search"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="header_account_area">
						<div class="header_account-list top_links">
							<a href="#"><i class="icon-users"></i></a>
							<ul class="dropdown_links">
								<li><a href="checkout">Checkout </a></li>
								<li><a href="my-account">My Account </a></li>
								<li><a href="cart">Shopping Cart</a></li>
								<li><a href="wishlist">Wishlist</a></li>
							</ul>
						</div>
						<div class="header_account-list header_wishlist">
							<a href="wishlist"><i class="icon-heart"></i></a>
						</div>
						<div class="header_account-list  mini_cart_wrapper">
							<a href="javascript:void(0)"><i class="icon-shopping-bag"></i><span
								class="item_count">2</span></a>
							<!--mini cart-->
							<div class="mini_cart">
								<div class="cart_gallery">
									<div class="cart_item">
										<div class="cart_img">
											<a href="#"><img
												src="${ctx}/assets/img/s-product/product.jpg" alt=""></a>
										</div>
										<div class="cart_info">
											<a href="#">iphone 11 紅</a>
											<p>
												1 x <span> $24900 </span>
											</p>
										</div>
										<div class="cart_remove">
											<a href="#"><i class="icon-x"></i></a>
										</div>
									</div>
									<div class="cart_item">
										<div class="cart_img">
											<a href="#"><img
												src="${ctx}/assets/img/s-product/product2.jpg" alt=""></a>
										</div>
										<div class="cart_info">
											<a href="#">ENRICH iphone 11 手機殼</a>
											<p>
												1 x <span> $900 </span>
											</p>
										</div>
										<div class="cart_remove">
											<a href="#"><i class="icon-x"></i></a>
										</div>
									</div>
								</div>
								<div class="mini_cart_table">
									<div class="cart_table_border">
										<div class="cart_total">
											<span>金額:</span> <span class="price">$25800</span>
										</div>
										<div class="cart_total mt-10">
											<span>總金額:</span> <span class="price">$25800</span>
										</div>
									</div>
								</div>
								<div class="mini_cart_footer">
									<div class="cart_button">
										<a href="cart"><i class="fa fa-shopping-cart"></i> 購物車</a>
									</div>
									<div class="cart_button">
										<a href="checkout"><i class="fa fa-sign-in"></i> 結帳</a>
									</div>

								</div>
							</div>
							<!--mini cart end-->
						</div>
					</div>
					<div class="call-support">
						<p>
							Call Support: <a href="tel:(+800)123456789">(+800) 123 456
								789</a>
						</p>
					</div>
					<div id="menu" class="text-left ">
						<ul class="offcanvas_main_menu">
							<li class="menu-item-has-children active"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index">Home 1</a></li>
									<li><a href="index-2">Home 2</a></li>
									<li><a href="index-3">Home 3</a></li>
									<li><a href="index-4">Home 4</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">Shop</a>
								<ul class="sub-menu">
									<li class="menu-item-has-children"><a href="#">Shop
											Layouts</a>
										<ul class="sub-menu">
											<li><a href="shop">shop</a></li>
											<li><a href="shop-fullwidth">Full Width</a></li>
											<li><a href="shop-fullwidth-list">Full Width list</a></li>
											<li><a href="shop-right-sidebar">Right Sidebar </a></li>
											<li><a href="shop-right-sidebar-list"> Right Sidebar
													list</a></li>
											<li><a href="shop-list">List View</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a href="#">other
											Pages</a>
										<ul class="sub-menu">
											<li><a href="cart">cart</a></li>
											<li><a href="wishlist">Wishlist</a></li>
											<li><a href="checkout">Checkout</a></li>
											<li><a href="my-account">my account</a></li>
											<li><a href="404">Error 404</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a href="#">Product
											Types</a>
										<ul class="sub-menu">
											<li><a href="product-details">product details</a></li>
											<li><a href="product-sidebar">product sidebar</a></li>
											<li><a href="product-grouped">product grouped</a></li>
											<li><a href="variable-product">product variable</a></li>
										</ul></li>
								</ul></li>
							<!--    <li class="menu-item-has-children">
                                    <a href="#">blog</a>
                                    <ul class="sub-menu">
                                        <li><a href="blog">blog</a></li>
                                        <li><a href="blog-details">blog details</a></li>
                                        <li><a href="blog-fullwidth">blog fullwidth</a></li>
                                        <li><a href="blog-sidebar">blog sidebar</a></li>
                                    </ul>

                                </li> -->
							<li class="menu-item-has-children"><a href="#">pages </a>
								<ul class="sub-menu">
									<li><a href="about">About Us</a></li>
									<li><a href="services">services</a></li>
									<li><a href="faq">Frequently Questions</a></li>
									<li><a href="contact">contact</a></li>
									<li><a href="login">login</a></li>
									<li><a href="404">Error 404</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="my-account">my
									account</a></li>
							<li class="menu-item-has-children"><a href="about">about
									Us</a></li>
							<li class="menu-item-has-children"><a href="contact">
									Contact Us</a></li>
						</ul>
					</div>

					<div class="offcanvas_footer">
						<span><a href="#"><i class="fa fa-envelope-o"></i>
								info@yourdomain.com</a></span>
						<ul>
							<li class="facebook"><a href="#"><i
									class="fa fa-facebook"></i></a></li>
							<li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li class="pinterest"><a href="#"><i
									class="fa fa-pinterest-p"></i></a></li>
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

<!--offcanvas menu area end-->
<header>
	<div class="main_header">
		<div class="header_top">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-7 col-md-7">
						<div class="welcome-text">
							<p>Welcome to our shopping Web</p>
						</div>
					</div>
					<!-- <div class="col-lg-5 col-md-5">
                            <div class="language_currency text-right">
                                <ul>
                                    <li class="currency"><a href="#"> USD <i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_currency">
                                            <li><a href="#">EUR</a></li>
                                            <li><a href="#">GPB</a></li>
                                            <li><a href="#">RUP</a></li>
                                        </ul>
                                    </li>
                                    <li class="language"><a href="#"> English <i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_language">
                                            <li><a href="#">French</a></li>
                                            <li><a href="#">Spanish</a></li>
                                            <li><a href="#">Russian</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div> -->
				</div>
			</div>
		</div>
		<div class="header_middle">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-3">
						<div class="logo">
							<a href="index"><img src="${ctx}/assets/img/logo/logo.png"
								alt=""></a>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="header_right_info">
							<div class="search_container" style="margin-right: 100px;">
								<form action="${ctx}/store/shop?page=0" method="post">
									<!-- 									<div class="hover_category"> -->
									<!-- 										<select class="select_option" name="select" id="categori1"> -->
									<!-- 											<option selected value="1">All Categories</option> -->
									<!-- 											<option value="2">Accessories</option> -->
									<!-- 											<option value="3">Accessories & More</option> -->
									<!-- 											<option value="4">Butters & Eggs</option> -->
									<!-- 											<option value="5">Camera & Video</option> -->
									<!-- 											<option value="6">Mornitors</option> -->
									<!-- 											<option value="7">Tablets</option> -->
									<!-- 											<option value="8">Laptops</option> -->
									<!-- 											<option value="9">Handbags</option> -->
									<!-- 											<option value="10">Headphone & Speaker</option> -->
									<!-- 											<option value="11">Herbs & botanicals</option> -->
									<!-- 											<option value="12">Vegetables</option> -->
									<!-- 											<option value="13">Shop</option> -->
									<!-- 											<option value="14">Laptops & Desktops</option> -->
									<!-- 											<option value="15">Watchs</option> -->
									<!-- 											<option value="16">Electronic</option> -->
									<!-- 										</select> -->
									<!-- 									</div> -->
									<div class="search_box">
										<input placeholder="搜尋產品..." type="text" name="searchContent">
										<button type="submit">
											<i class="icon-search"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="header_account_area">
								<div class="header_account-list top_links">
									<a href="my-account"> <i class="icon-users"></i></a>
									<ul class="dropdown_links">
										<c:if test="${empty LoginOK}">
											<li><a href="login">會員登入 </a></li>
										</c:if>
										<c:if test="${ ! empty LoginOK}">
											<li><a href="${ctx}/store/logout">會員登出 </a></li>
										</c:if>
										<li><a href="${ctx}/admin/login">廠商登入 </a></li>
										<li><a href="${ctx}/store/my-account">個人會員 </a></li>
									</ul>

									<!-- <ul class="dropdown_links">
                                            <li><a href="checkout">結帳</a></li>
                                            <li><a href="my-account">個人會員 </a></li>
                                            <li><a href="cart">購物車</a></li>
                                            <li><a href="wishlist">願望清單</a></li>
                                        </ul> -->
								</div>
								<!-- 								<div class="header_account-list header_wishlist"> -->
								<!-- 									<a href="wishlist"><i class="icon-heart"></i></a> -->
								<!-- 								</div> -->
								<div class="header_account-list  mini_cart_wrapper">
									<a href="javascript:void(0)" onmouseover="showShopCart(this)"
										id="${username.id}"><i class="icon-shopping-bag"></i> <!-- 									<span class="item_count">2</span> -->

									</a>
									<!--mini cart-->
									<div class="mini_cart"
										style="overflow: auto; margin-right: -220px;">
										<div class="cart_gallery" id="showCartAll">
											<div style="text-align: center;">
												<h2>尚無商品</h2>
											</div>
										</div>
										<!--mini cart end-->
									</div>
								</div>

							</div>
							<div>
								<div style="width: 100px; height: 50px;">
									<c:if test="${! empty LoginOK}">
										<h4 style="white-space: nowrap;">
											hello,<br>${username.name}</h4>
										<img src='${ctx}/${username.image}'
											style="height: 100px; margin-left: 90px; margin-top: -50px;">
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header_bottom sticky-header">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-3">
							<!-- 						<div class="categories_menu"> -->
							<!-- 							<div class="categories_title"> -->
							<!-- 								<h2 class="categori_toggle">Categories</h2> -->
							<!-- 							</div> -->
							<!-- 							<div class="categories_menu_toggle"> -->
							<!-- 								<ul> -->
							<!-- 									<li class="menu_item_children"><a href="#">Brake Parts -->
							<!-- 											<i class="fa fa-angle-right"></i> -->
							<!-- 									</a> -->
							<!-- 										<ul class="categories_mega_menu"> -->
							<!-- 											<li class="menu_item_children"><a href="#">Dresses</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Sweater</a></li> -->
							<!-- 													<li><a href="">Evening</a></li> -->
							<!-- 													<li><a href="">Day</a></li> -->
							<!-- 													<li><a href="">Sports</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Handbags</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Shoulder</a></li> -->
							<!-- 													<li><a href="">Satchels</a></li> -->
							<!-- 													<li><a href="">kids</a></li> -->
							<!-- 													<li><a href="">coats</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">shoes</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Ankle Boots</a></li> -->
							<!-- 													<li><a href="">Clog sandals </a></li> -->
							<!-- 													<li><a href="">run</a></li> -->
							<!-- 													<li><a href="">Books</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Clothing</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Coats Jackets </a></li> -->
							<!-- 													<li><a href="">Raincoats</a></li> -->
							<!-- 													<li><a href="">Jackets</a></li> -->
							<!-- 													<li><a href="">T-shirts</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 										</ul></li> -->
							<!-- 									<li class="menu_item_children"><a href="#"> Wheels & -->
							<!-- 											Tires <i class="fa fa-angle-right"></i> -->
							<!-- 									</a> -->
							<!-- 										<ul class="categories_mega_menu column_3"> -->
							<!-- 											<li class="menu_item_children"><a href="#">Chair</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Dining room</a></li> -->
							<!-- 													<li><a href="">bedroom</a></li> -->
							<!-- 													<li><a href=""> Home & Office</a></li> -->
							<!-- 													<li><a href="">living room</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Lighting</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Ceiling Lighting</a></li> -->
							<!-- 													<li><a href="">Wall Lighting</a></li> -->
							<!-- 													<li><a href="">Outdoor Lighting</a></li> -->
							<!-- 													<li><a href="">Smart Lighting</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Sofa</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Fabric Sofas</a></li> -->
							<!-- 													<li><a href="">Leather Sofas</a></li> -->
							<!-- 													<li><a href="">Corner Sofas</a></li> -->
							<!-- 													<li><a href="">Sofa Beds</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 										</ul></li> -->
							<!-- 									<li class="menu_item_children"><a href="#"> Furnitured -->
							<!-- 											& Decor <i class="fa fa-angle-right"></i> -->
							<!-- 									</a> -->
							<!-- 										<ul class="categories_mega_menu column_2"> -->
							<!-- 											<li class="menu_item_children"><a href="#">Brake -->
							<!-- 													Tools</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Driveshafts</a></li> -->
							<!-- 													<li><a href="">Spools</a></li> -->
							<!-- 													<li><a href="">Diesel </a></li> -->
							<!-- 													<li><a href="">Gasoline</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Emergency -->
							<!-- 													Brake</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Dolls for Girls</a></li> -->
							<!-- 													<li><a href="">Girls' Learning Toys</a></li> -->
							<!-- 													<li><a href="">Arts and Crafts for Girls</a></li> -->
							<!-- 													<li><a href="">Video Games for Girls</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 										</ul></li> -->
							<!-- 									<li class="menu_item_children"><a href="#"> Turbo -->
							<!-- 											System <i class="fa fa-angle-right"></i> -->
							<!-- 									</a> -->
							<!-- 										<ul class="categories_mega_menu column_2"> -->
							<!-- 											<li class="menu_item_children"><a href="#">Check -->
							<!-- 													Trousers</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Building</a></li> -->
							<!-- 													<li><a href="">Electronics</a></li> -->
							<!-- 													<li><a href="">action figures </a></li> -->
							<!-- 													<li><a href="">specialty & boutique toy</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 											<li class="menu_item_children"><a href="#">Calculators</a> -->
							<!-- 												<ul class="categorie_sub_menu"> -->
							<!-- 													<li><a href="">Dolls for Girls</a></li> -->
							<!-- 													<li><a href="">Girls' Learning Toys</a></li> -->
							<!-- 													<li><a href="">Arts and Crafts for Girls</a></li> -->
							<!-- 													<li><a href="">Video Games for Girls</a></li> -->
							<!-- 												</ul></li> -->
							<!-- 										</ul></li> -->
							<!-- 									<li><a href="#"> Lighting</a></li> -->
							<!-- 									<li><a href="#"> Accessories</a></li> -->
							<!-- 									<li><a href="#">Body Parts</a></li> -->
							<!-- 									<li><a href="#">Perfomance Filters</a></li> -->
							<!-- 									<li><a href="#"> Engine Parts</a></li> -->
							<!-- 									<li id="cat_toggle" class="has-sub"><a href="#"> More -->
							<!-- 											Categories</a> -->
							<!-- 										<ul class="categorie_sub"> -->
							<!-- 											<li><a href="#">Hide Categories</a></li> -->
							<!-- 										</ul></li> -->
							<!-- 								</ul> -->
							<!-- 							</div> -->
							<!-- 						</div> -->
						</div>
						<div class="col-lg-6">
							<!--main menu start-->
							<div class="main_menu menu_position" style="width:600px;">
								<nav>
									<ul>
										<li><a class="active" href="index">主頁 <!-- <i class="fa fa-angle-down"></i> -->
										</a></li>
										<li class="mega_items"><a href="shop?page=0">商品 <!-- <i class="fa fa-angle-down"></i> -->
										</a></li>
<!-- 										<li><a href="about">關於我們<i class="fa fa-angle-down"></i> -->
<!-- 										</a></li> -->
<!-- 										<li><a href="services">服務 <i class="fa fa-angle-down"></i> -->
<!-- 										</a></li> -->
										<li><a href="faq">常見問題 <!-- <i class="fa fa-angle-down"></i> -->
										</a></li>
										<li><a href="contact">服務據點及聯絡我們 <!-- <i class="fa fa-angle-down"></i> -->
										</a></li>
										<c:if test="${empty LoginOK}">
											<li><a href="login">會員登入 </a></li>
										</c:if>
										<c:if test="${ ! empty LoginOK}">
											<li><a href="${ctx}/store/logout">會員登出 </a></li>
										</c:if>
										<li><a href="${ctx}/admin/login">廠商登入 </a></li>
<!-- 										<li><a href="login">登入 <i class="fa fa-angle-down"></i> -->
<!-- 										</a></li> -->
										<!--      <li><a href="blog">blog<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                                <li><a href="blog-details">blog details</a></li>
                                                <li><a href="blog-fullwidth">blog fullwidth</a></li>
                                                <li><a href="blog-sidebar">blog sidebar</a></li>
                                            </ul>
                                        </li> -->
										<!-- 									<li><a href="#">簡介 <i class="fa fa-angle-down"></i></a> -->
										<!-- 										<ul class="sub_menu pages"> -->
										<!-- 											<li><a href="about">關於我們</a></li> -->
										<!-- 											<li><a href="services">服務</a></li> -->
										<!-- 											<li><a href="faq">常見問題</a></li> -->
										<!-- 											<li><a href="contact">服務據點</a></li> -->
										<!-- 											<li><a href="login">登入</a></li> -->
										<!-- 										</ul></li> -->
									</ul>
								</nav>
							</div>
							<!--main menu end-->
						</div>

					</div>
				</div>
			</div>
		</div>
</header>
<script>

function deletCart2(e){
	$.ajax({
		type :'Post',
		url : '${ctx}/store/deletCart',
		data : {
			"skuId" : parseInt(e),
			"userId" :'${!empty username}'=='true'?parseInt('${username.id}'):null
		},
		success:function(){
			//$('#headercart'+e).remove();
			showShopCart();
		}
	})
	
}
function pic(cartitem) {
	
		for (var i = 0; i < cartitem.productsku.product.productImage.length; i++) {
			if (cartitem.productsku.product.productImage[i].firstPic==true) {
				return cartitem.productsku.product.productImage[i].src;
			}
			
		}
		return '/assets/img/s-product/product.jpg';

}
function showShopCart(e){
	$.ajax({
		url:'${ctx}/store/showCart',
		dataType:"json",
		type:"GET",
		success:function(data){
			//在沒有登入的時候沒有CARTITEM ID 但依訂有SKUID
			//obj是cartitem
			if(data.length != 0){
				$('#showCartAll').html('');
				var sum=0;
				data.forEach(obj =>{
					$('#showCartAll').append(
							'<div class="cart_item" id="headercart'+obj.productsku.id+'"><div class="cart_img"><a href="#"><img src="${ctx}'+pic(obj)
				
							+'" alt=""></a></div><div class="cart_info"><a href="#">'
					+obj.productsku.product.productName+//":"+ obj.productsku.spec +
					'</a>'+
					'<p>'+obj.productsku.spec+'</p>'
					+'<p>'
					+ obj.buyNumber +
					'x <span> $'
					+ obj.productsku.originalPrice+ 
					'</span></p></div><div class="cart_remove" onclick="deletCart2('+obj.productsku.id+')"><a href="#"><i class="icon-x"></i></a></div></div>'
					);
					
					sum+=obj.productsku.originalPrice*obj.buyNumber;
				});
				$('#showCartAll').append('<div class="mini_cart_table"><div class="cart_table_border"><div class="cart_total"><span>金額:</span><span class="price">$'
					+ sum +
				'</span></div></div></div><div class="mini_cart_footer"><div class="cart_button"><a href="cart"><i class="fa fa-shopping-cart"></i> 購物車</a></div><div class="cart_button"><a href="checkout"><i class="fa fa-sign-in"></i> 結帳</a></div></div>'
				);
			
			}
			else  {
				var cont='<div style="text-align: center;"><h2>尚無商品</h2></div>';
				$('#showCartAll').html(cont);

				
			}
		}
		
	})
}
</script>
