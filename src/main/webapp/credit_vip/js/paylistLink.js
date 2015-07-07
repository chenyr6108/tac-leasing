
function number(value) {
    var num = parseInt(value * 100);
    var first = parseInt(num / 100) + "";
    var last = (num % 100) + "";
    return first + "." + last;
}
function valueIsNum(field) {
	var values = (field.value).trim();
//    values = values.trim();
    var m=/^(\d)+$/;
    if(values.match(m)) {
         field.value = values;
    } else {
         field.value = 0;
    }
}
function verifyNumber(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        // setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
// RZE
paylistchangeRZE = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	var PAY_PLEDGE_AVE_PRICE = parseCurrency(form.PAY_PLEDGE_AVE_PRICE.value);
	var PAY_PLEDGE_LAST_PRICE = parseCurrency(form.PAY_PLEDGE_LAST_PRICE.value);
	var PAY_PLEDGE_BACK_PRICE = parseCurrency(form.PAY_PLEDGE_BACK_PRICE.value);
	
	var PAY_TAX_PLAN_CODE= parseCurrency(form.PAY_TAX_PLAN_CODE.value);
	//Add by Michael 增加影响概算成本计算费用

	var totalFeeRZE=0;
	 $("input[feeListRZE='feeListRZE1']").each(function(){
		 if (PAY_TAX_PLAN_CODE=="2"){
			 totalFeeRZE=totalFeeRZE+parseInt(Math.round(parseCurrency($(this).val())/1.06));
		 }else if(PAY_TAX_PLAN_CODE=="1"||PAY_TAX_PLAN_CODE=="3"||PAY_TAX_PLAN_CODE=="4"){
			 totalFeeRZE=totalFeeRZE+parseInt(Math.round(parseCurrency($(this).val())/1.06));
		 }		 
	 });
	
	var pay_way = form.PAY_PAY_WAY.value;

	if (pay_way == 11 || pay_way == 13) {
		var head_hire = parseCurrency(form.PAY_HEAD_HIRE.value);
		form.PAY_LEASE_RZE.value = number(total_price - PAY_PLEDGE_AVE_PRICE - PAY_PLEDGE_LAST_PRICE - PAY_PLEDGE_BACK_PRICE - head_hire-totalFeeRZE);
	} else {
		form.PAY_LEASE_RZE.value = number(total_price - PAY_PLEDGE_AVE_PRICE - PAY_PLEDGE_LAST_PRICE - PAY_PLEDGE_BACK_PRICE-totalFeeRZE);
		//Add by Michael 2012 07-25 后收时将首期租金置0
		form.PAY_HEAD_HIRE_PERCENT.value=0.0;
		form.PAY_HEAD_HIRE.value=0.0;
	}
	setFormatCurrency(form.PAY_LEASE_RZE);
}
// 保证金
paylistchangePledgePrice = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	var pledge_price_rate = form.PAY_PLEDGE_PRICE_RATE.value;
	form.PAY_PLEDGE_PRICE.value = number(total_price * pledge_price_rate / 100);
	setFormatCurrency(form.PAY_PLEDGE_PRICE);
}
paylistchangePledgeRealPrice = function(){
	var form = document.payForm;
	var PAY_PLEDGE_AVE_PRICE = parseCurrency(form.PAY_PLEDGE_AVE_PRICE.value);
	var PAY_PLEDGE_LAST_PRICE = parseCurrency(form.PAY_PLEDGE_LAST_PRICE.value);
	
	form.PAY_PLEDGE_REALPRIC.value = PAY_PLEDGE_AVE_PRICE + PAY_PLEDGE_LAST_PRICE;
	setFormatCurrency(form.PAY_PLEDGE_REALPRIC);
}
//
paylistchangePledgePriceRate = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	var pledge_price = parseCurrency(form.PAY_PLEDGE_PRICE.value);
	form.PAY_PLEDGE_PRICE_RATE.value = Math.round((pledge_price/total_price)*Math.pow(10,8))/Math.pow(10,8)*100;
}
//
paylistchangeHeadHire = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	var head_hire_percent = form.PAY_HEAD_HIRE_PERCENT.value;
	form.PAY_HEAD_HIRE.value = number(total_price * head_hire_percent / 100 );
	setFormatCurrency(form.PAY_HEAD_HIRE);
}
//
paylistchangHeadHirePercent = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	var head_hire = parseCurrency(form.PAY_HEAD_HIRE.value);
	form.PAY_HEAD_HIRE_PERCENT.value = Math.round((head_hire/total_price)*Math.pow(10,8))/Math.pow(10,8)*100;
}
//
paylistchangeManagementFee = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	verifyNumber(form.PAY_MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.PAY_MANAGEMENT_FEE_RATE.value;
	
	valueIsNum(form.PAY_LEASE_PERIOD);
	var lease_period = form.PAY_LEASE_PERIOD.value;
	var lease_term = form.PAY_LEASE_TERM.value;
	if (lease_term == 0) {
		form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return;
	}

	var value = 0;
	value = (total_price * Number(management_fee_rate) / 100 )*(lease_period * lease_term / 12);

	form.PAY_MANAGEMENT_FEE.value = number(value );
	setFormatCurrency(form.PAY_MANAGEMENT_FEE);
}
//
paylistchangeManagementFeeRate = function () {
	var form = document.payForm;
	var total_price = parseCurrency(form.PAY_LEASE_TOPRIC.value);
	verifyNumber(form.PAY_MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.PAY_MANAGEMENT_FEE.value);
	
	valueIsNum(form.PAY_LEASE_PERIOD);
	var lease_period = form.PAY_LEASE_PERIOD.value;
	var lease_term = form.PAY_LEASE_TERM.value;
	if (lease_term == 0) {
		form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return;
	}
	
	var value = 0;
	value = (management_fee / (lease_period * lease_term / 12)  /  total_price) * 100;
	form.PAY_MANAGEMENT_FEE_RATE.value = Math.round((value)*Math.pow(10,8))/Math.pow(10,8);
}
//
paylistgetBaseRate = function (totalMonth) {
	if (totalMonth <= 6) {
		return baseRate.SIX_MONTHS;
	} else if (totalMonth <= 12) {
		return baseRate.ONE_YEAR;
	} else if (totalMonth <= 36) {
		return baseRate.ONE_THREE_YEARS;
	} else if (totalMonth <= 60) {
		return baseRate.THREE_FIVE_YEARS;
	} else {
		return baseRate.OVER_FIVE_YEARS;
	}
}
//
paylistchangeYearInterest = function () {
	var form = document.payForm;
	valueIsNum(form.PAY_LEASE_PERIOD);
	var lease_period = form.PAY_LEASE_PERIOD.value;
	var lease_term = form.PAY_LEASE_TERM.value;
	if (lease_term == 0) {
		form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.PAY_FLOAT_RATE);
	var float_rate = form.PAY_FLOAT_RATE.value;
	
	form.PAY_YEAR_INTEREST.value = Math.round(paylistgetBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,8))/Math.pow(10,8);
}
// 
paylistchangFloatRate = function () {
	var form = document.payForm;
	valueIsNum(form.PAY_LEASE_PERIOD);
	var lease_period = form.PAY_LEASE_PERIOD.value;
	var lease_term = form.PAY_LEASE_TERM.value;
	if (lease_term == 0) {
		form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.PAY_YEAR_INTEREST);
	var year_interest = form.PAY_YEAR_INTEREST.value;
	
	form.PAY_FLOAT_RATE.value = Math.round((year_interest/paylistgetBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,8))/Math.pow(10,8); 
}

