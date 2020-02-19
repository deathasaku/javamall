<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
<script type="text/javascript">var ctx='${ctx}'</script>
  <title>後台用戶管理</title>

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
    

    <!-- Main content -->

    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">後台用戶管理</h3>

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
                            <button class="btn btn-info" onclick="lockUser(0)"><i
                                    class="fa fa-plus"></i>&nbsp;解除封鎖
                            </button>
                            <button class="btn btn-danger" onclick="lockUser(1)"><i
                                    class="fa fa-trash"></i>&nbsp;封鎖
                            </button>
                        </div>
                        <table id="grid_id" class="table table-bordered">
                        </table>
                        <div id="grid_pager_id"></div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
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

<script src="${ctx}/admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="${ctx}/admin/plugins/jqgrid-5.3.0/grid.locale-zh.js"></script>

<!-- <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script> -->
<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<script type="text/javascript">var ctx='${ctx}'</script>
 <script src="${ctx}/admin/js/public.js" > </script>		 
<script src="${ctx}/admin/js/admin_user.js"></script>		
</body>
</html>