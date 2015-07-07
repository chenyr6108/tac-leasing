$(function (){
		/*if(DateDiff($("#createDate").val(),new Date())<6){
				
				var flag=false;	
				if($("#prc_node").val()!=2	||	parseInt($("#levelEndMoney").val())*10000<parseInt($("#rzeMoney").val())){			
						flag=true;
						//$("#memoa").css("display","none");						
				}
				var hu_flag=false;
				if(parseInt($("#levelGrantMoney").val())*10000>parseInt($("#custGrantMoney").val())){
					hu_flag=true;
				}
				if(flag && hu_flag){
					$("#memoa").css("display","none");
				}
				
				var flag=false;
				if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""){
					if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""&&$("#levelGrantMoney").val()!=null&&$("#levelGrantMoney").val()!=""&&parseFloat($("#ifwutiaojiaopass").val())>parseFloat($("#levelGrantMoney").val())){
						flag=true;
					}
				}
				//alert(flag);
				if(parseInt($("#vouchbiaodulist").val())>0 || parseInt($("#applybiaoedulist").val())>0){
					flag=true;
				}
				var tijiao_flag=false;				
				if($("#custGrantMoney").val()!=null&&$("#custGrantMoney").val()!=""&&parseFloat($("#custGrantMoney").val())<parseFloat($("#shenqingBokuan").val())){
					tijiao_flag=true;			
				}
				
				if($("#prc_node").val()!=2	||	parseInt($("#levelEndMoney").val())<parseInt($("#rzeMoney").val()) || flag){			
						
						$("#memoa").css("display","none");						
				}
				if(tijiao_flag){
					$("#memoa").css("display","none");
					$("#riskmemoa").css("display","none");
				}
				if(parseInt($("#applyedulist").val())>0 || parseInt($("#vouchdulist").val())>0){
					$("#riskmemoa").css("display","none");
					$("#memoa").css("display","none");
				}											
		}
		else{
				
				var flag=false;
				if(parseInt($("#levelEndMoney").val())*10000<parseInt($("#rzeMoney").val())){
					flag=true;			
					//$("#memoa").css("display","none");		
				}	
				var hu_flag=false;
				if(parseInt($("#levelGrantMoney").val())*10000>parseInt($("#custGrantMoney").val())){
					hu_flag=true;
				}
				if(flag && hu_flag){
					$("#memoa").css("display","none");
				}
				
				var flag=false;
				if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""){
					if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""&&$("#levelGrantMoney").val()!=null&&$("#levelGrantMoney").val()!=""&&parseFloat($("#ifwutiaojiaopass").val())>parseFloat($("#levelGrantMoney").val())){
						flag=true;
					}
				}
				if(parseInt($("#vouchbiaodulist").val())>0 || parseInt($("#applybiaoedulist").val())>0){
					flag=true;
				}
				var tijiao_flag=false;				
				if($("#custGrantMoney").val()!=null&&$("#custGrantMoney").val()!=""&&parseFloat($("#custGrantMoney").val())<parseFloat($("#shenqingBokuan").val())){
					tijiao_flag=true;			
				}
				if(parseInt($("#levelEndMoney").val())<parseInt($("#rzeMoney").val()) || flag){
							
					$("#memoa").css("display","none");		
				}	
				if(tijiao_flag){
					$("#memoa").css("display","none");
					$("#memo_hu").css("display","none");
				}	
				if(parseInt($("#applyedulist").val())>0 || parseInt($("#vouchdulist").val())>0){
					$("#memo_hu").css("display","none");
					$("#memoa").css("display","none");
				}						
		}		*/
		if($("#prc_node").val()==3){	
			$("#riskmemoa").css("display","none");	
			$("#memoa").css("display","");										
		}
		
		
							
		var PRCM_LEVELA=$("#PRCM_LEVEL").val();	
		var PRCM_USER_LEVELA=$("#PRCM_USER_LEVEL").val();	
		var STATEA=$("#STATE").val();		
			if(PRCM_LEVELA==0){
				//结案
				$("input[name='memo'][value='"+STATEA+"']").attr("checked",true);					
			}
			else{
				//提交
				$("input[name='memo'][value='111']").attr("checked",true);	
				$("#memoLevel").val(PRCM_LEVELA);			
			} 																				
});		
function DateDiff(dtStart,dtEnd){   
  var dtStart = new Date(dtStart);   
  if (isNaN(dtStart)) dtStart = new Date(); 
  var dtEnd = new Date(dtEnd);  
  if (isNaN(dtEnd)) dtEnd = new Date(); 
	return parseInt((dtEnd - dtStart)/86400000/30);
  }


//修改
function updatewind(){
	if($("#context").val()==""){
		alert("请输入评审内容,再提交,谢谢!");
			return false;
	}
/*
	  var chk_value =[];   
	  $('input[name="riskmemo"]:checked').each(function(){   
	   chk_value.push($(this).val());   
	  });   
	  if(chk_value.length==0){
	  	alert("你还没有评审方案！");
	  	return false;
	  }

	if($('input[name="riskmemo"]:checked').val()=="2"){
		  var chk_value2 =[];   
		  $('input[name="memo"]:checked').each(function(){   
		   chk_value2.push($(this).val());   
		  });   
		  if(chk_value2.length==0){
		  	alert("你还没有选择生成结果！");
		  	return false;
		  }
	}	
*/	
	  var chk_value =[];   
	  $('input[name="memo"]:checked').each(function(){   
	   chk_value.push($(this).val());   
	  });   
	  if(chk_value.length==0){
	  	alert("你还没有评审结果！");
	  	return false;
	  }
	  
		var IS_CHECK_PAY= document.getElementsByName("IS_CHECK_PAY");
		var CHECK_PAY_START= document.getElementsByName("CHECK_PAY_START"); 
		if(IS_CHECK_PAY[0].checked){
			document.getElementById("IS_CHECK_PAY_VALUE").value=1;
		if (CHECK_PAY_START.length == 0 ) {
			alert("选择支票还款时应填写支票还款期数！");
				return false;
			}
		}else{
			document.getElementById("IS_CHECK_PAY_VALUE").value=0;
		}
		
		if(CHECK_PAY_START.length>0 && !(IS_CHECK_PAY[0].checked)){
			alert("填写了支票还款期数，请勾选支票还款！");
			return false;		
		}
	  
	$("#__action").val("riskAuditUpdateAfter.updatetowind");
	$("#form1").submit();
}

function createDisplay(obj) {
	var value = $(obj).val();
	if(value == 1) {	
		$("#memoResult").css("display","none");
	}else{
		$("#memoResult").css("display","");	
		$("#prcmlevel").css("display","none");	
	}
}