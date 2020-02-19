<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>註冊員工帳號</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="${ctx}/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<style>
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
body,button, input, select, textarea,h1 ,h2, h3, h4, h5, h6 { font-family: Microsoft YaHei,'宋體' , Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;}
</style>

</head>
<body class="hold-transition register-page">
<div class="">
  <div class="register-logo">
    <a href="${ctx}/admin/login"><b>商城後台管理系統</b></a>
  </div>
  <form action="${ctx}/admin/register" method="post"  enctype="multipart/form-data"
				data-toggle="validator">
  <div class="card">

    <div class="card-body">
      <p class="login-box-msg">註冊新帳號</p>
							<!-- body -->
												
							<!-- body -->
						

							<!-- body -->
							<div class="row">
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>帳號</label> <input type="text" class="form-control" name="account"  
											placeholder="abcdef@gmail.com" id="goodsName" required="required">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								
								<div class="col-sm-6">
								<div class="form-group">
                    <label for="exampleInputFile">大頭貼</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile" name="file" accept="image/*"  required="required">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      </div>
                      <div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
                    </div>
                  </div>
                  
							</div>

							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>姓名</label> <input type="text"  class="form-control" required="required"
											placeholder="Enter ..." id="originalPrice" name="username">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>密碼</label> <input type="password"  class="form-control" required="required"
											placeholder="Enter ..." id="inputPW">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>確認密碼</label> <input type="password" class="form-control" required="required" 
											data-match="#inputPW" data-match-error="糟了！密碼並未吻合，請重新輸入"
											placeholder="Enter ..." id="stockNum" name="password">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>

							</div>
								<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>手機</label> <input type="text"  class="form-control" required="required"
											placeholder="Enter ..." id="originalPrice2" name="tel">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								<!--之後再補職位的設定 這裡應該是去從數據庫的TABLE撈出來ㄏㄏ 算了-->
								<div class="form-group">
                        <label>職位</label>
                        <select class="form-control" name="type">
                          <option>打雜</option>
                          <option>經理</option>
                        </select>
                      </div>
                      
							</div>
<div class="row">
											<div class="form-group">
												<img id="blah" " width="300" height="300"
													class="d-none" />
											</div>
</div>

						</div>

						<!-- /.card-body -->

					</div>
					<!-- card-腳腳 -->
					<div class="card-footer">
						<input type="hidden" name="block" value="false">
						<button type="submit" class="btn btn-primary">送出</button>
						
					</div>
					<!-- /.card -->

		</form>
		
			


      


      <a href="${ctx}/admin/login" class="btn btn-primary">已有帳號</a>
      <button type="submit" class="btn btn-primary" onclick="autowrite()">自動填寫</button>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- CKEDITOR5 插件  -->


	<!-- jQuery -->

	
	<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
	<!--引用 Validator-->
	<script src="${ctx}/admin/plugins/bootstrap-validator/validator.min.js"></script>
	




 <script src="${ctx}/admin/js/public.js" > </script>		 

    <script type="text/javascript">



function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {

			$('#blah').attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);

		$("#blah").removeClass("d-none");

	}
}

$("#exampleInputFile").change(function() {
	readURL(this);
});

function autowrite() {
	$('#goodsName').val('eeit110@gmail.com');
	$('#originalPrice').val('陳阿傑');
	$('#inputPW').val('123456');
	$('#stockNum').val('123456');
	$('#originalPrice2').val('0912345678');
	
}

</script>

    


</body>

</html>