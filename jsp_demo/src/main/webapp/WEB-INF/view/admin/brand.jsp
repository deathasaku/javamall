<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>品牌管理</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.css">

<link rel="stylesheet"
	href="${ctx}/admin/plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap4.css">
<link rel="stylesheet"
	href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

<!--   <link rel="stylesheet" href="plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap.css"> -->
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link type="text/css"
	href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css"
	rel="stylesheet" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<style type="text/css">
body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, '宋體', Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}


.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script> -->

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<!-- <script src="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script> -->

<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/> -->

<!-- <link href="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css" rel="stylesheet"/> -->



</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->

		<c:import url="/admin/sidebar"></c:import>




		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">品牌管理</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${ctx}/admin/index">首頁</a></li>
								<li class="breadcrumb-item active">品牌管理</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->

			<div class="col-12">
				<div class="card">

					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="    overflow-x:hidden;">
					
						<div class="grid-btn">

							<button class="btn btn-info" onclick="addBrand()">
								<i class="fa fa-plus"></i>&nbsp;新增
							</button>
							<button class="btn btn-info" onclick="modifyBrand()">
								<i class="fas fa-pencil-alt"></i>&nbsp;修改
							</button>
<!-- 							<button class="btn btn-danger" onclick="deleteBrand()"> -->
<!-- 								<i class="fa fa-trash"></i>&nbsp;删除 -->
<!-- 							</button> -->
						</div>



						<table id="table_id_example" class="display">
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>品牌名稱</th>
									<th>品牌圖片</th>
									<th>品牌資訊</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>

									</div>
									<div class="modal-body">

										<form action="" enctype="multipart/form-data" id="form">


											


											<div class="form-group">
												<label for="staticEmail">品牌名稱</label> <input type="text"
													class="form-control" id="brandName" name="brandName"
													>
											</div>

											<div class="form-group">
												<label for="staticEmail">品牌描述</label> <input type="text"
													class="form-control" id="brandInfo" name="brandInfo"
													>
											</div>
											
											<div class="form-group row">
												<label for="exampleInputFile"
													class="col-sm-4 col-form-label">品牌圖片</label>
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input "
															id="exampleInputFile" name="file" accept="image/*"
															required="required"> <label
															class="custom-file-label" for="exampleInputFile"
															id="filelabel">Choose file</label>
													</div>
												</div>

												<div class="help-block with-errors text-danger"
													style="font-family: Microsoft JhengHei;"></div>
											</div>

											<div class="form-group">
												<img id="blah" src="#" width="300" height="300"
													class="d-none" />
											</div>

										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>

										<button type="button" class="btn btn-primary" onclick="send()">送出</button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->
</div>


		<!-- Main Footer -->
		<c:import url="${ctx}/admin/footer"></c:import>
		<!-- ./wrapper -->

		<!-- REQUIRED SCRIPTS -->

		<!-- jQuery -->
		<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>


		<!-- Bootstrap 4 -->
		<script src="${ctx}/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
		<script src="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

		<script src="${ctx}/admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
		<script src="${ctx}/admin/plugins/jqgrid-5.3.0/grid.locale-zh.js"></script>

		<!-- <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script> -->
		<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
		<script src="${ctx}/admin/js/public.js"></script>
<%-- 		<script src="${ctx}/admin/js/index_carousel.js"></script> --%>
		
		<script
			src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript"
			src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>



		<script type="text/javascript">
		


		
			var table;
			$(function() {

				table = $('#table_id_example')
						.DataTable(
								{
									"paging" : true,
									autowidth : true,
									"bFilter" : true,
									"ajax" : {
										url : "${ctx}/admin/brandlist",
										type : "POST",
										"dataSrc" : ""
									},
									'columnDefs' : [
										{
											'targets' : 0,
											'data' : 'id',
											"defaultContent" : "",
											'checkboxes' : {
												'selectRow' : true
											}
										},
										{
											'targets' : 1,
											'data' : 'id'
										},
										{

											'targets' : 2,
											'data' : 'brandName'
										}, {
											'targets' : 3,
											'data' : 'brandLog',
											"render" : function(data) {
													if (data!=null) {
														return '<img  src="${ctx}'+data+'" width="200" height="200">';
													}
													return '';
											
											}
										}
										, {
											'targets' : 4,
											'data' : 'brandInfo'
										}
								],
									'select' : {
										'style' : 'multi'
									},
									'order' : [ [ 1, 'asc' ] ]

								});
			})

			function select() {
				var tt = [];
				var rows_selected = table.column(0).checkboxes.selected();
				var j = 0;
				//rowId 就是DATA
				$.each(rows_selected, function(index, rowId) {
					tt[j] = rowId;
					j = j + 1;
				});
				
				return tt;
			}

			//開關MODAL 新增修改用同一個
			//用onclick來送出 AJAX 在RELOAD
			function show_modal() {
				$("#blah").addClass("d-none");
				$('#filelabel').text("Choose file");
				$("#myModal").modal("show");
			}

			function hide_modal() {
				$("#myModal").modal("hide");
			}

			function addBrand() {
				$('#myModalLabel').text('新增');
				show_modal();
			}
			
			function modifyBrand() {

				$('#myModalLabel').text('修改');
				show_modal();
				//用AJ拿好了

				table.rows(function(idx, data, node){ 
					if(data.id==select()[0])
						{
						$('#blah').attr('src','${ctx}'+ data.brandLog);
						$('#brandName').val(data.brandName);//品牌名稱
						$('#brandInfo').val(data.brandInfo);//商品描述
						$("#blah").removeClass("d-none");
						}
});
				
				

			}
			function deleteBrand() {
				
				$.ajax({
					type : 'post',
					url : '${ctx}/admin/deletBrand',
					data : {id:select()}, //name=zhangsan&age=22
					success : function(data) {
						table.ajax.reload();
					}
				});

			}
			//新增
			function send() {
				var formData = new FormData();
				if (select().length>0) {
					formData.append('id',select()[0]);
				}
				formData.append('brandInfo', $('#brandInfo').val());
				formData.append('brandName', $('#brandName').val());
				formData.append('file', $('#exampleInputFile')[0].files[0]);

				hide_modal();

				$.ajax({
					type : 'post',
					url : '${ctx}/admin/addBrand',
					data : formData, // name=zhangsan&age=22
					cache : false, //設置為 false 將不緩存此頁面
					contentType : false,//發送信息至服務器時內容編碼類型
					processData : false,//默認會把data的數據轉為字符串
					success : function(data) {
						table.ajax.reload();
					}
				});
				event.preventDefault();
			}

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
</body>
</html>