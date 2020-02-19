<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html >
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>規格管理</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.css">
 <link rel="stylesheet" href="${ctx}/admin/plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap4.css"> 
  <link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 
 <script type="text/javascript">var ctx='${ctx}';
 </script>
  
<!--   <link rel="stylesheet" href="plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap.css"> -->
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<style type="text/css">
body,button, input, select, textarea,h1 ,h2, h3, h4, h5, h6 { font-family: Microsoft YaHei,'宋體' , Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;}


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

  <c:import url="sidebar.jsp"></c:import>
  
  
  
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   
    <!-- Main content -->

    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">規格管理</h3>

          <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
              <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body table-responsive p-0">
                           <div class="grid-btn">
                            <button class="btn btn-info" onclick="propertyAdd()"><i
                                    class="fa fa-plus"></i>&nbsp;新增規格
                            </button>
                            <button class="btn btn-info" onclick="propertyEdit()"><i
                                    class="	fas fa-pencil-alt"></i>&nbsp;修改規格
                            </button>
                            
                            <button class="btn btn-danger" onclick="categoryDel()"><i
                                    class="	fas fa-pencil-alt"></i>&nbsp;刪除規格
                            </button>
                            
                        </div>
                        <table id="grid_id" class="table table-bordered">
                        </table>
                        <div id="grid_pager_id"></div>
                        
                        
                        
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

												<div class="form-group">
												<label for="property">規格</label> <input type="text"
													class="form-control" id="property" placeholder="請輸入規格名稱"
													value="">

											</div>
											
												<div class="form-group">
												<label for="propertyValue">規格屬性</label> <input type="text" placeholder="以,分隔規格屬性"
													class="form-control" id="propertyValue" 
													value="">

											</div>

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
        	<!-- 應該用摩太快的 我後悔了 算了 這邊先硬幹 之後有時間再改 直接抓這邊的值去給SWEETALERT用 -->
     
       
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.content -->
  </div>
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
<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
<script src="${ctx}/admin/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="${ctx}/admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="${ctx}/admin/plugins/jqgrid-5.3.0/grid.locale-zh.js"></script>

<!-- <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script> -->
<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>

 <script src="${ctx}/admin/js/public.js" > </script>		 
<script src="${ctx}/admin/js/property.js"></script>		
</body>
<script type="text/javascript">


</script>
</html>