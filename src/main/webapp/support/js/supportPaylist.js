$(function(){
	$("input[id^=paylistsubmintButton]").attr('disabled','disabled')
	$("#rentContractsubmintButton1").attr('disabled','disabled')
	
	
		
	
})

function submitNum(numid,id,infoback){
     var num=$.trim($("#"+numid).val())
	 var flag = true
	 if(!(num.length == 0)){
	 	
		if(flag){
			
			$.ajax({
			type: 'post',
			url: '../servlet/defaultDispatcher ',
			data: {'__action':'supportPaylist.queryPaylistInfo','num':num},
			dataType: "json",
			
				success : function(json){
					$("#"+infoback).empty()
					var payList = json.payList
					
					if(payList.length >0){

						var i=0
					
							$("#"+infoback).append("<tr><td > <font color='blue' size='14'> 最近修改人: "+payList[i].NAME +"</font></td><td > <font color='blue' size='14'>支付表状态 :"+payList[i].STATUS +"</font></td><td> <font color='blue' size='14'>版本 :"+payList[i].VERSION_CODE +"</font></td><td ><font color='blue' size='14'> 起租日期 :"+payList[i].START_DATE +"</font></td><td > <font color='blue' size='14'>结束日期 :"+payList[i].END_DATE +"</font></td><td > <font color='blue' size='14'> 资产状态 :"+payList[i].ASSET_STATUS +"</font></td><td><font color='blue' size='14'>资金状态 :"+payList[i].FUND_STATUS+"</font></td><td ><font color='blue' size='14'>异常状态 :"+payList[i].WARN_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].RECPSYMBOL+"</font></td></tr>")
							
							$("#"+id).attr('disabled','')
					}else{
						
						$("#"+infoback).append(" <tr><td style='hieght:50px' > <font color='red'> "+ json.payMap.msg +"</font></td></tr>")
						$("#"+id).attr('disabled','disabled')
					}
					
				},
				error : function(){
					$("#"+infoback).empty()
					$("#"+infoback).append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
					$("#"+id).attr('disabled','disabled')
				}
			});
		}
		
	 }
	
}
function submitNum1(){
     var num=$.trim($("#payListinfoNum1").val())
	 var flag = true
	 if(!(num.length == 0)){
	 	
		
		
		if(flag){
			
			$.ajax({
			type: 'post',
			url: '../servlet/defaultDispatcher ',
			//data: {'__action':'supportPaylist.queryPaylistInfo','num':num},
			data: {'__action':'supportPaylist.deleteDate','num':num},
			dataType: "json",
			
				success : function(json){
					$("#payListinfoBack1").empty()
					var payList = json.payList
					
					
					if(payList.length >0){
						$("#payListinfoBack1").append("<tr><td>最近修改人 </td><td> STATUS状态 0 正常 -1 作废 -2删除 </td><td> VERSION_CODE版本号 </td><td>START_DATE起租日期  </td><td> END_DATE结束日期 </td><td> ASSET_STATUS资产状态 0正常 1融资 2保理 </td><td> FUND_STATUS资金状态 0正常 1正常结清 2提前结清 3回购 </td><td> WARN_STATUS异常状态 0正常 2转法务 </td><td> STAS </td><td> PAY_DATE支付日期 </td><td> DUN_STATUS催收状态 </td><td>  REDUCE_STATUS分解状态</td><td>PASSED是否已支付  </td><td> REDUCE_OWN_PRICE已分解本金 </td><td >LOCKED 0等额  1不等额</td></tr>")

						for(var i=0;i<payList.length;i++){
					
							$("#payListinfoBack1").append("<tr><td > <font color='blue' size='14'>"+payList[i].NAME +"</font></td><td > <font color='blue' size='14'>"+payList[i].STATUS +"</font></td><td> <font color='blue' size='14'>"+payList[i].VERSION_CODE +"</font></td><td ><font color='blue' size='14'>"+payList[i].START_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].END_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].ASSET_STATUS +"</font></td><td><font color='blue' size='14'>"+payList[i].FUND_STATUS+"</font></td><td ><font color='blue' size='14'>"+payList[i].WARN_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].STAS+"</font></td><td ><font color='blue' size='14'>"+payList[i].PAY_DATE+"</font></td><td > <font color='blue' size='14'>"+payList[i].DUN_STATUS+"</font></td><td > <font color='blue' size='14'>"+payList[i].REDUCE_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].PASSED+"</font></td><td><font color='blue' size='14'>"+payList[i].REDUCE_OWN_PRICE+"</font></td><td ><font color='blue' size='14'>"+payList[i].LOCKED+"</font></td></tr>")
						} 
					}
					
				},
				error : function(){
					$("#payListinfoBack1").empty()
					$("#payListinfoBack1").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
				}
			});
		}
		
	 }
	
}

