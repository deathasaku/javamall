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
        datatype: "local",
colNames:['ID','商品名稱', '圖片', '超連結','廣告詞','創建時間','創建者'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int"},
        {name:'invdate',index:'invdate', width:100, sorttype:"date"},
        {name:'name',index:'name', width:100},
        {name:'amount',index:'amount', width:80, align:"right",sorttype:"float"},
        {name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},
        {name:'total',index:'total', width:80,align:"right",sorttype:"float"},
        {name:'note',index:'note', width:150, align:"right",sortable:false}
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
            //隱藏grid底部滾動條
            $("#grid_id").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }

        
    });


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