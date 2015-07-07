document.onkeydown=showEntey;
function showEntey(event){    
		//alert(event.keyCode);
        if(event.keyCode==13)
        {
                doSearch();   
                                              
        }
 } 
 
function productShowSearch(){
	 $("#res").val("cs");
	 doSearch();  
}
		
showProduct = function (id){
	$("#__action").val("productCredit.getProductCreditJsp");
	$("#product_id").val(id);
	$("#PRODUCT_ID").val(id);
	$("#form1").submit();

}

function addCustRow(){
		table = document.getElementById("equipmentTab");
	    var row = table.insertRow(table.rows.length);
	    var length = document.getElementById("equipmentTab").rows.length;
	    
	    cell = row.insertCell(0); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="checkbox" name="newbox" id="newbox">';
	    
	    cell = row.insertCell(1); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="text" name="LEASE_PERIOD1" id="LEASE_PERIOD1">';
	    
	    cell = row.insertCell(2); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="text" name="LEASE_TERM1" id="LEASE_TERM1">';
	    
	    
	    var code = document.getElementsByName("ccode");
	    var flag = document.getElementsByName("cflag");
	   	cell = row.insertCell(3); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<select name="PAY_WAY1" id="PAY_WAY1"><option value="">---è¯·éæ©---</option><option value="11">æåç­é¢æ¬æ¯æ¯ä»</option><option value="12">æåç­é¢æ¬éæ¯ä»</option><option value="13">æåä¸ç­é¢æ¯ä»</option><option value="21">ææ«ç­é¢æ¬æ¯æ¯ä»</option><option value="22">ææ«ç­é¢æ¬éæ¯ä»</option><option value="23">ææ«ä¸ç­é¢æ¯ä»</option></select>';
	    
	   	cell = row.insertCell(4); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="text" name="MANAGEMENT_FEE_RATE1" id="MANAGEMENT_FEE_RATE1">';
	    
	    cell = row.insertCell(5); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="text" name="HEAD_HIRE_PERCENT1" id="HEAD_HIRE_PERCENT1">';
	    
	    cell = row.insertCell(6); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML = '<input type="text" name="PLEDGE_PRICE_RATE1" id="PLEDGE_PRICE_RATE1" >';
	    
	    cell = row.insertCell(7); 
	    cell.align='center';
	    cell.className = "ui-widget-content jqgrow ui-row-ltr";
	    cell.height= '26px';
	    cell.innerHTML ='<input type="text" name="FLOAT_RATE1" id="FLOAT_RATE1">';
	    
	}
function addProductCredit()
{
	if(trim(by("CUGP_CODE").value)==""){	
		alert("协议编号为必填项");
		$("#CUGP_CODE").focus();
		return false;
	}
	if(trim(by("GRANT_PRICE").value)==""){	
		alert("授信金额为必填项");
		$("#GRANT_PRICE").focus();
		return false;
	}
	else
	{
		var gra = by("GRANT_PRICE").value.replace(/\,/g,"");
		$("#GRANT_PRICE").val(gra);
	}
	if(trim(by("LAST_PRICE").value)==""){	
		alert("授信余额为必填项");
		$("#LAST_PRICE").focus();
		return false;
	}
	else
	{
		var gra = by("LAST_PRICE").value.replace(/\,/g,"");
		$("#LAST_PRICE").val(gra);
	}
	if(trim(by("START_DATE").value)==""){	
		alert("授信初始日期为必填项");
		$("#START_DATE").focus();
		return false;
	}
	if(trim(by("END_DATE").value)==""){	
		alert("授信结束日期为必填项");
		$("#END_DATE").focus();
		return false;
	}
	
	if($("#UNION_CREDIT").attr('checked')){
		if(trim(by("UNION_SUPPLIER_ID").value)=="-1"){	
		alert("请选择联合供应商");
		$("#UNION_SUPPLIER_ID").focus();
		return false;
		}
		if(trim(by("UNION_GRANT_PRICE").value)==""){	
			alert("请填写联合授信金额");
			$("#UNION_GRANT_PRICE").focus();
			return false;
		}	
	}
	

/*	var newbox=document.getElementsByName("newbox");
	var oldbox=document.getElementsByName("oldbox");
	if(newbox.length==0 && oldbox.length==0){
		alert("请添加授信方案");
		return false;
	}
	else
	{
		var LEASE_PERIOD1 = document.getElementsByName("LEASE_PERIOD1");
		var LEASE_TERM1 = document.getElementsByName("LEASE_TERM1");
		var PAY_WAY1 = document.getElementsByName("PAY_WAY1");
		var MANAGEMENT_FEE_RATE1 = document.getElementsByName("MANAGEMENT_FEE_RATE1");
		var HEAD_HIRE_PERCENT1 = document.getElementsByName("HEAD_HIRE_PERCENT1");
		var PLEDGE_PRICE_RATE1 = document.getElementsByName("PLEDGE_PRICE_RATE1");
		var FLOAT_RATE1 = document.getElementsByName("FLOAT_RATE1");
		for(var i = 0 ; i <  newbox.length ; i++)
		{
			if(LEASE_PERIOD1[i].value==""){	
				alert("还款期数为必填项");
				return false;
			}
			if(LEASE_TERM1[i].value==""){	
				alert("还款年期为必填项");
				return false;
			}
			if(PAY_WAY1.value==-11){	
				alert("支付方式为必填项");
				return false;
			}
			if(MANAGEMENT_FEE_RATE1[i].value==""){	
				alert("管理费（百分比）为必填项");
				return false;
			}
			if(HEAD_HIRE_PERCENT1[i].value==""){	
				alert("首期租金为必填项");
				$("#HEAD_HIRE_PERCENT1")[i].focus();
				return false;
			}
			if(PLEDGE_PRICE_RATE1[i].value==""){	
				alert("保证金为必填项");
				$("#PLEDGE_PRICE_RATE1")[i].focus();
				return false;
			}
			if(FLOAT_RATE1[i].value==""){	
				alert("利率上浮率为必填项");
				$("#FLOAT_RATE1")[i].focus();
				return false;
			}
		}
	}
	*/
	$("#formaddupd").submit();


}

