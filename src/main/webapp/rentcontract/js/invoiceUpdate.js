function checkAll(e, itemName)
{
  var aa = document.getElementsByName(itemName);
  for (var i=0; i<aa.length; i++)
   aa[i].checked = e.checked;
}
function checkItem(e, allName)
{
  var all = document.getElementsByName(allName)[0];
  if(!e.checked) all.checked = false;
  else
  {
    var aa = document.getElementsByName(e.name);
    for (var i=0; i<aa.length; i++)
     if(!aa[i].checked) return;
    all.checked = true;
  }
}


//进入添加开票协议书
function create(){
	$("#__action").val("invoiceContract.create");
	$("#form1").submit();
}

//整机发票开具给
function createDisplay(obj) {
	var value = $(obj).val();
	if(value == 3) {	
		$("#statusTr").css("display","");
	}else{
		$("#statusTr").css("display","none");		
	}
}

//整机发票开具给 如果选择第三方   个人或者丙方公司
function createDisplay2(obj) {
	var value = $(obj).val();
	if(value == 1) {	
		$("#TypeTr").css("display","");
		$("#TypeTr2").css("display","none");		
	}else{
		$("#TypeTr").css("display","none");
		$("#TypeTr2").css("display","");		
	}
}

//租金发票或利息发票开具给 
function createDisplay3(obj) {
	var value = $(obj).val();
	if(value == 2) {	
		$("#otherTr").css("display","");
	}else{
		$("#otherTr").css("display","none");	
	}
}

//租金发票或利息发票开具给   如果选择第三方   个人或者丙方公司
function createDisplay4(obj) {
	var value = $(obj).val();
	if(value == 1) {	
		$("#otherTypeTr").css("display","");
		$("#otherTypeTr2").css("display","none");	
	}else{
		$("#otherTypeTr").css("display","none");
		$("#otherTypeTr2").css("display","");		
	}
}

//选中的名字为空 
function lostName(obj) {
	if($(obj).val()=="姓名"){
		$(obj).val("");
	}
}
//选中的丙方公司为空 
function lostCompanyName(obj) {
	if($(obj).val()=="丙方公司名称"){
		$(obj).val("");
	}
}
//选中的注册号为空 
function lostSize(obj) {
	if($(obj).val()=="丙方营业执照注册号"){
		$(obj).val("");
	}
}
//选中的机构号为空 
function lostTeam(obj) {
	if($(obj).val()=="组织机构代码号"){
		$(obj).val("");
	}
}

//添加开票协议书
function addInvoice(){
	if($("#W_PERSON_NAME").val()=="姓名"){
		$("#W_PERSON_NAME").val("");
	}
	if($("#O_PERSON_NAME").val()=="姓名"){
		$("#O_PERSON_NAME").val("");
	}
	if($("#W_COMPANY_NAME").val()=="丙方公司名称"){
		$("#W_COMPANY_NAME").val("");
	}
	if($("#W_COMPANY_NUMBER").val()=="丙方营业执照注册号"){
		$("#W_COMPANY_NUMBER").val("");
	}	
	if($("#W_COMPANY_CODE").val()=="组织机构代码号"){
		$("#W_COMPANY_CODE").val("");
	}
	if($("#O_COMPANY_NAME").val()=="丙方公司名称"){
		$("#O_COMPANY_NAME").val("");
	}
	if($("#O_COMPANY_NUMBER").val()=="丙方营业执照注册号"){
		$("#O_COMPANY_NUMBER").val("");
	}	
	if($("#O_COMPANY_CODE").val()=="组织机构代码号"){
		$("#O_COMPANY_CODE").val("");
	}						
	$("#__action").val("invoiceContract.add");
	$("#form1").submit();
}

//修改开票协议书
function updateInvoice(){
	if($("#W_PERSON_NAME").val()=="姓名"){
		$("#W_PERSON_NAME").val("");
	}
	if($("#O_PERSON_NAME").val()=="姓名"){
		$("#O_PERSON_NAME").val("");
	}
	if($("#W_COMPANY_NAME").val()=="丙方公司名称"){
		$("#W_COMPANY_NAME").val("");
	}
	if($("#W_COMPANY_NUMBER").val()=="丙方营业执照注册号"){
		$("#W_COMPANY_NUMBER").val("");
	}	
	if($("#W_COMPANY_CODE").val()=="组织机构代码号"){
		$("#W_COMPANY_CODE").val("");
	}
	if($("#O_COMPANY_NAME").val()=="丙方公司名称"){
		$("#O_COMPANY_NAME").val("");
	}
	if($("#O_COMPANY_NUMBER").val()=="丙方营业执照注册号"){
		$("#O_COMPANY_NUMBER").val("");
	}	
	if($("#O_COMPANY_CODE").val()=="组织机构代码号"){
		$("#O_COMPANY_CODE").val("");
	}						
	$("#__action").val("invoiceContract.updateInvoice");
	$("#form1").submit();
}