// 查看
function querySales(msg){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.jumpQuerySales&sales_id="+msg;
}

// 新增(跳转)
function goAddSales(){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.jumpCreat";
}

// 修改(跳转)
function goupSales(msg){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.jumpModify&sales_id="+msg;
}

// 删除
function delSales(msg){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.delSalesLeads&sales_id="+msg;
}

// 销售漏斗(跳转)
function funnelSales(){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.funnelSalesLeads";
}
// 漏斗查询
function doSubmit(){
	$("#funnelForm").submit();
}

function goBack(){
	window.location.href = "../servlet/defaultDispatcher?__action=salesLeads.querySalesLeads";
}