//在仅仅添加授信，不关联授信方案
function addCreditJustForCustomer()
{
	if(trim(by("CUGP_CODE").value)==""){	
		alert("协议编号为必填项");
		$("#CUGP_CODE").focus();
		return false;
	}
	if(trim(by("GRANT_PRICE").value)==""){	
		alert("授信金额为必填项");
		$("#GRANT_PRICE").focus();
		return false;
	}
	else
	{
		var gra = by("GRANT_PRICE").value.replace(/\,/g,"");
		$("#GRANT_PRICE").val(gra);
	}
	if(trim(by("LAST_PRICE").value)==""){	
		alert("授信余额为必填项");
		$("#LAST_PRICE").focus();
		return false;
	}
	else
	{
		var gra = by("LAST_PRICE").value.replace(/\,/g,"");
		$("#LAST_PRICE").val(gra);
	}
	if(trim(by("START_DATE").value)==""){	
		alert("授信初始日期为必填项");
		$("#START_DATE").focus();
		return false;
	}
	if(trim(by("END_DATE").value)==""){	
		alert("授信结束日期为必填项");
		$("#END_DATE").focus();
		return false;
	}
	var CUGP_ID = by("CUGP_ID").value;
	var CUST_ID = by("CUST_ID").value;
	var CUGP_CODE = by("CUGP_CODE").value;
	var GRANT_PRICE = by("GRANT_PRICE").value.replace(/\,/g,"");
	var LAST_PRICE = by("LAST_PRICE").value.replace(/\,/g,"");
	var START_DATE = by("START_DATE").value ;
	var END_DATE = by("END_DATE").value
	$('#showDiv').dialog({
			modal:true,
			autoOpen: false,
			width: 350
		});
		$('#showDiv').dialog('open');
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:{"CUGP_ID":CUGP_ID,"CUST_ID":CUST_ID,"CUGP_CODE":CUGP_CODE,"GRANT_PRICE":GRANT_PRICE,"LAST_PRICE":LAST_PRICE,"START_DATE":START_DATE,"END_DATE":END_DATE,"__action":"custCredit.creatCreditPlanJust"},
		dataType:'json',
		success: function(dataBack){
			$('#showDiv').html("<br><br>保存成功！");
			var GRANT_PRICE = $("#GRANT_PRICE").val();
			var LAST_PRICE = $("#LAST_PRICE").val();
			$("#GRANT_PRICE").val(changeMoney(GRANT_PRICE.toString()));
			$("#LAST_PRICE").val(changeMoney(LAST_PRICE.toString()));
			return;
		},
		error: function(dataBack){
			alert("网络错误！");
			return ;
		}
	});
}
function changeMoney(GRANT_PRICE) {

	var gprice ;
	var num = GRANT_PRICE.indexOf(".");
	if(num!=-1)
	{
		after = GRANT_PRICE.substring(num);
		before = GRANT_PRICE.substring(0,num);
		leng = Number(before)%3 ;
		times = Number(before.length-leng)/3 ;
		gprice =  before.substring(0,leng);
		
		if(leng==0)
		{
			gprice += before.substring(0,3);
			cut = 3 ;
			for(i = 0 ; i < times-1 ; i++)
			{
				gprice += ","+before.substring(cut,cut+3);
				cut = cut+3;
			}
			gprice += after ;
		}
		else
		{
			var cut = leng ;
			for(i = 0 ; i < times ; i++)
			{
				gprice += ","+before.substring(cut,cut+3);
				cut = cut+3;
			}
			gprice += after ;
		}
	}
	else
	{
		leng = Number(GRANT_PRICE)%3 ;
		times = Number(GRANT_PRICE.length-leng)/3 ;
		
		if(leng==0)
		{
			gprice += GRANT_PRICE.substring(0,3);
			cut = 3 ;
			for(i = 0 ; i < times-1 ; i++)
			{
				gprice += ","+GRANT_PRICE.substring(cut,cut+3);
				cut = cut+3;
			}
		}
		else
		{
			gprice =  GRANT_PRICE.substring(0,leng);
			var cut = leng ;
			for(i = 0 ; i < times ; i++)
			{
				gprice += ","+GRANT_PRICE.substring(cut,cut+3);
				cut = cut+3;
			}
		}
	}
	return gprice ;
}
function deletecugd()
{
	var msg = "您确定要删除此方案吗？";
	if (confirm(msg)){
		$("#__action").val("custCredit.delCustCreditDetail");
		$("#formaddupd").submit();
	}
}
function delCreditPlan(id)
{
	var msg = "您确定要取消授信？";
	if (confirm(msg)){
		$("#__action").val("productCredit.delProductCreditPlan");
		$("#product_id").val(id);
		$("#PRODUCT_ID").val(id);
		$("#form1").submit();
	}
}

