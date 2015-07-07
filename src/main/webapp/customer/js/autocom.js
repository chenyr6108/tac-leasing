$(function() {
	// 加载数据, 并在回调函数中用返回的数据初始化autocomplete
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=salesLeads.selectCustomer',
		dataType:'json',
		success: initAutoComplete
	}); 
	  
});
// autocomplete选项 --承租人
var options = {minChars:1, max:20, mustMatch:false, matchContains:true, formatItem:function (row, i, max) {
	var rs = row.CUST_INFO;
	if (row.CUST_INFO != null && row.CUST_INFO.length > 0) {
		rs = "名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>客户级别：" + row.CUST_LEVEL;
	}
	return rs;
}, formatMatch:function (row, i, max) {
	return " 名称：" + row.CUST_NAME + "<br>类别：" + row.CUST_TYPE + "<br>客户级别：" + row.CUST_LEVEL;
}, formatResult:function (row) {
	return row.CUST_INFO;
}};
// autocomplete初始化函数 --承租人
function initAutoComplete(data) {
	dataList = data.custList;
	$("#LINK_CUSTOMER1").autocomplete(dataList, options);
   $("#LINK_CUSTOMER1").result(function (event, data, formatted){
		if (data != null) {
			$("#cust_id").val(data.CUST_ID);
			$("#LINK_CUSTOMER").val(data.CUST_NAME);
		}
	});
}

// autocomplete选项 --联系人
var options1 = {minChars:1, max:20, mustMatch:false, matchContains:true, formatItem:function (row, i, max) {
	var rs = row.LINK_INFO;
	if (row.LINK_INFO != null && row.LINK_INFO.length > 0) {
		rs = " 名称：" + row.LINK_NAME + "<br>与客户关系：" + row.LINK_RELATION2CUST;
	}
	return rs;
}, formatMatch:function (row, i, max) {
	return " 名称：" + row.LINK_NAME + "<br>与客户关系：" + row.LINK_RELATION2CUST;
}, formatResult:function (row) {
	return row.LINK_INFO;
}};
