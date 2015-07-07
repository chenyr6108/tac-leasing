// 弹出层(法人)
function addVoucherCorp(){
	var credit_id = $("#credit_id").val();
	var showFlag = $("#showFlag").val();
	$('#addVoucherCorps').dialog({
		modal:true,
		autoOpen: false,
		width: 900				
	});
	$('#addVoucherCorps').dialog('open');
	$("#addVoucherCorp_sec").load("../servlet/defaultDispatcher?__action=creditVoucherVip.gotoAddVoucherCorp&credit_id="+credit_id+"&showFlag="+showFlag);
}
// 弹出层(自然人)
function addVoucherNatu(){
	var credit_id = $("#credit_id").val();
	var showFlag = $("#showFlag").val();
	$('#addVoucherNatus').dialog({
		modal:true,
		autoOpen: false,
		width: 800				
	});
	$('#addVoucherNatus').dialog('open');
	$("#addVoucherNatu_sec").load("../servlet/defaultDispatcher?__action=creditVoucherVip.gotoAddVoucherNatu&credit_id="+credit_id+"&showFlag="+showFlag);
} 
 //弹出层返回按钮
 function closeDialog1(){
	$("#addVoucherCorps").dialog('close');
}		 

 //弹出层返回按钮
 function closeDialog2(){
	$('#addVoucherNatus').dialog('close');
}
// 法人添加
function addCorp(){
	
	if(!valueIsNotNull(by('CORP_NAME_CNs'))){
		alert("请填写单位名称");
		by('CORP_NAME_CNs').focus();
		return false;
	}
	if(!valueIsNotNull(by('ORGANIZATION_CODE_CERTIFICATEs'))){
		alert("组织机构代码证号");
		by('ORGANIZATION_CODE_CERTIFICATEs').focus();
		return false;
	}
	if(!valueIsNotNull(by('REGISTERED_OFFICE_ADDRESSs'))){
		alert("请填写公司注册地址");
		by('REGISTERED_OFFICE_ADDRESSs').focus();
		return false;
	}
	
	if(!valueIsNotNull(by('TELEPHONEs'))){
		alert("请填写公司电话");
		by('TELEPHONEs').focus();
		return false;
	}
	if(!valueIsNotNull(by('LEGAL_PERSONs'))){
		alert("请填写法定代表人");
		by('LEGAL_PERSONs').focus();
		return false;
	}
	
	if(!valueIsNotNull(by('LEGAL_MOBILE_NUMBER1s'))){
		alert("请填写法人手机号码");
		by('LEGAL_MOBILE_NUMBER1s').focus();
		return false;
	}
	var s0 = $("#corpdiv0").attr("style");
	var s1 = $("#custcorpdiv0").attr("style");
	
	if(s0==""){
		if(!isIdCard(by('LEGAL_ID_CARD_Crop'))){
			alert("请填写正确身份证号");
			by('LEGAL_ID_CARD_Crop').focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('otherPermit'))){
			alert("请填写其他证件号");
			by('otherPermit').focus();
			return false;
		}
	}
	if(s1==""){
		if(!isIdCard(by('LINK_ID_CARD_Crop'))){
			alert("请填写正确身份证号");
			by('LINK_ID_CARD_Crop').focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('linkPermit'))){
			alert("请填写其他证件号");
			by('linkPermit').focus();
			return false;
		}
	}
	
	
	if(!(isNumber(by('EMPLOYEE_COUNTs')))){
		alert("请填写正确职工人数");
		by('EMPLOYEE_COUNTs').focus();
		return false;
	}
	if(!isDouble(by('REGISTERED_CAPITALs'))){
		alert("请填写正确数字");
		by('REGISTERED_CAPITALs').focus();
		return false;
	}
	if(!isDouble(by('CONTRIBUTED_CAPITALs'))){
		alert("请填写正确数字");
		by('CONTRIBUTED_CAPITALs').focus();
		return false;
	}