// 首期款合计
paylistchangeShowFirstValueSpan = function () {

}
//
function valueIsNumberPaylistLink(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         field.value = value;
    } else {
         field.value = 0;
    }
}
//
changePayIrrMonthPriceEnd = function(){

	var form = document.payForm;
	valueIsNumberPaylistLink(form.PAY_LEASE_PERIOD);
	var lease_period = form.PAY_LEASE_PERIOD.value;
	 
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
	for (var i=0; i<PAY_IRR_MONTH_PRICE_END.length; i++){
		
		var selectObj = PAY_IRR_MONTH_PRICE_END[i];
		var selectLen = selectObj.options.length;

		if (lease_period > selectLen) {
			
			for (var j=1;j<=(lease_period-selectLen);j++){
				var varItem = new Option(selectLen+j,selectLen+j)
				selectObj.options[selectLen+j-1] = varItem;
				selectObj.options.add(varItem);
			}
			
		
		} else if (lease_period < selectLen) {
		
			for (var j=selectLen;j>lease_period;j--){
				$(selectObj.options[j-1]).remove();
			}
			
		}
		
		changeIrrMonthPriceEnd(selectObj);
	}

}
function changeFieldPay(eventName,field) {
 	//isDirty = true;
 	if (eventName == 'PAY_LEASE_TOPRIC') {
		paylistchangePledgePrice();
		paylistchangeRZE();
		paylistchangeHeadHire();
		//paylistchangeManagementFee(); 
		
	} else if (eventName == 'PAY_PLEDGE_PRICE_RATE') {
		paylistchangePledgePrice();
		paylistchangeRZE();
	} else if (eventName == 'PAY_PLEDGE_PRICE') {
		verifyNumber(field);
		paylistchangePledgePriceRate();
		paylistchangeRZE();
    } else if (eventName == 'PAY_HEAD_HIRE_PERCENT') {
       	paylistchangeHeadHire();
       	paylistchangeRZE();
    } else if (eventName == 'PAY_HEAD_HIRE') {
		verifyNumber(field);
       	paylistchangHeadHirePercent();
       	paylistchangeRZE();
    } else if (eventName == 'PAY_MANAGEMENT_FEE_RATE') {
		//paylistchangeManagementFee();     
    } else if (eventName == 'PAY_MANAGEMENT_FEE') {
    	verifyNumber(field);
        //paylistchangeManagementFeeRate();
    } else if (eventName == 'PAY_FLOAT_RATE') {
    	verifyNumber(field);
       	paylistchangeYearInterest();
    } else if (eventName == 'PAY_YEAR_INTEREST') {
       	paylistchangFloatRate();
    } else if (eventName == 'PAY_LEASE_PERIOD') {
       	paylistchangeYearInterest();
       	//paylistchangeManagementFee();
       	// 2010-09-01 wjw
    	//document.payForm.PAY_IRR_MONTH_PRICE_END.value = document.payForm.PAY_LEASE_PERIOD.value;
    	// 2010-09-26 wjw
       	changePayIrrMonthPriceEnd();
    } else if (eventName == 'PAY_LEASE_TERM') {
        paylistchangeYearInterest();
        //paylistchangeManagementFee();
    } else if (eventName = 'PAY_PAY_WAY') {
   		paylistchangeRZE();
    }
    else {
        console.error('else ', eventName);
    }
}

function notPositive(field, name) {
    var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');
    if (!/^\d+(\.\d+)?$/.test(value)) {
        alert(name + '只能输入数字！');
        field.focus();
        return true;
    } else {
        value = '' + parseFloat(value);
        field.value = value
        return false;
    }
}

