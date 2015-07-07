function submitCorpForm(){
	form=document.corpForm;
	if(blank(form.CORP_NAME_CN,'公司名称')
	||blank(form.BUSINESS_LICENCE_CODE,'营业执照注册号')
	||blank(form.ORGANIZATION_CODE_CERTIFICATE,'组织机构代码证号')
	||blank(form.TAX_REGISTRATION_NUMBER,'税务登记号')
	||blank(form.INCORPORATING_DATE2,'成立日期')
	||positive(form.REGISTERED_CAPITAL,'注册资本')
	||positive(form.CONTRIBUTED_CAPITAL,'实收资本')
	||blank(form.REGISTERED_OFFICE_ADDRESS,'公司注册地址')
	||blank(form.MANAGING_SCOPE,'经营范围')
	||blank(form.LEGAL_PERSON,'法定代表人')
	||phone(form.LEGAL_MOBILE_NUMBER1,'手机号码')
	//2011/12/26 Yang Yun 删除客户联系人信息的验证，因为是联动的，只要验证联系人是否存在。
	//||blank(form.LINK_MAN,'联系人姓名')
	||blank(form.TELEPHONE,'公司电话')
	||blank(form.B_BANK_NAME,'开户银行')
	||blank(form.B_BANK_ACCOUNT,'账号')
	||blank(form.TC_NAME,'实际经营者')
	||phone(form.TC_PHONE1,'手机号码')
	||blank(form.BUSINESS_TIME_LIMIT,'营业期限')
	||blank(form.ROAD_WORTHINESS_INSPECTION,'年检情况')
	){
		return false;
	}
	if($("#MEMO").val().length>120000) {
		alert("备注长度不能超过120000!");
		return false;
	}
	if($("#OTHER_INFO").val().length>120000) {
		alert("其他信息长度不能超过120000!");
		return false;
	}
	if (!(isPhone(form.TC_TELEPHONE))) {
		alert('请将办公电话填写正确。');
			return false;
	}
	if (!(isPostCode(form.TC_POSTCODE))) {
		alert('请将邮编填写正确。');
			return false;
	}
	 
	if($("#EMPLOYEE_COUNT").val() == ''| $("#EMPLOYEE_COUNT").val() == null){
		$("#EMPLOYEE_COUNT").val(0);
	}else{
			integer(form.EMPLOYEE_COUNT,'职工人数')
		
	}
	tab=document.getElementById("shareholderTab").rows.length;
	if(tab==4){
		HOLDER_NAME=form.HOLDER_NAME;
		HOLDER_CAPITAL=form.HOLDER_CAPITAL;
		HOLDER_RATE=form.HOLDER_RATE;
		if(blank(HOLDER_NAME,'股东名称')
		   ||positive(HOLDER_CAPITAL,'出资情况')
		   ||blank(HOLDER_CAPITAL,'出资情况') ){
			return false;
		}
	}else if(tab>4){
		HOLDER_NAME=form.HOLDER_NAME;	
		HOLDER_CAPITAL=form.HOLDER_CAPITAL;
		HOLDER_RATE=form.HOLDER_RATE;
		for(i=0;i<HOLDER_NAME.length;i++){
			if(blank(HOLDER_NAME[i],'股东名称')
		   ||positive(HOLDER_CAPITAL[i],'出资情况') 
		   ||blank(HOLDER_CAPITAL[i],'出资情况')){
			return false;
		}
		}
	}
	/*2011/12/26 Yang Yun 删除客户联系人信息的验证，因为是联动的，只要验证联系人是否存在。*/
	//增加联系人手机号验证
	/*if (($("#LINK_MOBILE_NUMBER1").val()).length > 1) {
		if (phone(form.LINK_MOBILE_NUMBER1, '联系人手机')) {
			return false;
		}
	}*/
	//2011/12/26 Yang Yun 删除客户联系人信息的验证，因为是联动的，只要验证联系人是否存在。
	//验证联系人
	if ($("#linkMan").val() == "") {
		alert("请先编辑联系人！");
		return false;
	}
	//增加联系人手机号验证 --结束
	//实际经营者邮箱不能为空
	if(blank(form.TC_EMAIL,'实际经营者EMAIL')) {
		return false;
	}
	//对电子邮件的验证
	//var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	//if(!myreg.test(form.TC_EMAIL.value)){
		//alert('请输入有效的实际经营者EMAIL格式！');
		//form.TC_EMAIL.focus();
		//return false;
	//}
	form.submit();
}
function submitCorpForm33(){
	form=document.corpForm;
	if (!(isroIdCard(form.nat_idcard))) {
		alert('请将身份证号码填写正确。');
			return false;
		}
	
	if(blank(form.nat_idcard ,'身份证号码')){
		return false;
	} 
	
	if(blank(form.natu_namen ,'承租人姓名')){
		return false;
	} 
	if(blank(form.nat_idcardAges ,'年龄')){
		return false;
	} 
	 if (($("#nat_idcardAges").val()).length > 1) {
			if(integer(form.nat_idcardAges,'年龄') ){
				
			return false;
			
			} 
		}
			
		if (($("#mate_idcardAges").val()).length > 1) {
		
			if (integer(form.mate_idcardAges, '配偶年龄')) {
			
				return false;
			}
		}
		
	
	if (($("#home_phone").val()).length > 1) {
		if (phone(form.home_phone, '家庭电话')) {
			return false;
		}
	}
	if (($("#mobile_phone").val()).length > 1) {
		if (phone(form.mobile_phone, '手机')) {
			return false;
		}
	}
	if (($("#mate_phone").val()).length > 1) {
		if (phone(form.mate_phone, '配偶联系电话')) {
			return false;
		}
	}
	
	var bank_name =[];
	$('input[name="BANK_NAME"]').each(function(){ 
		  bank_name.push($.trim($(this).val()));   
	});
	var subFlag=true;
	bank_name.push($.trim($("#B_BANK_NAME").val()));
	for (var i=0;i<bank_name.length;i++){
		$.ajax({  
			type:"post",
			url:"../../servlet/defaultDispatcher",
			data:{__action:'backMoney.checkBlackBank',
				BANK_NAME:bank_name[i]} ,
			dataType:"json",
			success: function(dataBack){
				if(dataBack.count>0){
					alert("该开户银行或分行不存在，请再确认！");
					subFlag=false;
				}
			}		
	});
		if(subFlag==false){
			break;
		}
	}
	if (subFlag){
		form.submit();
	}
}

