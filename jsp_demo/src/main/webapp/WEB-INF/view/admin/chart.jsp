<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>報表</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
		  <link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 
<style>
body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, '宋體', Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}
</style>

</head>
<body class="hold-transition sidebar-mini layout-fixed layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->

		<c:import url="sidebar.jsp"></c:import>





		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->

			<!-- Main content -->
			<section class="content">



				<!-- /.card-body -->

				<div class="card card-danger">
					<div class="card-header">
						<h3 class="card-title">報表</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
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


						</div>
						<canvas id="example" width="400" height="200" class="col-sm-6"></canvas>

					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->

			</section>


			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->



		<!-- Main Footer -->
		<c:import url="${ctx}/admin/footer"></c:import>
		<!-- ./wrapper -->

		<!-- REQUIRED SCRIPTS -->

		<!-- CKEDITOR5 插件  -->


		<!-- jQuery -->
		<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>

		<!-- Bootstrap 4 -->
		<script
			src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- AdminLTE App -->
		<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
		<script src="${ctx}/admin/js/public.js">
			
		</script>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
					<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
			
</body>
<script>
	var chartlabels = [];
	var chartdata = [];
	var example=null;
	$(function() {
		$('#datetimepicker1').datetimepicker({
			format : 'YYYY-MM',
			autoclose : true,
			defaultDate : new Date()
		}

		);
		chartupdate();
		//$('#datetimepicker1').datetimepicker('defaultDate',new Date());

		//重新繪製CHART
		//先用AJ撈資料
		$('#datetimepicker1').on("change.datetimepicker", function(e) {

			chartupdate()

		});

	}

	)

	function chartupdate() {
		var d = new Date($('#datetimepicker1').datetimepicker('date'));
		//alert($('#datetimepicker1').datetimepicker('viewDate'));
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/chartJson',
			data : {
				"date" : moment(d).format('YYYY-MM')
			}, //name=zhangsan&age=22
			dataType : 'json',
			success : function(data) {
				chartlabels = [];
				chartdata = [];
				//處理DATA 然後繪圖			
				var arr = Object.keys(data);
				for (var i = 0; i < arr.length; i++) {
					chartlabels[i] = arr[i];
					chartdata[i] =  parseInt(data[arr[i]]);
					
// 	 				ctx.data.labels.push( arr[i]);
// 	 				ctx.data.datasets.forEach(dataset => {
// 	 			        dataset.data.push( parseInt(data[arr[i]]));
// 	 			    });
	
				}
				
// 				removeData();
				
// 				ctx.data.labels.push(chartlabels);
// 				ctx.data.datasets.forEach(dataset => {
// 			        dataset.data.push(chartdata);
// 			    });

				// labels;
				//	 data;
			    if(example!=null){
			    	example.destroy();
			    }
				example = new Chart($('#example') , {
					// 參數設定[註1]
					type : "bar", // 圖表類型
					data : {
						labels : chartlabels, // 標題
						datasets : [ {
							label : "銷售數量", // 標籤
							data : chartdata, // 資料
							backgroundColor : [ // 背景色
							"#FF0000", "#00FF00", "#0000FF", ],
							borderWidth : 1
						// 外框寬度
						} ]
					}
				});
				
			}
		});
	}

	

//	document.getElementById("example")

</script>
</html>