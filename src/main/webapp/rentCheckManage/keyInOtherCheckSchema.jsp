<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">	
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

function addCheckPaylines(){

	var tab = document.getElementById("checkPayTab");
	var trs = tab.rows.length-1;
	var leasePeriod = getLeasePeriodTab1();
	var value =1;
	if (trs>0){
		var lastTr = tab.rows[trs];
		var lastVal = $(lastTr).find("select[name='CHECK_PAY_END']").val();
		if (lastVal >= leasePeriod) {
			alert("上一结束期次已经到达租赁期数的最大值！");
			return ;
		} else {
			value = Number(lastVal) + 1;
		}
	}
	var tid = document.getElementById("checkPayTab");
	var row = tid.insertRow(trs+1);
	addCellIrrMonthPriceTab1(row,0,'STARTANDENDWORD',null,null);	
	addCellIrrMonthPriceTab1(row,1,'STARTANDEND',value,null);
	addCellIrrMonthPriceTab1(row,2,'DELSPAN',null,null);	
	
	hideDelSpanTab1();
}

function addCellIrrMonthPriceTab1(row, index, name,value,height){
	var sed = document.getElementById("checkPayTab").rows.length;
	var html='';
	var cell = row.insertCell(index); 
	cell.className = "ui-widget-content jqgrow ui-row-ltr";

	if (name == "STARTANDENDWORD") {
		html = html + "对应期次";
	}
	if (name == "STARTANDEND" ){
		html = html + '第'
					+'<select name="CHECK_PAY_START" onchange="changeIrrMonthPriceStrat(this);">';
					for (var i=1;i<=getLeasePeriodTab1();i++){
						if (i==value){
							html = html + '<option value="'+i+'" selected="selected">'+i+'</option>'
						} else {
							html = html + '<option value="'+i+'">'+i+'</option>'
						}
					}
					html = html + '</select>期' 
					/* + '<input type="text"  name="CHECK_PAY_START" onchange="changeIrrMonthPriceStrat(this);" style="width: 130px;" value="">' */
					+'期到第<select name="CHECK_PAY_END" onchange="changeIrrMonthPriceEndTab1(this);">';
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
   var tr = this.parentNode.parentNode.parentNode;
   tr.parentNode.removeChild(tr); 
   hideDelSpanTab1();
}

function changeIrrMonthPriceStrat(obj){
	var thisVal = Number(obj.value);
	var preVal = Number(obj.nextSibling.nextSibling.value);

	var leasePeriod = getLeasePeriodTab1();

 	var tab = document.getElementById("checkPayTab");
	var trs = tab.rows.length -1 ;

	if (thisVal == leasePeriod){
		// 删除下面的所有
		var rowIndex = obj.parentNode.parentNode.rowIndex;
		for (var i=trs;i>rowIndex;i--){
			tab.deleteRow(i);
		}
		obj.value=thisVal;
		obj.nextSibling.nextSibling.value=thisVal;
		hideDelSpanTab1();
		
	} else if (thisVal > leasePeriod) {
		obj.value = leasePeriod;
		balanceIrrMonthTab1();
	} else if (thisVal > preVal) {
		obj.nextSibling.nextSibling.value=thisVal;
		balanceIrrMonthTab1();
	}else{
		obj.value=thisVal;
		balanceIrrMonthTab1();
	}  
	
}

function changeIrrMonthPriceEndTab1(obj) {
	var thisVal = Number(obj.value);
	var preVal = Number(obj.previousSibling.previousSibling.value);
	var leasePeriod = getLeasePeriodTab1();
	
	var tab = document.getElementById("checkPayTab");
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

function balanceIrrMonthTab1(){

	var tab = document.getElementById("checkPayTab");
	var trs = tab.rows.length;
	var lastVal = 1;
	for (var i=1;i<trs;i++){

		var tr = tab.rows[i];
		if (i==1){
			lastVal = Number($(tr).find("select[name='CHECK_PAY_END']").val());
		} else {
			thisSVal = Number($(tr).find("select[name='CHECK_PAY_START']").val()); 	
			thisEVal = Number($(tr).find("select[name='CHECK_PAY_END']").val());
			thisFar = Number(thisEVal - thisSVal);
			if (lastVal >= thisEVal) {
				$(tr).find("select[name='CHECK_PAY_START']").val(lastVal+1);
				$(tr).find("select[name='CHECK_PAY_END']").val(lastVal+1);
			} else {
				$(tr).find("select[name='CHECK_PAY_START']").val(lastVal+1);
			}
			
			if ($(tr).find("select[name='CHECK_PAY_START']").val() == getLeasePeriodTab1()) {
				$(tr).find("select[name='CHECK_PAY_END']").val(getLeasePeriodTab1());
				var rowIndex = tr.rowIndex;
				for (var j=trs-1;j>rowIndex;j--){
					tab.deleteRow(j);
				}
				hideDelSpanTab1();
				break;
			} 
			
			
			lastVal = Number($(tr).find("select[name='CHECK_PAY_END']").val());
		}
	}
}

	function saveRentCheckSchema(){
		alert("确定要录入！");
		$("#checkPayForm").submit();
	}

</script>
<form name="checkPayForm" id="checkPayForm" method="POST"  action="../servlet/defaultDispatcher?__action=rentContract.createRentCheckSchema">
	<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
				客户名称：${CUST_NAME }
			</td>
		</tr>
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
				合同号：${LEASE_CODE }
			</td>
		</tr>
	</table>
<table id="checkPayTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
<tr>
	<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
		<b style="font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增加支票还款期数</b>&nbsp;<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addCheckPaylines();">添加</a>
	</td>
</tr>
<input type="hidden" id="LEASE_TERM" name="LEASE_TERM" value="${schemaMap.LEASE_TERM }"/>&nbsp;
<input type="hidden" id="credit_id" name="credit_id" value="${schemaMap.CREDIT_ID }"/>

<c:forEach var="item" items="${checkSchemaList}" varStatus="status">
	<tr>
		<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			对应期次
		</td>
		<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<%-- 第<input type="text" size="5" name="CHECK_PAY_START" value="${item.CHECK_START}" disabled/>期到第<input type="text" size="5" name="CHECK_PAY_END" value="${item.CHECK_END}" disabled/>期 --%>
			第<select name="CHECK_PAY_START" disabled>
				<c:forEach begin="1" end="${schemaMap.LEASE_TERM}" var="item1" step="1">
					<option value="${item1 }" <c:if test="${item.CHECK_START eq item1}">selected="selected"</c:if>>${item1 }</option>
				</c:forEach></select>期到第<select name="CHECK_PAY_END" disabled>
				<c:forEach begin="1" end="${schemaMap.LEASE_TERM}" var="item1" step="1">
					<option value="${item1 }" <c:if test="${item.CHECK_END eq item1}">selected="selected"</c:if>>${item1 }</option>
				</c:forEach></select>期
		</td>
		<td style="text-align: left;height: 24px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			&nbsp;
		</td>
	</tr>
</c:forEach>
</table>
<center>
	<input class="ui-state-default ui-corner-all" style="cursor: pointer;" type="button" name="subbut" value="保  存" onclick="saveRentCheckSchema();">
</center>	
</form>