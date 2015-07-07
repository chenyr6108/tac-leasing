//保存奖金上传到本地
function submitSaveData(){
	window.location.href="../servlet/defaultDispatcher?__action=composeUpload.saveBonusServiceExcel";	
}

function submitCancelData(){
	//window.location.href="/financelease/decompose/upload.jsp";
	window.location.href="../servlet/defaultDispatcher?__action=composeUpload.deleteTempBonus";
	
}