function changeField(){
	changeLeaseTopric();
	updatePledgePrice();
	updateManagementFee();
	updateLeaseRZE();
}
 
// 根据租赁物件清单中的单价修改融资租赁总价值
function changeLeaseTopric() {
    var form = document.schemeForm;
    var thingPrice = form.UNIT_PRICE;
    var thingNum = form.AMOUNT;
    var totalPrice=form.TOTAL;

    var thingTable = document.getElementById('equipmentTab');
    var value = 0;
    if (thingTable.rows.length == 4) {
        // 单行情况
        if (positive(thingPrice, '租赁物单价')||checkBlank(thingNum.value)) {
            value = 0;
        } else {
            value = parseFloat(thingPrice.value) * parseInt(thingNum.value, 10); 
        } 
        setFormatCurrency(thingPrice);  
        totalPrice.value=value;
        setFormatCurrency(totalPrice);
    } else if (thingTable.rows.length > 4) {
        // 多行情况
        for (var i = 0; i < thingPrice.length; i++) {
            var num = 0;
            if (thingPrice[i].value==''||positive(thingPrice[i], '租赁物单价')) {
                //value = 0;
            } else {
                num = parseFloat(thingPrice[i].value) * parseInt(thingNum[i].value, 10); 
            }
            	setFormatCurrency(thingPrice[i]);  
            if (num) {
                value += num; 
	        	totalPrice[i].value=num;
	        	setFormatCurrency(totalPrice[i]);
            }
        }
    }
    // 求和，计算租赁物件总价值
    form.LEASE_TOPRIC.value = value;
    setFormatCurrency(form.LEASE_TOPRIC);
    changeLeaseTopricBig()
}
function changeLeaseTopricBig() {
    // 修改大写金额
    var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value);
    document.getElementById('leaseTopricBig').innerHTML = atoc(value);
}

//根据质押金比例 计算质押金金额
function updatePledgePrice(){ 
	form =document.schemeForm;
	rate=form.PLEDGE_PRICE_RATE.value; 
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
	form.PLEDGE_PRICE.value=value/100*rate;
	setFormatCurrency(form.PLEDGE_PRICE);
updateLeaseRZE();
}

//根据质押金金额 计算质押金比例 
function updatePledgePriceRate(){
	form =document.schemeForm;
	var pledgePrice=form.PLEDGE_PRICE.value;
	pledgePrice = parseCurrency(pledgePrice);
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
    setFormatCurrency(form.PLEDGE_PRICE);
	form.PLEDGE_PRICE_RATE.value=number(pledgePrice*100/value); 
	updateLeaseRZE();
}
// 首期款
function updateHeadHire() {
	form =document.schemeForm;
	rate=form.HEAD_HIRE_PERCENT.value;
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
	form.HEAD_HIRE.value=value/100*rate;
	setFormatCurrency(form.HEAD_HIRE);
}
function updateHeadHirePercent() {
	form =document.schemeForm;
	headHire=parseCurrency(form.HEAD_HIRE.value);
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
    setFormatCurrency(form.HEAD_HIRE);
	form.HEAD_HIRE_PERCENT.value=number(headHire*100/value); 
}

//
function valueIsNumber1(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         field.value = value;
    } else {
         field.value = 0;
    }
}

function verifyNumber1(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
function valueIsNumber2(id) {
	var value = document.getElementById(id).value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         document.getElementById(id).value = value;
    } else {
         document.getElementById(id).value = 1;
    }
}
function verifyNumber2(id) {
    var value = document.getElementById(id).value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        document.getElementById(id).value = formatCurrency(value);
    } else {
        document.getElementById(id).value = 0;
    }
}
// 小计 wjw 2010-07-14 
function updateTotal(index) {
	verifyNumber2("UNIT_PRICE"+index);
	valueIsNumber2("AMOUNT"+index);
	var price = parseCurrency(document.getElementById("UNIT_PRICE"+index).value);
	var amount = document.getElementById("AMOUNT"+index).value;
	document.getElementById("TOTAL"+index).value = formatCurrency(price * amount);
	changeField();
}
//
getBaseRate = function (totalMonth) {
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
function updateYearInterest() {
	var form = document.schemeForm;
	valueIsNumber1(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber1(form.FLOAT_RATE);
	var float_rate = form.FLOAT_RATE.value;
	
	form.YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,4))/Math.pow(10,4);
}
function updateFloatRate(){
	var form = document.schemeForm;
	valueIsNumber1(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber1(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,4))/Math.pow(10,4); 
}
//
function updateLeaseRZE () {
	form =document.schemeForm;
	var value = document.schemeForm.LEASE_TOPRIC.value;
	pledgePrice=form.PLEDGE_PRICE.value;
    value = parseCurrency(value); 
    pledgePrice = parseCurrency(pledgePrice); 
	
	form.LEASE_RZE.value= value - pledgePrice;
	setFormatCurrency(form.LEASE_RZE);

}

function number(value) {
    var num = parseInt(value * 100);
    var first = parseInt(num / 100) + "";
    var last = (num % 100) + "";
    return first + "." + last;
}

//根据管理费比例 计算管理费金额
function updateManagementFee(){ 
	var form = document.schemeForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber1(form.MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.MANAGEMENT_FEE_RATE.value; 
	valueIsNumber1(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	
	var value = 0;
	if (total_price >= 10000000){
		value = (10000000 * Number(management_fee_rate) / 100 + (total_price-10000000) * 0.3 / 100 )*(lease_period * lease_term / 12);
	} else {
		value = (total_price * Number(management_fee_rate) / 100 )*(lease_period * lease_term / 12);
	}
	form.MANAGEMENT_FEE.value = number(value );
	setFormatCurrency(form.MANAGEMENT_FEE);
	
}

//根据管理费金额 计算管理费比例
function updateManagementFeeRate(){
	var form = document.schemeForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber1(form.MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.MANAGEMENT_FEE.value);
	
	valueIsNumber1(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	
	var value = 0;
	if (total_price >= 10000000){
		value = (management_fee / (lease_period * lease_term / 12) * 100 - (total_price-10000000) * 0.3 ) / 10000000 ;
	} else {
		value = (management_fee / (lease_period * lease_term / 12)  /  total_price) * 100;
	}
	form.MANAGEMENT_FEE_RATE.value = Math.round((value)*Math.pow(10,4))/Math.pow(10,4);
}

function changeInsurePrice(){
	  var form = document.schemeForm;
	  insurePrice=form.INSURE_PRICE;
	  var tab= document.getElementById('insureTab');
	  var value=0;
	  var n=0; 
	  if(tab.rows.length==4){
	  		if(positive(insurePrice, '保险金额')){
	  			value=0;
	  		}else{
	  			value=parseCurrency(insurePrice.value);
		  		setFormatCurrency(insurePrice);
	  		}
	  }else{
	  	 for(i=0;i<insurePrice.length;i++){
		  	if(insurePrice[i].value==''||positive(insurePrice[i], '保险金额')){
		  		n=0;
		  	}else{
		  		n=parseCurrency(insurePrice[i].value);
		  	}
		  	value=n+value;
		  	setFormatCurrency(insurePrice[i]);
		  }
	  }
	 
	  form.TOTAL_INSURE.value=value;
	  setFormatCurrency(form.TOTAL_INSURE);
	  document.getElementById('insureTotalBig').innerHTML=atoc(value);
}
