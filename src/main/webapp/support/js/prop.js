function addNewG(){
	 var chil =$("#gradeCon");	
	 chil.prepend("<tr><input type='hidden' value='0' name='ID'><td height='26px' style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'> <input type='text' name='ADJUST_TIME' readonly='readonly'> </td>"
							+"<td style='text-align:center' height='26px' class='ui-widget-content jqgrow ui-row-ltr'> <input type='text'name='SIX_MONTHS'style='width:60px;'  > % </td>"
						 	+"<td style='text-align:center' height='26px'  class='ui-widget-content jqgrow ui-row-ltr'><input type='text'name='ONE_YEAR'style='width:60px;'  > %</td>"
							+"<td style='text-align:center' height='26px'  class='ui-widget-content jqgrow ui-row-ltr'> <input type='text'   style='width:60px' name='ONE_THREE_YEARS'   > %</td>"
							+"<td style='text-align:center' height='26px' class='ui-widget-content jqgrow ui-row-ltr'> <input type='text'   style='width:60px;' name='THREE_FIVE_YEARS'> %</td>"
							+"<td style='text-align:center' height='26px' class='ui-widget-content jqgrow ui-row-ltr'> <input type='text'   style='width:60px;' name='OVER_FIVE_YEARS'> %</td>"
							+"<td height='26px' class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;&nbsp;  <input type='text'   style='width:250px;' name='REMARK'></td>"
							+"<td width='7%'  height='26px' class='ui-widget-content jqgrow ui-row-ltr'><input type='button'  style='text-align:right;'  class='ui-state-default ui-corner-all' name='delTrr'  value='删除此行'  onclick='delTr(this,'0');' ></td></tr>"						
	);
	$("input[name='ADJUST_TIME']").datepicker($.datepicker.regional['zh-CN']);	
}


//事件添加
function delTr(th,id){
	if(confirm("确认删除本行记录？")){	
	$(th).parent().parent().remove();
		if(id!=0){
			location.href='../servlet/defaultDispatcher?__action=supportCreditReportDelete.deleteProp&id='+id;
		}
	}	
}  
//保存与验证  standard
	function savegrade(){
	 	$("#gradeCon :input[name='ADJUST_TIME']").each(function(){
				if( $(this).val().length == 0  ){
					alert("时间不能有空！！ 请填写完整，或者删除多余空项。");
					 $(this).focus();
					return false;				 
				}
		})			
		$("#gradeCon :input[name='SIX_MONTHS']").each(function(){
				if( $(this).val().length == 0  ){
					alert("利率不能有空！！ 请填写完整，或者删除多余空项。");
					$(this).focus();
					return false ;
				}
		})		
		$("#gradeCon :input[name='ONE_YEAR']").each(function(){
				if( $(this).val().length == 0  ){	
					alert("利率不能有空！！ 请填写完整，或者删除多余空项。");
					$(this).focus();
					return false ;
				}
		})			
		$("#gradeCon :input[name='ONE_THREE_YEARS']").each(function(){
				if( $(this).val().length == 0  ){		
					alert("利率不能有空！！ 请填写完整，或者删除多余空项。");
					$(this).focus();
					return false ;
				}		 
		})		
		$("#gradeCon :input[name='THREE_FIVE_YEARS']").each(function(){
				if( $(this).val().length == 0  ){	
					alert("利率不能有空！！ 请填写完整，或者删除多余空项。");
					$(this).focus();
					return false ;
				}
		})		
		$("#gradeCon :input[name='OVER_FIVE_YEARS']").each(function(){
				if( $(this).val().length == 0  ){				
					alert("利率不能有空！！ 请填写完整，或者删除多余空项。");
					$(this).focus();
					return false ;
				}
		});
	$("#__action").val("supportCreditReportDelete.updateProp");	
	$("#form1").submit();
	}  