function submitPayForm() {
    //
    var form = document.payForm;
    
    //
    if (notPositive(form.PAY_LEASE_PERIOD, '租赁期数')) {
        return false;
    } 
    // 租赁周期
    if (form.PAY_LEASE_TERM.value == 0) {
    	form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return false;
    }
    // 支付方式
    if (form.PAY_PAY_WAY.value == 0) {
    	alert("请选择支付方式!");
    	form.PAY_PAY_WAY.focus();
    	return false;
    }
	// 
    if (notPositive(form.PAY_LEASE_TOPRIC, '融资租赁总价值')) {
        return false;
    }
	// 
    if (notPositive(form.PAY_PLEDGE_PRICE_RATE, '保证金（比率）')) {
        return false;
    }
    if (notPositive(form.PAY_PLEDGE_PRICE, '保证金')) {
        return false;
    }
    //
    if (notPositive(form.PAY_HEAD_HIRE_PERCENT, '首期租金（比率）')) {
        return false;
    }
    if (notPositive(form.PAY_HEAD_HIRE, '首期租金')) {
        return false;
    }
    //
    if (notPositive(form.PAY_FLOAT_RATE, '利率上浮比例')) {
        return false;
    }
    //
    if (notPositive(form.PAY_YEAR_INTEREST, '合同利率')) {
        return false;
    }
    //
    if (notPositive(form.PAY_LEASE_RZE, '概算成本（RZE）')) {
        return false;
    }
    
    var paylines = document.getElementsByName("MONTH_PRICE");
    for (var i=0;i<paylines.length;i++){
    
   	 	if (positive(form.MONTH_PRICE[i], '每期租金')) {
            return false;
        }
    }
    
    return true;
}
function submitCalCulate(flag,tax_plan_code) {
 //
    var form = document.payForm;
    
    //
    if (notPositive(form.PAY_LEASE_PERIOD, '租赁期数')) {
        return ;
    } 
    // 租赁周期
    if (form.PAY_LEASE_TERM.value == 0) {
    	form.PAY_LEASE_TERM.value=1;
    	form.PAY_LEASE_TERM.focus();
    	return;
    }
    // 支付方式
    if (form.PAY_PAY_WAY.value == 0) {
    	alert("请选择支付方式!");
    	form.PAY_PAY_WAY.focus();
    	return;
    }
	// 
    if (notPositive(form.PAY_LEASE_TOPRIC, '融资租赁总价值')) {
        return;
    }
	// 
    if (notPositive(form.PAY_PLEDGE_PRICE_RATE, '保证金（比率）')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_PRICE, '保证金')) {
        return;
    }
    //
    if (notPositive(form.PAY_HEAD_HIRE_PERCENT, '首期租金（比率）')) {
        return;
    }
    if (notPositive(form.PAY_HEAD_HIRE, '首期租金')) {
        return;
    }
    //
    if (notPositive(form.PAY_LEASE_RZE, '概算成本（RZE）')) {
        return;
    }
    //
    //
    if (checkNumber(form.PAY_FLOAT_RATE, '利率上浮比例')) {
        return;
    }
    //
    if (checkNumber(form.PAY_YEAR_INTEREST, '合同利率')) {
        return;
    }
    //
    //if (notPositive(form.PAY_PLEDGE_REALPRIC, '实际使用保证金')) {
    //    return;
   // }
    //
    if (notPositive(form.PAY_PLEDGE_AVE_PRICE, '用于平均抵冲金额')) {
        return;
    }
    //
    if (notPositive(form.PAY_PLEDGE_BACK_PRICE, '用于期末退还金额')) {
        return;
    }
    //
    if (notPositive(form.PAY_PLEDGE_LAST_PRICE, '用于最后抵冲金额')) {
        return;
    }
    //
    if (notPositive(form.PAY_PLEDGE_LAST_PERIOD, '用于最后抵冲期数')) {
        return;
    }
    //
    if (notPositive(form.PAY_PLEDGE_ENTER_CMPRICE, '保证金入我司金额')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_ENTER_CMRATE, '保证金入我司税额')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_ENTER_AG, '保证金入供应商金额')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_ENTER_MCTOAG, '我司入供应商金额')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_ENTER_AGRATE, '保证金入供应商税额')) {
        return;
    }
    if (notPositive(form.PAY_PLEDGE_ENTER_MCTOAGRATE, '我司入供应商税额')) {
        return;
    }
    //
    var paylines = document.getElementsByName("MONTH_PRICE");
    for (var i=0;i<paylines.length;i++){
    
   	 	if (positive(form.MONTH_PRICE[i], '每期租金')) {
            return;
        }
    }
    //
    var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");

    //Add by Michael 2012 07-12 增加首期租金与支付方式的检核
    if(form.PAY_PAY_WAY.value == 13 ||form.PAY_PAY_WAY.value == 11){
    
    	if(parseFloat(form.PAY_HEAD_HIRE.value)<0){
    		alert("期初支付方式是的首期租金需keyin金额！");
    		return false;
    	}
	}
    
	if (PAY_IRR_MONTH_PRICE.length == 0 ) {
		alert("请填写应付租金！");
		return false;
	} else if (PAY_IRR_MONTH_PRICE.length == 1) {
		if (positive(form.PAY_IRR_MONTH_PRICE, '应付租金')) {
            return false;
        }
	} else {
		for (var i=0;i<PAY_IRR_MONTH_PRICE.length;i++){
    
	   	 	if (positive(form.PAY_IRR_MONTH_PRICE[i], '应付租金')) {
	            return false;
	        }
	    }
	}
	
	var PAY_IRR_MONTH_PRICE_START = document.getElementsByName("PAY_IRR_MONTH_PRICE_START");
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
	
	var PLEDGE_LAST_PERIOD = parseInt(form.PAY_PLEDGE_LAST_PERIOD.value);
	
	//Add by Michael 2013 01-08 如有期末抵充，则要在入我司税金keyIn相应金额
	if (PLEDGE_LAST_PERIOD>0){
		if (form.PAY_PLEDGE_ENTER_CMRATE.value!=parseInt(form.PAY_PLEDGE_ENTER_CMRATE.value)){ 
			alert("保证金税金入我司部分不能输入小数");
			return false;
		}
		if (parseInt(form.PAY_PLEDGE_ENTER_CMRATE.value)<=0){ 
			alert("有期末抵充时，保证金税金入我司部分要输入金额！");
			return false;
		}
	}
	
	for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
		if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.PAY_LEASE_PERIOD.value){
			$("#PAY_PLEDGE_LAST_PERIOD").val(0);
			alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
			return false;
		}else if(i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value == form.PAY_LEASE_PERIOD.value){
			if(PLEDGE_LAST_PERIOD>parseInt(PAY_IRR_MONTH_PRICE_END[i].value)){
				$("#PAY_PLEDGE_LAST_PERIOD").val(0);
				alert("用于抵充最后期数应小于或等于租赁方案中的租赁期数！");
				return false;
			}else{
				if(PLEDGE_LAST_PERIOD-1<=(parseInt(PAY_IRR_MONTH_PRICE_END[i].value)-parseInt(PAY_IRR_MONTH_PRICE_START[i].value))){
					form.PAY_PLEDGE_LAST_PRICE.value=parseCurrency(PAY_IRR_MONTH_PRICE[i].value)*PLEDGE_LAST_PERIOD;
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
					
					form.PAY_PLEDGE_LAST_PRICE.value=total_pledge_last_price;
				}
			}
		}
	}
	
	if(!checkBZJ()){
		return false ;
	}

	for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
   
		if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.PAY_LEASE_PERIOD.value){
			alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
			return false;
		}
    }
    if(form.PAY_PAY_WAY.value == 13 ||form.PAY_PAY_WAY.value == 11){
	    	//var pay_way=form.PAY_PAY_WAY.value;
	    	var head_price=form.PAY_HEAD_HIRE.value;
	    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
	    	//alert(head_price+"==="+firstmonthprice);
	    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
	    		alert("期初方式首栏的应付租金应该等于首期租金");
	    		return false;
	    	}
    }
    

	/* 
	Add by Michael 2012 04-11 check 应付租金应与支付方式一致
	*/
	var strVal=0;
	var trueFlag=true;
	 $("input[name='PAY_IRR_MONTH_PRICE']").each(function(){
		 if (strVal=="0"){
			strVal= parseCurrency($(this).val());
		}
		if (strVal!=parseCurrency($(this).val())){		
			if (form.PAY_PAY_WAY.value=="21"||form.PAY_PAY_WAY.value=="11"){
				alert("每期租金不一致，应选择不等额支付方式！");
				trueFlag= false;
			}
		}
	 });
	 
	 if (trueFlag==false){
		 return false;
	 }	 
	 
	 if ($("input[name='PAY_IRR_MONTH_PRICE']").length=="1"){
		if (form.PAY_PAY_WAY.value=="13"||form.PAY_PAY_WAY.value=="23"){
			alert("每期租金一致时，应选择等额支付方式！");
			return false;
		}
	 }    
    
    if (flag == 1){
	    form.__action.value = "creditPaylistServiceVip.calculateCreditPaylist";
    
    } else if (flag == 2) {
	    form.__action.value = "creditPaylistServiceVip.calculateCreditPaylistIRR";
    
    } else if (flag == 3) {
	
	    form.__action.value = "expQuoToPdfVip.expZulwToPdf";
    
    }else if(flag == 4 && (tax_plan_code==1||tax_plan_code==3)){
    	form.__action.value = "creditPaylistServiceVip.exportPaylist"
    }else if(flag == 4 && tax_plan_code==2){
    	form.__action.value = "creditPaylistServiceVip.exportPaylistByValueAdded"
    }else if(flag==5){
    	//flag==5   支付表详细
    	form.__action.value = "creditPaylistServiceVip.paylistDetail"
    }
	form.submit();
}
function checkBZJ(){
    //验证：保证金=平均冲抵+期末返还+最后冲抵
    //	      保证金=入我司+入供应商
    var _sum=parseCurrency(setzero($("#PAY_PLEDGE_PRICE").val()));
    var _ave=parseCurrency(setzero($("#PAY_PLEDGE_AVE_PRICE").val()));
    var _back=parseCurrency(setzero($("#PAY_PLEDGE_BACK_PRICE").val()));
    var _last=parseCurrency(setzero($("#PAY_PLEDGE_LAST_PRICE").val()));
    var _cmprice=parseCurrency(setzero($("#PAY_PLEDGE_ENTER_CMPRICE").val()));
    var _enter=parseCurrency(setzero($("#PAY_PLEDGE_ENTER_AG").val()));
    if(_sum.toFixed(2)!=(_ave+_back+_last).toFixed(2)){
    	alert("保证金处理金额和保证金总额不符");
    	return false;
    }
    if(_sum.toFixed(2)!=(_cmprice+_enter).toFixed(2)){
    	alert("保证金入账金额和保证金总额不符");
    	return false;
    }
    
    //验证：平均冲抵=我司入供应商+入供应商
    var _mctoag=parseCurrency(setzero($("#PAY_PLEDGE_ENTER_MCTOAG").val()));
    if(_ave.toFixed(2)!=(_mctoag+_enter).toFixed(2)){
    	alert("平均冲抵金额应等于我司入供应商加入供应商");
   		return false;
    }
    return true ;
}
function setzero(value){
	value=value.trim();
	if(value==""||value==null){
		return "0.00";
	}else{
		return value
	}
}

