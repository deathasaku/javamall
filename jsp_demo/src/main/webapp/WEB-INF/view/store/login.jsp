<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="server" value="${pageContext.request.serverName}"></c:set>
<c:set var="port" value="${pageContext.request.serverPort}"></c:set>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>會員登入</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="867101020440-cvofp0bq6a8jekij5fcdpc9favgoh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/assets/img/favicon.ico">
	<link rel="stylesheet"
	href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css">
<style>
.error {
	/* 當格式錯誤時，則新增此類別 */
	border-color: red !important
}
</style>
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
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<!-- jQuery Validation v1.17.0 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>  

</head>

<body>

	<!--header area start-->

	<!--offcanvas menu area start-->
	<c:import url="header.jsp" />
	<!--header area end-->

	<!--breadcrumbs area start-->
	<!-- 	<div class="breadcrumbs_area"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-12"> -->
	<!-- 					<div class="breadcrumb_content"> -->
	<!-- 						<h3>個人會員</h3> -->
	<!-- 						<ul> -->
	<%-- 							<li><a href="index.html">home</a></li> --%>
	<!-- 							<li>個人會員</li> -->
	<!-- 						</ul> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!--breadcrumbs area end-->

	<!-- customer login start -->
	<div class="customer_login">
		<div class="container">
			<div class="row">
				<!--login area start-->
				<div class="col-lg-6 col-md-6">
					<div class="account_form" style="width: 1200px;">
						<h2>登錄</h2>
						<div style="text-align: center">
							<h2 style="color: red">${errmsg}</h2>
							<c:if test="${not empty newpwd}">
								<div class="alert alert-danger" role="alert">您的新密碼為:${newpwd}</div>
							</c:if>
						</div>

						<form id="form2" action="${ctx}/store/loginDo" method="post"
							modelAttribute="user">
							<p>
								<label>Email</label> <input type="text" name="email" id="email">
							</p>
							<p>
								<label>密碼</label> <input type="password" name="password"
									id="password2">
							</p>
							<div class="login_submit">
								<a href="${ctx}/store/forgot-password">忘記密碼?</a> <a href="#"
									data-toggle="modal" data-target="#modal_box"><button
										type="submit">註冊</button></a> <label for="remember"
									style="padding-right: 40px"> <input id="remember"
									type="checkbox" name="remember" value="true"> 記住密碼
								</label>
								<button type="submit" style="float: right">登錄</button>
								<div class="g-signin2" onclick="ClickLogin()"
									data-onsuccess="onSignIn" data-theme="dark"
									style="float: right"></div>
								<!--     <a href="#" onclick="signOut();">Sign out</a> -->
								<div class="g-recaptcha" id="g-recaptcha-response"
									data-sitekey="6LfQZscUAAAAAN2xhkuxHSzOJJnEvjOA6lC4pGMF"
									data-callback="recaptchaCallback"></div>


								<div class="help-block with-errors text-danger "
									id="recaptchamsg" style="font-family: Microsoft JhengHei;"></div>
								<!-- 								<div> -->
								<!-- 									<button type="submit" value="Facebook登入" onclick="FBLogin();">Facebook登入</button> -->
								<!-- 									<button type="submit" value="Google登入" onclick="GoogleLogin();">Google登入</button> -->
								<!-- 								</div> -->


								<div class="input-group mb-3"> </div>

							</div>
						</form>
					</div>
				</div>
				<!--login area start-->
				<!--register area end-->
			</div>
		</div>
	</div>
	<!-- customer login end -->

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
						<h2>註冊</h2>
						<form id="form" method="post" action="${ctx}/store/addNewMember"
							enctype="multipart/form-data" modelAttribute="user">
							<p>
								<label for="url">Email:</label><span>*</span><input type="text"
									id="url" name="email"></input>
							</p>
							<p>
								<label for="password">密碼:<span>*</span></label> <input
									id="password" name="password" type="password" />
							</p>
							<p>
								<label for="confirm_password">確認密碼:<span>*</span></label> <input
									id="confirm_password" name="confirm_password" type="password" />
							</p>
							<p>
								<label for="fname">姓名:</label><span>*</span> <input type="text"
									id="fname" name="name"></input>
							</p>
							<p>
								<!-- <label for="date">生日</label> <input id="date" name="birth"
									class="date" /> -->
							<div class="birthday">
								<span>出生日期</span><select name="year" id="year"
									οnchange="getDays()"></select><span>年</span> <select
									name="month" id="month" οnchange="getDays()"></select><span>月</span>
								<select name="day" id="day"></select><span>日</span>
							</div>

							</p>

							<p>
								<label for="phone">聯絡電話:</label><input type="text" id="phone"
									name="tel"></input>
							</p>
							<p>
								<label for="address">地址:</label><span>*</span> <input
									type="text" id="address" name="address"></input>
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

							<p style="margin-top:15px;">
								<button type="submit" onclick="a=1" value="送出">送出</button>
								<button onclick=" autowrite()" value="自動填入">自動填入</button>								
							</p>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 	modal area end -->
	<c:if test=""></c:if>
	<script>
	var a=0;
		$(function() {
			if ('${msgg}' == "ok") {
				Swal.fire({text:'新增會員成功',type:'success'});
			} else if ('${msgg}' == "no") {
				Swal.fire({text:'新增會員失敗',type:'error'});
			}
		})
		// 		$(function() {

		// 			if ('${errmsg}' == "登陸成功") {
		// 				alert('${errmsg}');
		// 			} else if ('${errmsg}' == "email不能為空") {
		// 				alert('${errmsg}');
		// 			} else if ('${errmsg}' == "密碼不能為空") {
		// 				alert('${errmsg}');
		// 			} else if ('${errmsg}' == "email或密碼錯誤") {
		// 				alert('${errmsg}');
		// 			}
		// 		})

		$(function() {
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
							if(a==1)
								{
							form.submit();}
						}
					});

		});

		//新增的生日
		$(document).ready(
				function() {
					var date = new Date();//创建日期对象
					var year = date.getFullYear();//获取当前年份
					for (var i = year - 100; i <= year; i++) {//在id为year的selector附加option选项
						$("#year").append(
								"<option value=\""+i+"\">" + i + "</option>");//append函数附加html到元素结尾处
					}
					for (var i = 1; i <= 12; i++) {
						$("#month").append(
								"<option value=\""+i+"\">" + i + "</option>");//为Id为month的selector附加option选项
					}
					getDays($("#month").val(), $("#year").val());//执行函数getDays()，传参year和month，初始化day selector
				});
		function getDaysInMonth(month, year) {//年月对应的日数算法
			var days;
			if (month == 1 || month == 3 || month == 5 || month == 7
					|| month == 8 || month == 10 || month == 12) {
				days = 31;//固定31
			} else if (month == 4 || month == 6 || month == 9 || month == 11) {
				days = 30;//固定30
			} else {
				if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) { //排除百年，每四年一闰；每四百年一闰；
					days = 29; //闰年29
				} else {
					days = 28; //平年28
				}
			}
			return days;//返回该年月的日数
		}
		function getDays() {
			var year = $("#year").val();//year selector οnchange="getDays()"动态获取用户选择的year值
			var month = $("#month").val();//month selector οnchange="getDays()"动态获取用户选择的month值
			var days = getDaysInMonth(month, year);//调用算法函数计算对应年月的日数
			$("#day").empty();//调用empty()函数清空day selector options，然后再append函数往day selector添加options
			for (var i = 1; i <= days; i++) {
				$("#day").append("<option value=\""+i+"\">" + i + "</option>");
			}
		}
	</script>

	<!-- modal area end-->

	<!-- JS
