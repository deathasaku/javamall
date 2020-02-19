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
<title>員工管理</title>

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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
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
							<h1 class="m-0 text-dark">員工管理</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${ctx}/admin/index">首頁</a></li>
								<li class="breadcrumb-item active">員工管理</li>
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
					<div class="card-body table-responsive p-0"
						style="overflow-x: hidden;">

                            <div class="grid-btn">
                            <button class="btn btn-info" onclick="editEmployee()"><i
                                    class="fa fa-plus"></i>&nbsp;修改員工信息
                            </button>
                            <button class="btn btn-info" onclick="verifyEmployee()"><i
                                    class="fas fa-pencil-alt"></i>&nbsp;審核通過
                            </button>
                            <button class="btn btn-success" onclick="unlockEmployee()"><i
                                    class="fa fa-arrow-up"></i>&nbsp;解鎖員工帳號
                            </button>
                            <button class="btn btn-danger" onclick="banEmployee()"><i
                                    class="fa fa-arrow-down"></i>&nbsp;鎖定員工帳號
                            </button>

                        </div>


						<div class="row">

							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group date" id="datetimepicker1"
										data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input"
											data-target="#datetimepicker1" placeholder="開始日期" />
										<div class="input-group-append" data-target="#datetimepicker1"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group date" id="datetimepicker2"
										data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input"
											data-target="#datetimepicker2" placeholder="結束日期" />
										<div class="input-group-append" data-target="#datetimepicker2"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>


						<table id="table_id_example" class="display">
							<thead>
								<tr>
									<th></th>
									<th>員工編號</th>
									<th>帳號</th>
									<th>姓名</th>
									<th>大頭貼</th>
									<th>手機</th>
									<th>職位</th>
									<th>帳號狀態</th>
									<th>審核狀態</th>
									<th>創建日期</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
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

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>



	<script type="text/javascript">
		$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
			var min = new Date($('#datetimepicker1').datetimepicker('date'))
					.getTime();
			var max = new Date($('#datetimepicker2').datetimepicker('date'))
					.getTime();
			var time = new Date(data[4]).getTime();

			if ((min == 0 && max == 0) || (min == 0 && time <= max)
					|| (min <= time && max == 0)
					|| (min <= time && time <= max)) {
				return true;
			}
			return false;
		});

		var table;
		$(function() {

			table = $('#table_id_example')
					.DataTable(
							{

								"paging" : true,
								autowidth : true,
								"bFilter" : true,
								"ajax" : {
									url : "${ctx}/admin/employeelist",
									type : "POST",
									"dataSrc" : ""
								},
								'columnDefs' : [
										{
											'targets' : 0,
											'data' : 'id',
											//                    'render': function (data, type, row, meta) {
											//         return meta.row + meta.settings._iDisplayStart + 1;
											//     }
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
											'data' : 'account'
										
										},
										{

											'targets' : 3,
											'data' : 'username'
										}, {
											'targets' : 4,
											'data' : 'image',
											"render" : function(data) {
												return '<img src="'+'${ctx}'+data+'"width="150" height="150">';
											}
										}, {
											'targets' : 5,
											'data' : 'tel',
										},
										 {
											'targets' : 6,
											'data' : 'type',
										},
										{
											'targets' : 7,
											'data' : 'block',
											'render':function(data){
												
												
												return data==true?'<button type="button" class="btn btn-danger">已封鎖</button>':'<button type="button" class="btn btn-primary">正常</button>';
											}
										},
										{
											'targets' : 8,
											'data' : 'verify',
											'render':function(data){
												return data==true?'<button type="button" class="btn btn-success">通過</button>':'<button type="button" class="btn btn-danger">未審核</button>';
											}
										},
										{
											'targets' : 9,
											'data' : 'createDate',
											'render':function(data){
												
												return new Date(data).format("yyyy-MM-dd HH:mm:ss");
											}
										}
										

								],
								'select' : {
									'style' : 'multi'
								},
								'order' : [ [ 1, 'asc' ] ]

							});

			$('#datetimepicker1').datetimepicker({
				format : 'L',
				autoclose : true
			});
			$('#datetimepicker1').on("change.datetimepicker", function(e) {
				table.draw();
			});

			$('#datetimepicker2').datetimepicker({
				format : 'L',
				autoclose : true
			});
			$('#datetimepicker2').on("change.datetimepicker", function(e) {
				table.draw();
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

		

		/**
		 * 添加商品 直接頁面跳轉 之後都SET URL 用EL去田 路徑一定部會出包
		 */
		function addEmployy() {
		    window.location.href = "${ctx}/admin/adduser";
		}

		/**
		 * 修改商品
		 */
		function editEmployee() {
		    //麻煩 在處理
		    window.location.href = "${ctx}/admin/editEmployee?id=" + select()[0];
		}

		/**
		 * 上架 這邊都要大改 記得連 PUBLIC 別忘記改 
		 */
		 
		function verifyEmployee() {
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/verifyEmployee',
				data : {
					id : select(),
					status:true
				}, //name=zhangsan&age=22
				success : function(data) {
					table.ajax.reload();
				    
				}
			});

			
			
		}
		 
		function banEmployee() {
  
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/changeEmployeeStatus',
				data : {
					id : select(),
					status:true
				}, //name=zhangsan&age=22
				success : function(data) {
					table.ajax.reload();
				    
				}
			});

		}

		/**
		 * 下架
		 */
		function unlockEmployee() {

			$.ajax({
				type : 'post',
				url : '${ctx}/admin/changeEmployeeStatus',
				data : {
					id : select(),
					status:false
				}, //name=zhangsan&age=22
				success : function(data) {
					table.ajax.reload();
				    
				}
			});

		}
		
	</script>
</body>
</html>