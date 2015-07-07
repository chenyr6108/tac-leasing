
function saveScheme() {
	document.getElementById("credit_id").disabled=false;
	/*document.getElementById("clerkList_name").disabled=false;
	document.getElementById("sensorList_name").disabled=false;*/
	document.getElementById("customerComeList").disabled=false;
	equipment = document.getElementById("equipmentTab").rows.length;
	form=document.schemeForm;
	
	if(form.PLEDGE_ENTER_CMPRICE.value!=null && form.PLEDGE_ENTER_CMPRICE.value!="")
	{
		form.PLEDGE_ENTER_CMPRICE.value=parseCurrency(form.PLEDGE_ENTER_CMPRICE.value);
		//Add Michael 不能输入小数

		if (form.PLEDGE_ENTER_CMPRICE.value!=parseInt(form.PLEDGE_ENTER_CMPRICE.value)){ 
			alert("保证金入我司不能输入小数");
			return false;
		}
	}
	
	if(form.PLEDGE_ENTER_CMRATE.value!=null && form.PLEDGE_ENTER_CMRATE.value!="")
	{
		form.PLEDGE_ENTER_CMRATE.value=parseCurrency(form.PLEDGE_ENTER_CMRATE.value);
	}
	if(form.PLEDGE_ENTER_AG.value!=null  && form.PLEDGE_ENTER_AG.value!="")
	{
		form.PLEDGE_ENTER_AG.value=parseCurrency(form.PLEDGE_ENTER_AG.value);
		//Add Michael 不能输入小数
		if (form.PLEDGE_ENTER_AG.value!=parseInt(form.PLEDGE_ENTER_AG.value)){ 
			alert("保证金入供应商不能输入小数");
			return false;
		}
	}
	if(form.PLEDGE_ENTER_AGRATE.value!=null  && form.PLEDGE_ENTER_AGRATE.value!="")
	{
		form.PLEDGE_ENTER_AGRATE.value=parseCurrency(form.PLEDGE_ENTER_AGRATE.value);
	}
	if(form.PLEDGE_ENTER_MCTOAG.value!=null  && form.PLEDGE_ENTER_MCTOAG.value!="")
	{
		form.PLEDGE_ENTER_MCTOAG.value=parseCurrency(form.PLEDGE_ENTER_MCTOAG.value);
		
		//Add Michael 不能输入小数
		if (form.PLEDGE_ENTER_MCTOAG.value!=parseInt(form.PLEDGE_ENTER_MCTOAG.value)){ 
			alert("保证金我司入供应商不能输入小数");
			return false;
		}
	}
	if(form.PLEDGE_ENTER_MCTOAGRATE.value!=null  && form.PLEDGE_ENTER_MCTOAGRATE.value!="")
	{
		form.PLEDGE_ENTER_MCTOAGRATE.value=parseCurrency(form.PLEDGE_ENTER_MCTOAGRATE.value);
	}
	if(form.BEGMONEY.value!=null  && form.BEGMONEY.value!="")
	{
		form.BEGMONEY.value=parseCurrency(form.BEGMONEY.value);
	}else{
		form.BEGMONEY.value = 0;
	}
	if(form.APPROPIATEMON0.value!=null  && form.APPROPIATEMON0.value!="")
	{
		form.APPROPIATEMON0.value=parseCurrency(form.APPROPIATEMON0.value);
	}else{
		form.APPROPIATEMON0.value = 0;
	}
	if(form.APPROPIATEMON1.value!=null  && form.APPROPIATEMON1.value!="")
	{
		form.APPROPIATEMON1.value=parseCurrency(form.APPROPIATEMON1.value);
	}else{
		form.APPROPIATEMON1.value = 0;
	}

//	if(parseInt(form.APPROPIATEMON0.value)+parseInt(form.APPROPIATEMON1.value) != parseInt(form.BEGMONEY.value)){
//		alert(parseInt(form.APPROPIATEMON0.value)+"-->"+parseInt(form.APPROPIATEMON1.value)+"--->"+parseInt(form.BEGMONEY.value));
//		alert("交机前后的和应为申请拨款金额");
//		return false;
//	}
	var _mon0=parseCurrency(setzero($("#APPROPIATEMON0").val()));
	var _mon1=parseCurrency(setzero($("#APPROPIATEMON1").val()));
	var _begmoney=parseCurrency(setzero($("#BEGMONEY").val()));
	if(_begmoney.toFixed(2)!=(_mon0+_mon1).toFixed(2)){
		alert("交机前后的和应为申请拨款金额");
		return false;
	}
	
	if(parseInt(form.PLEDGE_ENTER_MCTOAG.value)>parseInt(form.PLEDGE_ENTER_CMPRICE.value)){
		alert("我司入供应商应该小于入我司");
		return false;
	}
	if (equipment <= 3) {
		alert("必须添加租赁物件!");
		return false;
	}else if(equipment == 5){ 
		type=form.TYPE;
		kind=form.KIND;
		prodcut=form.PRODUCT;
		suppier=form.SUPPIER;
		unitPrice=form.UNIT_PRICE;
		staybuyPrice=form.STAYBUY_PRICE;
		amount=form.AMOUNT;
		TOTAL=form.TOTAL;
		shuiprice=form.SHUI_PRICE;
		LOCK_CODE=form.LOCK_CODE;
		if(type.value=='-1'){
			alert("产品类型选择有误!");
			type.focus();
			return false;
		}
		if(kind.value=='-1'){
			alert("产品名称选择有误!");
			kind.focus();
			return false;
		}
		if(prodcut.value=='-1'){
			alert("产品型号选择有误!");
			prodcut.focus();
			return false;
		}
		if(suppier.value=='-1'){
			alert("产品供应商选择有误!");
			suppier.focus();
			return false;
		}
		if(positive(staybuyPrice,'租赁物件留购价')){
			return false;
		}
		if(positive(unitPrice,'租赁物件单价')){
			return false;
		}
		if(positive(shuiprice,'税款')){
			return false;
		}
		if(!checkInteger(amount.value)){
			alert("租赁物件数量必须为整数!");
			amount.focus();
			return false;
		}
		if(LOCK_CODE.value==-1){
			alert("请选择设备锁码方式!");
			LOCK_CODE.focus();
			return false;
		}
		TOTAL.value=parseCurrency(TOTAL.value);
	}else{
		type=form.TYPE;
		kind=form.KIND;
		prodcut=form.PRODUCT;
		suppier=form.SUPPIER;
		unitPrice=form.UNIT_PRICE;
		staybuyPrice=form.STAYBUY_PRICE;
		amount=form.AMOUNT;
		TOTAL=form.TOTAL;
		shuiprice=form.SHUI_PRICE;
		LOCK_CODE=form.LOCK_CODE;
		for(i=0;i<type.length;i++){
			if(type[i].value=='-1'){
				alert("产品类型选择有误!");
				type[i].focus();
				return false;
			}
			if(kind[i].value=='-1'){
				alert("产品名称选择有误!");
				kind[i].focus();
				return false;
			}
			if(prodcut[i].value=='-1'){
				alert("产品型号选择有误!");
				prodcut[i].focus();
				return false;
			}
			if(suppier[i].value=='-1'){
				alert("产品供应商选择有误!");
				suppier[i].focus();
				return false;
			}
			if(positive(staybuyPrice[i],'租赁物件留购价')){
				return false;
			}
			if(positive(unitPrice[i],'租赁物件单价')){
				return false;
			}
			if(positive(shuiprice[i],'税款')){
				return false;
			}
			if(!checkInteger(amount[i].value)){
				alert("租赁物件数量必须为整数!");
				amount[i].focus();
				return false;
			}
			if(LOCK_CODE[i].value==-1){
			alert("请选择设备锁码方式!");
			LOCK_CODE[i].focus();
			return false;
		}
			TOTAL[i].value=parseCurrency(TOTAL[i].value);
		}
	} 
	var flag = false;
	$.each($("input[id^='UNIT'].dropDownList"), function (){
		if($(this).getValue() == ""){
			alert("请选择租赁物单位！");
			$(this).focus();
			flag = true;
			return;
		}
	});
	if(flag){return false;}
	
	$.each($("input[id^='LOCK_CODE'].dropDownList"), function (){
		if($(this).getValue() == ""){
			alert("请选择锁码方式！");
			$(this).focus();
			flag = true;
			return;
		}
	});
	if(flag){return false;}
	LEASE_TOPRIC=form.LEASE_TOPRIC;
	LEASE_TOPRIC.value=parseCurrency(LEASE_TOPRIC.value);	
	//Add by Michael 2012 5-11
	form.PLEDGE_PRICE.value=parseCurrency(form.PLEDGE_PRICE.value);
	//Add Michael 不能输入小数
	if (form.PLEDGE_PRICE.value!=parseInt(form.PLEDGE_PRICE.value)){ 
		alert("保证金不能输入小数");
		return false;
	}
	
	form.PLEDGE_AVE_PRICE.value=parseCurrency(form.PLEDGE_AVE_PRICE.value);
	
	form.RATE_DIFF.value=parseCurrency(form.RATE_DIFF.value);
	
	//Add Michael 不能输入小数
	if (form.PLEDGE_AVE_PRICE.value!=parseInt(form.PLEDGE_AVE_PRICE.value)){ 
		alert("平均冲抵保证金不能输入小数");
		return false;
	}
	
	LEASE_TERM=form.LEASE_TERM;
	PLEDGE_PRICE_RATE=form.PLEDGE_PRICE_RATE;
	PLEDGE_PRICE=form.PLEDGE_PRICE;
	PLEDGE_REALPRIC=form.PLEDGE_REALPRIC;
	HEAD_HIRE_PERCENT = form.HEAD_HIRE_PERCENT;
	HEAD_HIRE = form.HEAD_HIRE;
	BUSINESS_TRIP_PRICE=form.BUSINESS_TRIP_PRICE;
	//
	//MANAGEMENT_FEE_RATE=form.MANAGEMENT_FEE_RATE;
	//MANAGEMENT_FEE=form.MANAGEMENT_FEE;
	YEAR_INTEREST=form.YEAR_INTEREST;
//	FLOAT_RATE=form.FLOAT_RATE;
	LEASE_RZE=form.LEASE_RZE;
	START_DATE=form.START_DATE;
	INSURE_REBATE_RATE=form.INSURE_REBATE_RATE;
	START_DATE=form.START_DATE;
	EQUPMENT_ADDRESS=form.EQUPMENT_ADDRESS;
	if(LEASE_TERM.value!=""&&!isNaN(LEASE_TERM.value)){
		var leaseterm=LEASE_TERM.value;
		leaseterm=parseInt(leaseterm);
		if(leaseterm==0){
			alert("租赁期限不能为0!");
			return false;
		}
		if(!checkInteger(LEASE_TERM.value)){
				alert("租赁期限必须为整数!");
				LEASE_TERM.focus();
				return false;
		}
	}

	var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE_TAB1");
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END_TAB1");
	var PAY_IRR_MONTH_PRICE_START = document.getElementsByName("PAY_IRR_MONTH_PRICE_START_TAB1");
			
	if(PAY_IRR_MONTH_PRICE_END.length==0){
		$("#PLEDGE_LAST_PERIOD").val(0);
		alert("请添加每期应付未税租金");
		return false;
	}
	
	var PLEDGE_LAST_PERIOD = parseInt(form.PLEDGE_LAST_PERIOD.value);
	for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
		if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.LEASE_TERM.value){
			$("#PLEDGE_LAST_PERIOD").val(0);
			alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
			return false;
		}else if(i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value == form.LEASE_TERM.value){
			if(PLEDGE_LAST_PERIOD>0){
				if(PLEDGE_LAST_PERIOD>parseInt(PAY_IRR_MONTH_PRICE_END[i].value)){
					$("#PLEDGE_LAST_PERIOD").val(0);
					alert("用于抵充最后期数应小于或等于租赁方案中的租赁期数！");
					return false;
				}else{
					if(PLEDGE_LAST_PERIOD-1<=(parseInt(PAY_IRR_MONTH_PRICE_END[i].value)-parseInt(PAY_IRR_MONTH_PRICE_START[i].value))){
						form.PLEDGE_LAST_PRICE.value=parseCurrency(PAY_IRR_MONTH_PRICE[i].value)*PLEDGE_LAST_PERIOD;
					}else{
						var total_pledge_last_price=0.0;
						var temp_pledge_last_period=PLEDGE_LAST_PERIOD;
						var j=i;
						while (temp_pledge_last_period>0){
							if(temp_pledge_last_period>=(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1)){
								total_pledge_last_price=total_pledge_last_price+parseCurrency(PAY_IRR_MONTH_PRICE[j].value)*(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1);
							}else{
								total_pledge_last_price=total_pledge_last_price+parseCurrency(PAY_IRR_MONTH_PRICE[j].value)*temp_pledge_last_period;
							}
							temp_pledge_last_period=temp_pledge_last_period-(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1);
							j--;
						}
						form.PLEDGE_LAST_PRICE.value=total_pledge_last_price;
					}
				}
			}
		}
	}
	
	if(positive(PLEDGE_PRICE,'保证金')
		||positive(HEAD_HIRE,'首期租金')||positive(LEASE_RZE,'概算成本')
		//||positive(MANAGEMENT_FEE,'管理费')
		||positive(BUSINESS_TRIP_PRICE,'差旅费')){
				return false;
    } 	
    if(valueIsNotPercent(PLEDGE_PRICE_RATE,'保证金比例')
    	||valueIsNotPercent(HEAD_HIRE_PERCENT,'首期租金比例')
    	//||valueIsNotPercent(MANAGEMENT_FEE_RATE,'管理费比例')
    	||valueIsNotPercent(YEAR_INTEREST,'合同利率')
//    	||valueIsNotPercent(FLOAT_RATE,'利率上浮比例')
//    	||valueIsNotPercent(INSURE_REBATE_RATE,'保险返利百分比')
		){
    	return false;
    }
    
    var PLEDGE_AVE_PRICE = form.PLEDGE_AVE_PRICE;
    var PLEDGE_BACK_PRICE = form.PLEDGE_BACK_PRICE;
    var PLEDGE_LAST_PRICE = form.PLEDGE_LAST_PRICE;
    if (positive(PLEDGE_AVE_PRICE,'用于平均抵冲保证金金额')
    		|| positive(PLEDGE_BACK_PRICE,'用于期末退还金额')
    		|| positive(PLEDGE_LAST_PRICE,'用于最后抵冲金额')) {
    	return false;
    }
    //实际使用保证金
    PLEDGE_REALPRIC.value = Number(PLEDGE_AVE_PRICE.value) + Number(PLEDGE_LAST_PRICE.value);
    
    var PLEDGE_LAST_PERIOD = form.PLEDGE_LAST_PERIOD;
    if(!checkInteger(PLEDGE_LAST_PERIOD.value)){
				alert("用于最后抵冲期数必须为整数!");
				PLEDGE_LAST_PERIOD.focus();
				return false;
	}
    var PLEDGE_PERIOD = form.PLEDGE_PERIOD;
     if(!checkInteger(PLEDGE_PERIOD.value)){
				alert("收入时间必须为整数!");
				PLEDGE_PERIOD.focus();
				return false;
	}
    //验证：平均冲抵=我司入供应商+入供应商
     var _ave=parseCurrency(setzero($("#PLEDGE_AVE_PRICE").val())); 
     var _mctoag=parseCurrency(setzero($("#PLEDGE_ENTER_MCTOAG").val()));
     var _enter=parseCurrency(setzero($("#PLEDGE_ENTER_AG").val()));
     if(_ave.toFixed(2)!=(_mctoag+_enter).toFixed(2)){
    	alert("平均冲抵金额应等于我司入供应商加入供应商");
    	return false;
     }
     
     
    //验证：保证金=平均冲抵+期末返还+最后冲抵
    //	      保证金=入我司+入供应商
    var _sum=parseCurrency(setzero($("#PLEDGE_PRICE").val()));
    //var _ave=parseCurrency(setzero($("#PLEDGE_AVE_PRICE").val()));
    var _back=parseCurrency(setzero($("#PLEDGE_BACK_PRICE").val()));
    var _last=parseCurrency(setzero($("#PLEDGE_LAST_PRICE").val()));
    var _cmprice=parseCurrency(setzero($("#PLEDGE_ENTER_CMPRICE").val()));
    //var _enter=parseCurrency(setzero($("#PLEDGE_ENTER_AG").val()));
    if(_sum.toFixed(2)!=(_ave+_back+_last).toFixed(2)){
    	alert("保证金处理金额和保证金总额不符");
    	return false;
    }
    if(_sum.toFixed(2)!=(_cmprice+_enter).toFixed(2)){
    	alert("保证金入账金额和保证金总额不符");
    	return false;
    }
    //验证交机前与交机后总和等于申请拨款金额
	if(checkAppropiatemon()){
		return false ;
	}
	/*
	保证金入我司与保证金入供应商同时存在
	var PLEDGE_ENTER_CMPRICE = form.PLEDGE_ENTER_CMPRICE;
	var PLEDGE_ENTER_CMRATE = form.PLEDGE_ENTER_CMRATE;
	var PLEDGE_ENTER_AG = form.PLEDGE_ENTER_AG;
	if ($(":radio[name='PLEDGE_ENTER_WAY']:checked").val() == 1){
		if (positive(PLEDGE_ENTER_CMPRICE,'保证金入我司金额')
    		|| positive(PLEDGE_ENTER_CMRATE,'保证金入我司税额')) {
    		return false;
    	} else {
    		PLEDGE_ENTER_AG.value=0;
    	}
	} else {
		
		if (positive(PLEDGE_ENTER_AG,'保证金入供应商金额')) {
    		return false;
    	} else {
	    	PLEDGE_ENTER_CMPRICE.value = 0;
	    	PLEDGE_ENTER_CMRATE.value = 0;
    	}
	}EQUPMENT_ADDRESS
  	*
	*/  
    if(blank(START_DATE,'起租日期')){
    	return false;
    }
    if(blank(EQUPMENT_ADDRESS,'租赁物件设置场所')){
    	return false;
    }
    insureTab = document.getElementById("insureTab").rows.length;
    if(insureTab == 4){ 
    	INSURE_RATE=form.INSURE_RATE;
    	INSURE_PRICE=form.INSURE_PRICE;
    	if(valueIsNotPercent(INSURE_RATE,'保险费率')){
    		return false;
    	}
    	if(positive(INSURE_PRICE,'保险费金额')){
    		return false;
    	}
    }else if(insureTab>4){ 
    	INSURE_RATE=form.INSURE_RATE;
    	INSURE_PRICE=form.INSURE_PRICE;
    	for(i=0;i<INSURE_RATE.length;i++){ 
    		if(valueIsNotPercent(INSURE_RATE[i],'保险费率')){
    		return false;
    	}
    	if(positive(INSURE_PRICE[i],'保险费金额')){
    		return false;
    	}
    	}
    }
    otherPriceTab = document.getElementById("otherPriceTab").rows.length;
    if(otherPriceTab==4){
    	OTHER_NAME=form.OTHER_NAME;
    	OTHER_PRICE=form.OTHER_PRICE;
    	if(blank(OTHER_NAME,'费用名称')||positive(OTHER_PRICE,'费用金额')){
    		return false;
    	}
    }else if(otherPriceTab>4){
    	OTHER_NAME=form.OTHER_NAME;
    	OTHER_PRICE=form.OTHER_PRICE;
    	for(i=0;i<otherPriceTab-3;i++){ 
    	if(blank(OTHER_NAME[i],'费用名称')||positive(OTHER_PRICE[i],'费用金额')){
    		return false;
    	}
    	}
    }
    
    
	PAY_WAY = form.PAY_WAY;
    var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE_TAB1");
	
	if (PAY_IRR_MONTH_PRICE.length == 0 ) {
//		alert("请填写应付租金！");
//		return false;
	} else if (PAY_IRR_MONTH_PRICE.length == 1) {
		if (positive(PAY_IRR_MONTH_PRICE[0], '应付租金')) {
            return false;
        }
        if(PAY_WAY.value == 13 ||PAY_WAY.value == 11){
	    	//var pay_way=form.PAY_PAY_WAY.value;
	    	var head_price=HEAD_HIRE.value;
	    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
	    	//alert(head_price+"==="+firstmonthprice);
	    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
	    		alert("期初方式首栏的应付租金应该等于首期租金");
	    		return false;
	    	}
    	}
	} else {
		for (var i=0;i<PAY_IRR_MONTH_PRICE.length;i++){
    
	   	 	if (positive(PAY_IRR_MONTH_PRICE[i], '应付租金')) {
	            return false;
	        }
	        
		    if(PAY_WAY.value == 13 ||PAY_WAY.value == 11){
		    	//var pay_way=form.PAY_PAY_WAY.value;
		    	var head_price=HEAD_HIRE.value;
		    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
		    	//alert(head_price+"==="+firstmonthprice);
		    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
		    		alert("期初方式首栏的应付租金应该等于首期租金");
		    		return false;
		    	}
    		}
	    }
	}
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END_TAB1");
	for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
   
		if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.LEASE_TERM.value){
			alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
			return false;
		}
    }    

	if(trim(by("province_id").value)==-1||trim(by("city_id").value)==-1){
		alert('请选择承租人所在地区！');
		return false;
	} 
	PAYPERCENT0=form.PAYPERCENT0;
	APPROPIATEMON0=form.APPROPIATEMON0;
	PAYPERCENT1=form.PAYPERCENT1;
	APPROPIATEMON1=form.APPROPIATEMON1;
	if(positive(PAYPERCENT0,'交机前比例')){
			return false;
		}  
	if(positive(PAYPERCENT1,'交机后比例')){
			return false;
		} 
	if(positive(APPROPIATEMON0,'交机前金额')){
			return false;
		}  
	if(positive(APPROPIATEMON1,'交机后金额')){
			return false;
	}  
	
	/* 
	Add by Michael 2012 04-11 check 应付租金应与支付方式一致
	*/
	var strVal=0;
	var trueFlag=true;
	 $("input[name='PAY_IRR_MONTH_PRICE_TAB1']").each(function(){
		 if (strVal=="0"){
			strVal= parseCurrency($(this).val());
		}
		if (strVal!=parseCurrency($(this).val())){

			if (PAY_WAY.value=="21"||PAY_WAY.value=="11"){
				alert("每期租金不一致，应选择不等额支付方式！");
				trueFlag= false;
			}
		}
	 });

	 if (trueFlag==false){
		 return false;
	 }
	 
	 if ($("input[name='PAY_IRR_MONTH_PRICE_TAB1']").length=="1"){
		if (PAY_WAY.value=="13"||PAY_WAY.value=="23"){
			alert("每期租金一致时，应选择等额支付方式！");
			return false;
		}
	 }
     form.submit();
}

