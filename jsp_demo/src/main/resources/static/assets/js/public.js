<!-- 正則驗證 start-->
/**
 * 判空
 *
 * @param obj
 * @returns {boolean}
 */
function isNull(obj) {
    if (obj == null || obj == undefined || obj.trim() == "") {
        return true;
    }
    return false;
}

/**
 * 參數長度驗證
 *
 * @param obj
 * @param length
 * @returns {boolean}
 */
function validLength(obj, length) {
    if (obj.trim().length < length) {
        return true;
    }
    return false;
}

/**
 * url驗證
 *
 * @param str
 * @returns {boolean}
 */
function isURL(str_url) {
    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}"
        + "|"
        + "([0-9a-zA-Z_!~*'()-]+\.)*"
        + "([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z]\."
        + "[a-zA-Z]{2,6})"
        + "(:[0-9]{1,4})?"
        + "((/?)|"
        + "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var re = new RegExp(strRegex);
    if (re.test(str_url)) {
        return (true);
    } else {
        return (false);
    }
}

/**
 * 用戶名稱驗證 4到16位（字母，數字，下劃線，減號）
 *
 * @param userName
 * @returns {boolean}
 */
function validUserName(userName) {
    var pattern = /^[a-zA-Z0-9_-]{4,16}$/;
    if (pattern.test(userName.trim())) {
        return (true);
    } else {
        return (false);
    }
}

/**
 * 手機號正則驗證
 * @returns {boolean}
 */
function validPhoneNumber(phone) {
    if ((/^1(3|4|5|6|7|8|9)\d{9}$/.test(phone))) {
        return true;
    }
    return false;
}

/**
 * 正則匹配2-18位的中英文字符串
 *
 * @param str
 * @returns {boolean}
 */
function validCN_ENString2_18(str) {
    var pattern = /^[a-zA-Z0-9-\u4E00-\u9FA5_,， ]{2,18}$/;
    if (pattern.test(str.trim())) {
        return (true);
    } else {
        return (false);
    }
}

/**
 * 正則匹配2-100位的中英文字符串
 *
 * @param str
 * @returns {boolean}
 */
function validCN_ENString2_100(str) {
    var pattern = /^[a-zA-Z0-9-\u4E00-\u9FA5_,， ]{2,100}$/;
    if (pattern.test(str.trim())) {
        return (true);
    } else {
        return (false);
    }
}

/**
 * 用戶密碼驗證 最少6位，最多20位字母或數字的組合
 *
 * @param password
 * @returns {boolean}
 */
function validPassword(password) {
    var pattern = /^[a-zA-Z0-9]{6,20}$/;
    if (pattern.test(password.trim())) {
        return (true);
    } else {
        return (false);
    }
}

<!-- 正則驗證 end-->

/**
 * 獲取jqGrid選中的一條記錄
 * @returns {*}
 */
function getSelectedRow() {
    var grid = $("#grid_id");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
    	Swal.fire("請選擇一條記錄");
        return;
    }
    var selectedIDs = grid.getGridParam("selarrrow");
    if (selectedIDs.length > 1) {
    	Swal.fire("只能選擇一條記錄", {
            icon: "warning",
        });
        return;
    }
    return selectedIDs[0];
}

/**
 * 獲取jqGrid選中的一條記錄(不出現彈框)
 * @returns {*}
 */
function getSelectedRowWithoutAlert() {
    var grid = $("#grid_id");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
        return;
    }
    var selectedIDs = grid.getGridParam("selarrrow");
    if (selectedIDs.length > 1) {
        return;
    }
    return selectedIDs[0];
}

/**
 * 獲取jqGrid選中的多條記錄
 * @returns {*}
 */
function getSelectedRows() {
    var grid = $("#grid_id");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
    	Swal.fire("請選擇一條記錄", {
            icon: "warning",
        });
        return;
    }
    return grid.getGridParam("selarrrow");
}



Date.prototype.format = function(e) {
    var a = function(m, l) {
        var n = ""
          , k = (m < 0)
          , j = String(Math.abs(m));
        if (j.length < l) {
            n = (new Array(l - j.length + 1)).join("0")
        }
        return (k ? "-" : "") + n + j
    };
    if ("string" != typeof e) {
        return this.toString()
    }
    var b = function(k, j) {
        e = e.replace(k, j)
    };
    var f = this.getFullYear()
      , d = this.getMonth() + 1
      , i = this.getDate()
      , g = this.getHours()
      , c = this.getMinutes()
      , h = this.getSeconds();
    b(/yyyy/g, a(f, 4));
    b(/yy/g, a(parseInt(f.toString().slice(2), 10), 2));
    b(/MM/g, a(d, 2));
    b(/M/g, d);
    b(/dd/g, a(i, 2));
    b(/d/g, i);
    b(/HH/g, a(g, 2));
    b(/H/g, g);
    b(/hh/g, a(g % 12, 2));
    b(/h/g, g % 12);
    b(/mm/g, a(c, 2));
    b(/m/g, c);
    b(/ss/g, a(h, 2));
    b(/s/g, h);
    return e
};