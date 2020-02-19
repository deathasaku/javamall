<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>聊天</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">

  <link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- Select2 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script> -->


<style>
.ck-editor__editable_inline {
	min-height: 400px;
}

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

body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, '宋體', Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}

.container {
	max-width: 1170px;
	margin: auto;
}

img {
	max-width: 100%;
}

.inbox_people {
	background: #f8f8f8 none repeat scroll 0 0;
	float: left;
	overflow: hidden;
	width: 20%;
	border-right: 1px solid #c4c4c4;
}

.inbox_msg {
	border: 1px solid #c4c4c4;
	clear: both;
	overflow: hidden;
}

.top_spac {
	margin: 20px 0 0;
}

.recent_heading {
	float: left;
	width: 40%;
}

.srch_bar {
	display: inline-block;
	text-align: right;
	width: 60%;
	padding:
}

.headind_srch {
	padding: 10px 29px 10px 20px;
	overflow: hidden;
	border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
	color: #05728f;
	font-size: 21px;
	margin: auto;
}

.srch_bar input {
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 100%;
	padding: 2px 0 4px 6px;
	background: none;
}

.srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto
}

.chat_img {
	float: left;
	width: 11%;
}

.chat_ib {
	float: left;
	padding: 0 0 0 15px;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
}

.chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
}

.inbox_chat {
	height: 550px;
	overflow-y: scroll;
}

.active_chat {
	background: #ebebeb;
}

.incoming_msg_img {
	display: inline-block;
	width: 6%;
}

.received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
	margin: 26px 0 26px;
}

.received_withd_msg p {
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.received_withd_msg {
	width: 57%;
}

.mesgs {
	float: left;
	padding: 30px 15px 0 25px;
	width: 100%;
}

.sent_msg p {
	background: #05728f none repeat scroll 0 0;
	border-radius: 3px;
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.outgoing_msg {
	overflow: hidden;
	margin: 26px 0 26px;
}

.sent_msg {
	float: right;
	width: 46%;
}

.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}

.type_msg {
	border: 1px solid #c4c4c4;
	position: relative;
}

.msg_send_btn {
	background: #05728f none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}

.messaging {
	padding: 0 0 0 0;
}

.msg_history {
	height: 516px;
	overflow-y: auto;
	overflow-x: hidden;
}

.msg_cotainer_send {
	margin-top: auto;
	margin-bottom: auto;
	margin-right: 10px;
	border-radius: 25px;
	background-color: #78e08f;
	padding: 10px;
	position: relative;
}

.mb-4, .my-4 {
	margin-bottom: 1.5rem !important;
}

.d-flex {
	display: -ms-flexbox !important;
	display: flex !important;
}

.chat_list:hover {
	background-color: yellow;
}

.justify-content-end {
	-ms-flex-pack: end !important;
	justify-content: flex-end !important;
}

.msg_time_send {
	word-break: keep-all; /* 不換行 */
	white-space: nowrap; /* 不換行 */
	position: absolute;
	right: 0;
	bottom: -15px;
	color: black;
	font-size: 10px;
}

.img_cont_msg {
	height: 40px;
	width: 40px;
}

.user_img_msg {
	height: 40px;
	width: 40px;
	border: 1.5px solid #f5f6fa;
}

.justify-content-start {
	-ms-flex-pack: start !important;
	justify-content: flex-start !important;
}

.msg_cotainer {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 25px;
	background-color: #82ccdd;
	padding: 10px;
	position: relative;
}

.msg_time {
	word-break: keep-all; /* 不換行 */
	white-space: nowrap; /* 不換行 */
	position: absolute;
	left: 0;
	bottom: -15px;
	color: black;
	font-size: 10px;
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
							<h1 class="m-0 text-dark">公告訊息</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Starter Page</li>
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
					<div class="card-body table-responsive p-0">

						<div class=".container-fluid">


							<div class="messaging">
								<div class="inbox_msg">
								
									<div class="mesgs">
										<div class="msg_history">

											<c:forEach items="${msglist}" var="msg">

									

													<div class="d-flex justify-content-start mb-4">
														<div class="img_cont_msg">
															<!-- 								放聊天對象的圖片 -->
<%-- 															<img src="${ctx}${toUserserBean.image}" --%>
<!-- 																class="rounded-circle user_img_msg"> -->
<span>公告:</span>
														</div>
														<div class="msg_cotainer">
															${msg.text} <span class="msg_time">${msg.createDate}</span>
														</div>
													</div>


												
											</c:forEach>



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



				<!-- Main Footer -->

				<c:import url="${ctx}/admin/footer"></c:import>

			</div>
			<!-- ./wrapper -->

			<!-- REQUIRED SCRIPTS -->

			<!-- CKEDITOR5 插件  -->

			<script src="${ctx}/admin/plugins/ckeditor5/ckeditor.js"></script>
			<script src="${ctx}/admin/plugins/ckeditor5/translations/zh.js"></script>

			<!-- jQuery -->
			<script src="${ctx}/admin/plugins/jquery/jquery.min.js"></script>

			<!-- Bootstrap 4 -->
			<script
				src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- AdminLTE App -->
			<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
			<!--引用 Validator-->
			<script
				src="${ctx}/admin/plugins/bootstrap-validator/validator.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
				<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
			<script>
// 	只需要寫好 WS就好 注意不要跟SIDEBAR的WS重複 給庫

$(function () {
	chat_bottom();
})


function  chat_bottom() {
	$('.msg_history').scrollTop(function() { return this.scrollHeight; });
}

  var websocket = null;
  websocket = new WebSocket('ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/ws');

  
  

  
  websocket.onmessage = function(evt) {
      onMessage(evt)
  };
        websocket.onerror = function(evt) {
        	onError(evt)
        };
        
 
        function onMessage(evt) {
        	
			//在這邊的時候順去處理 message 以讀的問題
        	$.ajax({
		    	type : "post",
		    	url : '${ctx}/admin/announcement2', //公告更新
		    	dataType : "html",
		    	success : function(cont) {
		    		$(".msg_history").html(cont);
		    		chat_bottom();
		    		
		    		$.ajax({
		  		    	type : "post",
		  		    	url : '${ctx}/admin/unread_num',
		  		    	dataType : "text",
		  		    	success : function(cont) {
		  		    		//更新 通知訊息 和 公告
		  		    		$('#unread_num2').text(cont=="0"?"":cont);
		           			}
		  		    });
         			}
		    });
        }
        

        
        
        function change_user(id) {
        	window.location ='${ctx}/admin/chat/'+id;
        }
        
        function onError(event) { console.log(event.Data)}
        
 
        function doSendUser() {
        	  var msg = document.getElementById("msgtoserver").value;
        	  $('#msgtoserver').val("");
        
        
            if (websocket.readyState == websocket.OPEN) {
                websocket.send(JSON.stringify({fromUser:parseInt('${admin.id}'),toUser:parseInt('${toUser}'),toAll:false,text:msg}));//調用後台handleTextMessage方法

                
            }
        }
 
        
 
        function doSendUsers() {
            if (websocket.readyState == websocket.OPEN) {
                var msg = document.getElementById("inputMsg").value;
                websocket.send("#everyone#"+msg);//調用後台handleTextMessage方法
                alert("發送成功!");
            } else {
                alert("連接失敗!");
            }
        }
 
 
        window.close=function()
        {
            websocket.onclose();
        }

	

</script>
</body>
</html>