//判断身份证

function isroIdCard(th)
{	
	var m=/^(\d){15}$/;
	var m1=/^(\d){18}$/;
	var m2=/^(\d){17}[x|X]$/;
	var m3=/^(\d){17}[y|Y]$/;
	if(th.value==""||
	   th.value.match(m)||
	   th.value.match(m1)||
	   th.value.match(m2)||
	   th.value.match(m3))
	{
		 
		return true;
	}
	else
	{
		 
		return false;
	}
}


function copyLEGAL(){
	$('#LINK_MAN').val($('#LEGAL_PERSON').val());
	$('#LINK_ID_CARD1').val($('#LEGAL_ID_CARD1').val());
	$('#LINK_ID_CARD2').val($('#LEGAL_ID_CARD2').val());
	$('#LINK_ID_CARD').attr('name',$('#LEGAL_ID_CARD').attr('name'));
	$('#LINK_TELEPHONE').val($('#LEGAL_TELEPHONE').val()); 
	$('#LINK_POSTCODE').val($('#LEGAL_POSTCODE').val());
	$('#LINK_MOBILE_NUMBER1').val($('#LEGAL_MOBILE_NUMBER1').val());
	$('#LINK_MOBILE_NUMBER2').val($('#LEGAL_MOBILE_NUMBER2').val());
	$("#LINK_IDCARD_FLAG").val($("#LEGAL_IDCARD_FLAG").val());
	chanCard(2) ;
	for(i=0;i<$('#LEGAL_ID_CARD1').val().length;i++){
		$('#LINK_ID_CARD1_field_'+i).val($('#LEGAL_ID_CARD1_field_'+i).val());
	} 
	
}
function addBanks(msg){
	$("#"+msg).append("<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td>其他账户</td>"+
		"<td><input type='checkbox' name='check_id'>开户银行：</td>"+
		"<td><input type='text' name='BANK_NAME' style='width: 150px;'></td>"+
		"<td>账号：</td>"+
		"<td colspan='3'><input type='text' name='BANK_ACCOUNT' style='width: 150px;'></td>"+
		"</tr>");
	
	$('#bankTab1').append("<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td>其他账户</td>"+
		"<td><input type='checkbox' name='check_id'>开户银行：</td>"+
		"<td><input type='text' name='BANK_NAME' style='width: 150px;'></td>"+
		"<td>账号：</td>"+
		"<td colspan='3'><input type='text' name='BANK_ACCOUNT' style='width: 150px;'></td>"+
		"</tr>");
}						
											