function formatNum(Num1,Num2){ 
     if(isNaN(Num1)||isNaN(Num2)){ 
           return(0); 
     }else{ 
           Num1=Num1.toString(); 
           Num2=parseInt(Num2); 
           if(Num1.indexOf('.')==-1){ 
                 return(Num1); 
           }else{ 
                 var b=Num1.substring(0,Num1.indexOf('.')+Num2+1); 
                 var c=Num1.substring(Num1.indexOf('.')+Num2+1,Num1.indexOf('.')+Num2+2); 
                 if(c==""){ 
                       return(b); 
                 }else{ 
                       if(parseInt(c)<5){ 
                             return(b); 
                       }else{ 
                             return((Math.round(parseFloat(b)*Math.pow(10,Num2))+Math.round(parseFloat(Math.pow(0.1,Num2).toString().substring(0,Math.pow(0.1,Num2).toString().indexOf('.')+Num2+1))*Math.pow(10,Num2)))/Math.pow(10,Num2)); 
                       } 
                 } 
           } 
     } 
} 
/**
 * make array
 */
function makeArray(array) {
	var rsArray = new Array(array.length);
	for (var i=0;i<array.length;i++){
		rsArray[i] = parseCurrency(array[i].value);
	}
	return rsArray;
}

function addSchema(word){ 

	PAY_LEASE_TOPRIC=parseCurrency($("#PAY_LEASE_TOPRIC").val()==""?"0":$("#PAY_LEASE_TOPRIC").val());  //设备总价
	PAY_LEASE_RZE=parseCurrency($("#PAY_LEASE_RZE").val()==""?"0":$("#PAY_LEASE_RZE").val());     //融资额  
	base_rate=$("#base_rate").val(); 	//基准利率（％）
	PAY_YEAR_INTEREST=$("#PAY_YEAR_INTEREST").val()==""?0:$("#PAY_YEAR_INTEREST").val(); 	//合同利率（％）
	PAY_FLOAT_RATE=$("#PAY_FLOAT_RATE").val()==""?0:$("#PAY_FLOAT_RATE").val(); 	//基准利率上浮（％）
	PAY_LEASE_TERM=$.trim($("#PAY_LEASE_TERM").find("option:selected").text());	//租赁周期
	PAY_LEASE_PERIOD=$("#PAY_LEASE_PERIOD").val()==""?0:$("#PAY_LEASE_PERIOD").val();	//租赁期数
	each_price=parseCurrency($("#each_price").val()==""?"0":$("#each_price").val());	//每期还款（万元）
	
	PAY_PAY_WAY=$.trim($("#PAY_PAY_WAY").find("option:selected").text());	//支付方式
	total_price=parseCurrency($("#total_price").val()==""?"0":$("#total_price").val());	//还款总额（万元）
	//PAY_MANAGEMENT_FEE=parseCurrency($("#PAY_MANAGEMENT_FEE").val()==""?"0":$("#PAY_MANAGEMENT_FEE").val());	//管理费（万元）
	PAY_PLEDGE_PRICE=parseCurrency($("#PAY_PLEDGE_PRICE").val()==""?"0":$("#PAY_PLEDGE_PRICE").val());	//保证金（万元）
	//
	PAY_PLEDGE_REALPRIC = parseCurrency($("#PAY_PLEDGE_REALPRIC").val()==""?"0":$("#PAY_PLEDGE_REALPRIC").val());
	total_ren_price=parseCurrency($("#total_ren_price").val()==""?"0":$("#total_ren_price").val());	//利息总额（万元）

	TOTAL_SALES_TAX=parseCurrency($("#TOTAL_SALES_TAX").val()==""?"0":$("#TOTAL_SALES_TAX").val());
	STAMP_TAX_PRICE=parseCurrency($("#STAMP_TAX_PRICE").val()==""?"0":$("#STAMP_TAX_PRICE").val());
	first_insure_price=parseCurrency($("#first_insure_price").val()==""?"0":$("#first_insure_price").val());
	total_insure_price=parseCurrency($("#total_insure_price").val()==""?"0":$("#total_insure_price").val());
    cust_tr=$("#cust_tr").val()==""?0:$("#cust_tr").val(); 
	//PAY_MANAGEMENT_FEE_RATE=parseCurrency($("#PAY_MANAGEMENT_FEE_RATE").val()==""?"0":$("#PAY_MANAGEMENT_FEE_RATE").val()) 
	PAY_HEAD_HIRE_PERCENT=parseCurrency($("#PAY_HEAD_HIRE_PERCENT").val()==""?"0":$("#PAY_HEAD_HIRE_PERCENT").val()) 
	PAY_HEAD_HIRE=parseCurrency($("#PAY_HEAD_HIRE").val()==""?"0":$("#PAY_HEAD_HIRE").val());
	PAY_PLEDGE_PRICE_RATE=parseCurrency($("#PAY_PLEDGE_PRICE_RATE").val()==""?"0":$("#PAY_PLEDGE_PRICE_RATE").val()) 
	PAY_START_DATE=$("#PAY_START_DATE").val(); 
	PAY_PAY_WAY_VALUE=$("#PAY_PAY_WAY").val();
	PAY_LEASE_TERM_VALUE=parseCurrency($("#PAY_LEASE_TERM").val()==""?"0":$("#PAY_LEASE_TERM").val())
	TR_IRR_RATE=parseCurrency($("#TR_IRR_RATE").val()==""?"0":$("#TR_IRR_RATE").val())
	
	var PAY_IRR_MONTH_PRICE = makeArray($("[name='PAY_IRR_MONTH_PRICE']"));
	var PAY_IRR_MONTH_PRICE_START =makeArray($("[name='PAY_IRR_MONTH_PRICE_START']"));
	var PAY_IRR_MONTH_PRICE_END = makeArray($("[name='PAY_IRR_MONTH_PRICE_END']"));

	PAY_PLEDGE_PERIOD=$("#PAY_PLEDGE_PERIOD").val();
	//
	PAY_PLEDGE_AVE_PRICE=parseCurrency($("#PAY_PLEDGE_AVE_PRICE").val()==""?"0":$("#PAY_PLEDGE_AVE_PRICE").val());
	PAY_PLEDGE_BACK_PRICE=parseCurrency($("#PAY_PLEDGE_BACK_PRICE").val()==""?"0":$("#PAY_PLEDGE_BACK_PRICE").val());
	PAY_PLEDGE_LAST_PRICE=parseCurrency($("#PAY_PLEDGE_LAST_PRICE").val()==""?"0":$("#PAY_PLEDGE_LAST_PRICE").val());
	PAY_PLEDGE_LAST_PERIOD=$("#PAY_PLEDGE_LAST_PERIOD").val();
	//PAY_PLEDGE_ENTER_WAY=$(":radio[name='PAY_PLEDGE_ENTER_WAY']:checked").val();
	PAY_PLEDGE_ENTER_CMPRICE=parseCurrency($("#PAY_PLEDGE_ENTER_CMPRICE").val()==""?"0":$("#PAY_PLEDGE_ENTER_CMPRICE").val());
	PAY_PLEDGE_ENTER_CMRATE=parseCurrency($("#PAY_PLEDGE_ENTER_CMRATE").val()==""?"0":$("#PAY_PLEDGE_ENTER_CMRATE").val());
	PAY_PLEDGE_ENTER_AG=parseCurrency($("#PAY_PLEDGE_ENTER_AG").val()==""?"0":$("#PAY_PLEDGE_ENTER_AG").val());
	PLEDGE_ENTER_MCTOAG=parseCurrency($("#PAY_PLEDGE_ENTER_MCTOAG").val()==""?"0":$("#PAY_PLEDGE_ENTER_MCTOAG").val());
	PLEDGE_ENTER_MCTOAGRATE=parseCurrency($("#PAY_PLEDGE_ENTER_MCTOAGRATE").val()==""?"0":$("#PAY_PLEDGE_ENTER_MCTOAGRATE").val());
	PLEDGE_ENTER_AGRATE=parseCurrency($("#PAY_PLEDGE_ENTER_AGRATE").val()==""?"0":$("#PAY_PLEDGE_ENTER_AGRATE").val());
	//alert(123);
	FIRST_OWN_PRICE=parseCurrency($("#FIRST_OWN_PRICE1").val()==""?"0":$("#FIRST_OWN_PRICE1").val());
	//alert(FIRST_OWN_PRICE);
	//Add BY Michael 2011 10/31 For  增加利差
	RATE_DIFF=parseCurrency($("#RATE_DIFF").val()==""?"0":$("#RATE_DIFF").val());
	
	//Add by Michael 2012 09-21 增加税费方案
	TAX_PLAN_CODE_TEXT=$.trim($("#PAY_TAX_PLAN_CODE").find("option:selected").text());	//税费测算方案
	TAX_PLAN_CODE=$("#PAY_TAX_PLAN_CODE").val();
	TOTAL_VALUEADDED_TAX=$("#TOTAL_VALUEADDED_TAX").val();
	//Add by Michael 增加影响概算成本计算费用
	var DEFER_PERIOD = $("#PAY_DEFER_PERIOD").val(); 
	//Add by Michael 2012 12-21 增加费用来源
	var strAttr="";
	 $("input[feeListRZE='feeListRZE1']").each(function(){
		var n=$(this).attr("name");
		var v=  parseCurrency($(this).val());
		strAttr+="&"+n+"="+v;
		var sn=$(this).attr("name")+"_SOURCE";
		var sv=$("#"+sn+"").val();
		strAttr+="&"+sn+"="+sv;
	 });
	 
	 $("input[feeListRZE='feeListRZE2']").each(function(){
			var n=$(this).attr("name");
			var v=  parseCurrency($(this).val());
			
			strAttr+="&"+n+"="+v;
			var sn=$(this).attr("name")+"_SOURCE";
			var sv=$("#"+sn+"").val();
			strAttr+="&"+sn+"="+sv;

	});
	 
	if(parseInt(PLEDGE_ENTER_MCTOAG)>parseInt(PAY_PLEDGE_ENTER_CMPRICE)){
		alert("我司入供应商应该小于入我司");
		return false;
	}
	
	$.ajax({
		type:'post',
		dataType:'json',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditPaylistServiceVip.saveSchemaToSession&PAY_LEASE_TOPRIC='+PAY_LEASE_TOPRIC
		+'&PAY_LEASE_RZE='+PAY_LEASE_RZE
		+'&base_rate='+base_rate
		+'&PAY_YEAR_INTEREST='+PAY_YEAR_INTEREST
		+'&PAY_FLOAT_RATE='+PAY_FLOAT_RATE
		+'&PAY_LEASE_TERM='+PAY_LEASE_TERM
		+'&PAY_LEASE_PERIOD='+PAY_LEASE_PERIOD
		+'&each_price='+each_price
		+'&PAY_PAY_WAY_VALUE='+PAY_PAY_WAY_VALUE
		+'&PAY_PAY_WAY='+PAY_PAY_WAY
		+'&total_price='+total_price
		//+'&PAY_MANAGEMENT_FEE='+PAY_MANAGEMENT_FEE
		+'&PAY_PLEDGE_PRICE='+PAY_PLEDGE_PRICE
		+'&total_ren_price='+total_ren_price
		+'&TOTAL_SALES_TAX='+TOTAL_SALES_TAX
		+'&STAMP_TAX_PRICE='+STAMP_TAX_PRICE
		+'&first_insure_price='+first_insure_price
		+'&total_insure_price='+total_insure_price
		//+'&PAY_MANAGEMENT_FEE_RATE='+PAY_MANAGEMENT_FEE_RATE
		+'&PAY_HEAD_HIRE_PERCENT='+PAY_HEAD_HIRE_PERCENT
		+'&PAY_HEAD_HIRE='+PAY_HEAD_HIRE
		+'&PAY_PLEDGE_PRICE_RATE='+PAY_PLEDGE_PRICE_RATE
		
		+'&PAY_START_DATE='+PAY_START_DATE
		+'&PAY_LEASE_TERM_VALUE='+PAY_LEASE_TERM_VALUE
		+'&TR_IRR_RATE='+TR_IRR_RATE
		
		+'&PAY_PLEDGE_PERIOD='+PAY_PLEDGE_PERIOD
		+'&PAY_PLEDGE_REALPRIC='+PAY_PLEDGE_REALPRIC
		+'&PAY_IRR_MONTH_PRICE='+PAY_IRR_MONTH_PRICE
		+'&PAY_IRR_MONTH_PRICE_START='+PAY_IRR_MONTH_PRICE_START
		+'&PAY_IRR_MONTH_PRICE_END='+PAY_IRR_MONTH_PRICE_END

		+'&PAY_PLEDGE_AVE_PRICE='+PAY_PLEDGE_AVE_PRICE
		+'&PAY_PLEDGE_BACK_PRICE='+PAY_PLEDGE_BACK_PRICE
		+'&PAY_PLEDGE_LAST_PRICE='+PAY_PLEDGE_LAST_PRICE
		+'&PAY_PLEDGE_LAST_PERIOD='+PAY_PLEDGE_LAST_PERIOD
		//+'&PAY_PLEDGE_ENTER_WAY='+PAY_PLEDGE_ENTER_WAY
		+'&PAY_PLEDGE_ENTER_CMPRICE='+PAY_PLEDGE_ENTER_CMPRICE
		+'&PAY_PLEDGE_ENTER_CMRATE='+PAY_PLEDGE_ENTER_CMRATE
		+'&PAY_PLEDGE_ENTER_AG='+PAY_PLEDGE_ENTER_AG
		+'&PLEDGE_ENTER_MCTOAG='+PLEDGE_ENTER_MCTOAG
		+'&PLEDGE_ENTER_MCTOAGRATE='+PLEDGE_ENTER_MCTOAGRATE
		+'&PLEDGE_ENTER_AGRATE='+PLEDGE_ENTER_AGRATE
		+'&FIRST_OWN_PRICE='+FIRST_OWN_PRICE
		//Add by Michael 2012 1/4增加利差
		+'&RATE_DIFF='+RATE_DIFF
		//Add by Michael 2012 09-21 增加税费方案配置
		+'&TAX_PLAN_CODE_TEXT='+TAX_PLAN_CODE_TEXT
		+'&TAX_PLAN_CODE='+TAX_PLAN_CODE
		+'&TOTAL_VALUEADDED_TAX='+TOTAL_VALUEADDED_TAX
		+'&DEFER_PERIOD='+DEFER_PERIOD
		//Add by Michael 2012 1/29 增加影响TR费用
		+strAttr
		+'&cust_tr='+cust_tr,
		success:function(dataBack){
			 html="<td width='20%'> "
				    +"<div  style='width: 130px'> "
				    +"		<div class='ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix' style='height: 25px;text-align: right;' >"
				    +"	   	</div>"
				    +"		<div class='zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all' id='main'>"
				    +"           	 <div class='zc_grid_body jqgrowleft'>"
				    +"               <div class='ui-state-default ui-jqgrid-hdiv '>"
                    +"					<table cellspacing='0' cellpadding='0' border='0'"
					+"						class='ui-jqgrid-htable zc_grid_title' style='width: 130px'>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁物件总价(元)</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>融资额(元)</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>净现金流TR（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>合同利率（％）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>基准利率上浮（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>客户TR（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁周期 </td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁期数 </td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>每期还款（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>支付方式 </td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>还款总额（元）</td>"
					+"						</tr>"
//					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
//					+"							<td style='height: 23px;'>管理费（元）</td>"
//					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>保证金（元）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>利息总额（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>营业税（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>印花税（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>第一年保险费（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>保险费总额（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>利差（元）</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>税费测算方案</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>操作</td>"
					+"						</tr> "
					+"					</table>"
					+"			</div>"
					+"		</div>"
					+"	</div> "
					+"</div>"
			        +"</td> "
			 for(i=0;i<dataBack.schemasList.length;i++){ 
				 html=html+" <td width='20%'> "
					+"<div  style='width: 130px'> "
					+"		<div class='ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix' style='height: 25px;text-align: right;' >"
					+"	   		<table>"
					+"	   			<tr>"
					+"	   				<td width='90%'><span class='ui-jqgrid-title' style='line-height: 25px; font-size: 12px;' >&nbsp;&nbsp;候选方案</span>"
					+"	   				</td>"
					+"	   				<td><span class='ui-icon ui-icon-closethick' onclick='deleteDIV(this,"+i+",\""+word+"\");' title='点击删除方案'></span> "
					+"	   				</td>"
					+"	   			</tr>"
					+"	   		</table>"
					+"	   	</div>"
					+"		<div class='zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all' id='main'>"
					 +"          	 <div class='zc_grid_body jqgrowleft'>"
					 +"               <div class='ui-state-default ui-jqgrid-hdiv '>"
					+"					<table cellspacing='0' cellpadding='0' border='0'"
					+"						class='ui-jqgrid-htable zc_grid_title' style='width: 130px'>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_LEASE_TOPRIC)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_LEASE_RZE)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].TR_IRR_RATE,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].PAY_YEAR_INTEREST,3)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].PAY_FLOAT_RATE,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].cust_tr,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_LEASE_TERM+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_LEASE_PERIOD+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].each_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_PAY_WAY+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_price)+"</td>"
					+"						</tr>"
//					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
//					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_MANAGEMENT_FEE)+"</td>"
//					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_PLEDGE_PRICE)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_ren_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].TOTAL_SALES_TAX)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].STAMP_TAX_PRICE)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].first_insure_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_insure_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].RATE_DIFF)+"</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].TAX_PLAN_CODE_TEXT+"</td>"
					+"						</tr> ";	
					if(word=='up'){
						html=html+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					    +"							<td style='height: 23px;text-align: center'><a href='javascript:void(0)' onclick='javacript:location.href=\"../servlet/defaultDispatcher?__action=creditPaylistServiceVip.updateSchema&contract_type="+$("#contract_type").val()+"&session_schema="+i+"&CREDIT_ID="+$("#cccccc").val()+"\";'>保存</a></td>"
					    +"						</tr> ";
					}else{
						html=html+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					    +"							<td style='height: 23px;text-align: center'>&nbsp;</td>"
					    +"				</tr> ";
					}
					html=html+"					</table>"
					+"				</div>"
					+"			</div>"
					+"		</div> "
					+"	</div>	"
				    +"</td>";
				} 
			for(i=0;i<4-dataBack.schemasList.length;i++){
				 html=html+" <td width='20%'></td> "
			} 
			$("#showDuibiTr").html(html);	   
		}
	});
		//弹出对比的层 
	$('#showDuibi').dialog({
		modal:true,
		autoOpen: false,
		width: 750,
		height: 520
	});
	$('#showDuibi').dialog('open');  
}


