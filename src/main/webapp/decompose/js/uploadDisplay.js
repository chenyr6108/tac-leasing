//保存来款上传到本地
function submitSaveData(){
	document.getElementById("submitSaveData").disabled=true;
	document.getElementById("submitCancelData").disabled=true;
	window.location.href="../servlet/defaultDispatcher?__action=composeUpload.saveServiceExcel";	
}

function submitCancelData(){
	document.getElementById("submitSaveData").disabled=true;
	document.getElementById("submitCancelData").disabled=true;
	//window.location.href="/financelease/decompose/upload.jsp";
	window.location.href="../servlet/defaultDispatcher?__action=composeUpload.deleteTemp";
	
}