function submitNum2(){
     var num=$.trim($("#payListinfoNum2").val())
	 var flag = true
	 if(!(num.length == 0)){
	 	
		
		
		if(flag){
			
			$.ajax({
			type: 'post',
			url: '../servlet/defaultDispatcher ',
			data: {'__action':'supportPaylist.deleteDate','num':num},
			dataType: "json",
			
				success : function(json){
					$("#payListinfoBack2").empty()
					var payList = json.payList
					
					
					if(payList.length >0){
						$("#payListinfoBack2").append("<tr><td>最近修改人 </td><td> STATUS状态 0 正常 -1 作废 -2删除 </td><td> VERSION_CODE版本号 </td><td>START_DATE起租日期  </td><td> END_DATE结束日期 </td><td> ASSET_STATUS资产状态 0正常 1融资 2保理 </td><td> FUND_STATUS资金状态 0正常 1正常结清 2提前结清 3回购 </td><td> WARN_STATUS异常状态 0正常 2转法务 </td><td> STAS </td><td> PAY_DATE支付日期 </td><td> DUN_STATUS催收状态 </td><td>  REDUCE_STATUS分解状态</td><td>PASSED是否已支付  </td><td> REDUCE_OWN_PRICE已分解本金 </td><td >LOCKED 0等额  1不等额</td></tr>")

						for(var i=0;i<payList.length;i++){
					
							$("#payListinfoBack2").append("<tr><td > <font color='blue' size='14'>"+payList[i].NAME +"</font></td><td > <font color='blue' size='14'>"+payList[i].STATUS +"</font></td><td> <font color='blue' size='14'>"+payList[i].VERSION_CODE +"</font></td><td ><font color='blue' size='14'>"+payList[i].START_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].END_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].ASSET_STATUS +"</font></td><td><font color='blue' size='14'>"+payList[i].FUND_STATUS+"</font></td><td ><font color='blue' size='14'>"+payList[i].WARN_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].STAS+"</font></td><td ><font color='blue' size='14'>"+payList[i].PAY_DATE+"</font></td><td > <font color='blue' size='14'>"+payList[i].DUN_STATUS+"</font></td><td > <font color='blue' size='14'>"+payList[i].REDUCE_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].PASSED+"</font></td><td><font color='blue' size='14'>"+payList[i].REDUCE_OWN_PRICE+"</font></td><td ><font color='blue' size='14'>"+payList[i].LOCKED+"</font></td></tr>")
						} 
					}
					
				},
				error : function(){
					$("#infoBack").empty()
					$("#infoBack").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
				}
			});
		}
		
	 }
	
}
function submitNum3(){
     var num=$.trim($("#payListinfoNum3").val())
	 var flag = true
	 if(!(num.length == 0)){
	 	
		
		
		if(flag){
			
			$.ajax({
			type: 'post',
			url: '../servlet/defaultDispatcher ',
			
			data:{'__action':'supportPaylist.delpayList','num':num},
			
			dataType: "json",
			
				success : function(json){
					$("#payListinfoBack3").empty()
					var payList = json.payList
					
					
					if(payList.length >0){
						$("#payListinfoBack3").append("<tr><td>最近修改人 </td><td> STATUS状态 0 正常 -1 作废 -2删除 </td><td> VERSION_CODE版本号 </td><td>START_DATE起租日期  </td><td> END_DATE结束日期 </td><td> ASSET_STATUS资产状态 0正常 1融资 2保理 </td><td> FUND_STATUS资金状态 0正常 1正常结清 2提前结清 3回购 </td><td> WARN_STATUS异常状态 0正常 2转法务 </td><td> STAS </td><td> PAY_DATE支付日期 </td><td> DUN_STATUS催收状态 </td><td>  REDUCE_STATUS分解状态</td><td>PASSED是否已支付  </td><td> REDUCE_OWN_PRICE已分解本金 </td><td >LOCKED 0等额  1不等额</td></tr>")

						for(var i=0;i<payList.length;i++){
					
							$("#payListinfoBack3").append("<tr><td > <font color='blue' size='14'>"+payList[i].NAME +"</font></td><td > <font color='blue' size='14'>"+payList[i].STATUS +"</font></td><td> <font color='blue' size='14'>"+payList[i].VERSION_CODE +"</font></td><td ><font color='blue' size='14'>"+payList[i].START_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].END_DATE +"</font></td><td > <font color='blue' size='14'>"+payList[i].ASSET_STATUS +"</font></td><td><font color='blue' size='14'>"+payList[i].FUND_STATUS+"</font></td><td ><font color='blue' size='14'>"+payList[i].WARN_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].STAS+"</font></td><td ><font color='blue' size='14'>"+payList[i].PAY_DATE+"</font></td><td > <font color='blue' size='14'>"+payList[i].DUN_STATUS+"</font></td><td > <font color='blue' size='14'>"+payList[i].REDUCE_STATUS+"</font></td><td><font color='blue' size='14'>"+payList[i].PASSED+"</font></td><td><font color='blue' size='14'>"+payList[i].REDUCE_OWN_PRICE+"</font></td><td ><font color='blue' size='14'>"+payList[i].LOCKED+"</font></td></tr>")
						} 
					}
					
				},
				error : function(){
					$("#infoBack").empty()
					$("#infoBack").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
				}
			});
		}
		
	 }
	
}


