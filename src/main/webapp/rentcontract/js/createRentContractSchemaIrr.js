// 添加一行
function addIrrMonthPriceRow(){
	var lease_period = $.trim($("#LEASE_PERIOD").val());
	if(lease_period==''){
		alert("请填写期数!");
		return false;
	}
	var lastVal = $("#irrMonthPriceTab tr:last").find("select").val();
	var value =1;

	if(lastVal==undefined){
		lastVal=0;
	}

	if(Number(lastVal) >= Number(lease_period)){
		alert("上一结束期次已经到达租赁期数的最大值！");
		return false;
	} else {
		value = Number(lastVal) + 1;
	}

	var html = "<tr><td class='ui-widget-content jqgrow ui-row-ltr'>未税应付租金<font color=red>&nbsp;*</font></td>"+
			   "<td style='text-align: left;' class='ui-widget-content jqgrow ui-row-ltr'>"+
			   "<input type='text' name='PAY_IRR_MONTH_PRICE' class='input_right' style='width: 130px;'></td>"+
			   "<td class='ui-widget-content jqgrow ui-row-ltr'>对应期次</td>"+
			   "<td style='text-align: left;' class='ui-widget-content jqgrow ui-row-ltr'>"+
			   "第<input type='text' name='PAY_IRR_MONTH_PRICE_START' value='"+value+"' readonly='readonly' style='width: 30px;text-align: center;'>"+
			   "期到第<select name='PAY_IRR_MONTH_PRICE_END' onchange='changeIrrMonthPriceEnd(this);'></select>期"+
			   "<td style='text-align: left;' class='ui-widget-content jqgrow ui-row-ltr'>"+
			   "<span name='delSpan' style='display:block;'>"+
			   "<a href='javascript:void(0);' onclick='delRow(this);'>删除</a>"+
			   "</tr>";
	$("#irrMonthPriceTab").append(html);
	
	for(i=0;i<lease_period;i++){
		$("#irrMonthPriceTab tr:last").find("select").get(0).options.add(new Option(i+1,i+1));
	}
	$("#irrMonthPriceTab tr:last").find("select").val(lease_period);
	hideDelSpan();
}

// 删除行
function delRow(th){
	$(th).parent().parent().parent().remove();
	hideDelSpan();
}
// 隐藏删除按钮
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

changePayIrrMonthPriceEnd = function(){

var form = document.schemeForm;
valueIsNumberPaylistLink(form.LEASE_TERM);
var lease_period = form.LEASE_TERM.value;
 
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
function changeIrrMonthPriceEnd(obj) {

	var thisVal = Number(obj.value);
	var preVal = Number(obj.previousSibling.previousSibling.value);
	
	var leasePeriod = getLeasePeriod();
	
	var tab = document.getElementById("irrMonthPriceTab");
	var trs = tab.rows.length -1 ;
	if (thisVal == leasePeriod){
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
function getLeasePeriod() {
	var leasePeriod = valueIsNumberIrrMonth(document.getElementById("LEASE_PERIOD").value);
	return Number(leasePeriod);
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
