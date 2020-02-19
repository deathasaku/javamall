/**
 * 商品頁面JS
 * 
 * 
 * JQGRID 設定 到時候再根據資料庫做修改 自動AJAX要資料處理 用RESTCONTROLLER來寫 EZGAME
 */
var selectCategory;

$(function () {

    $("#grid_id").jqGrid({
    	// 網址直接接改成變數 吃REQUEST的PARAM 直接實現分層
    	url:ctx+'/admin/propertyJqgrid',// ctx+'/admin/categorylist',
    	datatype: "json",
colNames:['ID','規格名稱',  '規格屬性'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int"},
        {name:'propertyName',index:'propertyName', width:100, sorttype:"text"},
        {name:'propertyValue',index:'propertyValue',formatter:function(cellvalue, options, rowObject){
     	   var pmsg="";
     	   if(Array.isArray(cellvalue))
     		   {
     		   for (var i in cellvalue) {
     			   pmsg=pmsg+cellvalue[i]['propertyValue'] +',';
     			   
     	    	   }
     		
     		   return    pmsg.substring(0,pmsg.length-1);
     		   
     		   }
     	   else if(!cellvalue)
     		   {
     		   return cellvalue[i]['propertyValue'];
     		   }
     	   
     	   return '';

         }  }
        
      ],
      height:'auto',
      loadonce:true,
        rowNum: 20,
        rowList: [20, 50, 80],
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        multiselectWidth:60,
        pager: "#grid_pager_id",
        forceFit:true
        ,
        gridComplete: function () {
         
        	// 微調
            $("#grid_id").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }

        
    });
    $("#grid_id").jqGrid('filterToolbar',
            {
autosearch: true,
stringResult: true,
searchOnEnter: true,
defaultSearch: "cn"
})

    // 隨著介面改變自動更改SIEZE
    $(window).resize(function () {
           $("#grid_id").setGridWidth($(".card-body").width());
    });
    });  


/**
 * jqGrid重新加載
 */
function reload() {

    $("#grid_id").jqGrid().setGridParam({datatype:'json'}).trigger('reloadGrid');
}





function propertyAdd() {
	//先清空
	$('#myModalLabel').text('新增商品規格');
	$('#property').removeAttr('readonly');

	$('#property').val('');
	$('#propertyValue').val('');
	show_modal();
	//SEND出資料
	
}

function send() {
	if ($('#myModalLabel').text()=='新增商品規格') {
		$.ajax({
			   type:"POST",                                             
			   url:ctx+"/admin/addProperty",                                        
			   dataType:"JSON",    
			   data:{"propertyName": $('#property').val(),
				   "value":	$('#propertyValue').val()
			   }
		}).done(function(data){
			if(data.sucess)
			{Swal.fire({title:"新增成功"});} 
		else 
			{Swal.fire({title:"新增失敗"});}
			hide_modal();
			reload();
			
			}).fail(function (){
				Swal.fire({title:"新增失敗"})
				hide_modal();
				});

	}
	else {
		
		$.ajax({
			   type:"POST",                                             
			   url:ctx+"/admin/propertyValueModify",                                        
			   dataType:"JSON",    
			   data:{"id":getSelectedRow(),
				   "value":	$('#propertyValue').val()
			   }
		}).done(function(data){
			if(data.sucess)
			{Swal.fire({title:"修改成功"});} 
		else 
			{Swal.fire({title:"修改失敗"});}
			hide_modal();
			reload();
			
			}).fail(function (){
				Swal.fire({title:"修改失敗"})
				hide_modal();
				});
		
	}
	
	
}


function propertyEdit() {
	  var id = getSelectedRow();
	  if (id == null) {
	      return;
	  }
	$('#myModalLabel').text('修改商品規格');
	$('#property').attr('readonly','readonly');
	$('#property').val(	$("#grid_id").jqGrid('getCell', id, 'propertyName'));
	$('#propertyValue').val($("#grid_id").jqGrid('getCell', id, 'propertyValue'));
	show_modal();
}

function show_modal() {
	

	
	$("#myModal").modal("show");
}


function hide_modal() {
	$("#myModal").modal("hide");
}

function carouselAdd() {
	$('#myModalLabel').text('新增廣告');
	$('#hyperlink').val("/upload/imgae.jpg");
	show_modal();
}
function carouselEdit() {


	
}




//新增規格
function categoryAdd() {
	var sendDate;
	// FETCH的資料處理有點麻煩 我不喜翻 直接用AJAX好了
	
	Swal.fire({
		  title: '請輸入新增規格',
		  input: 'text',
		  inputPlaceholder:'規格名稱',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		  preConfirm: (propertyvalue) => {
			  // 改一下 這邊先處理箝制資料再丟到完成後那邊去給AJAX用
			sendDate   ={
					   	"propertyName":propertyvalue 
			  };},
		  allowOutsideClick: () => !Swal.isLoading()
		})
		.then((result) => {
			if (result.value) {
				$.ajax({
					   type:"POST",                                             
					   url:ctx+"/admin/addProperty",                                        
					   dataType:"JSON",    
					   data:sendDate
				}).done(function(data){
					if(data.sucess)
					{Swal.fire({title:"新增成功"});} 
				else 
					{Swal.fire({title:"新增失敗"});}
					reload();
					}).fail(function (){Swal.fire({title:"新增失敗"})});
			}
			else {
				return
			}

				  }

		)

}