function delUnion(id)
{
	var msg = "您确定要取消这条联合授信？";
	if (confirm(msg)){
		$("#__action").val("creditVouchManage.delUnionPrice");
		$("#DEL_UNION_ID").val(id);
		$("#formaddupd").submit();
	}
}
function checkallbox()
{
	var ckb = document.getElementsByName("ckb");
	var oldbox = document.getElementsByName("oldbox");
	var newbox = document.getElementsByName("newbox");
	for(var i=0 ; i<ckb.length ; i++)
	{
		if(ckb[i].checked == true)
		{
			for(var j = 0 ;  j < oldbox.length ; j++)
			{
				oldbox[j].checked = true ;
			}
			for(var j = 0 ;  j < newbox.length ; j++)
			{
				newbox[j].checked = true ;
			}
		}
		else
		{
			for(var j = 0 ;  j < oldbox.length ; j++)
			{
				oldbox[j].checked = false ;
			}
			for(var j = 0 ;  j < newbox.length ; j++)
			{
				newbox[j].checked = false ;
			}
		}
	}
}

showLog = function (id){
	$("#__action").val("productCredit.queryLog");
	$("#product_id").val(id);
	$("#PRODUCT_ID").val(id);
	$("#form1").submit();
}


function changeValue(flag){ 
	if(flag==0){
		$("#union1").css('display','none'); 
	}else{  
	    $("#union1").css('display','');
	}
}

function updateUnion(id){			
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=creditVouchManage.getUnionByID&PUVP_ID="+id,
					dataType:"json",
					success:function(dataBack){
				    $("#UNION_ID").val(dataBack.unionMap.PUVP_ID);	
				    $("#UNION_SUPPLIER").html(dataBack.unionMap.NAME);						
				    $("#UNION_PRICE").val(dataBack.unionMap.UNION_VOUCH_PRICE);												
					$('#updateUnion').dialog({
						modal:true,
						autoOpen: false							
					});
					$('#updateUnion').dialog('open');
				},
				});				
			}


	function closeDialog(msg){
		$(msg).dialog('close');
	}
	
	function updateUnionPrice() {			
		if(trim(by("UNION_PRICE").value)==""){	
			alert("请填写联合授信金额");
			$("#UNION_PRICE").focus();
			return false;
		}   
		$("#updateForm").submit();
	}
