/**
 *   商品頁面JS 
 *   
 *   
 *   JQGRID 設定 到時候再根據資料庫做修改
 *   自動AJAX要資料處理
 *   用RESTCONTROLLER來寫
 *   EZGAME
 */
var selectCategory;

$(function () {
	selectCategory=$('#selectCategory').html();
	$('#selectCategory').empty();
	
    $("#grid_id").jqGrid({
    	//網址直接接改成變數  吃REQUEST的PARAM 直接實現分層
    	url:categoryurl,//ctx+'/admin/categorylist',
    	datatype: "json",
    	
colNames:['ID','分類名稱',  'level','parentId','規格'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int"},
        {name:'name',index:'name', width:100, sorttype:"text"},
     
        {name:'level',index:'level', hidden:true},
        {name:'parentId',index:'parentId',hidden:true},
       {name:'property',index:'property',hidden:$('#categoryLevel').val()!=2?true:false,formatter:function(cellvalue, options, rowObject){
    	   var pmsg="";
    	   if(Array.isArray(cellvalue))
    		   {
    		   for (var i in cellvalue) {
    			   pmsg=pmsg+cellvalue[i]['propertyName'] +',';
    			   
    	    	   }
    		
    		   return    pmsg.substring(0,pmsg.length-1);
    		   
    		   }
    	   else if(!cellvalue)
    		   {
    		   return cellvalue[i]['propertyName'];
    		   }
    	   
    	   return '';
    		 
    //  return cellvalue[0].getPropertyName();
      //JSON.stringify(rowObject);
////alert(rowObject);
//        	
//        	
        }  }//AAAAAAAAAAAAAAAAA 可能要用SUBGIRD做了
      ],
      height:'auto',
        rowNum: 20,
        loadonce:true,
        rowList: [20, 50, 80],
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        multiselectWidth:60,
     //   styleUI = 'Bootstrap4',
       // iconSet = 'Octicons',
        pager: "#grid_pager_id",
        forceFit:true
        ,
        gridComplete: function () {
         
//        	$("#level").val(0);
//        	$("#parentId").val(0) ;
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

    //隨著介面改變自動更改SIEZE
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





function categoryAdd() {
	//這邊要稽查 是不是第三層如果是第三層一定要讓他選擇規格
	//這邊要換MODAL不然泰喜憨了
	//$("#categoryLevel")直接看這邊第幾層 
	//$('#categoryLevel').val()!=2
	
//	$('input:checkbox:checked[name="vehicle"]').each(function(i) { cbxVehicle[i] = this.value; });
	Swal.fire({
		  title: '請輸入新增分類',
		  input: 'text',
		  html:selectCategory,
		  inputPlaceholder:'請輸入分類名稱',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		 //必須要傳 三個參數 LEVEL PID 跟NAME PID 跟 LEVEL 都是預設的HIDDEN INPUT $("#level").val $("#pid").val() 用AJAX傳吧
		  //用FETCH重做好了 這樣可以用LOADING
		  preConfirm: (categoryName) => {
			  var cbxVehicle = new Array();
		 $("input[name='checkboxes']:checked").each(function(i) {  cbxVehicle[i] = parseInt(this.value); })
$.ajax({
	   type:"POST",                                             
	   url:ctx+"/admin/addcategory",                                        
	   dataType:"JSON",    
	   data:{"level":	$("#categoryLevel").val(),
		   		"parentId":$("#parentId").val(),
		   		"name": categoryName,
		   	 "checkboxes": cbxVehicle
	   }
}).done(function(data){
reload();
	}).fail(function (){Swal.fire({title:"新增失敗"})})
	;
  },
  
		  
		  allowOutsideClick: () => !Swal.isLoading()
		})
		.then((result) => {
			alert(reslut);
			alert(reslut.value);
			alert(reslut.value.sucess);
		  if (result.value) {
			  //回傳的JSON放到RESULT.VALUE裡面 再去做處理
			  //所以我們抓
			  
		    Swal.fire({
		      title: `${result.value.login}'s avatar`,
		      imageUrl: result.value.avatar_url
		    })
		  }
		})
		
		
		
}

/**
 * 進入下級分類
 */
//這邊反而比較簡單
function categoryManage() {
    var categoryLevel = parseInt($("#categoryLevel").val());
    var parentId = $("#parentId").val();
    var id = getSelectedRow();//調整
    if (id == undefined || id < 0) {
        return false;
    }
    if (categoryLevel == 0 || categoryLevel == 1) {
        categoryLevel = categoryLevel + 1;
        //直接重整ㄟ 真D哭哭 我本還想直接用AJAX就好了 AJAX重拿資料 直接更新TABLE? 試試看  反正 屬性都一樣只是JSON回傳布一樣而已
        //把JSONURL設定成變數 在重整就好了  所以其實在AJAX 回傳 COMPLETE的時候 JSON要再把LEVEL跟PID設定好 看狀況處理
        //所以 @REQUESTPARAM(required=false) 
        window.location.href = ctx+'/admin/category?categoryLevel=' + categoryLevel + '&parentId=' + id + '&backParentId=' + parentId;
    } else {
        Swal.fire("無下級分類", {
            icon: "warning",
        });
    }
}

/**
 * 返回上一層級
 */
//簡單
function categoryBack() {
    var categoryLevel = parseInt($("#categoryLevel").val());
    var backParentId = $("#backParentId").val();
    if (categoryLevel == 1 || categoryLevel == 2) {
        categoryLevel = categoryLevel - 1;
        window.location.href = ctx+'/admin/category?categoryLevel=' + categoryLevel + '&parentId=' + backParentId + '&backParentId=0';
    } else {
    	Swal.fire("無上級分類", {
            icon: "warning",
        });
    }
}



//綁定modal上的保存按鈕 這串不用 反正失敗就接請他下去 在後端做 偷懶偷起來
$('#saveButton').click(function () {
    var categoryName = $("#categoryName").val();
    var categoryLevel = $("#categoryLevel").val();
    var parentId = $("#parentId").val();
    var categoryRank = $("#categoryRank").val();
    if (!validCN_ENString2_18(categoryName)) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("請輸入符合規範的分類名稱！");
    } else {
        var data = {
            "categoryName": categoryName,
            "categoryLevel": categoryLevel,
            "parentId": parentId,
            "categoryRank": categoryRank
        };
        var url = '/admin/categories/save';
        var id = getSelectedRowWithoutAlert();
        if (id != null) {
            url = '/admin/categories/update';
            data = {
                "categoryId": id,
                "categoryName": categoryName,
                "categoryLevel": categoryLevel,
                "parentId": parentId,
                "categoryRank": categoryRank
            };
        }
        $.ajax({
            type: 'POST',//方法類型
            url: url,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    $('#categoryModal').modal('hide');
                    swal("保存成功", {
                        icon: "success",
                    });
                    reload();
                } else {
                    $('#categoryModal').modal('hide');
                    swal(result.message, {
                        icon: "error",
                    });
                }
                ;
            },
            error: function () {
                swal("操作失敗", {
                    icon: "error",
                });
            }
        });
    }
});

//分類的修改喔...
function categoryEdit() {
//	reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#grid_id").jqGrid("getRowData", id);
    $('.modal-title').html('分類編輯');
    $('#categoryModal').modal('show');
    $("#categoryId").val(id);
    $("#categoryName").val(rowData.categoryName);
    $("#categoryRank").val(rowData.categoryRank);
    
    
    Swal.fire({
		  title: '修改分類',
		  input: 'text',
		  html:selectCategory,
		  inputPlaceholder:'修改分類名稱',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '送出',
		  cancelButtonText:'取消',
		  showLoaderOnConfirm: true,
		 //必須要傳 三個參數 LEVEL PID 跟NAME PID 跟 LEVEL 都是預設的HIDDEN INPUT $("#level").val $("#pid").val() 用AJAX傳吧
		  //用FETCH重做好了 這樣可以用LOADING
		  preConfirm: (categoryName) => {
			  var cbxVehicle = new Array();
		 $("input[name='checkboxes']:checked").each(function(i) {  cbxVehicle[i] = parseInt(this.value); })
$.ajax({
	   type:"POST",                                             
	   url:ctx+"/admin/addcategory",                                        
	   dataType:"JSON",    
	   data:{"level":	$("#categoryLevel").val(),
		   		"parentId":$("#parentId").val(),
		   		"name": categoryName,
		   	 "checkboxes": cbxVehicle,
		   	 "id":id
	   }
}).done(function(data){
reload();
	}).fail(function (){Swal.fire({title:"新增失敗"})})
	;
},

		  
		  allowOutsideClick: () => !Swal.isLoading()
		})
		.then((result) => {
			alert(reslut);
			alert(reslut.value);
			alert(reslut.value.sucess);
		  if (result.value) {
			  //回傳的JSON放到RESULT.VALUE裡面 再去做處理
			  //所以我們抓
			  
		    Swal.fire({
		      title: `${result.value.login}'s avatar`,
		      imageUrl: result.value.avatar_url
		    })
		  }
		})
		
		
    
    
}

/**
 * 分類的刪除會牽涉到多級分類的修改和商品數據的修改，因此暫時就不開放刪除功能了，
 * 如果在商城頁面不想顯示相關分類可以通過調整rank值來調整顯示順序，
 * 不過代碼我也寫了一部分，如果想保留刪除功能的話可以在此代碼的基礎上進行修改。
 */
function deleteCagegory() {
    swal("未開放", {
        icon: "warning",
    });
    return;
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "確認彈框",
        text: "確認要刪除數據嗎?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/categories/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("刪除成功", {
                                icon: "success",
                            });
                          reload();
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    )
    ;
}


function reset() {
    $("#categoryName").val('');
    $("#categoryRank").val(0);
    $('#edit-error-msg').css("display", "none");
}