//新增規格屬性
function addCategoryValue() {
	 
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    
	var sendDate;
	// FETCH的資料處理有點麻煩 我不喜翻 直接用AJAX好了
	Swal.fire({
		  title: '請輸入新增規格屬性',
		  input: 'text',
		  inputPlaceholder:'屬性名稱',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		  preConfirm: (propertyvalue) => {
			  // 改一下 這邊先處理箝制資料再丟到完成後那邊去給AJAX用
			sendDate   ={
						"id":id,
					   	"propertyValue":propertyvalue 
			  };},
		  allowOutsideClick: () => !Swal.isLoading()
		})
		.then((result) => {
			//說實在 這樣RESULT根本沒幹用 這樣寫真的有點不太OKㄏㄏ
			//可是FETCH真ㄉㄐ8 連HEADER都要自己來
			if (result.value) 
				{
			$.ajax({
					   type:"POST",                                             
					   url:ctx+"/admin/propertyAjax",                                        
					   dataType:"JSON",    
					   data:sendDate
				}).done(function(data){
				 
					if(data.sucess)
					{Swal.fire({title:"新增成功"});} 
				else 
					{Swal.fire({title:"新增失敗"});}
					
					reload();
					}).fail(function (){Swal.fire({title:"新增失敗"})})
					;
				}
			else {
				return;
			}
				  }

		)

}



//修改規格屬性
function modifyCategoryValue() {
	 
  var id = getSelectedRow();
  if (id == null) {
      return;
  }
	var sendDate;
	// FETCH的資料處理有點麻煩 我不喜翻 直接用AJAX好了
	Swal.fire({
		  title: '修改規格屬性',
		  input: 'text',
		  inputPlaceholder:'屬性值  以,區隔',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		  preConfirm: (propertyvalue) => {
			  // 改一下 這邊先處理箝制資料再丟到完成後那邊去給AJAX用
			sendDate   ={
						"id":id,
					   	"propertyValue":propertyvalue 
			  };},
		  allowOutsideClick: () => !Swal.isLoading(),
		  inputValue:$('#grid_id').jqGrid('getCell',id,'propertyValue') //這邊去抓那個DEFAULT
//		   onOpen: function() {
//			      var input = swal.getInput()
//			      input.setSelectionRange(0, input.value.length)
//			    }
		})
		.then((result) => {
			//說實在 這樣RESULT根本沒幹用 這樣寫真的有點不太OKㄏㄏ
			//可是FETCH真ㄉㄐ8 連HEADER都要自己來
			if (result.value) 
				{
			$.ajax({
					   type:"POST",                                             
					   url:ctx+"/admin/propertyValueModify",                                        
					   dataType:"JSON",    
					   data:sendDate
				}).done(function(data){
				 
					if(data.sucess)
					{Swal.fire({title:"修改成功"});} 
				else 
					{Swal.fire({title:"修改失敗"});}
					reload();
					}).fail(function (){Swal.fire({title:"修改失敗"})})
					;}
			
				  }

		)

}


//刪除規格考慮要不要取消 直接刪除不好
function categoryDel() {
	 
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    
   var sendDate   ={
			"id":ids
  };
	//說實在 這樣RESULT根本沒幹用 這樣寫真的有點不太OKㄏㄏ
	//可是FETCH真ㄉㄐ8 連HEADER都要自己來
	$.ajax({
			   type:"POST",                                             
			   url:ctx+"/admin/delProperty",                                        
			   dataType:"JSON",    
			   data:sendDate
		}).done(function(data){
		 
			if(data.sucess)
			{Swal.fire({title:"刪除成功"});} 
		else 
			{Swal.fire({title:"刪除失敗"});}
			reload();
			}).fail(function (){Swal.fire({title:"刪除失敗"})})
			;
	


}



// 規格的修改
function categoryEdit() {
 
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    
    
    var sendDate;
	// FETCH的資料處理有點麻煩 我不喜翻 直接用AJAX好了
	Swal.fire({
		  title: '修改規格',
		  input: 'text',
		  inputPlaceholder:'規格名稱',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		  preConfirm: (propertyName) => {
			  // 改一下 這邊先處理箝制資料再丟到完成後那邊去給AJAX用
			sendDate   ={
					   	"id":id ,
					   	"propertyName":propertyName
			  };},
		  allowOutsideClick: () => !Swal.isLoading()
		})
		.then((result) => {
			//說實在 這樣RESULT根本沒幹用 這樣寫真的有點不太OKㄏㄏ
			//可是FETCH真ㄉㄐ8 連HEADER都要自己來
			if (result.value) 
				{
			$.ajax({
					   type:"POST",                                             
					   url:ctx+"/admin/modifyProperty",                                        
					   dataType:"JSON",    
					   data:sendDate
				}).done(function(data){
				 
					if(data.sucess)
					{Swal.fire({title:"修改成功"});} 
				else 
					{Swal.fire({title:"修改失敗"});}
					reload();
					}).fail(function (){Swal.fire({title:"修改失敗"})})
					;
		}
				  }

		)

		
    //var rowData = $("#grid_id").jqGrid("getRowData", id);

//    $("#categoryName").val(rowData.categoryName);
//    $("#categoryRank").val(rowData.categoryRank);
}






function reset() {
    $("#categoryName").val('');
    $("#categoryRank").val(0);
    $('#edit-error-msg').css("display", "none");
}