function addBank(obj){
	tab=obj.parentNode.parentNode.parentNode;
	//tab=document.getElementById("bankTab");
	sed=tab.rows.length;
	if(sed==2){
		row=tab.insertRow(tab.rows.length);
		row.className = "ui-widget-content jqgrow ui-row-ltr";
		var cell = row.insertCell(0);  
		cell.rowSpan=2;
		cell.id="bankTd";
		cell.innerHTML="其他账户 ";
		row.appendChild(cell);
	}else{
		vtd=document.getElementById("bankTd"); 
		vtd.rowSpan=vtd.rowSpan+1;
	} 
	row=tab.insertRow(tab.rows.length);
	row.className = "ui-widget-content jqgrow ui-row-ltr";
	var cell = row.insertCell(0);  
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="<input type='checkbox' name='check_id' id='check_id"+sed+"' value='"+sed+"' /> 开户银行：";
	row.appendChild(cell);
	var cell = row.insertCell(1);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="<input type=\"text\" name=\"BANK_NAME\" id=\"BANK_NAME"+sed+"\" style=\"width: 150px;\">";
	row.appendChild(cell);
	var cell = row.insertCell(2);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="账号：";
	row.appendChild(cell);
	var cell = row.insertCell(3);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.colSpan=3;
	cell.innerHTML="<input type=\"text\" name=\"BANK_ACCOUNT\" id=\"BANK_ACCOUNT"+sed+"\" style=\"width: 150px;\">";
	row.appendChild(cell);
	
	$("#bankTab td").each(function(){
		$(this).attr('class','ui-widget-content jqgrow ui-row-ltr');
	})
	
	
}

//function deleteBank(){
//	check=document.getElementsByName("check_id");
//	tab=document.getElementById("bankTab"); 
//	for(i=check.length-1;i>=0;i--){
//		if(check[i].checked==true){  
//			if(tab.rows.length!=4){
//				var tr = check[i].parentNode.parentNode;
 //      		 	tr.parentNode.removeChild(tr); 
//			}else{
//				var tr = check[i].parentNode.parentNode;
 //      		 	tr.parentNode.removeChild(tr);   
 //     		 	tab.rows[2].parentNode.removeChild(tab.rows[2]);  
//			}
//		}
//	}
//}

