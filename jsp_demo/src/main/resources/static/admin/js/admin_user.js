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
    	url:ctx+'/admin/employeelist',
    	datatype: "json",
colNames:['ID','帳號', '信箱', '大頭貼','手機','職位','狀態','創建日期'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int"},
        {name:'account',index:'account', width:100, sorttype:"text"},
        {name:'email',index:'email', width:100,sorttype:"text"},
        {name:'image',index:'image', width:80, align:"right",formatter:function (cellvalue)
        	{return "<img src='" +ctx+ cellvalue + "' height=\"80\" width=\"80\" alt='商品首圖'/>";} 
        },//之後再補FUNCTION
        {name:'tel',index:'tel', width:80, align:"right",sorttype:"int"},
        {name:'type',index:'type', width:80,align:"right",sorttype:"text"},
        {name:'block',index:'block', width:80,align:"right"},
        {name:'createDate',index:'createDate', width:150, align:"right",sorttype:"text"}
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
        pager: "#grid_pager_id",
        gridComplete: function () {
            //隱藏grid底部滾動條
            $("#grid_id").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }

        
    }


    );
    


    //隨著介面改變自動更改SIEZE
    $(window).resize(function () {
           $("#grid_id").setGridWidth($(".card-body").width());
    });

////臨時資料列  到時候下面都拔掉
//    var mydata = [
//      {id:"1", invdate:"2007-10-01", name:"test", note:"note", amount:"200.00", tax:"10.00", total:"210.00"}, 
//      {id:"2", invdate:"2007-10-02", name:"test2", note:"note2", amount:"300.00", tax:"20.00", total:"320.00"}, 
//      {id:"3", invdate:"2007-09-01", name:"test3", note:"note3", amount:"400.00", tax:"30.00", total:"430.00"}, 
//      {id:"4", invdate:"2007-10-04", name:"test", note:"note", amount:"200.00", tax:"10.00", total:"210.00"}, 
//      {id:"5", invdate:"2007-10-05", name:"test2", note:"note2", amount:"300.00", tax:"20.00", total:"320.00"}, 
//      {id:"6", invdate:"2007-09-06", name:"test3", note:"note3", amount:"400.00", tax:"30.00", total:"430.00"}, 
//      {id:"7", invdate:"2007-10-04", name:"test", note:"note", amount:"200.00", tax:"10.00", total:"210.00"}, 
//      {id:"8", invdate:"2007-10-03", name:"test2", note:"note2", amount:"300.00", tax:"20.00", total:"320.00"}, 
//      {id:"9", invdate:"2007-09-01", name:"test3", note:"note3", amount:"400.00", tax:"30.00", total:"430.00"}
//    ];
//  
//    for(var i=0;i<=mydata.length ;i++)
//      $("#grid_id").jqGrid('addRowData',i+1,mydata[i]);
    
//    function coverImageFormatter(cellvalue) {
//        return "<img src='" + cellvalue + "' height=\"80\" width=\"80\" alt='大頭貼'/>";
//    }
    

});  



//對按鈕做操作


/**
 * 添加商品 直接頁面跳轉 之後都SET URL 用EL去田 路徑一定部會出包
 */
function addGoods() {
    window.location.href = "./addgoods.jsp";
}

/**
 * 修改商品
 */
function editGoods() {
    var id = getSelectedRow();//判斷行數
    if (id == null) {
        return;
    }
    window.location.href = "/admin/goods/edit/" + id;
}

/**
 * 上架 這邊都要大改 記得連 PUBLIC 別忘記改 
 */
function putUpGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    Swal.fire({
        title: "確認彈框",
        text: "確認要執行上架操作嗎?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "PUT",
                    url: "/admin/goods/status/0",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            Swal.fire("上架成功", {
                                icon: "success",
                            });
                            $("#grid_id").trigger("reloadGrid");
                        } else {
                        	Swal.fire(r.message, {
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

/**
 * 下架
 */
function putDownGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "確認彈框",
        text: "確認要執行下架操作嗎?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "PUT",
                    url: "/admin/goods/status/1",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("下架成功", {
                                icon: "success",
                            });
                            $("#grid_id").trigger("reloadGrid");
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