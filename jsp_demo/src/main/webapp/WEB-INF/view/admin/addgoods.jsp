<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>新增商品</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">



<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- Select2 -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css"
	rel="stylesheet" />
		  <link rel="stylesheet" href="${ctx}/admin/plugins/sweetalert2/sweetalert2.min.css"> 
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
.select2-container--default .select2-selection--single .select2-selection__rendered{
margin-top: -10px;
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

			<form action="${ctx}/admin/addgoods.do" method="post" id="add_goods" onsubmit="spec()"
				role="form" data-toggle="validator" enctype="multipart/form-data">
				<input type="hidden" value="" name="spec" id="spec">
				<!-- Main content -->
				<section class="content">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">新增商品</h3>
						</div>
						<!-- /.card-header -->

						<div class="card-body">
							<!-- body -->

							<div class="row">
								<div class="col-sm-4">
									<!-- text input -->
									<div class="form-group">
										<label>商品名稱</label> <input type="text" class="form-control"
											name="productName" placeholder="Enter ..." id="goodsName"
											required="required">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								<div class="col-sm-8">
									<div class="form-group">
										<label>商品簡介</label> <input type="text" class="form-control"
											name="productIntro" required="required"
											placeholder="Enter ..." id="goodsIntro">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4" data-select2-id="37">
									<div class="form-group">
										<label>第一分類</label> <select
											class="form-control select2bs4 select2-hidden-accessible"
											style="width: 100%;" data-select2-id="17" tabindex="-1"
											aria-hidden="true" id="categoryselect1">
										</select>
									</div>
								</div>
								<!-- /.col -->
								<div class="col-md-4">
									<div class="form-group">
										<label>第二分類</label> <select
											class="form-control select2bs4 select2-hidden-accessible"
											style="width: 100%;" data-select2-id="17" tabindex="-1"
											aria-hidden="true" id="categoryselect2">
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>第三分類</label> <select
											class="form-control select2bs4 select2-hidden-accessible"
											style="width: 100%;" data-select2-id="17" tabindex="-1"
											aria-hidden="true" id="categoryselect3"
											onchange="showProperty()" name="categoryId">
										</select>
									</div>
								</div>
								<!-- /.col -->
							</div>
							<div class="row" id="box"></div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>品牌</label> <select
											class="form-control select2bs4 select2-hidden-accessible"
											style="width: 100%;" data-select2-id="17" tabindex="-1"
											aria-hidden="true" id="Brand"
											name="brandId">
										</select>
									</div>
								</div>
							</div>
							<!-- 這邊放CHECKBOX -->


							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>原價</label> <input type="number" min="0"
											name="originalPrice" class="form-control" required="required"
											placeholder="Enter ..." id="originalPrice">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>
								
							
<div class="col-sm-2">
							<div class="form-group">	
							<label>折扣趴數</label>
					<div class="input-group">
					
                  <div class="input-group-prepend">
                    <span class="input-group-text">X</span>
                  </div>
                   <input type="number" min="0"
											class="form-control" required="required" name="sellingPrice" max="100" value="100"
											placeholder="Enter ..." id="sellingPrice">
                  <div class="input-group-append">
                    <span class="input-group-text">%</span>
                  </div>
                  	<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
											
                </div>
                </div>
                 </div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>售價</label> <input type="number"  readonly="readonly"
											class="form-control" 
											id="showmoney">
									</div>
								</div>
								
								<div class="col-sm-4">
									<div class="form-group">
										<label>數量</label> <input type="number" min="0"
											class="form-control" required="required" name="stockNum"
											placeholder="Enter ..." id="stockNum">
										<div class="help-block with-errors text-danger"
											style="font-family: Microsoft JhengHei;"></div>
									</div>
								</div>

							</div>
							<label>商品首圖</label> <input type="file" accept=".jpg" name="img" id="img_fp"/>
							<div id="preview_fp" class="row"></div>
							
							 <label>補充圖片</label> 
							
							<input id="file-selector"type="file" multiple="multiple" accept=".jpg" name="imgs" /> <br>
							<div class="row" id="preview">
							</div>
							

<!-- 							<div id="preview"></div> -->

							<textarea id="editor" name="description"></textarea>
						</div>

						<!-- /.card-body -->

					</div>
					<!-- card-腳腳 -->
					<div class="card-footer">
						<button type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-primary" onclick="autowrite()">自動填寫</button>
					</div>
					<!-- /.card -->

				</section>
			</form>


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
	<script src="${ctx}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx}/admin/dist/js/adminlte.min.js"></script>
	<!--引用 Validator-->
	<script src="${ctx}/admin/plugins/bootstrap-validator/validator.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
				<script src="${ctx}/admin/plugins/sweetalert2/sweetalert2.all.min.js"></script>
	<script>
	
	 $(function(){
		 $('#originalPrice').change(function(){$('#showmoney').val(Math.round($('#originalPrice').val()*($('#sellingPrice').val()/100)));});
		 $('#sellingPrice').change(function(){$('#showmoney').val(Math.round($('#originalPrice').val()*($('#sellingPrice').val()/100)));});
		 
		 
		 	// 選取到檔案後開始動作
		 	$('#file-selector').change(function(event){
		 		/**
		 		 * 宣告fileList來存取檔案(能夠多個)
		 		 * 用window將fileList宣告成全域變數
		 		 * 讓除了file-selector的外元素能夠存取圖片
		 		 */
		 		window.fileList = event.target.files;
		 
		 		var formData = new window.FormData();	// 建立formData物件
		 
		 		// 讀取fileList陣列(上傳多個檔案的話)
		 		for(var i=0; i<fileList.length; i++){
		 			var file = fileList[i];
		 
		 			/**
		 			 * 如果有要POST檔案到後端才會用到這行
		 			 * test將會是POST檔案的名稱
		 			 * 如果是多個檔案可存成formData.append('test'+i,file);
		 			 * formData內的檔案將會變成test0 , test1 ..... testn
		 			 * 後面的php解析檔案的部分會詳細解說
		 			 */
		 			formData.append('test',file);
		 			$('#preview').html("");
		 			// 解析檔案
		 			var reader = new FileReader();
		 			reader.onload = (function(file){
		 				return function(event){
		 					var src = event.target.result	// 圖片的編碼 , 格式為base64
		 					var title = escape(file.name);
		 					var img = '<img id="upload-img" src="'+src+'" title="'+title+'" class="img-fluid" style="max-width:300px;max-height:300px;" />';						
		 
		 					// 到這邊 , 我們已經能後用js存取圖片並顯示了
		 					$('#preview').append(img);
		 				};
		 			})(file);
		 
		 			reader.readAsDataURL(file);
		 		}

		
		 	});
		 	
		 	$('#img_fp').change(function(event){
		 		/**
		 		 * 宣告fileList來存取檔案(能夠多個)
		 		 * 用window將fileList宣告成全域變數
		 		 * 讓除了file-selector的外元素能夠存取圖片
		 		 */
		 		window.fileList = event.target.files;
		 
		 		var formData = new window.FormData();	// 建立formData物件
		 		$('#preview_fp').html("");
		 		// 讀取fileList陣列(上傳多個檔案的話)
		 		for(var i=0; i<fileList.length; i++){
		 			var file = fileList[i];
		 
		 			/**
		 			 * 如果有要POST檔案到後端才會用到這行
		 			 * test將會是POST檔案的名稱
		 			 * 如果是多個檔案可存成formData.append('test'+i,file);
		 			 * formData內的檔案將會變成test0 , test1 ..... testn
		 			 * 後面的php解析檔案的部分會詳細解說
		 			 */
		 			formData.append('test',file);
		 
		 			// 解析檔案
		 			var reader = new FileReader();
		 			reader.onload = (function(file){
		 				return function(event){
		 					var src = event.target.result	// 圖片的編碼 , 格式為base64
		 					var title = escape(file.name);
		 					var img = '<img id="upload-img" src="'+src+'" title="'+title+'" class="img-fluid" style="max-width:300px;max-height:300px;" />';						
		 					// 到這邊 , 我們已經能後用js存取圖片並顯示了
		 					$('#preview_fp').append(img);
		 				};
		 			})(file);
		 
		 			reader.readAsDataURL(file);
		 		}
		 	});
		 	
		 	
		 	
		 })
		 
	$('#add_goods').validator().on('submit', function(e) {
		if (e.isDefaultPrevented()) { // 未驗證通過 則不處理
		return;
		} else { // 通过后，送出表单
			spec();
		
		}
		
		//e.preventDefault(); // 防止原始 form 提交表单
		
		});
	
	
	$(function(){
		  $("#categoryselect1").select2({
		        ajax: {

		            url     : "${ctx}/admin/categories",//请求的API地址
		            dataType: 'json',//数据类型
		            delay: 500,
		            data    : function(params){

		                return {
		                    pid   : 0,//父類別 PID
		                    keyword:params.term//搜索關鍵字
		                    
		                }
		            },
		       //     results : function(data){ return data;},//返回的结果
		            processResults: function(data) {
	                    // 處理返回結果
	                    var itemList = [];//当数据对象不是{id:0,text:'ANTS'}这种形式的时候，可以使用类似此方法创建新的数组对象
	                    var arr = data;
	                    for (var i = 0; i < arr.length; i++) {
	                    	    itemList.push({id: arr[i]['id'], text: arr[i]['name']});
	                    	}
	                    return {
	                        results: itemList
	                    };
	                }
		            
		        }
		    });//启动select2
		    
		    
		    
		    $("#categoryselect2").select2({
		        ajax: {

		            url     : "${ctx}/admin/categories",//请求的API地址
		            dataType: 'json',//数据类型
		            delay: 500,
		            data    : function(params){

		                return {
		                    pid   : $("#categoryselect1").select2("val"),//父類別 PID
		                    keyword:params.term//搜索關鍵字
		                    
		                }
		            },
		       //     results : function(data){ return data;},//返回的结果
		            processResults: function(data) {
	                    // 處理返回結果
	                    var itemList = [];//当数据对象不是{id:0,text:'ANTS'}这种形式的时候，可以使用类似此方法创建新的数组对象
	                    var arr = data;
	                    for (var i = 0; i < arr.length; i++) {
	                    	    itemList.push({id: arr[i]['id'], text: arr[i]['name']});
	                    	}
	                    return {
	                        results: itemList
	                    };
	                }
		            
		        }
		    });//启动select2
		    
		    $("#categoryselect3").select2({
		        ajax: {

		            url     : "${ctx}/admin/categories",//请求的API地址
		            dataType: 'json',//数据类型
		            delay: 500,
		            data    : function(params){

		                return {
		                    pid   : $("#categoryselect2").select2("val"),//父類別 PID
		                    keyword:params.term//搜索關鍵字
		                    
		                }
		            },
		       //     results : function(data){ return data;},//返回的结果
		            processResults: function(data) {
	                    // 處理返回結果
	                    var itemList = [];//当数据对象不是{id:0,text:'ANTS'}这种形式的时候，可以使用类似此方法创建新的数组对象
	                    var arr = data;
	                    for (var i = 0; i < arr.length; i++) {
	                    	    itemList.push({id: arr[i]['id'], text: arr[i]['name']});
	                    	}
	                    return {
	                        results: itemList
	                    };
	                }
		            
		        }
		    });
		    
		    
		    
		    $("#Brand").select2({
		        ajax: {

		            url     : "${ctx}/admin/brandlist",//请求的API地址
		            dataType: 'json',//数据类型
		            delay: 500,
		            data    : function(params){

		                return {
		                    keyword:params.term//搜索關鍵字
		                    
		                }
		            },
		       //     results : function(data){ return data;},//返回的结果
		            processResults: function(data) {
	                    // 處理返回結果
	                    var itemList = [];//当数据对象不是{id:0,text:'ANTS'}这种形式的时候，可以使用类似此方法创建新的数组对象
	                    var arr = data;
	                    for (var i = 0; i < arr.length; i++) {
	                    	    itemList.push({id: arr[i]['id'], text: arr[i]['brandName']});
	                    	}
	                    return {
	                        results: itemList
	                    };
	                }
		            
		        }
		    });
	})
	 
  
function spec()
	{
	//直接JQUERY EACH
	var spec="";
	$('#box select').each(function (i) {
		//取得label的text
		//$(this).上一個元素
		spec=spec+$(this).prev().text()+':'+$(this).val()+',';
		

}

	)
	
	//$('#add_goods').appendTo('');
$('#spec').val(spec.substring(0,spec.length-1));
			}
	
	
function showProperty()
	{
		$.ajax({
		    url: "${ctx}/admin/addgoods_s",
		    type: "post",
		    dataType:"html",
		    data: {categoryId:$("#categoryselect3").select2("val")},
		    success: function (result) {
// 		    	$('#box').empty();
// 		    	var container = $('#box');
				$('#box').html(result);
		    	   
// 		    for(var i=0;i<result.length;i++)	
// 		    	{
// 		    	$('<label/>',{text:result[i]['propertyName']}).appendTo(container);
// 		    	$('<select />', { id:'select'+i, name: result[i]['id'] , value: result[i]['id'] }).appendTo(container);	
// 		  		for (var j = 0; j < result[i]['propertyValue'].length; j++) {
// 		  			$("<option/>",{value: result[i]['propertyValue'][j]['propertyValue'],text:result[i]['propertyValue'][j]['propertyValue']}).appendTo("#select"+i);	
// 				}
		    	
	
// 		    	}
		    
		    }
		});
		
		
		
		
	}
	 
	
	
    ClassicEditor.create( document.querySelector( '#editor' ),{
        language: {
            // The UI will be English.
            ui: 'zh'
        },
    
    ckfinder: {
        uploadUrl: "${ctx}/admin/uplaodCkeditor"
    }
    } ).catch( error => {console.error( error ); } );
    
    
//     $('#add_goods').validator().on('submit', function(e) {
//     	if (e.isDefaultPrevented()) { // 未驗證通過 則不處理
//     	return;
//     	} else { // 通過後，送出表單
//     	alert("已送出表單");
//     	}
//     	e.preventDefault(); // 防止原始 form 提交表單
//     	});
function  autowrite() {
	$('#goodsName').val('小米9T Pro');
	$('#goodsIntro').val('很好用');
	$('#originalPrice').val(40000);
	$('#stockNum').val(100);
	
}
</script>

</body>
</html>