//如果为null 设为0
function setzero(value){
	value=value.trim();
	if(value==""||value==null){
		return "0.00";
	}else{
		return value
	}
}


function commitCredit(id, cust_id) { 
	/*var unUp="";
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReportVip.getunUp&credit_id='+id + '&cust_id='+cust_id,
		dataType:'json',
		success: function(dataBack){ 
		if(dataBack.unUpList.length==0){*/
			//$("#__action").val("creditReport.selectCreditForShow");
			$("#__action").val("creditReportVip.selectCreditForCommit");
			$("#credit_id").val(id); 
			$("#commit_flag").val(1); 
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditReportVip.getIsCanSubmit&credit_id='+id,
				dataType:'json',
				success: function(dataBack){ 
					if(dataBack.custCount == 0){
						alert("公司沿革未保存，无法提交");
						return;
					} else {
						//加入提交报告前通过合同类型更新产品类别  add by ShenQi
						$.ajax({
							type:'post',
							url:'../servlet/defaultDispatcher',
							data:'__action=creditReport.updateProductionType&credit_id='+id,
							dataType:'json',
							success:function(data) { 
								$("#form1").submit();
							}
						});
					}
				}
			});
					/*}else{
						alert(dataBack.content.toString()) ;	
					}
				}
			});
		}else{
				for(i=0;i<dataBack.unUpList.length;i++){ 
				 	unUp=unUp+dataBack.unUpList[i].FILE_TYPE+":"+dataBack.unUpList[i].FILE_NAME+"\n";
				}
				unUp=unUp+"没有上传！"
				alert(unUp);		
			}
		}
	});*/
}