function deleteBank(obj){

	check=document.getElementsByName("check_id");
	//tab=document.getElementById("bankTab");
	tab=obj.parentNode.parentNode.parentNode;
	for(i=check.length-1;i>=0;i--){
		if(check[i].checked==true){  
			if(tab.rows.length!=4){
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr); 
			}else{
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr);   
       		 	tab.rows[2].parentNode.removeChild(tab.rows[2]);
			}
		}
	}
	
}
function addShareholders(msg){
	$("#"+msg).append("<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td><input type='checkbox' name='scheck_id'></td>"+
		"<td><input type='text' name='HOLDER_NAME' style='width: 180px;'></td>"+
		"<td><input type='text' name='HOLDER_CAPITAL' style='width: 120px'></td>"+
		"<td><input type='text' name='HOLDER_WAY' style='width: 140px;'></td>"+
		"<td><input type='text' name='HOLDER_RATE' style='width: 40px;'>%</td>"+
		"<td colspan='2'><input type='text' name='HOLDER_MOME' style='width: 200px;'></td>"+
		"</tr>");
}

function getTotal(){
	var capitals = document.getElementsByName("HOLDER_CAPITAL");
	var holder_rate = document.getElementsByName("HOLDER_RATE");
	var total = parseInt("0");
	for(var i =0 ; i< capitals.length;i++){
		if(isNaN(parseInt(capitals[i].value.replace(/[-￥,]/g, '')))){
			alert("出资情况只能为数字");
			capitals[i].focus();
			return false;
		}else{
			total+=parseInt(capitals[i].value.replace(/[-￥,]/g, ''));
		}
	}
	for(var i =0 ; i<holder_rate.length;i++){
		var temp = Math.round(parseInt(capitals[i].value.replace(/[-￥,]/g, ''))/total*10000)/100;
		holder_rate[i].value=temp;
		//$("#HOLDER_RATE"+(i+3)).val(temp);
	}
	$("#sharHolderTotal").html("￥"+total);
	$("#CONTRIBUTED_CAPITAL").val(total);
}