//	if(!isPhone(by('TELEPHONEs'))){
//		alert("请填写正确电话");
//		by('TELEPHONEs').focus();
//		return false;
//	}
//	if(!mobileTels(by('LEGAL_MOBILE_NUMBER1s'))){
//		alert("请填写正确法人手机号");
//		by('LEGAL_MOBILE_NUMBER1s').focus();
//		return false;
//	}
	if(!isPhone(by('FAXs'))){
		alert("请填写正确传真号");
		by('FAXs').focus();
		return false;
	}
	if(!isPostCode(by('POSTCODEs'))){
		alert("请填写正确邮编");
		by('POSTCODEs').focus();
		return false;
	}
	if(!isPhone(by('LEGAL_TELEPHONEs'))){
		alert("请填写正确电话");
		by('LEGAL_TELEPHONEs').focus();
		return false;
	}
	if(!isPostCode(by('LEGAL_POSTCODEs'))){
		alert("请填写正确邮编");
		by('LEGAL_POSTCODEs').focus();
		return false;
	}
	if(!isPhone(by('LINK_TELEPHONEs'))){
		alert("请填写正确电话号");
		by('LINK_TELEPHONEs').focus();
		return false;
	}
	if(!isPostCode(by('LINK_POSTCODEs'))){
		alert("请填写正确邮编");
		by('LINK_POSTCODEs').focus();
		return false;
	}
	if(!mobileTels(by('LINK_MOBILE_NUMBER1s'))){
		alert("请填写正确手机号");
		by('LINK_MOBILE_NUMBER1').focus();
		return false;
	}
	if(!mobileTels(by('LINK_MOBILE_NUMBER2s'))){
		alert("请填写正确手机号");
		by('LINK_MOBILE_NUMBER2s').focus();
		return false;
	}
	if(!isDouble(by('HOLDER_CAPITALs'))){
		alert("请填写正确数字");
		by('HOLDER_CAPITALs').focus();
		return false;
	}
	if(!isDouble(by('HOLDER_RATEs'))){
		alert("请填写正确数字");
		by('HOLDER_RATEs').focus();
		return false;
	}
	var HOUSE_NAMES = document.getElementsByName("HOUSE_NAME");
	for(var i =0;i<HOUSE_NAMES.length;i++)
	{
		if(HOUSE_NAMES[i].value ==null || HOUSE_NAMES[i].value ==""){
			alert("请填写房产名称");
			return false;
		}
	}
	var HOUSE_ADDRESSS = document.getElementsByName("HOUSE_ADDRESS");
	for(var i =0;i<HOUSE_ADDRESSS.length;i++)
	{
		if(HOUSE_ADDRESSS[i].value ==null || HOUSE_ADDRESSS[i].value ==""){
			alert("请填写房产地址");
			return false;
		}
	}
	var HOUSE_AREAS = document.getElementsByName("HOUSE_AREA");
	for(var i =0;i<HOUSE_AREAS.length;i++)
	{
		if(HOUSE_AREAS[i].value ==null || HOUSE_AREAS[i].value ==""){
			alert("请填写房产面积");
			return false;
		}
		if(isNaN(HOUSE_AREAS[i].value)){
			alert("请填写正确房产面积");
			return false;
		}
		
	}
	var HOUSE_PROVES = document.getElementsByName("HOUSE_PROVE");
	for(var i =0;i<HOUSE_PROVES.length;i++)
	{
		if(HOUSE_PROVES[i].value ==null || HOUSE_PROVES[i].value ==""){
			alert("请填写国土证/房产证");
			return false;
		}
	}
	var HOUSE_OTHERRIGHTS = document.getElementsByName("HOUSE_OTHERRIGHT");
	for(var i =0;i<HOUSE_OTHERRIGHTS.length;i++)
	{
		if(HOUSE_OTHERRIGHTS[i].value ==null || HOUSE_OTHERRIGHTS[i].value ==""){
			alert("请填写他项权利");
			return false;
		}
	}
	
	// 项目
	var PROJECT_NAME=document.getElementsByName("PROJECT_NAMEss");
	// 货币资金
	var MONEY_FUNDS=document.getElementsByName("MONEY_FUNDSs");
	// 应收账款
	var ACCOUNTS_RECEIVABLE=document.getElementsByName("ACCOUNTS_RECEIVABLEs");
	// 存货
	var STOCK=document.getElementsByName("STOCKs");
	// 固定资产
	var SALES_REVENUE=document.getElementsByName("SALES_REVENUEs");
	// 总资产
	var TOTAL_ASSERTS=document.getElementsByName("TOTAL_ASSERTSs");
	// 短期借款
	var SHORTTIME_LOAN=document.getElementsByName("SHORTTIME_LOANs");
	// 应付账款
	var ACCOUNTS_PAYABLE=document.getElementsByName("ACCOUNTS_PAYABLEs");
	// 总负债
	var TOTAL_OWES=document.getElementsByName("TOTAL_OWESs");
	// 实收资本
	var CONTRIBUTED_CAPITAL=document.getElementsByName("CONTRIBUTED_CAPITALs");
	// 资本公积
	var CAPITAL_RESERVE=document.getElementsByName("CAPITAL_RESERVEs");
	// 未分配利润
	var UNDISTRIBUTED_PROFIT=document.getElementsByName("UNDISTRIBUTED_PROFITs");
	// 销售收入
	var SALES_REVENUE=document.getElementsByName("SALES_REVENUEs");
	// 销售成本
	var COST_OF_MARKETING=document.getElementsByName("COST_OF_MARKETINGs");
	// 期间费用
	var PERIOD_EXPENSE=document.getElementsByName("PERIOD_EXPENSEs");
	// 利润总额
	var TOTAL_PROFIT=document.getElementsByName("TOTAL_PROFITs");
	// 资产负债率
	var DEBTR=document.getElementsByName("DEBTRs");
	// 销售净利率
	var PROFIT_MARGIN=document.getElementsByName("PROFIT_MARGINs");
	// 毛利率
	var TTM=document.getElementsByName("TTMs");
	// 销售增长率
	var SALES_GROWTH=document.getElementsByName("SALES_GROWTHs");
	// 净资产增长率
	var NAGR=document.getElementsByName("NAGRs");
	for(i=0;i<PROJECT_NAME.length;i++){
		// 货币资金
		if(!isDouble(MONEY_FUNDS[i])){
			alert("请填写正确数字");
			MONEY_FUNDS[i].focus();
			return false;
		}
		// 应收账款
		if(!isDouble(ACCOUNTS_RECEIVABLE[i])){
			alert("请填写正确数字");
			ACCOUNTS_RECEIVABLE[i].focus();
			return false;
		}
		// 存货
		if(!isDouble(STOCK[i])){
			alert("请填写正确数字");
			STOCK[i].focus();
			return false;
		}
		// 固定资产
		if(!isDouble(SALES_REVENUE[i])){
			alert("请填写正确数字");
			SALES_REVENUE[i].focus();
			return false;
		}
		// 总资产
		if(!isDouble(TOTAL_ASSERTS[i])){
			alert("请填写正确数字");
			TOTAL_ASSERTS[i].focus();
			return false;
		}
		// 短期借款
		if(!isDouble(SHORTTIME_LOAN[i])){
			alert("请填写正确数字");
			SHORTTIME_LOAN[i].focus();
			return false;
		}
		// 应付账款
		if(!isDouble(ACCOUNTS_PAYABLE[i])){
			alert("请填写正确数字");
			ACCOUNTS_PAYABLE[i].focus();
			return false;
		}
		// 总负债
		if(!isDouble(TOTAL_OWES[i])){
			alert("请填写正确数字");
			TOTAL_OWES[i].focus();
			return false;
		}
		// 实收资本
		if(!isDouble(CONTRIBUTED_CAPITAL[i])){
			alert("请填写正确数字");
			CONTRIBUTED_CAPITAL[i].focus();
			return false;
		}
		// 资本公积
		if(!isDouble(CAPITAL_RESERVE[i])){
			alert("请填写正确数字");
			CAPITAL_RESERVE[i].focus();
			return false;
		}
		// 未分配利润
		if(!isDouble(UNDISTRIBUTED_PROFIT[i])){
			alert("请填写正确数字");
			UNDISTRIBUTED_PROFIT[i].focus();
			return false;
		}
		// 销售收入
		if(!isDouble(SALES_REVENUE[i])){
			alert("请填写正确数字");
			SALES_REVENUE[i].focus();
			return false;
		}
		// 销售成本
		if(!isDouble(COST_OF_MARKETING[i])){
			alert("请填写正确数字");
			COST_OF_MARKETING[i].focus();
			return false;
		}
		// 期间费用
		if(!isDouble(PERIOD_EXPENSE[i])){
			alert("请填写正确数字");
			PERIOD_EXPENSE[i].focus();
			return false;
		}
		// 利润总额
		if(!isDouble(TOTAL_PROFIT[i])){
			alert("请填写正确数字");
			TOTAL_PROFIT[i].focus();
			return false;
		}
		// 资产负债率
		if(!isDouble(DEBTR[i])){
			alert("请填写正确数字");
			DEBTR[i].focus();
			return false;
		}
		// 销售净利率
		if(!isDouble(PROFIT_MARGIN[i])){
			alert("请填写正确数字");
			PROFIT_MARGIN[i].focus();
			return false;
		}
		// 毛利率
		if(!isDouble(TTM[i])){
			alert("请填写正确数字");
			TTM[i].focus();
			return false;
		}
		// 销售增长率
		if(!isDouble(SALES_GROWTH[i])){
			alert("请填写正确数字");
			SALES_GROWTH[i].focus();
			return false;
		}
		// 净资产增长率
		if(!isDouble(NAGR[i])){
			alert("请填写正确数字");
			NAGR[i].focus();
			return false;
		}
	}

	$("#addForm").submit();
}
// a要格式化得数，b保留小数点后几位
function round(a,b){
	return(Math.round(a*Math.pow(10,b))*Math.pow(10,-b));
}

