<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<footer class="footer_widgets">
	<div class="footer_top">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="widgets_container contact_us">
						<h3>營業時間</h3>
						<p>
							<span>星期一~星期五:</span>
						<p>8AM - 10PM</p>
						<p>
							<span>星期六:</span> 9AM-8PM
						</p>
						<p>
							<span>星期日:</span> 14hPM-18hPM
						</p>
						<p>
							<b></b>
						</p>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="widgets_container widget_menu">
						<h3>消息</h3>
						<div class="footer_menu">
							<ul>
								<li><a href="about">關於我們</a></li>
								<li><a href="checkout">結帳</a></li>
								<li><a href="contact">服務據點</a></li>
								<li><a href="faq">常見問題</a></li>
								<li><a href="wishlist">願望清單</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-5">
					<div class="widgets_container widget_app">
						<div class="footer_logo">
							<a href="index"><img src="${ctx}/assets/img/logo/logo.png"
								alt=""></a>
						</div>
						<div class="footer_widgetnav_menu">
							<ul>
								<li><a href="#">付款</a></li>
								<li><a href="#">加盟商</a></li>
								<li><a href="#">聯絡</a></li>
								<li><a href="#">互聯網</a></li>
							</ul>
						</div>
						<div class="footer_social">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-youtube"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="footer_app">
							<ul>
								<li><a href="#"><img
										src="${ctx}/assets/img/icon/icon-app.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="${ctx}/assets/img/icon/icon1-app.jpg" alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="widgets_container widget_menu">
						<h3>會員資料</h3>
						<div class="footer_menu">
							<ul>
								<li><a href="my-account">會員資料</a></li>
								<li><a href="contact">服務據點</a></li>
								<li><a href="cart">購物車</a></li>
								<li><a href="checkout">結帳</a></li>
								<li><a href="shop">商品</a></li>
								<li><a href="#">訂單</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-6">
					<div class="widgets_container widget_menu">
						<h3>客戶服務</h3>
						<div class="footer_menu">
							<ul>
								<li><a href="contact">關於我們</a></li>
<!-- 								<li><a href="#">使用條款</a></li> -->
<!-- 								<li><a href="#">隱私政策</a></li> -->
								<li><a href="contact">服務據點</a></li>
								<li><a href="my-account">會員資料</a></li>
								<li><a href="contact">退貨與退款</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer_bottom">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="copyright_area">
						<p>
							Copyright &copy; 2019
<!-- 							 <a href="http://www.bootstrapmb.com/">Lukani</a> -->
							All Right Reserved.
						</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="footer_payment">
						<a href="#"><img src="${ctx}/assets/img/icon/payment.png"
							alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>