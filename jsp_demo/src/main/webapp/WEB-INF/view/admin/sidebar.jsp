<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- Navbar -->

<nav class="main-header navbar navbar-expand navbar-white navbar-light">

	<!-- Left navbar links -->
	<ul class="navbar-nav">

		<li class="nav-item d-none d-sm-inline-block"><a
			href="${ctx}/admin/index" class="nav-link">首頁</a></li>

	</ul>



	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
				<!--           鳩四這個  三要調整 放到MODEL 裡面 用SERVICE 去算 然後 那邊去撈 記得檢查 預設給0 -->
				<span class="badge badge-danger navbar-badge" id="unread_num">${unread!=0?unread:""}</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"
				id="drop1">
				<!--         這邊開始 -->
				<c:forEach items="${dropmsg}" var="msg">
					<a href="${ctx}/admin/chat/${msg.key.id}" class="dropdown-item">
						<!-- Message Start -->
						<div class="media">
							<img src="${ctx}${msg.key.image}" alt="User Avatar"
								class="img-size-50 mr-3 img-circle">
							<div class="media-body">
								<h3 class="dropdown-item-title">
									${msg.key.username}
									<!--                   <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
								</h3>
								<p class="text-sm">${msg.value[0].text}</p>
								<p class="text-sm text-muted">
									<i class="far fa-clock mr-1"></i> ${msg.value[0].createDate}
								</p>
							</div>
						</div> <!-- Message End -->
					</a>
				</c:forEach>
				<!--           到這結束 -->
				<div class="dropdown-divider"></div>
				<!--           跳轉到CHAT -->
				<a href="${ctx}/admin/chat" class="dropdown-item dropdown-footer">See
					All Messages</a>
			</div></li>
		<!-- Notifications Dropdown Menu -->

		<li class="nav-item dropdown" onclick="readit()"><a
			class="nav-link" data-toggle="dropdown" href="#"> <i
				class="far fa-bell"></i> <span
				class="badge badge-warning navbar-badge" id="unread_num2">${unread2!=0?unread2:""}</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"
				id="drop2">

				<c:forEach var="msg" items="${announcement}" end="4">
					<div class="dropdown-divider"></div>
            ${msg.text}
</c:forEach>


				<div class="dropdown-divider"></div>
				<a href="${ctx}/admin/announcement"
					class="dropdown-item dropdown-footer">See All Messages</a>

			</div></li>

	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${ctx}/admin/index" class="brand-link"> <img
		src="${ctx}/admin/dist/img/AdminLTELogo.png" alt="蹦娃娛樂"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">商城管理系統</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img
					src="${ctx}${empty admin.image?'/admin/dist/img/AdminLTELogo.png':admin.image }"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">你好R,${empty admin.username?"使用者":admin.username}</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->


				<!--           <li class="nav-item has-treeview menu-open"> -->
				<!--             <a href="#" class="nav-link active"> -->
				<!--               <i class="nav-icon fas fa-tachometer-alt"></i> -->
				<!--               <p> -->
				<!--                 Starter Pages -->
				<!--                 <i class="right fas fa-angle-left"></i> -->
				<!--               </p> -->
				<!--             </a> -->
				<!--             <ul class="nav nav-treeview"> -->
				<!--               <li class="nav-item"> -->
				<!--                 <a href="#" class="nav-link active"> -->
				<!--                   <i class="far fa-circle nav-icon"></i> -->
				<!--                   <p>Active Page</p> -->
				<!--                 </a> -->
				<!--               </li> -->
				<!--               <li class="nav-item"> -->
				<!--                 <a href="#" class="nav-link"> -->
				<!--                   <i class="far fa-circle nav-icon"></i> -->
				<!--                   <p>Inactive Page</p> -->
				<!--                 </a> -->
				<!--               </li> -->
				<!--             </ul> -->
				<!--           </li> -->



				<!-- 首頁配置 -->
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-copy"></i>
						<p>
							首頁配置 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a href="${ctx}/admin/index_carousel"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>輪播圖片</p>
						</a></li>
						<%-- 						<li class="nav-item"><a href="${ctx}/admin/index_config" --%>
						<!-- 							class="nav-link"> <i class="far fa-circle nav-icon"></i> -->
						<!-- 								<p>BOSS推薦</p> -->
						<!-- 						</a></li> -->

					</ul></li>
				<!--  首頁配置END -->



				<!--商品管理  -->
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-copy"></i>
						<p>
							商品 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a href="${ctx}/admin/goods"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>商品管理</p>
						</a></li>
						<li class="nav-item"><a href="${ctx}/admin/addgoods"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>添加商品</p>
						</a></li>
						<li class="nav-item"><a href="${ctx}/admin/orders"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>商品訂單</p>
						</a></li>

						<li class="nav-item"><a href="${ctx}/admin/review"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>商品評價管理</p>
						</a></li>

						<li class="nav-item"><a
							href="${ctx}/admin/category?categoryLevel=0&parentId=0&backParentId=0"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>商品類別</p>
						</a></li>
						<li class="nav-item"><a href="${ctx}/admin/property"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>商品規格</p>
						</a></li>
						<li class="nav-item"><a href="${ctx}/admin/brand"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>品牌管理</p>
						</a></li>

					</ul></li>
				<!--   商品管理 END -->

				<!--會員管理  -->
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-copy"></i>
						<p>
							會員管理 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item"><a href="${ctx}/admin/getMemberByName"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>會員帳號管理</p>
						</a></li>


					</ul></li>
				<!--   主管權限 END -->

				<!--主管權限  -->
				<c:if test="${admin.type=='經理'}">
					<li class="nav-item has-treeview"><a href="#" class="nav-link">
							<i class="nav-icon fas fa-copy"></i>
							<p>
								主管權限 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" style="display: none;">
							<li class="nav-item"><a href="${ctx}/admin/admin_user"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>員工帳號管理</p>
							</a></li>
							<li class="nav-item"><a href="${ctx}/admin/adduser"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>新增員工帳號</p>
							</a></li>
							<li class="nav-item"><a href="${ctx}/admin/chart"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>查看報表</p>
							</a></li>

							<li class="nav-item"><a href="javascript:void(0);"
								class="nav-link" onclick="salert()"> <i
									class="far fa-circle nav-icon"></i>
									<p>發公告</p>
							</a></li>

						</ul></li>
				</c:if>
				<!--   主管權限 END -->

				<!--自己帳號管理 -->
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-copy"></i>
						<p>
							系統設定 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" style="display: none;">

						<li class="nav-item"><a href="${ctx}/admin/contact"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>聯絡人</p>
						</a></li>

						<li class="nav-item"><a href="${ctx}/admin/chat"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>聊天</p>
						</a></li>

						<li class="nav-item"><a href="${ctx}/admin/announcement"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>系統訊息</p>
						</a></li>

						<li class="nav-item">
						<li class="nav-item"><a href="${ctx}/admin/profile"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>帳號資料修改</p>
						</a></li>
						<li class="nav-item"><a href="${ctx}/admin/logout.action"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>登出</p>
						</a></li>


					</ul></li>
				<!--   自己帳號管理END -->

			</ul>




		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>