// 过往记录验证
function changEBTRs(){
	//总资产
	TOTAL_ASSERTS=document.getElementsByName("TOTAL_ASSERTSs");
	//总负债
	TOTAL_OWES=document.getElementsByName("TOTAL_OWESs");
	//资产负债率
	DEBTR=document.getElementsByName("DEBTRs");
	for(i=0;i<TOTAL_ASSERTS.length;i++){
		if(TOTAL_ASSERTS[i].value!=''&&TOTAL_OWES[i].value!=''){
			if(TOTAL_ASSERTS[i].value!=0&&TOTAL_OWES[i].value!=0){
				
			
			var m = number((TOTAL_OWES[i].value)*100000) ;
			var n = number((TOTAL_ASSERTS[i].value)*100000)  ;
			var c =  Math.round((m/n)*10000)
			
			DEBTR[i].value=  c/100 ;
			}else{
				DEBTR[i].value='';
			}
		}
		else{
			
			DEBTR[i].value = '';
		}
	}
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUEs");
	//利润总额
	TOTAL_PROFIT=document.getElementsByName("TOTAL_PROFITs");
	//销售净利率
	PROFIT_MARGIN=document.getElementsByName("PROFIT_MARGINs");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&TOTAL_PROFIT[i].value!=''){
			if (SALES_REVENUE[i].value != 0 && TOTAL_PROFIT[i].value != 0) {
			
			
				var m = number((TOTAL_PROFIT[i].value) * 100000);
				var q = number((SALES_REVENUE[i].value) * 100000);
				var ll = Math.round((m / q) * 10000);
				
				PROFIT_MARGIN[i].value = ll / 100;
				
			}else{
				PROFIT_MARGIN[i].value = '';
			}
		}else{
			PROFIT_MARGIN[i].value = '';
		}
	}
	
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUEs");
	//销售成本
	COST_OF_MARKETING=document.getElementsByName("COST_OF_MARKETINGs");
	//毛利率
	TTM=document.getElementsByName("TTMs");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&COST_OF_MARKETING[i].value!=''){
			if (SALES_REVENUE[i].value != 0 && COST_OF_MARKETING[i].value != 0) {
			
			
				var m = number((COST_OF_MARKETING[i].value) * 100000);
				var n = number((SALES_REVENUE[i].value) * 100000);
				
				var q = Math.round((1 - (m / n)) * 10000);
				
				TTM[i].value = q / 100;
			}else{
			TTM[i].value ='';
			}
		}else{
			
			 TTM[i].value ='';
			}
	}

	perencens();

}

