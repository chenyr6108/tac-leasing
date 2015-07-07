
$(function () {
	$("input[name='leave_price']").each(function (i) {
		if ($(this).val() <= 0.004) {
			$("td", $(this).parent().parent()[0]).css("color", "#009900");
		}
	});
	$dunRent = {showDunList:function (code,custid) {
	
		$("#showDunListTable" + code).toggle(function () {
			var start_date=$("input[name='start_date']").val();
			var end_date=$("input[name='end_date']").val();
			var content=$("input[name='content']").val();
			$(this).load("../servlet/defaultDispatcher?__action=dunRent.getDunRentInfoByCustCode&cust_code=" + code+"&start_date="+start_date+"&end_date="+end_date+"&content="+content+"&cust_id="+custid);
		});
	  },
					addDunRecord:function(code,custid){
						
						if(blank(document.getElementById("ANSWERPHONE_NAME"+code),'接电话人')
						||blank(document.getElementById("PHONE_NUMBER"+code),'联系电话')
						||blank(document.getElementById("RESULT"+code),'催收结果')
						||blank(document.getElementById("CALL_CONTENT"+code),'简要记录')){
							return false;
						}
						var ANSWERPHONE_NAME=$("#ANSWERPHONE_NAME"+code).val(); 
						var PHONE_NUMBER=$("#PHONE_NUMBER"+code).val();
						var RESULT = jQuery("#RESULT"+code+"  option:selected").val();
						var CALL_CONTENT=$("#CALL_CONTENT"+code).val();
						var CALL_USER_ID=$("#CALL_USER_ID"+code).val();
						var CUST_CODE=code; 
						//请选择的code=5,所以加入以下判断!
						if(RESULT==5) {
							alert("请选择催收结果!");
							return false;
						}
						$("#showDunListTable"+code).html('<img src="../images/loading.gif">');
						$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=dunTask.addDunRecord&ANSWERPHONE_NAME='
						+ANSWERPHONE_NAME+'&PHONE_NUMBER='+PHONE_NUMBER+'&RESULT='+RESULT+'&CALL_CONTENT='+CALL_CONTENT
						+'&CUST_CODE='+CUST_CODE+'&clerk_id='+CALL_USER_ID,
						dataType:'json',
						success:function(dataBack){
							var start_date=$("input[name='start_date']").val();
							var end_date=$("input[name='end_date']").val();
							var content=$("input[name='content']").val();
							$("#showDunListTable"+code).load("../servlet/defaultDispatcher?__action=dunRent.getDunRentInfoByCustCode&cust_code=" + code+"&start_date="+start_date+"&end_date="+end_date+"&content="+content+"&cust_id="+custid);
						}
						});
					},
					deleteDunRecord:function(id,code,custid){
						if(confirm("确认删除？")){
							$("#showDunListTable"+code).html('<img src="../images/loading.gif">');
							$.ajax({
							type:'post',
							url:'../servlet/defaultDispatcher',
							data:'__action=dunTask.deleteDunRecord&dudr_id='+id,
							dataType:'json',
							success:function(dataBack){
								var start_date=$("input[name='start_date']").val();
								var end_date=$("input[name='end_date']").val();
								var content=$("input[name='content']").val();
								$("#showDunListTable"+code).load("../servlet/defaultDispatcher?__action=dunRent.getDunRentInfoByCustCode&cust_code=" + code+"&start_date="+start_date+"&end_date="+end_date+"&content="+content+"&cust_id="+custid);
							}
							})
						}
					},
derateFine:function(code){  
						var recp_id;
						check=$("input[name='recp_id"+code +"']");
						$.each(check,function(i,v){
							if(v.checked==true){
								recp_id=v.value;
							}
						});
						if(recp_id !=null){
							$.ajax({
								type:'post',
								dataType:'json',
								url:'../servlet/defaultDispatcher',
								data:'__action=dunTask.getDunInfoForDerateFine&recp_id='+recp_id,
								success:function(databack){
									$('#derateFineLeaseCode').html(databack.dunInfoMap.LEASE_CODE);
									$('#derateFinePaylistCode').html(databack.dunInfoMap.RECP_CODE);
									$('#derateFineShouldPayDate').html(databack.dunInfoMap.SHOULD_PAYDATE);
									$('#derateFineShouldPayPirce').html(databack.dunInfoMap.DUN_TOTALPRICE);
									$('#derateFineDunDay').html(databack.dunInfoMap.DUN_DAY);
									$('#derateFineDunPrice').html(databack.dunInfoMap.DUN_MONTHPRICE);
									$('#derateFineDunFine').html(databack.dunInfoMap.DUN_FINE);
									$('#derateFineDunFineRate').html(databack.dunInfoMap.DUN_FINEINTEREST); 
									$('#reduce_date').val(databack.dunInfoMap.REDUCE_DATE);
									$('#reduce_paylistId').val(databack.dunInfoMap.RECP_ID);
									$('#derateFineDialog').dialog({
										autoOpen: false,
										modal:true,
										width: 600
									});
									$('#derateFineDialog').dialog('open');
									$('#showlog').remove();
									return false;	  
								}
							});
						}else{
							alert("无支付表！");
						}
					},	
					updateDunFine_rate:function(value){ 
						var derateFineDunFine=$('#derateFineDunFine').html();
						if(derateFineDunFine!=""&&derateFineDunFine!=null){
							derateFineDunFine=parseFloat(derateFineDunFine);
							value=parseFloat(value);
						}
						$("input[name='dunFine']").val(derateFineDunFine*value/100);
					} ,
					updateDunFineRate_rate:function(value){ 
						var derateFineDunFineRate=$('#derateFineDunFineRate').html();
						if(derateFineDunFineRate!=""&&derateFineDunFineRate!=null){
							derateFineDunFineRate=parseFloat(derateFineDunFineRate);
							value=parseFloat(value);
						}
						$("input[name='dunFineRate']").val(derateFineDunFineRate*value/100);
					} ,
					updateDunFine:function(value){ 
						var derateFineDunFine=$('#derateFineDunFine').html();
						if(derateFineDunFine!=""&&derateFineDunFine!=null){
							derateFineDunFine=parseFloat(derateFineDunFine);
							value=parseFloat(value);
						}
						$("input[name='dunFine_rate']").val(Math.round(value*10000/derateFineDunFine)*0.01);
					} ,
					updateDunFineRate:function(value){ 
						var derateFineDunFineRate=$('#derateFineDunFineRate').html();
						if(derateFineDunFineRate!=""&&derateFineDunFineRate!=null){
							derateFineDunFineRate=parseFloat(derateFineDunFineRate);
							value=parseFloat(value);
						}
						$("input[name='dunFineRate_rate']").val(Math.round(value*10000/derateFineDunFineRate)*0.01);
					} ,				
					singleChecked:function(sel,name){
						check=$("input[name='"+name +"']");
						check.attr('checked',false);
						sel.checked=true;
					}, 
					saveDerate:function(){ 
							if($('#showlog').size()==0){  
							var derateFineShouldPayDate=$('#derateFineShouldPayDate').html();
							var derateFineShouldPayPirce=$('#derateFineShouldPayPirce').html();
							var	derateFineDunDay=$('#derateFineDunDay').html();
							var	derateFineDunPrice=$('#derateFineDunPrice').html();
							var derateFineDunFine=$('#derateFineDunFine').html(); 
							var apply_date=$('#apply_date').html(); 
							if(derateFineDunFine!=""&&derateFineDunFine!=null){
								derateFineDunFine=parseFloat(derateFineDunFine);
							}
							var derateFineDunFineRate=$('#derateFineDunFineRate').html();
							if(derateFineDunFineRate!=""&&derateFineDunFineRate!=null){
								derateFineDunFineRate=parseFloat(derateFineDunFineRate);
							} 
							if(valueIsNotPercent(document.derateForm.dunFine_rate,'罚金比例')||valueIsNotPercent(document.derateForm.dunFineRate_rate,'罚息比例')){
								return false;
							}
							document.derateForm.action='../servlet/defaultDispatcher?derateFineShouldPayDate='+derateFineShouldPayDate+
							'&derateFineShouldPayPirce='+derateFineShouldPayPirce+'&derateFineDunDay='+derateFineDunDay
							+'&derateFineDunPrice='+derateFineDunPrice+'&derateFineDunFine='+derateFineDunFine
							+'&derateFineDunFineRate='+derateFineDunFineRate+'&apply_date='+apply_date;
							document.derateForm.submit();
						}else{
							$('#showlog').html('当日不存在罚息!');
						}
					},
					sendMessge:function(recp_id){
						var recpId = document.getElementsByName("recp_id"+recp_id);

						var valueRecp = "";
						for(var i = 0; i<recpId.length;i++){
							if(recpId[i].checked){ //判断复选框是否选中
								valueRecp=recpId[i].value; //值的拼凑 .. 具体处理看你的需要,
							}
						}
						
						var linkManMobile = document.getElementsByName("mobileToMessage"+recp_id);//$('#mobileToMessage'+recp_id).val();
						var value = "";
						for(var i = 0; i<linkManMobile.length;i++){
							if(linkManMobile[i].checked){ //判断复选框是否选中
								value=value+linkManMobile[i].value + ","; //值的拼凑 .. 具体处理看你的需要,
							}
						}
						if(valueRecp!=""){
							if(value!=""){
								$.ajax({
								type:'post',
								url:'../servlet/defaultDispatcher',
								data:'__action=dunRent.sendMessage&recp_id='
								+valueRecp+'&linkManMobile='+value,
								dataType:'json',
								success:function(dataBack){
									alert(dataBack.returnStr);
								}
								});
							}else{
								alert("请选择联系人！");
							}
						}else{
							alert("请选择合同！");
						}
						
					}
	};
	
	 
	$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
 
 
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

// autocomplete选项
var options = {
	minChars : 1,
	max : 20,
	mustMatch: false,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.LINK_NAME;
		if (row.LINK_MOBILE != null && row.LINK_MOBILE.length > 0) {
			rs += "【" + row.LINK_MOBILE + "】";

		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.id + " " + row.LINK_NAME;
	},
	formatResult : function(row) {
		return row.LINK_NAME;
	}
};


function initAutoComplete(data) { 
	dataList = data.custLinkman;
	var linkCode = data.linkCode;
	$("#ANSWERPHONE_NAME"+linkCode).autocomplete(dataList, options);
	$("#ANSWERPHONE_NAME"+linkCode).result(function(event, data, formatted) {
				if(data!=null){
					$("#PHONE_NUMBER"+linkCode).val(data.LINK_MOBILE); 
				}	
			}); 	
} 

