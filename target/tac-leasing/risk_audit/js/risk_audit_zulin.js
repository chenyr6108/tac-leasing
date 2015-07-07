$(function (){
/*	
if(DateDiff($("#createDate").val(),new Date())<=6){
		$("#riskmemoa").css("display","none");
	}
	else{
		if(parseInt($("#levelEndMoney").val())*10000<=parseInt($("#rzeMoney").val())){
			$("#memoa").css("display","none");
			$("#memob").css("display","none");
		}
	}
*/			/*
			var flag=false;
			if(parseInt($("#levelEndMoney").val())*10000<parseInt($("#rzeMoney").val())	||	DateDiff($("#createDate").val(),new Date())<6){
				flag=true;
			}
			var hu_flag=false;
			if(parseInt($("#levelGrantMoney").val())*10000>parseInt($("#custGrantMoney").val())){
				hu_flag=true;
			}
			if(flag && hu_flag){
				$("#memoa").css("display","none");
			}
			*/
			/*alert("本级授信的上限"+parseInt($("#levelGrantMoney").val()));
			alert("客户的授信余额"+$("#ifwutiaojiaopass").val());
			alert("本篇申请拨款金额"+$("#shenqingBokuan").val());
			alert("客户的标准额度"+parseInt($("#custGrant_Biaozhun").val()));
			alert("客户的标准额度"+parseInt($("#applybiaoedulist").val()));
			alert("客户的标准额度"+parseInt($("#vouchbiaodulist").val()));
			*/
			/*var flag=false;			
				if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""){
					if($("#ifwutiaojiaopass").val()!=null&&$("#ifwutiaojiaopass").val()!=""&&$("#levelGrantMoney").val()!=null&&$("#levelGrantMoney").val()!=""&&parseFloat($("#ifwutiaojiaopass").val())>parseFloat($("#levelGrantMoney").val())){
						flag=true;
					}
				}
				if(parseInt($("#vouchbiaodulist").val())>0 || parseInt($("#applybiaoedulist").val())>0){
					flag=true;
				}
				//alert(flag);
				var tijiao_flag=false;				
				if($("#custGrantMoney").val()!=null&&$("#custGrantMoney").val()!=""&&parseFloat($("#custGrantMoney").val())<parseFloat($("#shenqingBokuan").val())){
					tijiao_flag=true;			
				}*/
//			if(parseInt($("#levelEndMoney").val())<parseInt($("#rzeMoney").val())	||	DateDiff($("#createDate").val(),new Date())<6 || flag){
//				$("#memoa").css("display","none");
//			}
			//alert(tijiao_flag);
//			if(tijiao_flag){
//				$("#memoa").css("display","none");
//				$("#memo_hu").css("display","none");
//			}
//			if(parseInt($("#applyedulist").val())>0 || parseInt($("#vouchdulist").val())>0){
//				$("#memo_hu").css("display","none");
//				$("#memoa").css("display","none");
//			}	
});		
function DateDiff(dtStart,dtEnd){  
	  var dtStart = new Date(dtStart);   
	  if (isNaN(dtStart)) dtStart = new Date(); 
	  var dtEnd = new Date(dtEnd);  
	  if (isNaN(dtEnd)) dtEnd = new Date(); 
	  return parseInt((dtEnd - dtStart)/86400000/30);		
  }

//添加风投
function addwind(){
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
	  	alert("你还没有选择结果！");
	  	return false;
	  }
	/*if($("#visitor_id").val() == ''){
		alert("请填写访厂人员！");
		return false;
	}
	if($("#visit_date").val() == ''){
		alert("请填写访厂时间！");
		return false;
	}*/
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
	
	$("#__action").val("riskAudit.doRisk");
	$("#form1").submit();
}
/*
function createDisplay(obj) {
	var value = $(obj).val();
	if(value == 1) {
			$("#memoResult").css("display","none");	
		}else{
			$("#memoResult").css("display","");	
			$("#memolevelTr").css("display","none");	
		}
}
*/



function showBeforeMemo(credit_id){
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=riskAudit.showBeforeMemo&credit_id=' + credit_id,
        dataType: 'json',
        success: function(json){
            $("#data1 tr").each(function(){       
                    $(this).remove();
            });
            var beforeMemoList = json.beforeMemoList;  
            for (var i = 0; i < beforeMemoList.length; i++) {					            
	            $("#data1").append(
	            		"<TR>" +
	            			"<TD class='ui-widget-content jqgrow ui-row-ltr' align='right'>" +
	            				(beforeMemoList[i].PRCM_USER_LEVEL == 0 ? "初" : beforeMemoList[i].PRCM_USER_LEVEL) + "级评审" +
	            			"</TD>" +
	            		"</TR>" +
	            		"<TR>" +
		            		"<TD class='ui-widget-content jqgrow ui-row-ltr' align='center'>" +
		            			"<pre><TEXTAREA ROWS='5' COLS='70'  readonly='readonly'>"+beforeMemoList[i].PRCM_CONTEXT+"</TEXTAREA></pre>" +
		            		"</TD>" +
	            		"</TR>" +
	            		
	            		"<TR>" +
	            			"<TD class='ui-widget-content jqgrow ui-row-ltr' align='right'>" +
	            				"签字："+beforeMemoList[i].NAME+" &nbsp;&nbsp;时间："+beforeMemoList[i].CREATE_TIME+"" +
	            			"</TD>" +
	            		"</TR>");
            }
			$('#showBeforeMemo').dialog({
				modal:true,
				autoOpen: false,
				width: 500
			});	            
            $('#showBeforeMemo').dialog('open');
        }      
    });  
}  