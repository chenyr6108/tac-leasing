$(function (){
	/*
	var flag=false;
	if(parseInt($("#levelEndMoney").val())*10000<parseInt($("#rzeMoney").val())	||	DateDiff($("#createDate").val(),new Date())<6){
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
	*/
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
//Modify by Michael 2012 1/13修改评审级别，二级及以上评审的不过公司成立是否有达到6个月及以上 
//	if(parseInt($("#levelEndMoney").val())<parseInt($("#rzeMoney").val())	||	DateDiff($("#createDate").val(),new Date())<6 || flag){
	if(parseInt($("#levelEndMoney").val())<parseInt($("#rzeMoney").val())	||	flag){		
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
	var PRCM_LEVELA=$("#PRCM_LEVEL").val();	
	var PRCM_USER_LEVELA=$("#PRCM_USER_LEVEL").val();	
	var STATEA=$("#STATE").val();		
		if(PRCM_LEVELA==0){
			//结案
			$("input[name=memo][value="+STATEA+"]").attr("checked",true);						
		}
		else{
			//提交
			$("input[name=memo][value=111]").attr("checked",true);		
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

//修改风控
function updatewind(){
	/*if($("#visitor_id").val() == ''){
		alert("请填写访厂人员！");
		return false;
	}
	if($("#visit_date").val() == ''){
		alert("请填写访厂时间！");
		return false;
	}*/
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
	$("#__action").val("riskAuditUpdate.updatewind");
	$("#form1").submit();
}

function createDisplay(obj) {
	var value = $(obj).val();
	if(value == 1) {
		$("#memoResult").css("display","none");
	}else{
		$("#memoResult").css("display","");	
		$("#memolevelTr").css("display","none");	
	}
}