function deleteDIV(obj,idValue,word) {
     var this_box=$(obj).parent().parent().parent().parent().parent().parent().closest('div').remove(); 
     $.ajax({
		type:'post',
		dataType:'json',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditPaylistServiceVip.removeSchemaFromSession&idValue='+idValue,
		success:function(dataBack){
			  html="<td width='20%'> "
				    +"<div  style='width: 130px'> "
				    +"		<div class='ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix' style='height: 25px;text-align: right;' >"
				    +"	   	</div>"
				    +"		<div class='zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all' id='main'>"
				    +"           	 <div class='zc_grid_body jqgrowleft'>"
				    +"               <div class='ui-state-default ui-jqgrid-hdiv '>"
                    +"					<table cellspacing='0' cellpadding='0' border='0'"
					+"						class='ui-jqgrid-htable zc_grid_title' style='width: 130px'>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁物件总价(元)</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>融资额(元)</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>净现金流TR（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>合同利率（％）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>基准利率上浮（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>客户TR（％）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁周期 </td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>租赁期数 </td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>每期还款（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>支付方式 </td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>还款总额（元）</td>"
					+"						</tr>"
//					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
//					+"							<td style='height: 23px;'>管理费（元）</td>"
//					+"						</tr>"
					//+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					//+"							<td style='height: 23px;'>保证金处理方式</td>"
					//+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>保证金（元）</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>利息总额（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>营业税（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>印花税（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>第一年保险费（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>保险费总额（元）</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>利差（元）</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>税费测算方案</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>操作</td>"
					+"						</tr> "
					+"					</table>"
					+"			</div>"
					+"		</div>"
					+"	</div> "
					+"</div>"
			        +"</td> "
			 for(i=0;i<dataBack.schemasList.length;i++){ 
				 html=html+" <td width='20%'> "
					+"<div  style='width: 130px'> "
					+"		<div class='ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix' style='height: 25px;text-align: right;' >"
					+"	   		<table>"
					+"	   			<tr>"
					+"	   				<td width='90%'><span class='ui-jqgrid-title' style='line-height: 25px; font-size: 12px;' >&nbsp;&nbsp;候选方案</span>"
					+"	   				</td>"
					+"	   				<td><span class='ui-icon ui-icon-closethick' onclick='deleteDIV(this,"+i+",\""+word+"\");' title='点击删除方案'></span> "
					+"	   				</td>"
					+"	   			</tr>"
					+"	   		</table>"
					+"	   	</div>"
					+"		<div class='zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all' id='main'>"
					 +"          	 <div class='zc_grid_body jqgrowleft'>"
					 +"               <div class='ui-state-default ui-jqgrid-hdiv '>"
					+"					<table cellspacing='0' cellpadding='0' border='0'"
					+"						class='ui-jqgrid-htable zc_grid_title' style='width: 130px'>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_LEASE_TOPRIC)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_LEASE_RZE)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].TR_IRR_RATE,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].PAY_YEAR_INTEREST,3)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].PAY_FLOAT_RATE,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+formatNum(dataBack.schemasList[i].cust_tr,3)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_LEASE_TERM+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_LEASE_PERIOD+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].each_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_PAY_WAY+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_price)+"</td>"
					+"						</tr>"
//					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
//					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_MANAGEMENT_FEE)+"</td>"
//					+"						</tr>"
					//+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					//+"							<td style='height: 23px;'>"+dataBack.schemasList[i].PAY_PLEDGE_WAY+"</td>"
					//+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].PAY_PLEDGE_PRICE)+"</td>"
					+"						</tr>"
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_ren_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].TOTAL_SALES_TAX)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].STAMP_TAX_PRICE)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].first_insure_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].total_insure_price)+"</td>"
					+"						</tr> "
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>￥"+formatCurrency(dataBack.schemasList[i].RATE_DIFF)+"</td>"
					+"						</tr> "	
					+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					+"							<td style='height: 23px;'>"+dataBack.schemasList[i].TAX_PLAN_CODE_TEXT+"</td>"
					+"						</tr> ";
					if(word=='up'){
						html=html+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					    +"							<td style='height: 23px;text-align: center'><a href='javascript:void(0)' onclick='javacript:location.href=\"../servlet/defaultDispatcher?__action=creditPaylistService.updateSchema&session_schema="+i+"&CREDIT_ID="+$("#cccccc").val()+"\";'>保存</a></td>"
					    +"						</tr> ";
					}else{
						html=html+"						<tr class='ui-widget-content jqgrow ui-row-ltr'>"
					    +"							<td style='height: 23px;text-align: center'>&nbsp;</td>"
					    +"				</tr> ";
					}
					html=html+"					</table>"
					+"				</div>"
					+"			</div>"
					+"		</div> "
					+"	</div>	"
				    +"</td>";
				} 
			for(i=0;i<4-dataBack.schemasList.length;i++){
				 html=html+" <td width='20%'></td> "
			} 
			$("#showDuibiTr").html(html);	 
		}
		});
}


function expCat(id) {  
			
			window.location.href="../servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx="+ id +"";
		}