function submitNum4(){
	var num = $.trim($("#rentContractnum1").val())
	var flag = true
	if (!(num.length == 0)) {
	
		if (flag) {
		
			$.ajax({
				type: 'post',
				url: '../servlet/defaultDispatcher',
				data: {'__action': 'supportPaylist.selectRentcontractMemo','num': num}, 
				dataType: "json",
				
				success: function(json){
					$("#rentContractInfo1").empty()
					var memoList = json.memoList
					
					
					if (memoList.length > 0) {
						$("#rentContractInfo1").append("<tr><td style='width : 150px'><strong>备注人</strong></td><td  style='width :200px' ><strong>时间</strong></td><td ><strong>备注</strong></td></tr>")
						
						for (var i = 0; i < memoList.length; i++) {
						
							$("#rentContractInfo1").append("<tr><td style='text-align:center'><input type='checkbox' name='delRentmemo' value='" + memoList[i].RECR_ID + "' >&nbsp;&nbsp;" + memoList[i].NAME + " &nbsp; </td><td  align='center'> &nbsp;" + memoList[i].CREATE_TIME + "</td><td  align='center'>" + memoList[i].REMARK + " &nbsp; </td></tr>")
						}
						
						$("#rentContractInfo1").append("<tr><td colspan='3' style='text-align:center'>  <input type='button'  value='提交' class='ui-state-default ui-corner-all'  id='rentContractsubmintButton1' onclick='pickMemoID()' disabled='disabled' />  </td><td></td></tr>")
						 rentcontractMemoCheckbox();
					}
					
				},
				error: function(){
				
					$("#rentContractInfo1").empty()
					$("#rentContractInfo1").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
				}
			});
		}
		
	}
}
//合同备注多选
function rentcontractMemoCheckbox(){
	$("input[name='delRentmemo']").click(function(){
		
		var s =$("input[@name='delRentmemo'][checked]")
		if(s.length >0){
			
			$("#rentContractsubmintButton1").attr('disabled','')
		}
		else{
			
			$("#rentContractsubmintButton1").attr('disabled','disabled')
		}
		
	})
} 	
//合同备注删除提交
function  pickMemoID(){
	
	var s =$("input[@name='delRentmemo'][checked]")
		if(s.length >0){
			var numArray=''
			s.each(function(){
				
		numArray+= $(this).val() +',';
		
			})
		}
	$.ajax({
		
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:{'__action':'supportPaylist.delRentContractMemo','num':numArray},
		dataType:'json',
			success: function(json){
				$("#rentContractInfo1").empty()
					$("#rentContractInfo1").append("<tr><td  style=' text-align:center'> <font color='blue' size='26'>操作成功</td></tr>")

			},
			
			error: function(){
					$("#rentContractInfo1").empty()
					$("#rentContractInfo1").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
			},
	})
	
}


