/**
 *   商品頁面JS 
 *   
 *   
 *   JQGRID 設定 到時候再根據資料庫做修改
 *   自動AJAX要資料處理
 *   用RESTCONTROLLER來寫
 *   EZGAME
 */
$(function () {
    $("#grid_id").jqGrid({
    	url:producturl,//ctx+'/admin/categorylist',
    	datatype: "json",
colNames:['商品ID','商品名稱', '商品原價', '商品折扣價','商品庫存','倉品狀態','創建日期'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int" },
        {name:'product',index:'product',formatter:function(cellvalue, options, rowObject){
     	   return cellvalue['productName'];
         }  },
        {name:'originalPrice',index:'originalPrice', width:100, sorttype:"int"},
        {name:'sellingPrice',index:'sellingPrice', width:100, sorttype:"int"},
        {name:'stockNum',index:'stockNum', width:100},
        {name:'productStatus',index:'productStatus', width:80, align:"right",sorttype:"int",formatter:function(celval,options,rowdata){
        	if (celval==true) {
				return "上架中";
			}
        	else {
				return "以下架";
			}
        	
        } },
//        {name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},
        {name:'note',index:'note', width:150, align:"right",sortable:false}
      ],
      height:'auto',
        rowNum: 10,
        rowList: [10, 50, 80],
        loadonce:true,
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
            //隱藏grid底部滾動條
            $("#grid_id").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $("#grid_id").jqGrid("filterToolbar", {stringResult: true });

    //隨著介面改變自動更改SIEZE
    $(window).resize(function () {
           $("#grid_id").setGridWidth($(".card-body").width());
    });
    });  



//對按鈕做操作


/**
 * 添加商品 直接頁面跳轉 之後都SET URL 用EL去田 路徑一定部會出包
 */
function addGoods() {
    window.location.href = ctx+"/admin/addgoods";
}

/**
 * 修改商品
 */
function editGoods() {
    var id = getSelectedRow();//判斷行數
    if (id == null) {
        return;
    }
    //麻煩 在處理
    window.location.href = ctx+"/admin/goods/edit/" + id;
}

/**
 * 上架 這邊都要大改 記得連 PUBLIC 別忘記改 
 */
function putUpGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }

    
	$.ajax({
		type : 'post',
		url : '${ctx}/admin/changeStatus',
		data : {
			id : ids,
			status:true
		}, //name=zhangsan&age=22
		success : function(data) {
		    Swal.fire({
		        title: "上架成功",
		        icon: "warning",
		        buttons: true,
		        dangerMode: true,
		    })
		    
		}
	});

}

/**
 * 下架
 */
function putDownGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    
	$.ajax({
		type : 'post',
		url : ctx+'/admin/changeStatus',
		data : {
			id : ids,
			status:false
		}, //name=zhangsan&age=22
		success : function(data) {
		    Swal.fire({
		        title: "下架成功",
		        icon: "warning",
		        buttons: true,
		        dangerMode: true,
		    })
		    
		}
	});

}