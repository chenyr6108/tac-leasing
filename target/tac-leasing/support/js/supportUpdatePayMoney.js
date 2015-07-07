
function number(value) {
    var num = parseInt(value * 100);
    var first = parseInt(num / 100) + "";
    var last = (num % 100) + "";
    return first + "." + last;
}
function valueIsNumber(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         field.value = value;
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
        setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
// RZE
changeRZE = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var pledge_price = parseCurrency(form.PLEDGE_PRICE.value);
	form.LEASE_RZE.value = number(total_price - pledge_price);
	setFormatCurrency(form.LEASE_RZE);
}
// 租赁质押金
changePledgePrice = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var pledge_price_rate = form.PLEDGE_PRICE_RATE.value;
	form.PLEDGE_PRICE.value = number(total_price * pledge_price_rate / 100);
	setFormatCurrency(form.PLEDGE_PRICE);
}
//
changePledgePriceRate = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var pledge_price = parseCurrency(form.PLEDGE_PRICE.value);
	form.PLEDGE_PRICE_RATE.value = Math.round((pledge_price/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeHeadHire = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var head_hire_percent = form.HEAD_HIRE_PERCENT.value;
	form.HEAD_HIRE.value = number(total_price * head_hire_percent / 100 );
	setFormatCurrency(form.HEAD_HIRE);
}
//
changHeadHirePercent = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var head_hire = parseCurrency(form.HEAD_HIRE.value);
	form.HEAD_HIRE_PERCENT.value = Math.round((head_hire/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeManagementFee = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	verifyNumber(form.MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.MANAGEMENT_FEE_RATE.value;
	
	valueIsNumber(form.LEASE_PERIOD);
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
//
changeManagementFeeRate = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	verifyNumber(form.MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.MANAGEMENT_FEE.value);
	
	valueIsNumber(form.LEASE_PERIOD);
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
//
changeYearInterest = function () {
	var form = document.payForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.FLOAT_RATE);
	var float_rate = form.FLOAT_RATE.value;
	
	form.YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,4))/Math.pow(10,4);
}
// 
changFloatRate = function () {
	var form = document.payForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,4))/Math.pow(10,4); 
}

// 首期款合计
changeShowFirstValueSpan = function () {
	var form = document.payForm;
	var pledegPrice = parseCurrency(form.PLEDGE_PRICE.value);
	var FirstValue =  pledegPrice +  parseCurrency(form.HEAD_HIRE.value) + parseCurrency(form.MANAGEMENT_FEE.value) + parseCurrency(form.BUSINESS_TRIP_PRICE.value);
	var fv = formatCurrency(FirstValue);
	$("#showFirstValueSpan").html(fv);
}

function changeField(eventName,field) {
 if (eventName == 'OTHER_PRICE') {
        changeOtherFeeTotal();
    } 
 else {
     console.error('else ', eventName);
 }
	
}

changeInsureTotal = function () {
	  var form = document.payForm;
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
	 var showSpan = formatCurrency(value);
	 document.getElementById("showInsureTotalSpan").innerHTML = showSpan;
	
	 var showUpper = atoc(value);
	 document.getElementById("showInsureTotalSpanUpper").innerHTML = showUpper;
}
//
changeOtherFeeTotal = function () {
	var form = document.payForm;
	otherPrice=form.OTHER_PRICE;
	var tab= document.getElementById('otherPriceTab');
	var value=0;
	var n=0; 
	  if(tab.rows.length==4){
	  		if(positive(otherPrice, '其他费用金额')){
	  			value=0;
	  		}else{
	  			value=parseCurrency(otherPrice.value);
		  		setFormatCurrency(otherPrice);
	  		}
	  }else{
	  	 for(i=0;i<otherPrice.length;i++){
		  	if(otherPrice[i].value==''||positive(otherPrice[i], '其他费用金额')){
		  		n=0;
		  	}else{
		  		n=parseCurrency(otherPrice[i].value);
		  	}
		  	value=n+value;
		  	setFormatCurrency(otherPrice[i]);
		  }
	  }
	 
	   var showSpan = formatCurrency(value);
	 document.getElementById("showOtherFeeTotalSpan").innerHTML = showSpan;
	
	 var showUpper = atoc(value);
	 document.getElementById("showOtherFeeTotalSpanUpper").innerHTML = showUpper;
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
    var otherPriceTab = document.getElementById("otherPriceTab");
    if(otherPriceTab.rows.length < 4){
		
    } else if (otherPriceTab.rows.length == 4) {
    	if (blank(form.OTHER_NAME, '费用名称' )) {
    		return false;
    	}
    	if (positive(form.OTHER_PRICE, '费用金额' )) {
    		return false;
    	}
    	if (blank(form.OTHER_DATE, '产生费用时间' )) {
    		return false;
    	}
    }else {
	    for (var i = 0; i < form.OTHER_NAME.length; i++) {
	    	if (blank(form.OTHER_NAME[i], '费用名称' )) {
	    		return false;
	    	}
	    	if (positive(form.OTHER_PRICE[i], '费用金额' )) {
	    		return false;
	    	}
	    	if (blank(form.OTHER_DATE[i], '产生费用时间' )) {
	    		return false;
	    	}
	    }
    }

    return true;
}