function perencens(){
	//截取月份数字
 
	 var mon =document.getElementById("PROJECT_NAME11s").value ;
	var mmm=	 mon.substr(5,2);
	var nmn = number(mmm);
	if(nmn >0& nmn <12){
		
	//销售增长率=(本年度销售收入-上年度销售收入)/上年度销售收入     如果本年度是不满12个月的销售收入，则上年度的销售收入按比例换算成与本年度相同的月份数。
	//即销售增长率=（本年度销售收入-上年度销售收入*月份数/12）/（上年度销售收入*月份数/12）
		
		if(  $("#SALES_REVENUE2s").val() !='' & $("#SALES_REVENUE1s").val() !='' ){
			
	    var	tim = nmn/12;
		var qj = number(($("#SALES_REVENUE4s").val())*100000);
		
		var hf =number(($("#SALES_REVENUE3s").val())*100000);
		
		var zd = number(($("#SALES_REVENUE2s").val())*100000);
		
		var rr =  number(($("#SALES_REVENUE1s").val())*100000);
		 
				
				var sj = Math.round(((zd - hf) / hf) * 10000); 
				$("#SALES_GROWTH2s").val(sj / 100);
				
				var zz = Math.round(((hf - qj) / qj) * 10000);
				
				$("#SALES_GROWTH3s").val(zz / 100);
				
				var jj =  Math.round(((rr-(zd*tim) ) / (zd*tim)) * 10000);
				
				$("#SALES_GROWTH1s").val(jj / 100);
			 
		}
		
		
	} 
		
		
		if($("#SALES_REVENUE4s").val()  ==''|$("#SALES_REVENUE4s").val() ==0 ){
			
			 $("#SALES_GROWTH3s").val("")   ;
				
		}
		if($("#SALES_REVENUE3s").val()  ==''|$("#SALES_REVENUE3s").val() ==0 ){
			
			 	$("#SALES_GROWTH2s").val("")   ;
				
		}
		if($("#SALES_REVENUE2s").val()  ==''|$("#SALES_REVENUE2s").val() ==0 ){
			
			 $("#SALES_GROWTH1s").val("")   ;
				
		}
		
		

	 
	
 


//净资产增长率=（本年度实收资本+本年度资本公积+本年度未分配利润-上年度实收资本-上年度资本公积-上年度未分配利润）/（上年度实收资本+上年度资本公积+上年度未分配利润）

//实收资本 CONTRIBUTED_CAPITAL
//		CONTRIBUTED_CAPITAL=document.getElementsByName("CONTRIBUTED_CAPITAL");
//资本公积 CAPITAL_RESERVE
//	CAPITAL_RESERVE=document.getElementsByName("CAPITAL_RESERVE");
// 未分配利润 UNDISTRIBUTED_PROFIT
//UNDISTRIBUTED_PROFIT=document.getElementsByName("UNDISTRIBUTED_PROFIT");
//净资产增长率 NAGR
//	NAGR=document.getElementsByName("NAGR");


	if( $("#CONTRIBUTED_CAPITAL1s").val() !=''& $("#CAPITAL_RESERVE1s").val() !=''& $("#UNDISTRIBUTED_PROFIT1s").val() !=''& $("#CONTRIBUTED_CAPITAL2s").val() !=''& $("#CAPITAL_RESERVE2s").val() !=''& $("#UNDISTRIBUTED_PROFIT2s").val() !=''){
			var zz = number(($("#CONTRIBUTED_CAPITAL1s").val())*100000) ;
			var jw =number(($("#CAPITAL_RESERVE1s").val())*100000);
			var  zl =number(($("#UNDISTRIBUTED_PROFIT1s").val())*100000);
			
			var an =  zz*1  + jw*1 +  zl*1 ;
			var nn = number(($("#CONTRIBUTED_CAPITAL2s").val())*100000);
			var mm =number(($("#CAPITAL_RESERVE2s").val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT2s").val())*100000) ;
			
			var kk =   nn*1  + mm*1 + uu*1 ;
			
			var zd =   Math.round(((an - kk) /kk )*10000);
			
			if(kk == 0){
				
			 	$("#NAGR1s").val("")   ;
			}else{
					$("#NAGR1s").val((zd/100))   ;
			}
		

		
		}

	if( $("#CONTRIBUTED_CAPITAL2s").val() !=''& $("#CAPITAL_RESERVE2s").val() !=''& $("#UNDISTRIBUTED_PROFIT2s").val() !=''& $("#CONTRIBUTED_CAPITAL3s").val() !=''& $("#CAPITAL_RESERVE3s").val() !=''& $("#UNDISTRIBUTED_PROFIT3s").val() !=''){
			var zz = number(($("#CONTRIBUTED_CAPITAL2s").val())*100000) ;
			var jw =number(($("#CAPITAL_RESERVE2s").val())*100000);
			var  zl =number(($("#UNDISTRIBUTED_PROFIT2s").val())*100000);
			
			var an =  zz*1  + jw*1 +  zl*1 ;
			var nn = number(($("#CONTRIBUTED_CAPITAL3s").val())*100000);
			var mm =number(($("#CAPITAL_RESERVE3s").val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT3s").val())*100000) ;
			
			var kk =   nn*1  + mm*1 + uu*1 ;
			
			var zd =   Math.round(((an - kk) /kk )*10000);
			
			if(kk == 0){
				
				 $("#NAGR2s").val("")   ;
			}else{
					$("#NAGR2s").val((zd/100))   ;
			}
		
		}
	
	
	if( $("#CONTRIBUTED_CAPITAL3s").val() !=''& $("#CAPITAL_RESERVE3s").val() !=''& $("#UNDISTRIBUTED_PROFIT3s").val() !=''& $("#CONTRIBUTED_CAPITAL4s").val() !=''& $("#CAPITAL_RESERVE4s").val() !=''& $("#UNDISTRIBUTED_PROFIT4s").val() !=''){
			var zz =number(($("#CONTRIBUTED_CAPITAL3s").val())*100000);
			var jw =number(($("#CAPITAL_RESERVE3s").val())*100000);
			var zl =number(($("#UNDISTRIBUTED_PROFIT3s").val())*100000) ;
			
			var an =zz*1  + jw*1 +  zl*1 ;
			var nn =number(($("#CONTRIBUTED_CAPITAL4s").val())*100000);
			var mm = number(($("#CAPITAL_RESERVE4s").val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT4s").val())*100000);
			
			var kk = nn*1   +mm*1 + uu*1 ;
			var zd =  Math.round(((an - kk) /kk )*10000);
			
			
			if(kk == 0){
				
				 $("#NAGR3s").val("")   ;
			}else{
					$("#NAGR3s").val((zd/100))   ;
			}
		
		}
	
	

}

function getValuess(th)
{
	var value = "";
	if(th!=null)
	{
		value=th;
		while(value.indexOf(" ")!=-1)
		{
			value = value.replace(" ","");
		}		
		while(value.indexOf(",")!=-1)
		{
			value = value.replace(",","");
		}
		while(value.indexOf("￥")!=-1)
		{
			value = value.replace("￥","");
		}
		while(value.indexOf("，")!=-1)
		{
			value = value.replace("，","");
		}
		while(value.indexOf("%")!=-1)
		{
			value = value.replace("%","");
		}
		
		if(!valueIsDouble(value))
		{
			value=0;
		}
	}
	return value;
}
// 删除法人
function delCorp(msg,id){
	$("#"+msg).remove();
	var url = "../servlet/defaultDispatcher?__action=creditVoucherVip.deleteCorp&pjccc_id="+id;
	$.getJSON(url);
}

// 自然人添加
function addNatu(){
	if(!valueIsNotNull(by('natu_name'))){
		alert("请填写担保人姓名");
		by('natu_name').focus();
		return false;
	}
	
	var s0 = $("#natudiv0").attr("style");
	
	if(s0==""){
		if(!valueIsNotNull(by('natu_idcard'))){
			alert("请填写担保人身份证号码");
			by('natu_idcard').focus();
			return false;
		}else if(!isIdCard(by('natu_idcard'))){
			alert("请填写正确身份证号");
			by('natu_idcard').focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('otherPermit'))){
			alert("请填写其他证件号");
			by('otherPermit').focus();
			return false;
		}
	}
	if(!valueIsNotNull(by('natu_mobile'))){
		alert("请填写担保人手机号码");
		by('natu_mobile').focus();
		return false;
	}
	
//	if(!mobileTels(by('natu_mobile'))){
//		alert("请填写正确的手机号码");
//		by('natu_mobile').focus();
//		return false;
//	}
	var natu_mate_age = document.getElementById("natu_mate_idcardAge").value;
	if(natu_mate_age!=null&&natu_mate_age!=""){
		if(isNaN(natu_mate_age)){
			alert("请正确填写配偶年龄");
			return false;
		}
	}
	
	var HOUSE_NAMES = document.getElementsByName("HOUSE_NAME");
	for(var i =0;i<HOUSE_NAMES.length;i++)
	{
		if(HOUSE_NAMES[i].value ==null || HOUSE_NAMES[i].value ==""){
			alert("请填写房产名称");
			return false;
		}
	}
	var HOUSE_ADDRESSS = document.getElementsByName("HOUSE_ADDRESS");
	for(var i =0;i<HOUSE_ADDRESSS.length;i++)
	{
		if(HOUSE_ADDRESSS[i].value ==null || HOUSE_ADDRESSS[i].value ==""){
			alert("请填写房产地址");
			return false;
		}
	}
	var HOUSE_AREAS = document.getElementsByName("HOUSE_AREA");
	for(var i =0;i<HOUSE_AREAS.length;i++)
	{
		if(HOUSE_AREAS[i].value ==null || HOUSE_AREAS[i].value ==""){
			alert("请填写房产面积");
			return false;
		}
		if(isNaN(HOUSE_AREAS[i].value)){
			alert("请填写正确房产面积");
			return false;
		}
		
	}
	var HOUSE_PROVES = document.getElementsByName("HOUSE_PROVE");
	for(var i =0;i<HOUSE_PROVES.length;i++)
	{
		if(HOUSE_PROVES[i].value ==null || HOUSE_PROVES[i].value ==""){
			alert("请填写国土证/房产证");
			return false;
		}
	}
	var HOUSE_OTHERRIGHTS = document.getElementsByName("HOUSE_OTHERRIGHT");
	for(var i =0;i<HOUSE_OTHERRIGHTS.length;i++)
	{
		if(HOUSE_OTHERRIGHTS[i].value ==null || HOUSE_OTHERRIGHTS[i].value ==""){
			alert("请填写他项权利");
			return false;
		}
	}
	/*
	if(!isPhone(by('natu_fax'))){
		alert("请填写正确传真号");
		by('natu_fax').focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_bank_accounts'))){
		alert("请填写担保人银行帐号");
		by('natu_bank_accounts').focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_open_bank'))){
		alert("请填写担保人开户银行");
		by('natu_open_bank').focus();
		return false;
	}if(!valueIsNotNull(by('natu_mobile'))){
		alert("请填写担保人手机号码");
		by('natu_mobile').focus();
		return false;
	}else if(!mobileTels(by('natu_mobile'))){
		alert("请填写正确的电话号码");
		by('natu_mobile').focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_home_address'))){
		alert("请填写担保人家庭地址");
		by('natu_home_address').focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_work_units'))){
		alert("请填写担保人工作单位");
		by('natu_work_units').focus();
		return false;
	}
	*/
	$("#natuForm").submit();
}
// 删除自然人
function delNatu(msg,id){
	$("#"+msg).remove();
	var url = "../servlet/defaultDispatcher?__action=creditVoucher.deleteNatu&pron_id="+id;
	$.getJSON(url);
}

function upCorp(msg){
	if(!valueIsNotNull(by('CORP_NAME_CN'+msg))){
		alert("请填写单位名称");
		by('CORP_NAME_CN'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('REGISTERED_OFFICE_ADDRESS'+msg))){
		alert("请填写公司注册地址");
		by('REGISTERED_OFFICE_ADDRESS'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('LEGAL_PERSON'+msg))){
		alert("请填写法定代表人");
		by('LEGAL_PERSON'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('TELEPHONE'+msg))){
		alert("请填写公司电话");
		by('TELEPHONE'+msg).focus();
		return false;
	}
	/*var s0 = $("#corpdiv0"+msg).attr("style");
	var s1 = $("#custcorpdiv0"+msg).attr("style");
	if(!valueIsNotNull(by('LEGAL_MOBILE_NUMBER1'+msg))){
		alert("请填写法人手机号码");
		by('LEGAL_MOBILE_NUMBER1'+msg).focus();
		return false;
	}
	if(s0=="" || s0 == null){
		if(!isIdCard(by('LEGAL_ID_CARD_Crop'+msg))){
			alert("请填写正确身份证号");
			by('LEGAL_ID_CARD_Crop'+msg).focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('otherPermit'+msg))){
			alert("请填写其他证件号");
			by('otherPermit'+msg).focus();
			return false;
		}
	}
	if(s1=="" || s1 == null){
		if(!isIdCard(by('LINK_ID_CARD_Crop'+msg))){
			alert("请填写正确身份证号");
			by('LINK_ID_CARD_Crop'+msg).focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('linkPermit'+msg))){
			alert("请填写其他证件号");
			by('linkPermit'+msg).focus();
			return false;
		}
	}
	
	
	
	
	
	
	if(!isNumber(by('EMPLOYEE_COUNT'+msg))){
		alert("请填写正确职工人数");
		by('EMPLOYEE_COUNT'+msg).focus();
		return false;
	}
	if(!isDouble(by('REGISTERED_CAPITAL'+msg))){
		alert("请填写正确数字");
		by('REGISTERED_CAPITAL'+msg).focus();
		return false;
	}
	if(!isDouble(by('CONTRIBUTED_CAPITAL'+msg))){
		alert("请填写正确数字");
		by('CONTRIBUTED_CAPITAL'+msg).focus();
		return false;
	}*/
//	if(!isPhone(by('TELEPHONE'+msg))){
//		alert("请填写正确电话");
//		by('TELEPHONE'+msg).focus();
//		return false;
//	}
//	if(!mobileTels(by('LEGAL_MOBILE_NUMBER1'+msg))){
//		alert("请填写正确法人手机号");
//		by('LEGAL_MOBILE_NUMBER1'+msg).focus();
//		return false;
//	}
	/*if(!isPhone(by('FAX'+msg))){
		alert("请填写正确传真号");
		by('FAX'+msg).focus();
		return false;
	}
	if(!isPostCode(by('POSTCODE'+msg))){
		alert("请填写税务登记号");
		by('POSTCODE'+msg).focus();
		return false;
	}
	if(!isPhone(by('LEGAL_TELEPHONE'+msg))){
		alert("请填写正确电话");
		by('LEGAL_TELEPHONE'+msg).focus();
		return false;
	}
	if(!isPostCode(by('LEGAL_POSTCODE'+msg))){
		alert("请填写正确邮编");
		by('LEGAL_POSTCODE'+msg).focus();
		return false;
	}
	if(!isPhone(by('LINK_TELEPHONE'+msg))){
		alert("请填写正确电话号");
		by('LINK_TELEPHONE'+msg).focus();
		return false;
	}
	if(!isPostCode(by('LINK_POSTCODE'+msg))){
		alert("请填写正确邮编");
		by('LINK_POSTCODE'+msg).focus();
		return false;
	}
	if(!mobileTels(by('LINK_MOBILE_NUMBER1'+msg))){
		alert("请填写正确手机号");
		by('LINK_MOBILE_NUMBER1'+msg).focus();
		return false;
	}
	if(!mobileTels(by('LINK_MOBILE_NUMBER2'+msg))){
		alert("请填写正确手机号");
		by('LINK_MOBILE_NUMBER2'+msg).focus();
		return false;
	}
	if(!isDouble(by('HOLDER_CAPITAL'+msg))){
		alert("请填写正确数字");
		by('HOLDER_CAPITAL'+msg).focus();
		return false;
	}
	if(!isDouble(by('HOLDER_RATE'+msg))){
		alert("请填写正确数字");
		by('HOLDER_RATE'+msg).focus();
		return false;
	}
	
	var HOUSE_NAMES = document.getElementsByName("HOUSE_NAME");
	for(var i =0;i<HOUSE_NAMES.length;i++)
	{
		if(HOUSE_NAMES[i].value ==null || HOUSE_NAMES[i].value ==""){
			alert("请填写房产名称");
			return false;
		}
	}
	var HOUSE_ADDRESSS = document.getElementsByName("HOUSE_ADDRESS");
	for(var i =0;i<HOUSE_ADDRESSS.length;i++)
	{
		if(HOUSE_ADDRESSS[i].value ==null || HOUSE_ADDRESSS[i].value ==""){
			alert("请填写房产地址");
			return false;
		}
	}
	var HOUSE_AREAS = document.getElementsByName("HOUSE_AREA");
	for(var i =0;i<HOUSE_AREAS.length;i++)
	{
		if(HOUSE_AREAS[i].value ==null || HOUSE_AREAS[i].value ==""){
			alert("请填写房产面积");
			return false;
		}
		if(isNaN(HOUSE_AREAS[i].value)){
			alert("请填写正确房产面积");
			return false;
		}
		
	}
	var HOUSE_PROVES = document.getElementsByName("HOUSE_PROVE");
	for(var i =0;i<HOUSE_PROVES.length;i++)
	{
		if(HOUSE_PROVES[i].value ==null || HOUSE_PROVES[i].value ==""){
			alert("请填写国土证/房产证");
			return false;
		}
	}
	var HOUSE_OTHERRIGHTS = document.getElementsByName("HOUSE_OTHERRIGHT");
	for(var i =0;i<HOUSE_OTHERRIGHTS.length;i++)
	{
		if(HOUSE_OTHERRIGHTS[i].value ==null || HOUSE_OTHERRIGHTS[i].value ==""){
			alert("请填写他项权利");
			return false;
		}
	}*/
	
	$("#upCropForm"+msg).submit();
}	

function upNatu(msg){
	if(!valueIsNotNull(by('natu_name'+msg))){
		alert("请填写担保人姓名");
		by('natu_name'+msg).focus();
		return false;
	}
	var s0 = $("#natudiv0"+msg).attr("style");

	if(s0=="" || s0 == null){
		if(!valueIsNotNull(by('natu_idcard'+msg))){
			alert("请填写担保人身份证号码");
			by('natu_idcard'+msg).focus();
			return false;
		}else if(!isIdCard(by('natu_idcard'+msg))){
			alert("请填写正确身份证号");
			by('natu_idcard'+msg).focus();
			return false;
		}
	}else{
		if(!valueIsNotNull(by('otherPermitZ'+msg))){
			alert("请填写其他证件号");
			by('otherPermitZ'+msg).focus();
			return false;
		}
	}
	
	if(!valueIsNotNull(by('natu_mobile'+msg))){
		alert("请填写担保人手机号码");
		by('natu_mobile'+msg).focus();
		return false;
	}
	
	if(!(isNumber(by('natu_age'+msg)))){
		alert("请填写正确年龄");
		by('natu_age'+msg).focus();
		return false;
	}
//	if(!mobileTels(by('natu_mobile'+msg))){
//		alert("请填写正确的电话号码");
//		by('natu_mobile'+msg).focus();
//		return false;
//	}
	if(!isPhone(by('natu_fax'+msg))){
		alert("请填写正确传真号");
		by('natu_fax'+msg).focus();
		return false;
	}
	
	var HOUSE_NAMES = document.getElementsByName("HOUSE_NAME");
	
	for(var i =0;i<HOUSE_NAMES.length;i++)
	{
		if(HOUSE_NAMES[i].value ==null || HOUSE_NAMES[i].value ==""){
			alert("请填写房产名称");
			return false;
		}
	}
	var HOUSE_ADDRESSS = document.getElementsByName("HOUSE_ADDRESS");
	for(var i =0;i<HOUSE_ADDRESSS.length;i++)
	{
		if(HOUSE_ADDRESSS[i].value ==null || HOUSE_ADDRESSS[i].value ==""){
			alert("请填写房产地址");
			return false;
		}
	}
	var HOUSE_AREAS = document.getElementsByName("HOUSE_AREA");
	for(var i =0;i<HOUSE_AREAS.length;i++)
	{
		if(HOUSE_AREAS[i].value ==null || HOUSE_AREAS[i].value ==""){
			alert("请填写房产面积");
			return false;
		}
		if(isNaN(HOUSE_AREAS[i].value)){
			alert("请填写正确房产面积");
			return false;
		}
	}
	var HOUSE_PROVES = document.getElementsByName("HOUSE_PROVE");
	for(var i =0;i<HOUSE_PROVES.length;i++)
	{
		if(HOUSE_PROVES[i].value ==null || HOUSE_PROVES[i].value ==""){
			alert("请填写国土证/房产证");
			return false;
		}
	}
	var HOUSE_OTHERRIGHTS = document.getElementsByName("HOUSE_OTHERRIGHT");
	for(var i =0;i<HOUSE_OTHERRIGHTS.length;i++)
	{
		if(HOUSE_OTHERRIGHTS[i].value ==null || HOUSE_OTHERRIGHTS[i].value ==""){
			alert("请填写他项权利");
			return false;
		}
	}
	/*
	if(!valueIsNotNull(by('natu_bank_accounts'+msg))){
		alert("请填写担保人银行帐号");
		by('natu_bank_accounts'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_open_bank'+msg))){
		alert("请填写担保人开户银行");
		by('natu_open_bank'+msg).focus();
		return false;
	}if(!valueIsNotNull(by('natu_mobile'+msg))){
		alert("请填写担保人手机号码");
		by('natu_mobile'+msg).focus();
		return false;
	}else if(!mobileTels(by('natu_mobile'+msg))){
		alert("请填写正确的电话号码");
		by('natu_mobile'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_home_address'+msg))){
		alert("请填写担保人家庭地址");
		by('natu_home_address'+msg).focus();
		return false;
	}
	if(!valueIsNotNull(by('natu_work_units'+msg))){
		alert("请填写担保人工作单位");
		by('natu_work_units'+msg).focus();
		return false;
	}
	*/
	$("#upNatuForm"+msg).submit();
}

// 证件类型转换
function changeCard(flag,msg){ 
	$("#natu_name"+msg).val('');
	for (var i=0;i<18;i++) {
		$("#natu_idcard"+msg+"_field_"+i).val('');
	}
	for (var i=0;i<18;i++) {
		$("#HKMacPermit"+msg+"_field_"+i).val('');
	}
	for (var i=0;i<18;i++) {
		$("#passport"+msg+"_field_"+i).val('');
	}
	for (var i=0;i<18;i++) {
		$("#otherPermit"+msg+"_field_"+i).val('');
	}
	
	//$("#HKMacPermit"+msg).val('');
	//$("#passport"+msg).val('');
	//$("#otherPermit"+msg).val('');
	if(flag==0){
		$("#natudiv0"+msg).attr('style','');	 
		$("#natudiv1"+msg).attr('style','display: none;');	
		$("#natudiv2"+msg).attr('style','display: none;');
		$("#natudiv3"+msg).attr('style','display: none;');
	}else if(flag==1){
		$("#natudiv0"+msg).attr('style','display: none;');	 
		$("#natudiv1"+msg).attr('style','');	
		$("#natudiv2"+msg).attr('style','display: none;');
		$("#natudiv3"+msg).attr('style','display: none;');
	}else if(flag==2){
		$("#natudiv0"+msg).attr('style','display: none;');	 
		$("#natudiv1"+msg).attr('style','display: none;');	
		$("#natudiv2"+msg).attr('style','');
		$("#natudiv3"+msg).attr('style','display: none;');
	}else if(flag==3){
		$("#natudiv0"+msg).attr('style','display: none;');	 
		$("#natudiv1"+msg).attr('style','display: none;');	
		$("#natudiv2"+msg).attr('style','display: none;');
		$("#natudiv3"+msg).attr('style','');
	}
}	

function changeType(flag,msg){ 
	for (var i=0;i<18;i++) {
		$("#natu_idcard"+msg+"_field_"+i).val('');
	}
	$('#otherPermit'+msg).val('');
	
	if(flag==0){
		$("#natudiv0"+msg).attr('style','');	 
		$("#natudiv1"+msg).attr('style','display: none;');	
	}else{
		$("#natudiv0"+msg).attr('style','display: none;');	 
		$("#natudiv1"+msg).attr('style','');	
	}
}	
function changeMateType(flag,msg){ 
	for (var i=0;i<18;i++) {
		$("#natu_mate_idcard"+msg+"_field_"+i).val('');
	}
	$('#mate_other_permit'+msg).val('');
	
	if(flag==0){
		$("#natuMatediv0"+msg).attr('style','');	 
		$("#natuMatediv1"+msg).attr('style','display: none;');	
	}else{
		$("#natuMatediv0"+msg).attr('style','display: none;');	 
		$("#natuMatediv1"+msg).attr('style','');	
	}
}
function changeType2(flag,msg){ 
	
	if(flag==0){
		$("#custdiv0"+msg).attr('style','');	 
		$("#custdiv1"+msg).attr('style','display: none;');	
	}else{
		$("#custdiv0"+msg).attr('style','display: none;');	 
		$("#custdiv1"+msg).attr('style','');	
	}
}	

function changeType3(flag,msg){ 
	for (var i=0;i<18;i++) {
		$("#LEGAL_ID_CARD_Crop"+msg+"_field_"+i).val('');
	}
	$('#otherPermit'+msg).val('');
	
	if(flag==0){
		$("#corpdiv0"+msg).attr('style','');	 
		$("#corpdiv1"+msg).attr('style','display: none;');	
	}else{
		$("#corpdiv0"+msg).attr('style','display: none;');	 
		$("#corpdiv1"+msg).attr('style','');	
	}
}	

function changeType4(flag,msg){ 
	for (var i=0;i<18;i++) {
		$("#LINK_ID_CARD_Crop"+msg+"_field_"+i).val('');
	}
	$('#linkPermit'+msg).val('');
	
	if(flag==0){
		$("#custcorpdiv0"+msg).attr('style','');	 
		$("#custcorpdiv1"+msg).attr('style','display: none;');	
	}else{
		$("#custcorpdiv0"+msg).attr('style','display: none;');	 
		$("#custcorpdiv1"+msg).attr('style','');	
	}
}	

// 验证护照
function checkPermit(th){
	var str=th.value;
	//在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
	var Expression=/(P\d{7})|(G\d{8})/;
	var objExp=new RegExp(Expression);
	if(objExp.test(str)==true){
	   return true;
	}else{
	   return false;
	}
}

// 过往记录验证
function changeDEBTRs(x){
	//总资产
	TOTAL_ASSERTS=document.getElementsByName("TOTAL_ASSERTS");
	//总负债
	TOTAL_OWES=document.getElementsByName("TOTAL_OWES");
	//资产负债率
	DEBTR=document.getElementsByName("DEBTR");
	for(i=0;i<TOTAL_ASSERTS.length;i++){
		if(TOTAL_ASSERTS[i].value!=''&&TOTAL_OWES[i].value!=''){
			if(TOTAL_ASSERTS[i].value!=0&&TOTAL_OWES[i].value!=0){
				
			
			var m = number((TOTAL_OWES[i].value)*100000) ;
			var n = number((TOTAL_ASSERTS[i].value)*100000)  ;
			var c =  Math.round((m/n)*10000)
			
			DEBTR[i].value=  c/100 ;
			}else{
				DEBTR[i].value='';
			}
		}
		else{
			
			DEBTR[i].value = '';
		}
	}
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUE");
	//利润总额
	TOTAL_PROFIT=document.getElementsByName("TOTAL_PROFIT");
	//销售净利率
	PROFIT_MARGIN=document.getElementsByName("PROFIT_MARGIN");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&TOTAL_PROFIT[i].value!=''){
			if (SALES_REVENUE[i].value != 0 && TOTAL_PROFIT[i].value != 0) {
			
			
				var m = number((TOTAL_PROFIT[i].value) * 100000);
				var q = number((SALES_REVENUE[i].value) * 100000);
				var ll = Math.round((m / q) * 10000);
				
				PROFIT_MARGIN[i].value = ll / 100;
				
			}else{
				PROFIT_MARGIN[i].value = '';
			}
		}else{
			PROFIT_MARGIN[i].value = '';
		}
	}
	
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUE");
	//销售成本
	COST_OF_MARKETING=document.getElementsByName("COST_OF_MARKETING");
	//毛利率
	TTM=document.getElementsByName("TTM");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&COST_OF_MARKETING[i].value!=''){
			if (SALES_REVENUE[i].value != 0 && COST_OF_MARKETING[i].value != 0) {
			
			
				var m = number((COST_OF_MARKETING[i].value) * 100000);
				var n = number((SALES_REVENUE[i].value) * 100000);
				
				var q = Math.round((1 - (m / n)) * 10000);
				
				TTM[i].value = q / 100;
			}else{
			TTM[i].value ='';
			}
		}else{
			
			 TTM[i].value ='';
			}
	}

	perencents(x);

}

function perencents(x){
	//截取月份数字
 	 
	 var mon =  $("#PROJECT_NAME11s"+x) ;
	 var  men = mon[0];
	 mfm = men.value;
	var mmm=	  mfm.substr(5,2);
	
	var nmn = number(mmm);
	if(nmn >0& nmn <12){
		
	//销售增长率=(本年度销售收入-上年度销售收入)/上年度销售收入     如果本年度是不满12个月的销售收入，则上年度的销售收入按比例换算成与本年度相同的月份数。
	//即销售增长率=（本年度销售收入-上年度销售收入*月份数/12）/（上年度销售收入*月份数/12）
		
		if(  $("#SALES_REVENUE2s"+x).val() !='' & $("#SALES_REVENUE1s"+x).val() !='' ){
			
	    var	tim = nmn/12;
		var qj = number(($("#SALES_REVENUE4s"+x).val())*100000);
		
		var hf =number(($("#SALES_REVENUE3s"+x).val())*100000);
		
		var zd = number(($("#SALES_REVENUE2s"+x).val())*100000);
		
		var rr =  number(($("#SALES_REVENUE1s"+x).val())*100000);
		 
				
				var sj = Math.round(((zd - hf) / hf) * 10000); 
				$("#SALES_GROWTH2s"+x).val(sj / 100);
				
				var zz = Math.round(((hf - qj) / qj) * 10000);
				
				$("#SALES_GROWTH3s"+x).val(zz / 100);
				
				var jj =  Math.round(((rr-(zd*tim) ) / (zd*tim)) * 10000);
				
				$("#SALES_GROWTH1s"+x).val(jj / 100);
			 
		}
		
		
	} 
		
		
		if($("#SALES_REVENUE4s"+x).val()  ==''|$("#SALES_REVENUE4s"+x).val() ==0 ){
			
			 $("#SALES_GROWTH3s"+x).val("")   ;
				
		}
		if($("#SALES_REVENUE3s"+x).val()  ==''|$("#SALES_REVENUE3s"+x).val() ==0 ){
			
			 	$("#SALES_GROWTH2s"+x).val("")   ;
				
		}
		if($("#SALES_REVENUE2s"+x).val()  ==''|$("#SALES_REVENUE2s"+x).val() ==0 ){
			
			 $("#SALES_GROWTH1s"+x).val("")   ;
				
		}
		
		

	 
	
 


//净资产增长率=（本年度实收资本+本年度资本公积+本年度未分配利润-上年度实收资本-上年度资本公积-上年度未分配利润）/（上年度实收资本+上年度资本公积+上年度未分配利润）

//实收资本 CONTRIBUTED_CAPITAL
//		CONTRIBUTED_CAPITAL=document.getElementsByName("CONTRIBUTED_CAPITAL");
//资本公积 CAPITAL_RESERVE
//	CAPITAL_RESERVE=document.getElementsByName("CAPITAL_RESERVE");
// 未分配利润 UNDISTRIBUTED_PROFIT
//UNDISTRIBUTED_PROFIT=document.getElementsByName("UNDISTRIBUTED_PROFIT");
//净资产增长率 NAGR
//	NAGR=document.getElementsByName("NAGR");


	if( $("#CONTRIBUTED_CAPITAL1s"+x).val() !=''& $("#CAPITAL_RESERVE1s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT1s"+x).val() !=''& $("#CONTRIBUTED_CAPITAL2s"+x).val() !=''& $("#CAPITAL_RESERVE2s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT2s"+x).val() !=''){
			var zz = number(($("#CONTRIBUTED_CAPITAL1s"+x).val())*100000) ;
			var jw =number(($("#CAPITAL_RESERVE1s"+x).val())*100000);
			var  zl =number(($("#UNDISTRIBUTED_PROFIT1s"+x).val())*100000);
			
			var an =  zz*1  + jw*1 +  zl*1 ;
			var nn = number(($("#CONTRIBUTED_CAPITAL2s"+x).val())*100000);
			var mm =number(($("#CAPITAL_RESERVE2s"+x).val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT2s"+x).val())*100000) ;
			
			var kk =   nn*1  + mm*1 + uu*1 ;
			
			var zd =   Math.round(((an - kk) /kk )*10000);
			
			if(kk == 0){
				
			 	$("#NAGR1s"+x).val("")   ;
			}else{
					$("#NAGR1s"+x).val((zd/100))   ;
			}
		

		
		}

	if( $("#CONTRIBUTED_CAPITAL2s"+x).val() !=''& $("#CAPITAL_RESERVE2s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT2s"+x).val() !=''& $("#CONTRIBUTED_CAPITAL3s"+x).val() !=''& $("#CAPITAL_RESERVE3s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT3s"+x).val() !=''){
			var zz = number(($("#CONTRIBUTED_CAPITAL2s"+x).val())*100000) ;
			var jw =number(($("#CAPITAL_RESERVE2s"+x).val())*100000);
			var  zl =number(($("#UNDISTRIBUTED_PROFIT2s"+x).val())*100000);
			
			var an =  zz*1  + jw*1 +  zl*1 ;
			var nn = number(($("#CONTRIBUTED_CAPITAL3s"+x).val())*100000);
			var mm =number(($("#CAPITAL_RESERVE3s"+x).val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT3s"+x).val())*100000) ;
			
			var kk =   nn*1  + mm*1 + uu*1 ;
			
			var zd =   Math.round(((an - kk) /kk )*10000);
			
			if(kk == 0){
				
				 $("#NAGR2s"+x).val("")   ;
			}else{
					$("#NAGR2s"+x).val((zd/100))   ;
			}
		
		}
	
	
	if( $("#CONTRIBUTED_CAPITAL3s"+x).val() !=''& $("#CAPITAL_RESERVE3s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT3s"+x).val() !=''& $("#CONTRIBUTED_CAPITAL4s"+x).val() !=''& $("#CAPITAL_RESERVE4s"+x).val() !=''& $("#UNDISTRIBUTED_PROFIT4s"+x).val() !=''){
			var zz =number(($("#CONTRIBUTED_CAPITAL3s"+x).val())*100000);
			var jw =number(($("#CAPITAL_RESERVE3s"+x).val())*100000);
			var zl =number(($("#UNDISTRIBUTED_PROFIT3s"+x).val())*100000) ;
			
			var an =zz*1  + jw*1 +  zl*1 ;
			var nn =number(($("#CONTRIBUTED_CAPITAL4s"+x).val())*100000);
			var mm = number(($("#CAPITAL_RESERVE4s"+x).val())*100000);
			var uu =number(($("#UNDISTRIBUTED_PROFIT4s"+x).val())*100000);
			
			var kk = nn*1   +mm*1 + uu*1 ;
			var zd =  Math.round(((an - kk) /kk )*10000);
			
			
			if(kk == 0){
				
				 $("#NAGR3s"+x).val("")   ;
			}else{
					$("#NAGR3s"+x).val((zd/100))   ;
			}
		
		}
	
}
// 判断是否添加过(自然人)
function checkTrueNatu(){
	var natu_name = $.trim($("#natu_name").val());
	var natu_idcard = $.trim($("#natu_idcard").val());
	var otherPermit = $.trim($("#otherPermit").val());
	
	// alert(natu_name);
	// alert(natu_idcard);
	
	if(natu_idcard != '' && natu_name != ''){
		var url = "../servlet/defaultDispatcher?__action=creditVoucher.backWriteNatu&cust_name="+natu_name+"&natu_idcard="+natu_idcard;
		$.getJSON(url,function(data){
			var natuMap = data.natuMap;
			if(natuMap == null){
				return false;
			}
			$("#natu_gender").val(natuMap.NATU_GENDER);
			$("#natu_idcardAge").val(natuMap.NATU_AGE);
			$("#natu_zip").val(natuMap.NATU_ZIP);
			$("#natu_phone").val(natuMap.NATU_PHONE);
			$("#natu_open_bank").val(natuMap.OPEN_BANK);
			$("#natu_bank_accounts").val(natuMap.BANK_ACCOUNTS);
			$("#natu_mobile").val(natuMap.NATU_MOBILE);
			$("#natu_fax").val(natuMap.NATU_FAX);
			$("#natu_home_address").val(natuMap.NATU_HOME_ADDRESS);
			$("#natu_idcardAddr1").val(natuMap.NATU_IDCARD_ADDRESS);
			$("#natu_work_units").val(natuMap.NATU_WORK_UNITS);
			$("#natu_work_address").val(natuMap.NATU_WORK_ADDRESS);
		});
	}
	if(otherPermit != '' && natu_name != ''){
		var url = "../servlet/defaultDispatcher?__action=creditVoucher.backWriteNatu&cust_name="+natu_name+"&otherPermit="+otherPermit;
		$.getJSON(url,function(data){
			var natuMap = data.natuMap;
			if(natuMap == null){
				return false;
			}
			$("#natu_gender").val(natuMap.NATU_GENDER);
			$("#natu_idcardAge").val(natuMap.NATU_AGE);
			$("#natu_zip").val(natuMap.NATU_ZIP);
			$("#natu_phone").val(natuMap.NATU_PHONE);
			$("#natu_open_bank").val(natuMap.OPEN_BANK);
			$("#natu_bank_accounts").val(natuMap.BANK_ACCOUNTS);
			$("#natu_mobile").val(natuMap.NATU_MOBILE);
			$("#natu_fax").val(natuMap.NATU_FAX);
			$("#natu_home_address").val(natuMap.NATU_HOME_ADDRESS);
			$("#natu_idcardAddr1").val(natuMap.NATU_IDCARD_ADDRESS);
			$("#natu_work_units").val(natuMap.NATU_WORK_UNITS);
			$("#natu_work_address").val(natuMap.NATU_WORK_ADDRESS);
		});
	}
}
// 判断是否添加过(配偶)
function checkTrueNatuMate(){
	var natu_mate_name = $.trim($("#natu_mate_name").val());
	var natu_mate_idcards = $.trim($("#natu_mate_idcard").val());
	var mate_other_permits = $.trim($("#mate_other_permit").val());
	var natu_mate_idcards = '';
	if(natu_mate_idcard==''){
		natu_mate_idcard = mate_other_permits;
	}else{
		natu_mate_idcard = natu_mate_idcards;
	}
	
	if(natu_mate_idcard != '' && natu_mate_name != ''){
		var url = "../servlet/defaultDispatcher?__action=creditVoucher.backWriteNatu&natu_mate_name="+natu_mate_name+"&natu_mate_idcard="+natu_mate_idcard;
		$.getJSON(url,function(data){
			var natuMap = data.natuMap;
			if(natuMap != null){
				$("#natu_mate_gender").val(natuMap.NATU_MATE_GENDER);
				$("#natu_mate_idcardAge").val(natuMap.NATU_MATE_AGE);
				$("#natu_mate_zip").val(natuMap.NATU_MATE_ZIP);
				$("#natu_mate_phone").val(natuMap.NATU_MATE_PHONE);
				$("#open_mate_bank").val(natuMap.OPEN_MATE_BANK);
				$("#bank_accounts_mate").val(natuMap.BANK_ACCOUNTS_MATE);
				$("#natu_mate_mobile").val(natuMap.NATU_MATE_MOBILE);
				$("#natu_mate_fax").val(natuMap.NATU_MATE_FAX);
				$("#natu_mate_home_address").val(natuMap.NATU_MATE_HOME_ADDRESS);
				$("#natu_mate_idcardAddr1").val(natuMap.NATU_MATE_IDCARD_ADDRESS);
				$("#natu_mate_work_units").val(natuMap.NATU_MATE_WORK_UNITS);
				$("#natu_mate_work_address").val(natuMap.NATU_MATE_WORK_ADDRESS);
			}
		});
	}
}
// 判断是否添加过(法人)
function checkTrueCorp(){
	var corp_name_cn = $.trim($("#CORP_NAME_CNs").val());
	var organization_code_certificate = $.trim($("#ORGANIZATION_CODE_CERTIFICATEs").val());
	// alert(corp_name_cn);
	// alert(organization_code_certificate);
	
	if(corp_name_cn != '' && organization_code_certificate != ''){
		var url = "../servlet/defaultDispatcher?__action=creditVoucher.backWriteCorp&corp_name_cn="+corp_name_cn+"&organization_code_certificate="+organization_code_certificate;
		$.getJSON(url,function(data){
			var corpMap = data.corpMap;
			if(corpMap != null){
				$("#EMPLOYEE_COUNTs").val(corpMap.EMPLOYEE_COUNT);
				$("#CORP_NAME_EN").val(corpMap.CORP_NAME_EN);
				$("#CORP_TYPE").val(corpMap.CORP_TYPE);
				$("#BUSINESS_LICENCE_CODE").val(corpMap.BUSINESS_LICENCE_CODE);
				$("#BUSINESS_TIME_LIMIT").val(corpMap.BUSINESS_TIME_LIMIT);
				$("#ROAD_WORTHINESS_INSPECTION").val(corpMap.ROAD_WORTHINESS_INSPECTION);
				$("#TAX_REGISTRATION_NUMBER").val(corpMap.TAX_REGISTRATION_NUMBER);
				$("#datebegin").val(corpMap.INCORPORATING_DATE);
				$("#REGISTERED_CAPITALs").val(corpMap.REGISTERED_CAPITAL);
				$("#CONTRIBUTED_CAPITALs").val(corpMap.CONTRIBUTED_CAPITAL);
				$("#REGISTERED_OFFICE_ADDRESSs").val(corpMap.REGISTERED_OFFICE_ADDRESS);
				$("#MANAGING_SCOPE").val(corpMap.MANAGING_SCOPE);
				$("#TELEPHONEs").val(corpMap.TELEPHONE);
				$("#FAXs").val(corpMap.FAX);
				$("#URL").val(corpMap.URL);
				$("#POSTCODEs").val(corpMap.POSTCODE);
				$("#MEMO").val(corpMap.MEMO);
			}
		});
	}
}