============================================ -->
	<!--jquery min js-->
	<!-- 				<script src="${ctx}/assets/js/vendor/jquery-3.4.1.min.js"></script> -->
	<!--popper min js-->
	<script src="${ctx}/assets/js/popper.js"></script>
	<!--bootstrap min js-->
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!--owl carousel min js-->
	<script src="${ctx}/assets/js/owl.carousel.min.js"></script>
	<!--slick min js-->
	<script src="${ctx}/assets/js/slick.min.js"></script>
	<script src="${ctx}/assets/js/pp.js"></script>

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


	<!-- <script type="text/javascript">
		//應用程式編號，進入 https://developers.facebook.com/apps/ 即可看到
		let FB_appID = "489844471949859";

		//FB Login 官方文件：https://developers.facebook.com/docs/facebook-login/web

		// Load the Facebook Javascript SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		window.fbAsyncInit = function() {
			FB.init({
				appId : '489844471949859',//FB appID
				cookie : true, // enable cookies to allow the server to access the session

				xfbml : true, // parse social plugins on this page
				version : 'v5.0' // use graph api version
			});

		};

		//使用自己客製化的按鈕來登入
		function FBLogin() {

			FB.login(function(response) {
				//debug用
				console.log(response);
				if (response.status === 'connected') {
					//user已登入FB
					//抓userID
					let FB_ID = response["authResponse"]["userID"];
					console.log("userID:" + FB_ID);

				} else {
					// user FB取消授權
					alert("Facebook帳號無法登入");
				}
			}, {
				scope : 'public_profile,email'
			});

		}
	</script>



	Google登入
	<script async defer src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};HandleGoogleApiLibrary()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>
	<script type="text/javascript">
		//進入 https://console.developers.google.com/，找「憑證」頁籤(記得先選對專案)，即可找到用戶端ID
		let Google_appId = "867101020440-cvofp0bq6a8jekij5fcdpc9favgoh449.apps.googleusercontent.com";

		//參考文章：http://usefulangle.com/post/55/google-login-javascript-api 

		// Called when Google Javascript API Javascript is loaded
		function HandleGoogleApiLibrary() {
			// Load "client" & "auth2" libraries
			gapi
					.load(
							'client:auth2',
							{
								callback : function() {
									// Initialize client & auth libraries
									gapi.client
											.init(
													{
														clientId : Google_appId,
														scope : 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me'
													})
											.then(
													function(success) {
														// Google Libraries are initialized successfully
														// You can now make API calls 
														console
																.log("Google Libraries are initialized successfully");
													}, function(error) {
														// Error occurred
														console.log(error);// to find the reason 
													});
								},
								onerror : function() {
									// Failed to load libraries
									console.log("Failed to load libraries");
								}
							});
		}

		function GoogleLogin() {
			// API call for Google login  
			gapi.auth2.getAuthInstance().signIn().then(function(success) {
				// Login API call is successful 
				console.log(success);
				let Google_ID = success["El"];

			}, function(error) {
				// Error occurred
				// console.log(error) to find the reason
				console.log(error);
			});

		}
	</script>

	有些網站會做帳號和user FB帳號的綁定/解除綁定，或你想讓使用者刪除你的FB App，讓使用者下次可以切換不同FB帳號登入你的網站
	下面程式碼派得上用場
	<script type="text/javascript">
		//刪除使用者已授權你的FB App，好讓使用者下次重新授權你的FB App
		//參考：https://stackoverflow.com/questions/6634212/remove-the-application-from-a-user-using-graph-api/7741978#7741978
		function Del_FB_App() {
			FB.getLoginStatus(function(response) {//取得目前user是否登入FB網站
				//debug用
				console.log(response);
				if (response.status === 'connected') {
					// Logged into Facebook.
					//抓userID
					FB.api("/me/permissions", "DELETE", function(response) {
						console.log("刪除結果");
						console.log(response); //gives true on app delete success 
					});
				} else {
					// FB取消授權
					console.log("無法刪除FB App");
				}
			});

		}
	</script>

	類似上面Delete FB App的效果，呼叫此function後，下次使用者想再Google登入你的網站就必須重新選擇帳號
	<script type="text/javascript">
		//參考：https://developers.google.com/identity/sign-in/web/disconnect

		function Google_disconnect() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.disconnect().then(function() {
				console.log('User disconnect.');
			});
		}
	</script> -->
	<script type="text/javascript">
		var cookies = document.cookie.split(';');
		function getCK(mkey) {
			for (var i = 0; i < cookies.length; i++) {
				var kv = cookies[i].split('=');
				if (kv[0].trim() == mkey) {
					return kv[1].trim();
				}
			}
			return '';
		}

		window.onload = function() {
			var remember = getCK('remember');
			var email = getCK('email');
			var password = getCK('password');
			if (remember == 'true') {
				var userEmailInput = document.getElementById("email");
				userEmailInput.value = email;
				var userrememberInput = document.getElementById("remember");
				userrememberInput.value = "checked";
				var userpasswordInput = document.getElementById("password");
				userpasswordInput.value = password;
			}
		}
	</script>

	<script>
		$('#form2').on('submit', function(e) {
			// 			required : '必需填寫';
			if (grecaptcha.getResponse() == null) {
				//沒勾就給我下去

				$('#recaptchamsg').html("請勾選我不是機器人");
				e.preventDefault();
				return false;
			}
		});

		//勾選機器人以後 讓錯誤訊息消失
		function recaptchaCallback() {
			$('#recaptchamsg').html("");
		}
	</script>
	<script>
		var clicked = false;//Global Variable
		function ClickLogin() {
			clicked = true;
		}
		function onSignIn(googleUser) {
			// 傳回後臺驗證，並獲取userid
			if (clicked) {
				var id_token = googleUser.getAuthResponse().id_token;
				console.log("ID Token: " + id_token);
				var xhr = new XMLHttpRequest();
				xhr.open('POST',
// 						'${ctx}/store/googleVerify');
						"http://"+'${server}'+":"+'${port}'+'${ctx}'+'/store/googleVerify');
				xhr.setRequestHeader('Content-Type',
						'application/x-www-form-urlencoded');
				xhr.onload = function() {
					Swal.fire("登入成功");
					console.log('Signed in as: ' + xhr.responseText);
// 					location.href = '${ctx}/store/index';
					location.href = "http://"+'${server}'+":"+'${port}'+'${ctx}'+'/store/index';
				};
				xhr.send('idtokenstr=' + id_token);
			}
		};

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>
	<script>
	function autowrite(){
		a=0;
		form.email.value="eeit11016@gmail.com";
		form.password.value="123456";
		form.confirm_password.value="123456";
		form.name.value="陳阿傑";
		form.tel.value="0987654321";
		form.address.value="基隆區鐵路街123號";
	}
	
	
	</script>

</body>

</html>