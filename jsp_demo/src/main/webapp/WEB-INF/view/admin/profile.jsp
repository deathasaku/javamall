<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>個人資料</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.css">
  
 <link rel="stylesheet" href="${ctx}/admin/plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap4.css"> 
 
    <link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 
<!--   <link rel="stylesheet" href="plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap.css"> -->
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

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
body,button, input, select, textarea,h1 ,h2, h3, h4, h5, h6 { font-family: Microsoft YaHei,'宋體' , Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->

  <c:import url="sidebar.jsp"></c:import>
  
  
  
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">個人資料</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">個人資料</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->

<div class="row">
<div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">基本信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userNameForm" data-toggle="validator" action="${ctx}/admin/profile" method="post" enctype="multipart/form-data">
                                    <div class="form-group col-sm-8">
                                        <div class="alert alert-danger" id="updateUserName-info" style="display: none;"></div>
                                    </div>
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label>帳號</label>
                                        <input type="text" class="form-control" id="loginUserName" readonly="readonly"
                                               name="loginUserName" value="${admin.account}"
                                             >
                                    </div>
                                    <div class="form-group">
                                        <label>暱稱</label>
                                        <input type="text" class="form-control" id="nickName"
                                               name="nickName"
                                               placeholder="請輸入暱稱" required="true" value="${admin.username}">
                                               	<div class="help-block with-errors text-danger"
style="font-family: Microsoft JhengHei;"></div>
                                    </div>
                                    
                                                                        <div class="form-group">
                                        <label>手機</label>
                                        <input type="tel" class="form-control" 
                                               name="telp"
                                               placeholder="請輸入手機號碼" required="true" value="${admin.tel}">
                                               	<div class="help-block with-errors text-danger"
style="font-family: Microsoft JhengHei;"></div>
                                    </div>
                                    	<div class="form-group row">
												<label for="exampleInputFile"
													class="col-sm-4 col-form-label">大頭貼</label>
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input "
															id="exampleInputFile" name="file" accept="image/*"
															required="required"> <label
															class="custom-file-label" for="exampleInputFile"
															id="filelabel">Choose file</label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<img id="blah" src="${admin.image}" width="300" height="300"
													class="d-none" />
											</div>
											
                                    <div class="card-footer">
                                    
            			  <button type="submit" class="btn btn-primary">確認修改</button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">修改密碼</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userPasswordForm" data-toggle="validator" action="${ctx}/admin/profilepwd" method="post">
                                    <div class="form-group col-sm-8">
                                        <div class="alert alert-danger updatePassword-info" id="updatePassword-info" style="display: none;"></div>
                                    </div>
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label"><i class="fa fa-key"></i>新密碼</label>
                                        <input type="password" class="form-control" id="originalPassword"
                                               name="originalPassword"
                                               placeholder="請輸入新密碼" required>
                                               	<div class="help-block with-errors text-danger"
style="font-family: Microsoft JhengHei;"></div>
                                    </div>
                                    <!--  問題 他好像被已被送出 沒有被攔截?  -->
                                    <div class="form-group">
                                        <label class="control-label"><i class="fa fa-key"></i>重複確認</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword"
                                               placeholder="新密码重複確認" required data-match="#originalPassword"
                                               data-match-error="糟了！密碼並未吻合，請重新輸入"
                                               >
                                               	<div class="help-block with-errors text-danger"
style="font-family: Microsoft JhengHei;"></div>
                                    </div>
                                    <div class="card-footer">
  <button type="submit" class="btn btn-primary">確認修改</button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>

</div>
    <!-- /.content -->

  </div>
  <!-- /.content-wrapper -->



  <!-- Main Footer -->
<c:import url="${ctx}/admin/footer"></c:import>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
<script src="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

	<script src="${ctx}/admin/plugins/bootstrap-validator/validator.min.js"></script>

<!-- <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script> -->
<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>

</body>
<script type="text/javascript">



function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		$('#filelabel').text(input.files[0].name);
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


</script>
</html>