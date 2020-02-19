<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>聯絡人</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
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

<c:import url="/admin/sidebar"></c:import>
  
  
  
  

  <!-- Content Wrapper. Contains page content -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>聯絡人</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active">聯絡人</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
        
        <div class="row">
                <div class="input-group input-group-sm float-right" style="width: 150px;">
              <input type="text" name="table_search" class="form-control float-right" placeholder="Search" id="search">
              <div class="input-group-append">
                <button type="submit" class="btn btn-default"><i class="fas fa-search" onclick="search()"></i></button>
              </div>
            </div>
          </div>
            
          <div class="row d-flex align-items-stretch">
          <c:forEach var="item" items="${employees.content}">
          <c:if test="${item.id!=admin.id}">
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
              		${item.type}
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>${item.username}</b></h2>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
<%--                         <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: ${item.address}</li> --%>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: ${item.tel}</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="${ctx}${item.image}" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
<%--                    <a href="${ctx}/admin/friend/${item.id}" class="btn btn-sm bg-teal"> --%>
<!--                    <span>新增好友</span> -->
<!--                     </a> -->
                    <a href="${ctx}/admin/chat/${item.id}" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                        <span>對話</span> 
                    </a>

                  </div>
                </div>
              </div>
            </div>
            </c:if>
            </c:forEach>
       
          </div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
        
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
             <c:forEach begin="0" end="${employees.totalPages-1}"  varStatus="status">
               <li class="page-item ${employees.number==status.index?'active':''}"><a class="page-link" href="${ctx}/admin/contact?page=${status.count}${ !empty searchName?'&username=':''}${!empty searchName?searchName:''}">${status.count}</a></li>
             </c:forEach>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- /.content-wrapper -->

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

<!-- <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script> -->
<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>

 <script src="${ctx}/admin/js/public.js" > </script>		 
<script src="${ctx}/admin/js/goods.js"></script>		
<script type="text/javascript">

$("#search").keypress(function(e){
	  code = (e.keyCode ? e.keyCode : e.which);
	  if (code == 13)
	  {
		  search();
	  }

	});


function search() {
	window.location = '${ctx}/admin/contact?username='+$('#search').val();
}



</script>
</body>
</html>