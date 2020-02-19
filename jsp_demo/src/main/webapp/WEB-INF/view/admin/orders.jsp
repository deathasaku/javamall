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
<title>訂單管理</title>

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
	 width: auto 
 } 

td{
    white-space:nowrap;
    overflow:hidden;
    word-break:keep-all;
}

th{
    white-space:nowrap;
    overflow:hidden;
    word-break:keep-all;
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
							<h1 class="m-0 text-dark">訂單管理</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${ctx}/admin/index">首頁</a></li>
								<li class="breadcrumb-item active">訂單管理</li>
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

							<button class="btn btn-info" onclick="modifyStatus()">
								<i class="fa fa-plus"></i>&nbsp;修改訂單狀態
							</button>
<!-- 							<button class="btn btn-danger" onclick="deleteorder()"> -->
<!-- 								<i class="fa fa-trash"></i>&nbsp;刪除訂單 -->
<!-- 							</button> -->
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
									<th>訂單編號</th>
									<th>訂單詳情</th>
									<th>訂購用戶</th>
									<th>付款詳情</th>
									<th>訂單狀態</th>
									<th>出貨地址</th>
									<th>訂購日期</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>




						<!-- 不只一個MODAL囉 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document" style="max-width:none;" >
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel"></h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>

									</div>
									<div class="modal-body" id="modalbody">

										<form action="" enctype="multipart/form-data" id="form">
											<div class="form-group">
												<textarea class="form-control" rows="3"
													placeholder="Enter ..." id="reply"></textarea>

											</div>

										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>

										<button type="button" class="btn btn-primary" onclick="send()" id="sendbutton">送出</button>
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
			var time = new Date(data[7]).getTime();

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
									url : "${ctx}/admin/orderlist",
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
											'data' : 'id',
											"render" : function(data) {
												return '<button  class="btn btn-info" onclick="orderdetail('
														+ data
														+ ')">查看</button>';
											}
										}, {
											'targets' : 3,
											'data' : 'user.email'
										}, {
											//付款詳情
											'targets' : 4,
											'data' : 'payment',
											"render" : function(data) {
												if (data==null) {
													return '尚未付款';
												}
												return '<button  class="btn btn-info" onclick="payment('
														+ data.id
														+ ')">查看</button>';
											}
											
										}, {
											//訂單狀態
											'targets' : 5,
											'data' : 'status',
											'render':function(data)
											{
												var str="";
												switch (data) {
												case 0:
													str="下訂單"
													break;
												case 1:
													str="備貨"
													break;
												case 2:
													str="出貨"
													break;
												case 3:
													str="完成訂單"
													break;
												case 4:
													str="取消訂單"
													break;
												default:
													break;
												}
												return str;
											}
										}, {
											//出貨地址
											'targets' : 6,
											'data' : 'address',
										}, {
											//訂購地址
											'targets' : 7,
											'data' : 'createDate',
											"render" : function(data) {
												return new Date(data)
														.format("yyyy-MM-dd HH:mm:ss");
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


		
		function modifyStatus() {

			var div1 = '<div class="form-group">'
					+ '<select class="form-control" id="exampleFormControlSelect1">'
					+ '<option value="0" selected>下訂單</option>'
					+ '<option value="1">備貨</option>'
					+ '<option value="2">出貨</option>'
					+ '<option value="3">結單</option>'
					+ ' <option value="4">取消訂單</option>' + '</select>'
					+ '</div>';
				$('#modalbody').html(div1);
				$('#myModalLabel').text("修改訂單狀態");
				$('#sendbutton').removeClass("d-none");
				show_modal();
		}

		//開關MODAL 新增修改用同一個
		//用onclick來送出 AJAX 在RELOAD
		
// 		$('#myModal').on('show.bs.modal', function () {
// 		       $(this).find('.modal-body').css({
// 		              width:'auto', //probably not needed
// 		              height:'auto', //probably not needed 
// 		              height:'auto', //probably not needed 
// 		              'max-height':'100%'
// 		       });
// 		});
		
		function show_modal() {
			$("#myModal").modal("show");
		}

		function hide_modal() {
			$("#myModal").modal("hide");
		}
		function orderdetail(id) {
			
        	$.ajax({
		    	type : "post",
		    	url : '${ctx}/admin/ordertable1',
		    	dataType : "html",
		    	data:{
		    		"id":id
		    	},
		    	success : function(cont) {
		    		$('#modalbody').html(cont);
		    	
					$('#myModalLabel').text("訂單詳情");
					$('#sendbutton').addClass("d-none");
					show_modal();
         			}
		    });
		}
		
		function payment(id) {
			
        	$.ajax({
		    	type : "post",
		    	url : '${ctx}/admin/ordertable2',
		    	dataType : "html",
		    	data:{
		    		"id":id
		    	},
		    	success : function(cont) {
		    		$('#modalbody').html(cont);
					$('#myModalLabel').text("付款詳情");
					$('#sendbutton').addClass("d-none");
					
					var obj = JSON.parse($('#ship').text());
						$('#ship').text(obj.city + obj.line1);
					show_modal();
         			}
		    });
		}

		
		
		function changeorder() {

		}

		function deleteorder() {

			$.ajax({
				type : 'post',
				url : '${ctx}/admin/deleteorder',
				data : {
					id : select()
				}, //name=zhangsan&age=22
				success : function(data) {
					table.ajax.reload();
				}
			});

		}

		//新增
		function send() {
			hide_modal();
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/modifyorder',
				data : {
					id : select(),
					status : $('#exampleFormControlSelect1').val()
				}, // name=zhangsan&age=22
				success : function(data) {
					table.ajax.reload();
				}
			});
			event.preventDefault();
		}
	</script>
</body>
</html>