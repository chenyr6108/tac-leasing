//判断新旧合同号是否存在
function checkRent(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.checkRent&newRent='+$("#newRent").val()+'&oldRent='+$("#oldRent").val(),
		dataType:'json',
		success:function(dataBack){   
			if(dataBack.oldRentMap==0){
				alert("旧的合同号不存在");
			}
			else{
					if(dataBack.newRentMap!=0){
						alert("新的合同号已存在");
					}	
					else{
						alert("可以修改");
					}			
			}
		
        }   
	});
}
//修改合同号支付表号
function updateRent(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.updateRent&newRent='+$("#newRent").val()+'&oldRent='+$("#oldRent").val(),
		dataType:'json',
		success:function(dataBack){   
			alert("修改已成功");
			$("#newRent").val("");
			$("#oldRent").val("");
        } 
	});
}




//判断新旧支付表号是否存在
function checkPay(){
		if($("#oldPay").val().length<16){
			alert("输入的旧支付表号不符合规范");
			return false;
		}
		if($("#newPay").val().length<16){
			alert("输入的新支付表号不符合规范");
			return false;
		}	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.checkPay&newPay='+$("#newPay").val()+'&oldPay='+$("#oldPay").val(),
		dataType:'json',
		success:function(dataBack){ 
			if(dataBack.oldRentMap==0){
				alert("旧的支付表号所引用的合同号不存在");
				return false;
			}
			if(dataBack.newRentMap==0){
				alert("新的支付表号所引用的合同号不存在");
				return false;
			}			  
			if(dataBack.oldPayMap==0){
				alert("旧的支付表号不存在");
				return false;
			}
			if(dataBack.newPayMap!=0){
				alert("新的支付表号已存在");
				return false;
			}	
			alert("可以修改");
        }   
	});
}
//修改支付表号
function updatePay(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.updatePay&&newPay='+$("#newPay").val()+'&oldPay='+$("#oldPay").val(),
		dataType:'json',
		success:function(dataBack){   
			alert("修改已成功");
			$("#newPay").val("");
			$("#oldPay").val("");
        } 
	});
}




//逾期信息更新
function dunUpdate(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.dunUpdate',
		dataType:'json',
		success:function(dataBack){   
			alert("修改已成功");
        } 
	});
}


function checkDeleteRent(){
	if($("#deleteRent").val().trim() == "" ){
		alert("请输入合同号码") ;
		return false ;
	}
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.checkDeleteRent&LEA_CODE='+$("#deleteRent").val(),
		dataType:'json',
		success:function(dataBack){   
			if(dataBack.CNT == 0){
				alert("要删除的合同号不存在");
				$("#deleteRent").focus().selected ;
			}
			else{
				alert("可以删除");
			}
        }   
	});
}


function deleteRent(){
	if(confirm("确定要删除此合同？")){
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=supportUpdatePay.deleteRent&rect_code='+$("#deleteRent").val(),
			dataType:'json',
			success:function(dataBack){   
				alert("删除已成功");
				$("#deleteRent").val("");
        	} 
		});
	}else {
		return false ;
	}
}


	
	
	//业务人员活动日报表信息更新
function logDayUpdate(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportUpdatePay.logDayUpdate',
		dataType:'json',
		success:function(dataBack){   
			alert("更新已成功");
        } 
	});
}