function addShareholder(){
	tab=document.getElementById("shareholderTab"); 
	sed=tab.rows.length;
	newRow=tab.insertRow(tab.rows.length-1); 
	td1=newRow.insertCell(0);
	td1.className="ui-widget-content jqgrow ui-row-ltr";
	td2=newRow.insertCell(1);
	td2.className="ui-widget-content jqgrow ui-row-ltr";
	td3=newRow.insertCell(2);
	td3.className="ui-widget-content jqgrow ui-row-ltr";
	td4=newRow.insertCell(3);
	td4.className="ui-widget-content jqgrow ui-row-ltr";
	td5=newRow.insertCell(4);
	td5.className="ui-widget-content jqgrow ui-row-ltr";
	td6=newRow.insertCell(5);
	td6.className="ui-widget-content jqgrow ui-row-ltr";
	
	td1.height='26px';
	td1.align="center";
	td1.innerHTML="<input type=\"checkbox\"  name=\"scheck_id\" id=\"scheck_id"+sed+"\">"; 
	
	td2.align="center";
	td2.innerHTML="<input type=\"text\" style=\"width: 180px;\" name=\"HOLDER_NAME\" id=\"HOLDER_NAME"+sed+"\" style=\"width: 40px;\">"; 
	
	td3.align="center";
	td3.innerHTML="<input type=\"text\" style=\"width: 120px;\" name=\"HOLDER_CAPITAL\" id=\"HOLDER_CAPITAL"+sed+"\"  onchange=\"getTotal()\" style=\"width: 40px;\">"; 
	
	
	td4.align="center";
	td4.innerHTML="<input type=\"text\" style=\"width: 140px;\" name=\"HOLDER_WAY\" id=\"HOLDER_WAY"+sed+"\" style=\"width: 40px;\">"; 

	
	td5.align="center";
	td5.innerHTML="<input type=\"text\" style=\"width: 40px;\" name=\"HOLDER_RATE\" id=\"HOLDER_RATE"+sed+"\" style=\"width: 40px;\"> %"; 
	
	
	td6.align="center";
	td6.colSpan=2;
	td6.innerHTML="<input type=\"text\" style=\"width: 200px;\" name=\"HOLDER_MOME\" id=\"HOLDER_MOME"+sed+"\" style=\"width: 40px;\">"; 

}
function addShareholder2(){
	var ta = $("#shareholderTab2");
	ta.append("<tr class='ui-widget-content jqgrow ui-row-ltr'></tr>");
		
//	var tac=document.getElementById("shareholderTab3").lastChild; 
	var tac= $("#shareholderTab2  tr:last") ; 
	 
	 tac.append("<td    class='ui-widget-content jqgrow ui-row-ltr'>" +
	 "<input type='text'name='fam_name' size=10'' ></td><td   class='ui-widget-content jqgrow ui-row-ltr'>"+
	 "<input type='text'name='fam_relation'size='10'  ></td><td     class='ui-widget-content jqgrow ui-row-ltr'>" +
	 "<input type='text'name='fam_link'size='15'  ></td><td     class='ui-widget-content jqgrow ui-row-ltr'>"+
	 "<input type='text'name='fam_addr'size='60' ></td><td  class='ui-widget-content jqgrow ui-row-ltr'><input size='17' type='text'name='remark'  ></td>"+
	 "<td >  <img  onclick='deleteShareholder3();' name='devill' src='../images/u103.gif'></td>");
	 
	 
	 deleteShareholder3();
}
function addShareholder3(){
	
	var i = 56;
	i++;
	var ta = $("#shareholderTab3");
	ta.append("<tr class='ui-widget-content jqgrow ui-row-ltr'></tr>");
		
//	var tac=document.getElementById("shareholderTab3").lastChild; 
	var tac= $("#shareholderTab3  tr:last") ; 
	 
	 tac.append("<td    class='ui-widget-content jqgrow ui-row-ltr'>" +
	 "<input type='text'name='soci_name' size=10'' ></td><td   class='ui-widget-content jqgrow ui-row-ltr'>"+
	 "<input type='text'name='soci_work'size='42'  ></td><td     class='ui-widget-content jqgrow ui-row-ltr'>" +
	 "<input type='text'name='soci_position'size='12'  ></td><td     class='ui-widget-content jqgrow ui-row-ltr'>"+
	 "<input type='text'name='soci_link'  ></td><td  class='ui-widget-content jqgrow ui-row-ltr'><input type='text'name='soci_remark'  ></td>"+
	 "<td ><img  onclick='deleteShareholder3();' name='devill' src='../images/u103.gif'></td>");
	 
	 
	 deleteShareholder3();
	
}

function deleteShareholder3(){
	
//	var ta = $("#shareholderTab3"); 
//	
//	var tac= $("#shareholderTab3  tr:last") ; 
//	var tcv = $("#shareholderTab3 tr") ; 
//	if(tcv.length >2){
//		tac.remove();
//	}
//		var eee = $(this)
//		var eee2 = $(this).parent()
//		var ddd = $(this).parent().parent();
//		$(this).parent().parent().remove();
	$("img[name='devill']").click(function(){
		
		 $(this).parent().parent().remove();
	} );
	
}

