// 修改值
function changeValue(id,filed_name,show_name,rate_value,th,back_value_id,TAX_PLAN_CODE){
	var back_value = $("#"+back_value_id).val();
	if(checkBlank(trimStr(th.value))){
		alert("利率值不能为空!");
		$(th).val(back_value);
		$(th).focus();
		return false;
	} else if(!valueIsDouble(th.value)){
		alert("利率值不是正确数字!");
		$(th).val(back_value);
		$(th).focus();
		return false;
	}
	$("#"+back_value_id).val(th.value);
	//var url = "../servlet/defaultDispatcher?__action=moneyRate.updateMoneyRateByRateValue&id="+id+"&rate_value="+th.value+"&filed_name="+filed_name+"&show_name="+show_name+"&rate_valueOld="+rate_value;
	
	//$.getJSON(url);
	
	
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=moneyRate.updateMoneyRateByRateValue&id='+id+'&rate_value='+th.value+'&filed_name='+filed_name+'&show_name='+show_name+'&rate_valueOld='+rate_value+'&TAX_PLAN_CODE='+TAX_PLAN_CODE,
		dataType:'json',
		async: false,
		success: function(dataBack){		
//				<!--$.ajax({
//					type:"post",
//					url:'../servlet/defaultDispatcher',
//					data:'__action=moneyRate.getShow',
//					dataType:'json',
//					async: false,
//					success: function(back1){	
//			
//					},
//					error:function(back2){
//					alert("error!");
//					return;
//			});-->
			
			location.href='../servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE='+TAX_PLAN_CODE;
			

		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
}
// 修改备注
function changeRemark(id,th){
	var url = "../servlet/defaultDispatcher?__action=moneyRate.updateMoneyRateByRemark&id="+id+"&remark="+th.value;
	$.getJSON(url);
}