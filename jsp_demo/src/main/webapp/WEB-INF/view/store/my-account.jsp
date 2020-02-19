<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>個人會員</title>
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

<link rel="stylesheet"
	href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css">


<!--modernizr min js here-->
<script src="${ctx}/assets/js/vendor/modernizr-3.7.1.min.js"></script>

<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

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
						<h3>我的帳戶</h3>
						<ul>
							<li><a href="index">home</a></li>
							<li>我的帳戶</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!-- my account start  -->
	<section class="main_content_area">
		<div class="container">
			<div class="account_dashboard">
				<div class="row">
					<div class="col-sm-12 col-md-3 col-lg-3">
						<!-- Nav tabs -->
						<div class="dashboard_tab_button">
							<ul role="tablist" class="nav flex-column dashboard-list">
								<li><a href="#dashboard" data-toggle="tab"
									class="nav-link active">帳戶訊息</a></li>
								<li><a href="#orders" data-toggle="tab" class="nav-link"
									id="ccc">歷史訂單</a></li>
								<!-- 								<li><a href="#downloads" data-toggle="tab" class="nav-link">下載</a></li> -->
								<li><a href="#address" data-toggle="tab" class="nav-link"
									id="bbb">地址 </a></li>
								<li><a href="#account-details" data-toggle="tab"
									class="nav-link" id="aaa">帳戶詳情</a></li>
								<li><a href="${ctx}/store/logout" class="nav-link">登出</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-12 col-md-9 col-lg-9">
						<!-- Tab panes -->
						<div class="tab-content dashboard_content">
							<div class="tab-pane fade show active" id="dashboard">
								<h3>帳戶訊息</h3>
								<p>
									從您的帳戶訊息您可以輕鬆地確認和查看您的<a href="#" onclick="go()">最新訂單</a>管理您的 <a
										href="#" onclick="go1()">送貨地址和帳單地址</a> 以及 <a href="#"
										onclick="go2()">修改密碼和帳戶詳細信息</a>
								</p>
							</div>
							<div class="tab-pane fade" id="orders">
								<h3>訂單</h3>
								<div class="table-responsive">
									<table class="table" id="table123">
										<thead>
											<tr>
												<th>訂單編號</th>
												<th>日期</th>
												<th>狀態</th>
												<th>總價</th>
												<th>明細</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="aaa" items="${orderList}">
												<tr id="orderItem${aaa.id}">
													<td>${aaa.id}</td>
													<td><fmt:formatDate type="date"
															value="${aaa.createDate}" /></td>
													<td><span class="success">${aaa.status}</span></td>
													<td><c:set var="sum" value="0"></c:set> <c:forEach
															items="${aaa.orderItems}" var="orderItems">
															<c:set var="sum"
																value="${sum+orderItems.buyNumber*orderItems.productsku.originalPrice*orderItems.productsku.sellingPrice/100}" />
														</c:forEach> <c:out value="${sum}"></c:out></td>
													<td><button type="button" onclick="viewOrd(${aaa.id})">查看</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
							<div class="tab-pane fade" id="downloads">
								<h3>下載</h3>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Product</th>
												<th>Downloads</th>
												<th>Expires</th>
												<th>Download</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Shopnovilla - Free Real Estate PSD Template</td>
												<td>May 10, 2018</td>
												<td><span class="danger">Expired</span></td>
												<td><a href="#" class="view">Click Here To Download
														Your File</a></td>
											</tr>
											<tr>
												<td>Organic - ecommerce html template</td>
												<td>Sep 11, 2018</td>
												<td>Never</td>
												<td><a href="#" class="view">Click Here To Download
														Your File</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane" id="address">
								<p>默認情況下，以下地址將在結帳頁面上使用。</p>
								<h4 class="billing-address">帳單地址</h4>
								<a href="#" class="view" onclick="go3()">修改</a>
								<p>
									<strong>收信人姓名:${username.name}</strong>
								</p>
								<address>收信人地址:${username.address}</address>
								<p>台灣</p>
							</div>
							<div class="tab-pane fade" id="account-details">
								<!-- 								<h3>帳戶詳情</h3> -->
								<div class="login">
									<div class="login_form_container">
										<div class="account_login_form">
											<form action="#">
												<!-- 												<p> -->
												<!-- 													已經有帳號了嗎? <a href="#">更改為登錄!</a> -->
												<!-- 												</p> -->
												<!-- 												<div class="input-radio"> -->
												<!-- 													<span class="custom-radio"><input type="radio" -->
												<!-- 														value="1" name="id_gender"> 男性</span> <span -->
												<!-- 														class="custom-radio"><input type="radio" value="1" -->
												<!-- 														name="id_gender"> 女性</span> -->
												<!-- 												</div> -->
												<br> <img src='${ctx}/${username.image}'
													style="height: 100px"><br>
												<!-- 												<label>姓氏</label> <input type="text" -->
												<%-- 													name="first-name" value='${username.account}' --%>
												<!-- 													readonly="readonly">  -->
												<label>名字</label> <input type="text" name="last-name"
													value='${username.name}' readonly="readonly"> <label>Email</label>
												<input type="text" name="email-name"
													value='${username.email}' readonly="readonly"> <label>密碼</label>
												<input type="text" name="user-password"
													value='${username.password}' readonly="readonly"> <label>地址</label>
												<input type="text" name="address"
													value='${username.address}' readonly="readonly"> <label>出生年月日</label>
												<input type="text" placeholder="MM/DD/YYYY"
													value='${fn:substring(username.birthdate,0,10)}'
													name="birthday" readonly="readonly">

												<!-- <span class="example"> (E.g.: 05/31/1970) </span> <br> <span -->
												<!-- 													class="custom_checkbox"> <input type="checkbox" -->
												<!-- 													value="1" name="optin"> <label>Receive -->
												<!-- 														offers from our partners</label> -->
												<!-- 												</span> <br> <span class="custom_checkbox"> <input -->
												<!-- 													type="checkbox" value="1" name="newsletter"> <label>Sign -->
												<!-- 														up for our newsletter<br> <em>You may -->
												<!-- 															unsubscribe at any moment. For that purpose, please find -->
												<!-- 															our contact info in the legal notice.</em> -->
												<!-- 												</label> -->
												<!-- 												</span> -->
												<div>
													<a href="#" data-toggle="modal" data-target="#modal_box"><button
															type="submit">修改個人資料</button></a>
												</div>

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
	</section>
	<!-- my account end   -->
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

					<div class="account_form register">
						<h2>修改個人資料&nbsp;&nbsp;&nbsp;#代表可修改</h2>
						<form id="form" method="post" action="${ctx}/store/editMember"
							enctype="multipart/form-data" modelAttribute="user">
							<p>
								<label for="url">Email:</label><span></span><input type="text"
									id="url" name="email" value='${username.email}'
									readonly="readonly"></input>
							</p>
							<p>
								<label for="password">密碼:<span>&nbsp;#</span></label> <input
									id="password" name="password" type="password"
									value='${username.password}' />
							</p>
							<p>
								<label for="confirm_password">確認密碼:<span>&nbsp;#</span></label>
								<input id="confirm_password" name="confirm_password"
									type="password" value='${username.password}' />
							</p>
							<p>
								<label for="fname">姓名:</label><span>&nbsp;#</span> <input
									type="text" id="fname" name="name" value='${username.name}'></input>
							</p>
							<p>
								<!-- <label for="date">生日</label> <input id="date" name="birth"
									class="date" /> -->
								<label>出生年月日:</label> <input type="text"
									placeholder="MM/DD/YYYY"
									value='${fn:substring(username.birthdate,0,10)}'
									name="birthday" readonly="readonly">
							</p>




							<p>
								<label for="phone">聯絡電話:</label><span>&nbsp;#</span><input
									type="text" id="phone" name="tel" value='${username.tel}'></input>
							</p>
							<p>
								<label for="address">地址:</label><span>&nbsp;#</span> <input
									type="text" id="address" name="address"
									value='${username.address}'></input>
							</p>
							<label for="exampleInputFile">圖片上傳</label>
							<div class="input-group">
								<div class="custom-file">
									<input type="file" class="custom-file-input"
										id="exampleInputFile" name="file" accept="image/*"> <label
										class="custom-file-label" for="exampleInputFile">Choose
										file</label>
								</div>
							</div>
							<!-- 							<p> -->
							<!-- 								<label for="email">Email:</label><span>*</span> <input -->
							<!-- 									type="text" id="email" name="email"></input> -->
							<!-- 							</p> -->

							<p>
								<input type="submit" value="送出" />
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	modal area end -->

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
		$(function() {
$('#table123 .success').each(function(){
				
				switch($(this).text()){
				case '0' :
					$(this).text("下訂單");
					break;
				case '1' :
					$(this).text("備貨");
					break;
				case '2' :
					$(this).text("出貨");
					break;
				case '3' :
					$(this).text("結單");
					break;
				case '4' :
					$(this).text("取消訂單");
					break;
				}
})
				
			
			
			$('#form').validate(
					{
						/* 常用檢測屬性
						required:必填
						noSpace:空白
						minlength:最小長度
						maxlength:最大長度
						email:信箱格式
						number:數字格式
						url:網址格式https://www.minwt.com
						 */
						onkeyup : function(element, event) {
							//去除左側空白
							var value = this.elementValue(element).replace(
									/^\s+/g, "");
							$(element).val(value);
						},
						rules : {
							email : {
								required : true,
								email : true
							},
							name : {
								required : true
							},
							tel : {
								minlength : 8,
								number : true
							},
							address : 'required',
							// 							email : {
							// 								required : true,
							// 								minlength : 8
							// 							},
							email : {
								required : true,
								email : true
							},
							password : {
								required : true,
								minlength : 5
							},
							confirm_password : {
								required : true,
								minlength : 5,
								equalTo : '#password'
							}

						},
						messages : {
							username : {
								required : '必需填寫',
								email : 'Email格式不正確'
							},
							name : {
								required : '必需填寫'
							},
							tel : {

								minlength : '不得少於8位',
								number : '電話需為數字'
							},
							address : '必需填寫',
							// 							email : {
							// 								required : '必需填寫',
							// 								email : 'Email格式不正確'
							// 							},
							account : {
								required : '必需填寫',
								minlength : '不得少於8位'
							},
							//birth : "請輸入正確的日期",
							password : {
								required : '必需填寫',
								minlength : '不得少於5位'
							},
							confirm_password : {
								required : '必需填寫',
								minlength : '不得少於5位',
								equalTo : '密碼不一致'
							}
						},

						submitHandler : function(form) {
							form.submit();
						}
					});

		});

		// 			//新增的生日
		// 			$(document).ready(
		// 					function() {
		// 						var date = new Date();//创建日期对象
		// 						var year = date.getFullYear();//获取当前年份
		// 						for (var i = year - 100; i <= year; i++) {//在id为year的selector附加option选项
		// 							$("#year").append(
		// 									"<option value=\""+i+"\">" + i
		// 											+ "</option>");//append函数附加html到元素结尾处
		// 						}
		// 						for (var i = 1; i <= 12; i++) {
		// 							$("#month").append(
		// 									"<option value=\""+i+"\">" + i
		// 											+ "</option>");//为Id为month的selector附加option选项
		// 						}
		// 						getDays($("#month").val(), $("#year").val());//执行函数getDays()，传参year和month，初始化day selector
		// 					});
		// 			function getDaysInMonth(month, year) {//年月对应的日数算法
		// 				var days;
		// 				if (month == 1 || month == 3 || month == 5 || month == 7
		// 						|| month == 8 || month == 10 || month == 12) {
		// 					days = 31;//固定31
		// 				} else if (month == 4 || month == 6 || month == 9
		// 						|| month == 11) {
		// 					days = 30;//固定30
		// 				} else {
		// 					if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) { //排除百年，每四年一闰；每四百年一闰；
		// 						days = 29; //闰年29
		// 					} else {
		// 						days = 28; //平年28
		// 					}
		// 				}
		// 				return days;//返回该年月的日数
		// 			}
		// 			function getDays() {
		// 				var year = $("#year").val();//year selector οnchange="getDays()"动态获取用户选择的year值
		// 				var month = $("#month").val();//month selector οnchange="getDays()"动态获取用户选择的month值
		// 				var days = getDaysInMonth(month, year);//调用算法函数计算对应年月的日数
		// 				$("#day").empty();//调用empty()函数清空day selector options，然后再append函数往day selector添加options
		// 				for (var i = 1; i <= days; i++) {
		// 					$("#day").append(
		// 							"<option value=\""+i+"\">" + i + "</option>");
		// 				}
		// 			}
	</script>
	<script>
	function go(){
		ccc.click();
	}
	function go1(){
		bbb.click();
	}
	function go2(){
		aaa.click();
	}
	function go3(){
		aaa.click();
	}
	</script>
	<script>
	function viewOrd(e){
		$.ajax({
			url:'${ctx}/store/ordView',
			type:"GET",
			dataType:"json",
			data:{
				"orderId":e
			},
			success:function(data){
				
				
 				/* var str='商品名稱:'+JSON.stringify(data[0].productsku.product.productName)+'購買數量:'+JSON.stringify(data[0].buyNumber)+'<br>132';
 				Swal.fire(); */
 				//var swal_html = '<div class="panel" style="background:aliceblue;font-weight:bold"><div class="panel-heading panel-info text-center btn-info"> <b>Import Status</b> </div> <div class="panel-body"><div class="text-center"><b><b style="font-weight:bold">商品名稱:'+data[0].productsku.product.productName+'</b><p style="font-weight:bold">購買數量:'+data[0].buyNumber+'</p></b></div></div></div>';
 				var swal_html = '<div class="panel" style="background:aliceblue;font-weight:bold"><div class="panel-heading panel-info text-center btn-info"> <b>商品</b> </div> <div class="panel-body"><div class="text-center">';
 				data.forEach(obj=>{
 						swal_html += '<b style="font-weight:bold">商品名稱 : '+obj.productsku.product.productName+'</b><p style="font-weight:bold">購買數量  : '+obj.buyNumber+'</p>';					
 				});
 				swal_html += '</div></div></div>'; 
 				
 				Swal.fire({title:"購買明細", html: swal_html});
			}
		})
	};
	
	</script>
</body>

</html>