<script type="text/javascript">

  function salert() {
  	
  	
  	Swal.fire({
  		  title: '公告',
  		  input: 'text',
  		  inputAttributes: {
  		    autocapitalize: 'off'
  		  },
  		  showCancelButton: true,
  		  confirmButtonText: '送出',
  		  showLoaderOnConfirm: true,
  		  preConfirm: (msg) => {
  			  //ajax 寫在餓就好 
  			  
  		 websocket2.send(JSON.stringify({fromUser:parseInt('${admin.id}'),toUser:parseInt('-1'),toAll:true,text:msg}));
  			  
  			  
  		  },
  		  allowOutsideClick: () => !Swal.isLoading()
  		})
  		
	}





    var websocket2 = null;
    websocket2 =new WebSocket('ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/ws');


    
    websocket2.onmessage = function(evt) {
        onMessage2(evt)
    };
    
          function  readit() {
            	$.ajax({
      		    	type : "post",
      		    	url : '${ctx}/admin/read_announcement',
      		    	dataType : "text",
      		    	success : function(cont) {
      		    		//更新 通知訊息 和 公告
					
      		    		        	$.ajax({
  		    	type : "post",
  		    	url : '${ctx}/admin/unread_num2',
  		    	dataType : "text",
  		    	success : function(cont) {
  		    		//更新 通知訊息 和 公告
  		    		$('#unread_num2').text(cont!="0"?cont:"");
           			}
  		    });
      		    		
      		    		//----------
               			}
      		    });
            	
		}
   
          function onMessage2(evt) {
          
  			//在這邊的時候順去處理 message 以讀的問題
          	$.ajax({
  		    	type : "post",
  		    	url : '${ctx}/admin/sidebar_drop1',
  		    	dataType : "html",
  		    	success : function(cont) {
  		    		//更新 通知訊息 和 公告
  		    			
  		    		$('#drop1').html(cont);
           			}
  		    });
  			
        	$.ajax({
  		    	type : "post",
  		    	url : '${ctx}/admin/unread_num',
  		    	dataType : "text",
  		    	success : function(cont) {
  		    		//更新 通知訊息 和 公告
  		    		
  		    		$('#unread_num').text(cont!="0"?cont:"");
  		    		
           			}
  		    });

        	
         	$.ajax({
  		    	type : "post",
  		    	url : '${ctx}/admin/sidebar_drop2',
  		    	dataType : "html",
  		    	success : function(cont) {
  		    		//更新 通知訊息 和 公告
  		    			
  		    		$('#drop2').html(cont);
           			}
  		    });
  			
        	$.ajax({
  		    	type : "post",
  		    	url : '${ctx}/admin/unread_num2',
  		    	dataType : "text",
  		    	success : function(cont) {
  		    		//更新 通知訊息 和 公告
  		    		$('#unread_num2').text(cont!="0"?cont:"");
           			}
  		    });

        	
        	
        	
          }
   
          window.close=function()
          {
        	  websocket2.onclose();
          }

</script>



