<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>忘記密碼</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${ctx}/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/admin/dist/css/adminlte.min.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/assets/img/favicon.ico">



<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- Select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
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
</style>

</head>
<body class="hold-transition login-page">
	<div class="login-box">
  <div class="login-logo">
    <a><b>密碼重置</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">將新密碼寄到您的信箱</p>

      <form action="${ctx}/store/userrecover-password" method="post">
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">發送新密碼</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

     <%--  <p class="mt-3 mb-1">
        <a href="${ctx}/store/login">登入</a>
      </p> --%>

    </div>
    <!-- /.login-card-body -->
  </div>
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
	<script>
	
	 $(function(){
		 
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
		 
		 			// 解析檔案
		 			var reader = new FileReader();
		 			reader.onload = (function(file){
		 				return function(event){
		 					var src = event.target.result	// 圖片的編碼 , 格式為base64
		 					var title = escape(file.name);
		 					var img = '<img id="upload-img" src="'+src+'" title="'+title+'" />';						
		 
		 					// 到這邊 , 我們已經能後用js存取圖片並顯示了
		 					$('#preview').append('<div id="preview">'+img+'</div>');
		 				};
		 			})(file);
		 
		 			reader.readAsDataURL(file);
		 		}
		 
		 		/**
		 		 * 上面的流程就是在client端存取圖片
		 		 * 如果有要傳送到後端
		 		 * 可以接著使用下面的code
		 		 */
		 
		 		// 新增要POST的變數 , 然後塞入formData內
		 		formData.append('action','uploadImg');
		 
		 		$.ajax({
		 			url:'upload.php',
		 			data:formData,
		 			cache:false,
		 			contentType:false,
		 			processData:false,
		 			type:'POST',
		 			success:function(data){
		 				console.log(data);
		 			},
		 			error:function(err){
		 				console.log(err);
		 			}
		 		});
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

		            url     : "${ctx}/store/categories",//请求的API地址
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

		            url     : "${ctx}/store/categories",//请求的API地址
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

		            url     : "${ctx}/store/categories",//请求的API地址
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
		    });//启动select2
		
	})
	 
  
function spec()
	{
	//直接JQUERY EACH
	alert("132");
	var spec="";
	$('#box select').each(function (i) {
		//取得label的text
		//$(this).上一個元素
		spec=spec+$(this).prev().text()+':'+$(this).val()+',';
		

}

	)
	alert(spec);
	//$('#add_goods').appendTo('');
$('#spec').val(spec.substring(0,spec.length-1));
			}
	
function showProperty()
	{
		$.ajax({
		    url: "${ctx}/store/properties",
		    type: "post",
		    dataType:"json",
		    data: {categoryId:$("#categoryselect3").select2("val")},
		    success: function (result) {
		    	$('#box').empty();
		    	var container = $('#box');

		    	   
		    for(var i=0;i<result.length;i++)	
		    	{
		    	//產生select區塊包含品牌 這邊應該是 輸出一個字串去給SPEC吃 送出前作處理
		    	
		    	//SELECT的LABEL
		    	$('<label/>',{text:result[i]['propertyName']}).appendTo(container);
		    	$('<select />', { id:'select'+i, name: result[i]['id'] , value: result[i]['id'] }).appendTo(container);	
		  		for (var j = 0; j < result[i]['propertyValue'].length; j++) {
		  			$("<option/>",{value: result[i]['propertyValue'][j]['propertyValue'],text:result[i]['propertyValue'][j]['propertyValue']}).appendTo("#select"+i);	
				}
		    	
	
		    	}
		    
		    }
		});
		
		
		
		
	}
	 
	
	
    ClassicEditor.create( document.querySelector( '#editor' ),{
        language: {
            // The UI will be English.
            ui: 'zh'
        },
    
    ckfinder: {
        uploadUrl: "${ctx}/store/uplaodCkeditor"
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

</script>

</body>
</html>