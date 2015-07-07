function hideDelSpan(){
	var spans = document.getElementsByName("delSpan");
	var len = spans.length-1;
	for (var i=0;i<spans.length;i++){
		
		if (i != len){
			spans[i].style.display = 'none';
		} else {
			spans[i].style.display = 'block';
		}
	}
}

function addIrrMonthPriceRow(){
	$("#PAY_PLEDGE_LAST_PRICE").val(0);
	$("#PAY_PLEDGE_LAST_PERIOD").val(0);
	paylistchangeRZE();
	paylistchangePledgeRealPrice();
	var tab = document.getElementById("irrMonthPriceTab");
	var trs = tab.rows.length-1;
	
	var leasePeriod = getLeasePeriod();
	
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

	var tid = document.getElementById("irrMonthPriceTab");
	var row = tid.insertRow(trs+1);
	addCellIrrMonthPrice(row,0,'IRRMONTHPRICEWORD', null,null);	
	addCellIrrMonthPrice(row,1,'IRRMONTHPRICE',null,null);	
	addCellIrrMonthPrice(row,2,'STARTANDENDWORD',null,null);	
	addCellIrrMonthPrice(row,3,'STARTANDEND',value,null);
	addCellIrrMonthPrice(row,4,'DELSPAN',null,null);	
	
	hideDelSpan();
}

function addCellIrrMonthPrice(row, index, name,value,height){
	var sed = document.getElementById("irrMonthPriceTab").rows.length;
	var html='';
	var cell = row.insertCell(index); 
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	
	if (name == "IRRMONTHPRICEWORD") {
		html = html + "应付租金<font color=\"red\">&nbsp;*</font>";
	}
	if (name == "IRRMONTHPRICE"){
		html = html + '<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right" onchange="changeLastRentPrice();" style="width: 130px;" value="">';
	}
	if (name == "STARTANDENDWORD") {
		html = html + "对应期次";
	}
	if (name == "STARTANDEND" ){
		html = html + '第'
					+'<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="'+value+'" readonly="readonly" style="width: 30px;text-align: center;">'
					+'期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">';
		for (var i=1;i<=getLeasePeriod();i++){
			if (i==value){
				html = html + '<option value="'+i+'" selected="selected">'+i+'</option>'
			} else {
				html = html + '<option value="'+i+'">'+i+'</option>'
			}
		}
		
		html = html + '</select>期';
	}
	if (name == "DELSPAN"){
		html = html + '<span name="delSpan" style="display: block;"><input type="button" name="delBut" onclick="deleteIrrMonthPriceRow.call(this)" value="删 除" class="ui-state-default ui-corner-all"></span>'
	}
	
	if (height != null) {
		cell.height = height;
	}
	cell.innerHTML =html;
	row.appendChild(cell);
	return;
}

function deleteIrrMonthPriceRow(){
	$("#PAY_PLEDGE_LAST_PRICE").val(0);
	$("#PAY_PLEDGE_LAST_PERIOD").val(0);
	paylistchangeRZE();
	paylistchangePledgeRealPrice();
   var tr = this.parentNode.parentNode.parentNode;
   tr.parentNode.removeChild(tr); 
   hideDelSpan();
}
function valueIsNumberIrrMonth(value) {
    // value = value.trim();
    value = value.replace(/(^\s*)|(\s*$)/g, "");
    var m=/^(\d)+$/;
    if(value.match(m)) {
        return value;
    } else {
        return 0;
    }
}
function getLeasePeriod() {
	var leasePeriod = valueIsNumberIrrMonth(document.getElementById("PAY_LEASE_PERIOD").value);
	return Number(leasePeriod);
}

function changeIrrMonthPriceEnd(obj) {

	var thisVal = Number(obj.value);
	var preVal = Number(obj.previousSibling.previousSibling.value);
	
	var leasePeriod = getLeasePeriod();
	
	var tab = document.getElementById("irrMonthPriceTab");
	var trs = tab.rows.length -1 ;
	if (thisVal == leasePeriod){
		// 删除下面的所有
		var rowIndex = obj.parentNode.parentNode.rowIndex;
		for (var i=trs;i>rowIndex;i--){
			tab.deleteRow(i);
		}
		hideDelSpan();
		
	} else if (thisVal > leasePeriod) {
		obj.value = leasePeriod;
	} else if (thisVal < preVal) {
		obj.value = preVal;
	} 
	// change
	balanceIrrMonth();
	
}
function balanceIrrMonth(){

	var tab = document.getElementById("irrMonthPriceTab");
	var trs = tab.rows.length;
	var lastVal = 1;
	for (var i=1;i<trs;i++){

		var tr = tab.rows[i];
		if (i==1){
			lastVal = Number($(tr).find("select").val());
		} else {
			thisSVal = Number($(tr).find("input[name='PAY_IRR_MONTH_PRICE_START']").val()); 	
			thisEVal = Number($(tr).find("select").val());
			thisFar = Number(thisEVal - thisSVal);
			if (lastVal >= thisEVal) {
				$(tr).find("input[name='PAY_IRR_MONTH_PRICE_START']").val(lastVal+1);
				$(tr).find("select").val(lastVal+1)
			} else {
				$(tr).find("input[name='PAY_IRR_MONTH_PRICE_START']").val(lastVal+1);
				
			}
			
			if ($(tr).find("input[name='PAY_IRR_MONTH_PRICE_START']").val() == getLeasePeriod()) {
				$(tr).find("select").val(getLeasePeriod())
				var rowIndex = tr.rowIndex;
				for (var j=trs-1;j>rowIndex;j--){
					tab.deleteRow(j);
				}
				hideDelSpan();
				break;
			} 
			
			
			lastVal = Number($(tr).find("select").val());
		}
	}
}