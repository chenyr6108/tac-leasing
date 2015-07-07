function hideDelSpanTab1(){
	var spans = document.getElementsByName("delSpanTab1");
	var len = spans.length-1;
	for (var i=0;i<spans.length;i++){
		
		if (i != len){
			spans[i].style.display = 'none';
		} else {
			spans[i].style.display = 'block';
		}
	}
}

function addIrrMonthPriceRowTab1(){
	$("#PLEDGE_LAST_PERIOD").val(0);
	$("#PLEDGE_LAST_PRICE").val(0);
	updateLeaseRZE();
	updatePledgeRealPrice();
	
	var tab = document.getElementById("irrMonthPriceTabTab1");
	var trs = tab.rows.length-1;
	
	var leasePeriod = getLeasePeriodTab1();
	
	var value =1;
	if (trs>0){
		var lastTr = tab.rows[trs];
		var lastVal = $(lastTr).find("select").val();
		if (lastVal >= leasePeriod) {
			alert("上一结束期次已经到达租赁期数的最大值！");
			return ;
		} else {
			value = Number(lastVal) + 1;
		}
	}

	var tid = document.getElementById("irrMonthPriceTabTab1");
	var row = tid.insertRow(trs+1);
	addCellIrrMonthPriceTab1(row,0,'IRRMONTHPRICEWORD', null,null);	
	addCellIrrMonthPriceTab1(row,1,'IRRMONTHPRICE',null,null);	
	addCellIrrMonthPriceTab1(row,2,'STARTANDENDWORD',null,null);	
	addCellIrrMonthPriceTab1(row,3,'STARTANDEND',value,null);
	addCellIrrMonthPriceTab1(row,4,'DELSPAN',null,null);	
	
	hideDelSpanTab1();
}

function addCellIrrMonthPriceTab1(row, index, name,value,height){
	var sed = document.getElementById("irrMonthPriceTabTab1").rows.length;
	var html='';
	var cell = row.insertCell(index); 
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	
	if (name == "IRRMONTHPRICEWORD") {
		html = html + "应付租金<font color=\"red\">&nbsp;*</font>";
	}
	if (name == "IRRMONTHPRICE"){
		html = html + '<input type="text"  name="PAY_IRR_MONTH_PRICE_TAB1" onchange="changeSchemaLastRentPrice();" class="input_right" style="width: 130px;">';
	}
	if (name == "STARTANDENDWORD") {
		html = html + "对应期次";
	}
	if (name == "STARTANDEND" ){
		html = html + '第'
					+'<input type="text" name="PAY_IRR_MONTH_PRICE_START_TAB1" value="'+value+'" readonly="readonly" style="width: 30px;text-align: center;">'
					+'期到第<select name="PAY_IRR_MONTH_PRICE_END_TAB1" onchange="changeIrrMonthPriceEndTab1(this);">';
		for (var i=1;i<=getLeasePeriodTab1();i++){
			if (i==value){
				html = html + '<option value="'+i+'" selected="selected">'+i+'</option>'
			} else {
				html = html + '<option value="'+i+'">'+i+'</option>'
			}
		}
		
		html = html + '</select>期';
	}
	if (name == "DELSPAN"){
		html = html + '<span name="delSpanTab1" style="display: block;"><input type="button" name="delBut1" onclick="deleteIrrMonthPriceRowTab1.call(this)" value="删 除" class="ui-state-default ui-corner-all"></span>'
	}
	
	if (height != null) {
		cell.height = height;
	}
	cell.innerHTML =html;
	row.appendChild(cell);
	return;
}

function deleteIrrMonthPriceRowTab1(){
	$("#PLEDGE_LAST_PERIOD").val(0);
	$("#PLEDGE_LAST_PRICE").val(0);
	updateLeaseRZE();
	updatePledgeRealPrice();
   var tr = this.parentNode.parentNode.parentNode;
   tr.parentNode.removeChild(tr); 
   hideDelSpanTab1();
}
function valueIsNumberIrrMonthTab1(value) {
    // value = value.trim();
    value = value.replace(/(^\s*)|(\s*$)/g, "");
    var m=/^(\d)+$/;
    if(value.match(m)) {
        return value;
    } else {
        return 0;
    }
}
function getLeasePeriodTab1() {
	var leasePeriod = valueIsNumberIrrMonthTab1(document.getElementById("LEASE_TERM").value);
	return Number(leasePeriod);
}

function changeIrrMonthPriceEndTab1(obj) {
	var thisVal = Number(obj.value);
	var preVal = Number(obj.previousSibling.previousSibling.value);
	
	var leasePeriod = getLeasePeriodTab1();
	
	var tab = document.getElementById("irrMonthPriceTabTab1");
	var trs = tab.rows.length -1 ;
	if (thisVal == leasePeriod){
		// 删除下面的所有
		var rowIndex = obj.parentNode.parentNode.rowIndex;
		for (var i=trs;i>rowIndex;i--){
			tab.deleteRow(i);
		}
		hideDelSpanTab1();
		
	} else if (thisVal > leasePeriod) {
		obj.value = leasePeriod;
	} else if (thisVal < preVal) {
		obj.value = preVal;
	} 
	// change
	balanceIrrMonthTab1();
	
}
function balanceIrrMonthTab1(){

	var tab = document.getElementById("irrMonthPriceTabTab1");
	var trs = tab.rows.length;
	var lastVal = 1;
	for (var i=1;i<trs;i++){

		var tr = tab.rows[i];
		if (i==1){
			lastVal = Number($(tr).find("select").val());
		} else {
			thisSVal = Number($(tr).find("input[name='PAY_IRR_MONTH_PRICE_START_TAB1']").val()); 	
			thisEVal = Number($(tr).find("select").val());
			thisFar = Number(thisEVal - thisSVal);
			if (lastVal >= thisEVal) {
				$(tr).find("input[name='PAY_IRR_MONTH_PRICE_START_TAB1']").val(lastVal+1);
				$(tr).find("select").val(lastVal+1)
			} else {
				$(tr).find("input[name='PAY_IRR_MONTH_PRICE_START_TAB1']").val(lastVal+1);
				
			}
			
			if ($(tr).find("input[name='PAY_IRR_MONTH_PRICE_START_TAB1']").val() == getLeasePeriodTab1()) {
				$(tr).find("select").val(getLeasePeriodTab1())
				var rowIndex = tr.rowIndex;
				for (var j=trs-1;j>rowIndex;j--){
					tab.deleteRow(j);
				}
				hideDelSpanTab1();
				break;
			} 
			
			
			lastVal = Number($(tr).find("select").val());
		}
	}

}

