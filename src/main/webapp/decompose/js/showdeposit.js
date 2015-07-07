//来款搜索
function searchdeposit() {
	$("#form1").submit();
}
//标签页
function selectCard(n) {
	if (n == 0) {
		location.href = "../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=0";
	}
	if (n == 1) {
		location.href = "../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=1";
	}
	if (n == 2) {
		location.href = "../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=2";
	}
	if (n == 3) {
		location.href = "../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=3";
	}
	if (n == 4) {
		location.href = "../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=4";
	}
}
//抵消租金
function counterbalance(recp_code,recp_id) {
	if (window.confirm("\u60a8\u786e\u5b9a\u8981\u5c06\u6b64\u652f\u4ed8\u8868\u7684\u4fdd\u8bc1\u91d1\u51b2\u62b5\u79df\u91d1\u5417\uff1f")) {
		$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=deposit.makeDepositToIncome&recp_code=" + recp_code + "&recp_id=" + recp_id, datatype:"json", success:backcounterbalance});
	} else {
		return false;
	}
}
//抵消租金回调函数
function backcounterbalance(callback) {
	eval("arraylist=" + callback);
	var arraylist = arraylist;
	alert(arraylist.operateflag);
	window.location.href="../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=1";
	//window.location.reload();
}
//平均抵消租金
function averagecounterbalance(recp_code,recp_id,real_price) {
	if (window.confirm("您确定要将此支付表的保证金平均冲抵租金吗？")) {
		$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=deposit.makeDepositToAverage&recp_code=" + recp_code + "&recp_id=" + recp_id + "&real_price=" + real_price, datatype:"json", success:averagebalance});
	} else {
		return false;
	}
}
// 平均抵消回掉函数
function averagebalance(callback){
	eval("arraylist=" + callback);
	var arraylist = arraylist;
	alert(arraylist.operateflag);
	window.location.href="../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=2";
	//window.location.reload();
}
//期末退回
function endoftermback(recp_code,recp_id) {
	if (window.confirm("\u60a8\u786e\u5b9a\u8981\u5c06\u6b64\u652f\u4ed8\u8868\u7684\u4fdd\u8bc1\u91d1\u671f\u672b\u9000\u56de\u5417\uff1f")) {
		$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=deposit.makeDepositToEndback&recp_code=" + recp_code + "&recp_id=" + recp_id, datatype:"json", success:backcounterbalance});
	} else {
		return false;
	}
}
//期末退回回调函数
function backcounterbalance(callback) {
	eval("arraylist=" + callback);
	var arraylist = arraylist;
	alert(arraylist.operateflag);
	window.location.href="../servlet/defaultDispatcher?__action=deposit.queryDepositInfo&cardFlag=3";
	//window.location.reload();
}

