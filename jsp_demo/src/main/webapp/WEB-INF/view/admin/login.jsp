<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>後台登入</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<style type="text/css">
.has-error .form-control {
	border-color: #883333;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.has-error .form-control:focus {
	border-color: #632525;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px
		#c35e5e;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #c35e5e;
}

body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, '宋體', Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<b>商城管理系統登入</b>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">登入</p>

				<!--登錄錯誤訊息顯示區塊  -->
				<c:if test="${not empty admin_login_error}">
					<div class="alert alert-danger" role="alert">${admin_login_error}</div>
				</c:if>

				<c:if test="${not empty newpwd}">
					<div class="alert alert-danger" role="alert">${newpwd=="false"?"密碼重置失敗":"您的新密碼是:"}${newpwd=="false"?"":newpwd}</div>
				</c:if>
				<form action="${ctx}/admin/login" method="POST" id="login_form">
					<!-- 					onsubmit="return validateForm()" -->
					<div class="form-group">
						<div class="input-group mb-3">
							<input type="email" class="form-control" placeholder="帳號"
								required="required" value="${cookie.rem.value}" onblur="rmac()"
								name="username" id="account">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-envelope"></span>
								</div>
							</div>


						</div>
						<div class="help-block with-errors text-danger "
							style="font-family: Microsoft JhengHei;"></div>
					</div>

					<div class="form-group">
						<div class="input-group mb-3">
							<input type="password" class="form-control" placeholder="密碼" id="password"
								required="required" name="password">

							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>

						</div>
						<div class="help-block with-errors text-danger "
							style="font-family: Microsoft JhengHei;"></div>
					</div>

					<div class="input-group mb-3">

						 
						<div class="g-recaptcha" id="g-recaptcha-response"
							data-sitekey="6LfQZscUAAAAAN2xhkuxHSzOJJnEvjOA6lC4pGMF"
							data-callback="recaptchaCallback"></div>

						<div class="help-block with-errors text-danger " id="recaptchamsg"
							style="font-family: Microsoft JhengHei;"></div>
					</div>




					<div class="row">

						<div class="col-4">
							<div class="icheck-primary">
								<input type="checkbox" id="remembAccount" name="remembAccount"
									value="true" onchange="remac(this)"
									${!empty cookie.rem.value ?'checked':''}> <label
									for="remembAccount"> 記住帳號 </label>
							</div>
						</div>

						<div class="col-4">
							<div class="icheck-primary">
								<input type="checkbox" id="remember" name="rememberMe">
								<label for="remember"> 維持登入 </label>
							</div>
						</div>

						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-danger btn-block">登入</button>
						</div>
						<!-- /.col -->
					</div>


				</form>
				<!-- 				<div class="social-auth-links text-center mb-3"> -->
				<!-- 					    -->
				<!-- 					<p>- OR -</p> -->

				<!-- 					<div class="fb-login-button" data-width="" data-size="large" -->
				<!-- 						data-button-type="continue_with" data-auto-logout-link="true" -->
				<!-- 						data-use-continue-as="false"></div> -->

				<!-- 					<a href="#" class="btn btn-block btn-danger"> <i -->
				<!-- 						class="fab fa-google-plus mr-2"></i> 用GOOGLE登入 -->
				<!-- 					</a> -->
				<!-- 				</div> -->


				<!-- /.social-auth-links -->

				<p class="mb-1">
					<a href="${ctx}/admin/register">申請帳號</a>
					<a href="${ctx}/admin/forgot-password">忘記密碼</a>
				</p>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
	<div id="fb-root"></div>

	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v5.0&appId=610844403054237&autoLogAppEvents=1"></script>
	<script src="${ctx}/admin/plugins/bootstrap-validator/validator.min.js"></script>

	<script>
	
		$(function () {
			if('${!empty remadmin}'=='true'){
				$("#remember").prop('checked', true);
				$('#account').val('${remadmin.account}');
				$('#password').val('${remadmin.password}');
				$('#login_form').submit();
			}	
		}
		)
		//記住帳號1
		function rmac() {

			if ($('#remembAccount').prop("checked")) {
				remac();
			}

		}
		//記住帳號2
		function remac() {
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/remember',
				data : {
					remembAccount : $('#remembAccount').prop("checked"),
					account : $('#account').val()
				}, //name=zhangsan&age=22
				success : function(data) {

				}
			});

		}

		$('#login_form').validator().on('submit', function(e) {
			if (e.isDefaultPrevented()) { // 未驗證通過 則不處理

				return;
			} else {

							if (grecaptcha.getResponse()==null) {
								//沒勾就給我下去
								$('#recaptchamsg').html("請勾選我不是機器人");
								e.preventDefault();
								return;
							}
			}
		});

		//勾選機器人以後 讓錯誤訊息消失
		function recaptchaCallback() {
			$('#recaptchamsg').html("");
		}

		function statusChangeCallback(response) {
			//可用於後台驗證，但是前台調用SDK則會自動驗證
			var accessToken = response.authResponse.accessToken;
			console.log(response.authResponse.accessToken);
			if (response.status === 'connected') {//sdk會自動保留accessToken，並且驗證該請求是否來自我的應用
				FB
						.api(
								'/me?fields=name,first_name,last_name,email',
								function(response) {
									//將用戶信息傳回服務端
									conlose.log("aaaaaaaaaaa");
									window.location.href = "./userInfo="
											+ JSON.stringify(response);
									/* $.ajax({
									        url:"http://gntina.iok.la/userInfo",
									        data:{
									        	userInfo:JSON.stringify(response)
									        },
									        dataType:"json",
									        async:false,
									        success:function(data){
									        	window.location.href="";
									        } 
									    }); */

									document.getElementById('status').innerHTML = 'Thanks for logging in, '
											+ response.name + '!';

								});

			} else {

				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '610844403054237',
				cookie : true,
				xfbml : true,
				version : '5.0'
			});

			FB.AppEvents.logPageView();

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

</body>
</html>