function addOtherPrice(){
	tab=document.getElementById("otherPriceTab");
	var row = tab.insertRow(tab.rows.length-1);
	var sed = document.getElementById("otherPriceTab").rows.length;
	 cell = row.insertCell(0); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_NAME"+sed+"\" name=\"OTHER_NAME\"/>";
	 row.appendChild(cell);
	 cell = row.insertCell(1); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input class=\"input_right\" onchange=\"changeField('OTHER_PRICE',this);\"  id=\"OTHER_PRICE"+sed+"\" name=\"OTHER_PRICE\">";
	 row.appendChild(cell);
	 cell = row.insertCell(2); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_DATE"+sed+"\" name=\"OTHER_DATE\">";
	 row.appendChild(cell);
	 cell = row.insertCell(3); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_MEMO"+sed+"\" name=\"OTHER_MEMO\" size=\"30\">";
	 row.appendChild(cell);
	 cell = row.insertCell(4); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteOtherPriceRow.call(this)\">删除</a>"
	 	+"<input type=\"hidden\" name=\"RECO_ID\" value=\"0\" id=\"RECO_ID"+sed+"\">";
	 row.appendChild(cell); 
}
function deleteOtherPriceRow(){
        var tr = this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
        changeField('OTHER_PRICE');
}

function addInsureItem(id){ 
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePayMoney.getComTypeById&INCP_ID='+$("#INSURANCE_COMPANY_ID2").val(),
		dataType:'json',
		success: function(dataBack){ 
	tab=document.getElementById("insureTab");
	var row = tab.insertRow(tab.rows.length-1);
	var sed = document.getElementById("insureTab").rows.length;
	var cell = row.insertCell(0); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';	 
	 var htmls = "<select id=\"INSURE_ITEM"+sed+"\" name=\"INSURE_ITEM\">" +"<option value=\"-1\">" +"-请选择-" +"</option>";		
	 	 for(i=0;i<dataBack.insureTypeList.length;i++){
	 		htmls=htmls+"<option value='"+insureTypeData[i].INTP_ID+"'>"+insureTypeData[i].INTP_NAME+"</option>"
	 	 }
	 htmls = htmls+"</select>";

	 cell.innerHTML = htmls;
	 row.appendChild(cell);
	 cell = row.insertCell(1); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"START_DATE"+sed+"\" name=\"INSURE_START_DATE\" size=\"11\" /> 到 "
						+" <input id=\"END_DATE"+sed+"\" name=\"INSURE_END_DATE\" size=\"11\" />";
	 row.appendChild(cell);
	  cell = row.insertCell(2); 
	 cell.align='center';
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"INSURE_RATE"+sed+"\" name=\"INSURE_RATE\" size=\"4\">%";
	 row.appendChild(cell);
	  cell = row.insertCell(3); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input class=\"input_right\" onchange=\"changeField('INSURE_PRICE',this);\"  id=\"INSURE_PRICE"+sed+"\" name=\"INSURE_PRICE\" size=\"15\">";
	 row.appendChild(cell);
	 cell = row.insertCell(4); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"INSURE_MEMO"+sed+"\"  name=\"INSURE_MEMO\" size=\"25\">";
	 row.appendChild(cell);
	 cell = row.insertCell(5); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteInsureItemRow.call(this)\">删除</a>"
	 	+"<input type=\"hidden\" name=\"RECI_ID\" value=\"0\" id=\"RECI_ID"+sed+"\">";
	 row.appendChild(cell);			
		}
	});
	



}
function deleteInsureItemRow(){
    var tr = this.parentNode.parentNode;
    tr.parentNode.removeChild(tr); 
    //changeInsureTotal();
    changeField('INSURE_PRICE');
} 


function submitPayForm2() {
    //
    var form = document.payForm;
    // 保险公司
    if (form.INSURANCE_COMPANY_ID.value == 0) {
    	alert("请选择保险公司!");
    	form.INSURANCE_COMPANY_ID.focus();
    	return false;
    }
   
    var insureTab = document.getElementById("insureTab");
    if(insureTab.rows.length < 4){
		
    } else if (insureTab.rows.length == 4) {
    	if (form.INSURE_ITEM.value == 0) {
    		alert("请选择保险险种！");
    		return false;
    	}
    	if (blank(form.INSURE_START_DATE, '保险开始时间' )) {
    		return false;
    	}
    	if (blank(form.INSURE_END_DATE, '保险结束时间' )) {
    		return false;
    	}
    	if (positive(form.INSURE_RATE,'保险费率')) {
    		return false;
    	}
        if (positive(form.INSURE_PRICE, '保险费用')) {
            return false;
        }
    }else {
	    for (var i = 0; i < form.INSURE_ITEM.length; i++) {
	    	if (form.INSURE_ITEM[i].value == 0) {
	    		alert("请选择保险险种！");
	    		return false;
	    	}
	    	if (blank(form.INSURE_START_DATE[i], '保险开始时间' )) {
	    		return false;
	    	}
	    	if (blank(form.INSURE_END_DATE[i], '保险结束时间' )) {
	    		return false;
	    	}
	    	if (positive(form.INSURE_RATE[i],'保险费率')) {
	    		return false;
	    	}
	        if (positive(form.INSURE_PRICE[i], '保险费用')) {
	            return false;
	        }
	    }
    }

    return true;
} 


function updateCompanyId() {
	var checkValue=$("#INSURANCE_COMPANY_ID").val();
	$("#INSURANCE_COMPANY_ID2").val(checkValue);
	var selectLength=document.getElementsByName("INSURE_ITEM");	
	for(var j=0;j<selectLength.length;j++){  
	    selectLength[j].options.length=0; 
	}	
	    $.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePayMoney.getComTypeById&INCP_ID='+$("#INSURANCE_COMPANY_ID2").val(),
		dataType:'json',
		success: function(dataBack){ 
		var selectLength=document.getElementsByName("INSURE_ITEM");	
			for(var j=0;j<selectLength.length;j++){	
						for(i=0;i<dataBack.insureTypeList.length;i++){
					 	$(selectLength[j]).get(0).options.add(new Option(dataBack.insureTypeList[i].INTP_NAME,dataBack.insureTypeList[i].INTP_ID));
					}	
			}		
		}
	});		 
  }