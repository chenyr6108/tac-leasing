

//添加保险公司表单验证

function addInsuCompany(){
		var submitvalue = true;
	if(trim($("#incp_name").val())=="" || trim(by("incp_code").value)=="" ){
		alert("请填写必填项！");
		return false;
	}
	if(blank($("#rate")[0],"费率")){
		return false;
	}
	if(blank($("#short_name")[0],"简称")){
		return false;
	}
	if(blank($("#incp_email")[0],"邮箱")){
		return false;
	}
	if(positive($("#rate")[0],"费率")){
		return false;
	}
	if(positive($("#rate_more")[0],"费率")){
		return false;
	}
	if(trim(by("incp_linkman").value)==""|| trim(by("incp_linktel").value)==""){
		alert("请填写必填项！");
		return false;
		}
	var telNo= $('#incp_linktel').val(); 
	if (!phones(telNo)) {
		submitvalue = false;
		alert("请将电话填写正确");
	}
	if(submitvalue){
			$("#form1").submit();
	}
	return false;

}

//删除一条保险公司记录
function deleteCompany(incp_id){
	if(confirm('您确定要删除该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=insuCompany.delete&incp_id='+incp_id;
	}else{
		return false;
	}
}

//查找一条保险公司记录   更新,修改一条记录
function preUpdateCompany(incp_id){
	location.href='../servlet/defaultDispatcher?__action=insuCompany.getCompanyById&incp_id='+incp_id;
}

//查找一条保险公司记录
function showCompany(incp_id){
	location.href='../servlet/defaultDispatcher?__action=insuCompany.getCompanyByIdForShow&incp_id='+incp_id;
}

//电话或手机号
function checkTelNumber(submitvalue){
	 
	var telNo= $('#incp_linktel').val(); 
	if (!phones(telNo)) {
		submitvalue = false;
		alert("请将填写电话填正确");
	}
		
};


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
	
};
/**为保险公司的险种显示添加每3换行
 * 根据id ，<td>可以有id
 * 子元素，input   :nth-child(3n) 
 * 去下一个元素的所有 checkbox 的input 然后 计数 换行，，
 * 添加<br>
 * 
 * function picbr(参数 元素id){
 * 		
 * }
 * function picbr( di){
	//var ele = $("#"+di+"\""); 
	$("td input:nth-child(3n)").add("<br>");
}
 */
$(function(){
	//alert("pic");
	//$("td input:nth-child(3n)").add("<br>");
	//alert($("td input:nth-child(3n)").val());
	$("#pic span:nth-child(3n)").after("<br>");
//	$("#pic td:nth-child(4n)").after("<tr class='ui-widget-content jqgrow ui-row-ltr'>");

//var pic = document.getElementById("pic");
//pic.childNodes.

	//	alert("pic");
});
		function addBank(){
	tab=document.getElementById("bankTab");
	sed=tab.rows.length;
	if(sed==1){
		row=tab.insertRow(tab.rows.length);
		row.className = "ui-widget-content jqgrow ui-row-ltr";
		var cell = row.insertCell(0);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
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


function deleteBank(){
	check=document.getElementsByName("check_id");
	tab=document.getElementById("bankTab"); 
	for(i=check.length-1;i>=0;i--){
		if(check[i].checked==true){  
			if(tab.rows.length!=3){
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr); 
			}else{
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr);   
       		 	tab.rows[1].parentNode.removeChild(tab.rows[1]);  
			}
		}
	}
}