function deleteShareholder2(){
	scheck=document.getElementsByName("scheck_id");
	for(i=scheck.length-1;i>=0;i--){
		if(scheck[i].checked==true){
			var tr=scheck[i].parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}

function deleteShareholder(){
	scheck=document.getElementsByName("scheck_id");
	for(i=scheck.length-1;i>=0;i--){
		if(scheck[i].checked==true){
			var tr=scheck[i].parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
	getTotal();
}
function addProjects(){
	$("#dddd").append("<table width='100%' cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'><input type='checkbox' name='pcheck_id'>项目名称：</td>"+
		"<td><input type='text' name='PROJECT_NAMES' style='width: 200px;'></td>"+
		"</tr>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'><input type='hidden' name='fforDelete1'>起止时间：</td>"+
		"<td><input type='text' name='PROJECT_DATE' style='width: 150px;'></td>"+
		"</tr>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'>&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：<input type='hidden' name='fforDelete2'></td>"+
		"<td><textarea name='PROJECT_CONTENT' style='width: 500px; height: 50px; font-size: 12px'></textarea></td>"+
		"</tr></table>");
}
function addProjectss(msg){
	$("#"+msg).append("<table width='100%' cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'><input type='checkbox' name='pcheck_id'>项目名称：</td>"+
		"<td><input type='text' name='PROJECT_NAME' style='width: 200px;'></td>"+
		"</tr>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'><input type='hidden' name='fforDelete1'>起止时间：</td>"+
		"<td><input type='text' name='PROJECT_DATE' style='width: 150px;'></td>"+
		"</tr>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td width='19%'>&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：<input type='hidden' name='fforDelete2'></td>"+
		"<td><textarea name='PROJECT_CONTENT' style='width: 500px; height: 50px; font-size: 12px'></textarea></td>"+
		"</tr></table>");
}

function addProject(){
	tab=document.getElementById("projectTab"); 
	newRow=tab.insertRow(tab.rows.length-1); 
	sed=tab.rows.length
	cell0=newRow.insertCell(0);
	cell0.className="ui-widget-content jqgrow ui-row-ltr";
	cell0.innerHTML="<input type=\"checkbox\" name=\"pcheck_id\" id=\"pcheck_id"+sed+"\" value=\""+sed+"\">"
					+"				项目名称：";
	newRow.appendChild(cell0);					
	cell1=newRow.insertCell(1);
	cell1.className="ui-widget-content jqgrow ui-row-ltr";
	cell1.innerHTML="<input type=\"text\" name=\"PROJECT_NAME\" id=\"PROJECT_NAME\""
					+"					style=\"width: 400px;\">";
	newRow.appendChild(cell1);	
	newRow=tab.insertRow(tab.rows.length-1); 
	cell0=newRow.insertCell(0);
	cell0.className="ui-widget-content jqgrow ui-row-ltr";
	cell0.innerHTML="&nbsp;&nbsp;&nbsp; 起止时间：<input type=\"hidden\" name=\"fforDelete\" id=\"fforDelete"+sed+"\" value=\""+sed+"\"> ";
	newRow.appendChild(cell0);					
	cell1=newRow.insertCell(1);
	cell1.className="ui-widget-content jqgrow ui-row-ltr";
	cell1.innerHTML="<input type=\"text\" name=\"PROJECT_DATE\" id=\"PROJECT_DATE\""
					+"					style=\"width: 400px;\">";
	newRow.appendChild(cell1);	
	newRow=tab.insertRow(tab.rows.length-1);  
	cell0=newRow.insertCell(0);
	cell0.className="ui-widget-content jqgrow ui-row-ltr";
	cell0.innerHTML="&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：<br /><input type=\"button\" value=\"加\" onClick=\"controllerTextArea1('add', 'td"+sed+"');\" /><input type=\"button\" value=\"减\" onClick=\"controllerTextArea1('del', 'td"+sed+"');\"  /> <input type=\"hidden\" name=\"forDelete\" id=\"forDelete"+sed+"\" value=\""+sed+"\"> ";
	newRow.appendChild(cell0);					
	cell1=newRow.insertCell(1);
	cell1.className="ui-widget-content jqgrow ui-row-ltr";
	cell1.id = "td"+sed;
	cell1.innerHTML="<textarea name=\"PROJECT_CONTENT\" id=\"PROJECT_CONTENT\"" 
					+"			style=\"width: 500px; height: 50px;font-size: 12px\" class=\"txtk\"></textarea>";
	newRow.appendChild(cell1);	
}
function deleteProjects(){
	pcheck=document.getElementsByName("pcheck_id");
	for(i=pcheck.length-1;i>=0;i--){
		if(pcheck[i].checked==true){
			var tr=pcheck[i].parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}
function deleteProjectss(){
	pcheck=document.getElementsByName("pcheck_id");
	for(i=pcheck.length-1;i>=0;i--){
		if(pcheck[i].checked==true){
			var tr=pcheck[i].parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}

function deleteProject(){
	pcheck=document.getElementsByName("pcheck_id"); 
	tab=document.getElementById("projectTab"); 
	for(i=pcheck.length-1;i>=0;i--){
		if(pcheck[i].checked==true){  
			var tr=pcheck[i].parentNode.parentNode;
			hi=document.getElementById("forDelete"+pcheck[i].value);
			hii=document.getElementById("fforDelete"+pcheck[i].value);
			var tr1= hi.parentNode.parentNode;
			var tr2= hii.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			tr1.parentNode.removeChild(tr1);
			tr2.parentNode.removeChild(tr2);
		}
	}
}

//不同身份证选择器
// 法人  LEGAL_ID_CARD  0    HKMACPERMIT 1    OTHERPERMIT  3 $("#LEGAL_ID_CARD").attr("name","LEGAL_ID_CARD");
//联系人   LINK_ID_CARD  0  LKHKMACPERMIT 1   LKOTHERPERMIT  3
function chanCard(num){
	//法人
	if(num == 1){
	var typ = $("#LEGAL_IDCARD_FLAG").val();
	var input1=	$("#LEGAL_ID_CARD");
		if(typ == 0){
			
			$("#LEGAL_ID_CARD1").parent().show();
			$("#LEGAL_ID_CARD1").attr("name","LEGAL_ID_CARD");
			$("#LEGAL_ID_CARD2").parent().hide();
		 $("#LEGAL_ID_CARD2").attr("name","LEGAARDnnmm");
		}
		else{
			$("#LEGAL_ID_CARD1").parent().hide();
			 $("#LEGAL_ID_CARD1").attr("name","LEGAARDnnmm");
			$("#LEGAL_ID_CARD2").parent().show();
		 $("#LEGAL_ID_CARD2").attr("name","LEGAL_ID_CARD");
		}
		 
	}
	
	
	//联系人  LINK_ID_CARD   LINK_HKMACPERMIT LINK_OTHERPERMIT
	if(num == 2){
		var ncp = $("#LINK_IDCARD_FLAG").val();
		
		if(ncp == 0){
			$("#LINK_ID_CARD1").parent().show(); 
			$("#LINK_ID_CARD1").attr("name","LINK_ID_CARD");
			$("#LINK_ID_CARD2").parent().hide(); 
		 $("#LINK_ID_CARD2").attr("name","LINCARDmmnn");
		}
		else{
			$("#LINK_ID_CARD1").parent().hide(); 
			$("#LINK_ID_CARD1").attr("name","LINCARDmmnn");
			$("#LINK_ID_CARD2").parent().show(); 
		 $("#LINK_ID_CARD2").attr("name","LINK_ID_CARD");
			}
		 
	}
	
	//实际经营者
	if(num == 3){
	var typ = $("#CARD_FLAG").val();
	var input1=	$("#CARD_ID");
		if(typ == 0){
			
			$("#CARD_ID1").parent().show();
			$("#CARD_ID1").attr("name","CARD_ID");
			$("#CARD_ID2").parent().hide();
		 $("#CARD_ID2").attr("name","CARD_ID");
		}
		else{
			$("#CARD_ID1").parent().hide();
			 $("#CARD_ID1").attr("name","CARD_ID");
			$("#CARD_ID2").parent().show();
		 $("#CARD_ID2").attr("name","CARD_ID");
		}
		 
	}
}


function changeIdCardTypes(value){ 
	if(value==1){
		$("#showIdTd2").hide();
		$("#showIdTd1").show();
	}else{
		$("#showIdTd1").hide();
		$("#showIdTd2").show();
	}
}