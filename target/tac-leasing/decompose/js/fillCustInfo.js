var option = {delay:10, matchSubset:1, matchContains:1, cacheLength:10, formatItem:function (row) {
	return " <p>" + row[0] + " </p>" + " <span>" + row[1] + "\u4e2a\u7ed3\u679c</span>";
}, formatResult:function (row) {
	return row[0].replace(/(<.+?>)/gi, "");
}};
// autocomplete选项 --承租人
var options = {minChars:1, max:20, mustMatch:false, matchContains:true, formatItem:function (row, i, max) {
	var rs = row.CUSTINFO;
	if (row.CUSTINFO != null && row.CUSTINFO.length > 0) {
		rs = "名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>省份：" + row.ADD_NAME + "<br>证件：" + row.TYPE_NO;
	}
	return rs;
}, formatMatch:function (row, i, max) {
	return " 名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>省份：" + row.ADD_NAME + "<br>证件：" + row.TYPE_NO;
}, formatResult:function (row) {
	return row.CUSTINFO;
}};
// autocomplete初始化函数 --承租人
function initAutoComplete(data) {
	dataList = data.custList;
	$("#decomposeCustName").autocomplete(dataList, options);
	$("#decomposeCustName").result(function (event, data, formatted) {
		if (data != null) {
			$("#cust_code").val(data.CUST_CODE);
		}
	});
}
// autocomplete选项 --支付表
var options1 = {minChars:1, max:20, mustMatch:false, matchContains:true, formatItem:function (row, i, max) {
	var rs = "";
	if (row.RECP_CODE != null && row.RECP_CODE.length > 0) {
		rs = "支付表："+row.RECP_CODE+"<br>名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>省份：" + row.ADD_NAME + "<br>证件：" + row.TYPE_NO;
	}
	return rs;
}, formatMatch:function (row, i, max) {
	return " 支付表："+row.RECP_CODE+"<br>名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>省份：" + row.ADD_NAME + "<br>证件：" + row.TYPE_NO;
}, formatResult:function (row) {
	return row.RECP_CODE;
}};
// autocomplete初始化函数 --支付表
function initAutoComplete1(data) {
	dataList = data.recpList;
	$("#decomposeRecpCode").autocomplete(dataList, options1);
	$("#decomposeRecpCode").result(function (event, data, formatted) {
		if (data != null) {
			$("#cust_code1").val(data.CUST_CODE);
			$("#recp_code").val(data.RECP_CODE);
		}
	});
}