//合同承租人信息查询  paramMap
function submitNum5(){
	var num=$.trim($("#rentContractnum2").val())
	var flag =true
	if(  num != null & num.length != 0 ){
		
		if(flag){
			
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:{'__action':'supportPaylist.selectRentcontractCustomer','num':num},
				dataType:'json',
				success: function(json){
					$("#rentContractInfo2").empty()
					var paramMap = json.paramMap
					
					
					
						$("#rentContractInfo2").append("<tr><td style='width : 99px' ><strong>承租人</strong><input type='hidden' id='rentContractsubmintval3' value='"+paramMap.CUST_ID+"'></td><td  style='width :75px' > 修改为</td> </tr>")
						
					
							$("#rentContractInfo2").append("<tr><td >" + paramMap.NAME2+ " <input type='hidden'id='rentContractbu5'value='" + paramMap.NAME2+ " '>  </td><td  align='center'> <input size='28' type='text' id='rentContractbu3'></td></tr>")
					
						
						$("#rentContractInfo2").append("<tr><td colspan='2' style='text-align:center' >  <input type='button'  value='提交' class='ui-state-default ui-corner-all'  id='rentContractsubmintval2' onclick='submitNum6()' />  </td></tr>")
					
				},
				error: function(){
					
					$("#rentContractInfo2").empty()
					$("#rentContractInfo2").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>")
				},
				
				
			})
			
			
		}
	}
} 




//合同承租人名称修改 
function submitNum6(){
	var num=$.trim($("#rentContractbu3").val())
	var num2=$.trim($("#rentContractbu5").val())
	
	var id=$.trim($("#rentContractsubmintval3").val())
	var flag =true
	if(num !=null || num.length !=0){
		
		if(num2 == num){
			flag = false;
			alert("修改前后名字不能相同");
		}
		
		
		if(flag){
			
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:{'__action':'supportPaylist.changeRentcontractCustomer','num':num,'id':id},
				dataType:'json',
				 success: function(json){
				 	$("#rentContractInfo2").empty();
					$("#rentContractInfo2").append("<tr><td  style=' text-align:center'> <font color='blue' size='26'>修改成功新的承租人为 ： "+num+"</td></tr>");

				 },
					error: function(){
						
					$("#rentContractInfo2").empty();
					$("#rentContractInfo2").append("<tr><td  style=' text-align:center'> <font color='red' size='26'>程序出错,请查看后台错误</td></tr>");
					}
					
				
			})
			
			
		}
		
	}
	
	
}

