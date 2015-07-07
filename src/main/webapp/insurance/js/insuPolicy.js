// 保单申请
function preCreate(id){
	window.location.href="../servlet/defaultDispatcher?__action=insuPolicy.selectEquipment&credit_id="+id;
}
// 查看(保单)
function showInsu(id){
  	window.location.href="../servlet/defaultDispatcher?__action=insuPolicy.insuPolicyShow&PRCE_ID="+id;
}

// 修改
function updateCover(id){
 	window.location.href="../servlet/defaultDispatcher?__action=insuPolicy.insuPolicyUpdateJsp&PRCE_ID="+id;
}
// 删除
function doIt(id){
if(confirm('确认删除？')){
 	window.location.href="../servlet/defaultDispatcher?__action=insuPolicy.insuPolicyDel&PRCE_ID="+id;
 	}
}
// 查看（状态）
function showDelvStatus(id,delv_status){
	window.location.href="../servlet/defaultDispatcher?__action=insuPolicy.insuPolicyToShowStatus&delv_id="+id+"&delv_status="+delv_status;
}
// 展开层
function showInsuPolicyList(code){
	$("#showInsuPolicyTable" + code).toggle(function () {
		$(this).load("../servlet/defaultDispatcher?__action=insuPolicy.insuPolicyByCreditId&credit_id=" + code);
	});
}
function checkAndCancelAll(id,name) {
	var checkbox = document.getElementsByTagName("input");
	if($("#" + id).attr("checked")) {
		for ( var i = 0; i < checkbox.length; i++) {
			if (checkbox[i].type == "checkbox" && checkbox[i].name == name) {
				checkbox[i].checked = true;
			}
		}
	}else{
		for ( var i = 0; i < checkbox.length; i++) {
			if (checkbox[i].type == "checkbox" && checkbox[i].name == name) {
				checkbox[i].checked = false;
			}
		}
	}
}

function checkContract(){
	   sub1 = true;
	var rcode = $.trim($("#DELV_CODE").val());
	if (rcode == "") {
		alert("发车通知单编号不能为空，请填写！");
		
	  return  false;
	}else{
		return  true;
	}
};

//验证是否为数字         并且不能为空
function isNumber(number) {
	var num = $.trim(number.value);
	if(isNaN(num)) {
		alert("必须为数字，请重新填写");
		number.value = "";
		return;
	}
};
//非空验证
function checForm(){
	if ((trim($("#datebegin").val())).length == 0) {
		alert("开始时间不能为空");
		return  false;
	}
	if ((trim($("#RECEIVE_UNIT").val())).length == 0) {
		alert("收件人不能为空");
		return  false;
	}
	if ((trim($("#SEND_UNIT").val())).length == 0) {
		alert("发件单位不能为空");
		return  false;
	}
	if ((trim($("#SEND_ADDRESS").val())).length == 0) {
		alert("通讯地址不能为空");
		return  false;
	}
	if ((trim($("#LINK_PHONE").val())).length == 0) {
		alert("联系电话不能为空");
		return  false;
	}
	if ((trim($("#COVER_NAME").val())).length == 0) {
		alert("投保人不能为空");
		return  false;
	}
	if ((trim($("#BENEFIT_NAME").val())).length == 0) {
		alert(" 受益人不能为空");
		return  false;
	}
	if ((trim($("#CUST_NAME").val())).length == 0) {
		alert("客户不能为空");
		return  false;
	}	
	return true;
}

//电话或手机号
function checkTelNumber(){
	var telNo = $('#RECEIVE_PHONE').val();
	if (!phones(telNo)) {
		alert("电话不正确");
		return  false;
	}
	telNo = $('#LINK_PHONE').val();
	if (!phones(telNo)) {
		alert("联系人联系电话不正确");
		return  false;
	}
	return true;
}

function phones(elementt){
	var mmob=/^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
	var mtel = /^(0[0-9]{2,3}(\-)?)?([2-9]{1}[0-9]{6,7}){1}(\-[0-9]{1,4})?$/;
	if(elementt==null || elementt=="" ){
		return false;
	}
	if(elementt.match(mmob)){
		return true;
	}
	if(elementt.match(mtel)){
		return true;
	}
		return false;
}
//日期
function checkDate(){ 
	if (!(strDateTime($("#datebegin").val()))) {
		alert("请将交强险投保期限开始时间日期格式填写为 2008-08-08的格式");
		return  false;
	}
	if (!(strDateTime($("#datebegin2").val()))) {
		alert("请将交强险投保期限开始时间日期格式填写为 2008-08-08的格式");
		return  false;
	}
	if (!(strDateTime($("#datebegin3").val()))) {
		alert("请将商业险投保期限开始日期格式填写为 2008-08-08的格式");
		return  false;
	}
	if (!(strDateTime($("#datebegin4").val()))) {
		alert("请将商业险投保期限结束日期格式填写为 2008-08-08的格式");
		return  false;
	}
	return true;
}
function strDateTime(str) { 
    var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
    if(r==null)return false; 
    var d= new Date(r[1], r[3]-1, r[4]); 
    return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]); 
} 
function subForm(name) {
	var obj = $("input[name=" + name + "]:checked");
	if(obj.size() == 0) {
		alert("请选择设备");
		return false;
	}else{
		$("#form").submit();
	}
}
//提交保险单
function subNotice() {
	//if(! (test() )){ return false; }; 
	//if(!checkTelNumber()){ return false; };
	//日期
	//if(checkDate()&&checForm()) {
		$("#addform").submit();
	//}else{
	//	return false;
	//}
}

function updateNotice() {
	if( !(testUpdate()) ){ return false; };		 
	if(!checkTelNumber()){ return false; };
	if(checkDate()) {
		$("#updateform").submit();
	}else{
		return false;
	}
}
function upStatus(){
	if(checkBlank(trimStr($("#remark").val()))){
		alert("说明原因不能为空");
		$("#remark").focus();
		return false;
	}
	$("#form").submit();
}