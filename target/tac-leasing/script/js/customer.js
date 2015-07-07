/**add by yangxuan**/
function resetButton() {
		$("#ssn").attr("value","");
		$('#pwd').attr("value","");
		$("#__verifycode#").attr("value","");
}
function validateLoign() {
	var username = $('#ssn').val();
	var password = $('#pwd').val(); 
	var validateCode = $('#__verifycode').val();
	if (username=="" || null==username) {
		alert("登陆名不能为空!");
		return false;
	} else {
		/**if ($('#ssn').val().length >9 | $('#pwd').val().length<6) {
			alert("登陆名必须在6至8位之间!");
			return;
		}**/
	}
	if (password=="" || null==password) {
		alert('密码不能为空!');
		return false;
	} 
	return true;
}
/*window.document.onkeyup=function(evt){
 		if(window.ActiveXObject){
 			if(event.keyCode==13){
 				validateLoign();
 				submit();
 			}
 		}else{
 			if(evt.which==13){
 				validateLoign();
 				submit();
 			}
 		}
 }*/
function submit()
{
	document.loginForm.submit();
	document.getElementById("loginForm").disabled=true;
}
