
// autocomplete选项 --承租人
var options = {
	minChars : 1, 
	max : 20, 
	mustMatch : false, 
	matchContains : true, 
	formatItem : function (row, i, max) {
		var rs = row.CUST_INFO;
		if (row.CUST_INFO != null && row.CUST_INFO.length > 0) {
			rs = "名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>客户级别：" + row.CUST_LEVEL;
		}
		return rs;
	}, 
	formatMatch : function (row, i, max) {
		return " 名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>客户级别：" + row.CUST_LEVEL;
	}, 
	formatResult : function (row) {
		return row.CUST_INFO;
	}
};
// autocomplete初始化函数 --承租人
function initAutoComplete(data) {
	dataList = data.custList;
	$("#cust_info").autocomplete(dataList, options);
	$("#cust_info").result(function (event, data, formatted) {
		if (data != null) {
			$("#cust_id").val(data.CUST_ID);
			$("#cust_name").val(data.CUST_NAME);
		}
	});
}

// autocomplete选项 --联系人
var options1 = {
	minChars:1, 
	max:20, 
	mustMatch:false, 
	matchContains:true, 
	formatItem:function (row, i, max) {
		var rs = row.LINK_INFO;
		if (row.LINK_INFO != null && row.LINK_INFO.length > 0) {
			rs = " 名称：" + row.LINK_NAME + "<br>与客户关系：" + row.LINK_RELATION2CUST;
		}
		return rs;
	}, formatMatch:function (row, i, max) {
		return " 名称：" + row.LINK_NAME + "<br>与客户关系：" + row.LINK_RELATION2CUST;
	}, formatResult:function (row) {
		return row.LINK_INFO;
	}
};
// autocomplete初始化函数 --联系人
function initAutoComplete2(data) {
		dataList = data.linkList;
	if (dataList.length>0) {
		$("#link_info").val('');
		$("#link_info").autocomplete(dataList, options1);
		$("#link_info").result(function (event, data, formatted) {
			if (data != null) {
				$("#linkman_id").val(data.CULM_ID);
				$("#linkman_name").val(data.LINK_NAME);
			}
		});
	}else{
		$("#link_info").val('无联系人');
	}
}

