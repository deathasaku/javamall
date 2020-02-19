<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>用戶管理</title>

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
button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
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
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">用戶管理</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active">用戶管理</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->

    <div class="col-12">
      <div class="card">
        
        <!-- /.card-header -->
        <div class="card-body table-responsive p-0">
       	<div
		style="padding: 10px; float: left; width: 1000px; margin-bottom: 100px;">
		<div class="container" style="text-align: center">
			<h1>會員管理</h1>
			<form action="getMemberByName" method="post">
				<input type="text" name="user" id="user"
					placeholder="輸入查詢"> <input type="submit" value="會員查詢">
			</form>
		</div>
		<table style="border: 3px #cccccc solid;" cellpadding="15" border='1'>
			<tr bgcolor="#8fefa">
			<tr>
				<th>會員編號
				<th>帳號
				<th>密碼
				<th>大頭貼
				<th>創辦日期
				<th>黑名單
				<th>電話
				<th style="width: 50px;">功能 <c:forEach var="user"
						items="${users}">
						<!--  隨便取                      對應Controller-->
						<tr>
							<td align="center">${user.id}</td>
							<td>${user.email}</td>
							<td>${user.password}</td>
							<td><div style="text-align: center">
									<img src="${ctx}${user.image}"
										height="120px" width="120px" required="required" />
							</div></td>							
							<td>${user.createDate}</td>
							<td><c:if test="${user.block==false}">已封鎖</c:if>
							<c:if test="${user.block==true}">正常</c:if>
							</td>
							<td>${user.tel}</td>
							
							
							<td>
							
							
							<c:if test="${user.block==true}">
							<form action="${ctx}/admin/banuser?userId=${user.id}&block=0" method="post">
								<button type="submit" class="btn btn-outline-secondary"
										style="background-color: #4CAF50; color: black;">封鎖</button>
								</form>
							</c:if>
							<c:if test="${user.block==false}">
							
							<form action="${ctx}/admin/banuser?userId=${user.id}&block=1" method="post">
								<button type="submit" class="btn btn-outline-secondary"
										style="background-color: #4CAF50; color: black;">解鎖</button>
								</form>
							</c:if>
							
							<form action="getOne?id=${user.id}" method="POST">
									<button type="submit" class="btn btn-outline-secondary"
										style="background-color: #4CAF50; color: black;">修改</button>
							</form>
							
							</td>

						</tr>
					</c:forEach>
			
						</tr>
		</table>
	</div>
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

<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
 <script src="${ctx}/admin/js/public.js" > </script>		 
<script src="${ctx}/admin/js/user.js"></script>
</body>
</html>