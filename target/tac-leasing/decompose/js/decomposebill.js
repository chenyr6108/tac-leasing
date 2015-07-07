//财务通过资金管理员提交的分解单
function passDecompose() {
	$("#check_flag").val("Y");
	$("#__action").val("checkDecompose.dueDecomposeBill");
	if(window.confirm("你确定要通过该笔分解单吗？")){
		$("#commitform").submit();
	}else{
		return false;
	}
}
//财务驳回资金管理员提交的分解单
function backDecompose() {
	$("#check_flag").val("N");
	$("#__action").val("checkDecompose.dueDecomposeBill");
	if(window.confirm("你确定要驳回该笔分解单吗？")){
		$("#commitform").submit();
	}else{
		return false;
	}
}