$(function (){
	$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
});
$(function (){
	 $.datepicker.regional['zh-CN'] =
     {
        clearText: '清除', clearStatus: '清除已选日期',
        closeText: '关闭', closeStatus: '不改变当前选择',
        prevText: '&lt;上月', prevStatus: '显示上月',
        nextText: '下月&gt;', nextStatus: '显示下月',
        currentText: '今天', currentStatus: '显示本月',
        monthNames: ['一月','二月','三月','四月','五月','六月',
        '七月','八月','九月','十月','十一月','十二月'],
        monthNamesShort: ['一月','二月','三月','四月','五月','六月',
        '七月','八月','九月','十月','十一月','十二月'],
        monthStatus: '选择月份', yearStatus: '选择年份',
        weekHeader: '周', weekStatus: '年内周次',
        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
        dayNamesMin: ['日','一','二','三','四','五','六'],
        dayStatus: '设置 DD 为一周起始', dateStatus: '选择 m月 d日, DD',
        dateFormat: 'yy-mm-dd', firstDay: 1,
        initStatus: '请选择日期', isRTL: false,
		changeMonth: true,changeYear: true
   };
	  $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
	$("#dateend").datepicker();
});


//标签
function addTags(id,creditCode){
	
	$("#project_id").val(id);
	
	$("#addTags").find("input[name='tag']").each(function(){
		$(this).attr("checked",false);
	});
	
	var param = {__action:'tagManageCommand.getProjectTags','id':id,'tagType':1};
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:param,
		dataType:'json',
		success:function(data){
			var tags = data.tags;
			if(tags && tags.length>0){
				for(var i=0,len=tags.length;i<len;i++){
					$("#tag_"+ tags[i].id).attr("checked",true);
				}					
			}
			
			
			$("#addTags").dialog({
				draggable: false,resizable:true, modal: true,closeOnEscape: false ,title: "案件号" + creditCode ,
				width:320,height:260,
				buttons: {
				 	关闭:function(){
				 		$( this ).dialog( "close" );
				 	},
				 	保存: function() {
				 		saveProjectTags($( this ));

				 	}
				 }				
			});	
		}
	});	
}

function saveProjectTags(dialog){
	var param = $("#tag2prjt_creditForm").serialize();
	$.ajax({
		type:'post',
		data:param,
		url:'../servlet/defaultDispatcher?__action=creditReport.bindTags',
		dataType:'json',
		success:function(data){
			if(data.success){
				alert("操作成功");
			}
			$(dialog).dialog( "close" );	
			doSearch();
		}
	});

}