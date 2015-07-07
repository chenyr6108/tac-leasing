<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );

//供应商银行提示
function supl(CREDIT_ID,name,INVOICE_PERSON,num) {
document.getElementById("numType").value=num;
if(num==0)
{
	//document.getElementById("bank_name").type="text";
	 document.getElementById("bank_name").style.display="block";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_account").type="text";
	document.getElementById("bank_account1").type="hidden";
}
else if(num==1)
{
	document.getElementById("bank_name1").type="text";
	//document.getElementById("bank_name").type="hidden";
	 document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_account").type="text";
	document.getElementById("bank_account1").type="hidden";
}
else if(num==2)
{
	document.getElementById("bank_name2").type="text";
	//document.getElementById("bank_name").type="hidden";
	 document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_account1").type="text";
	document.getElementById("bank_account").type="hidden";
}

	 $("select[name='bank_name']").empty();
	document.getElementById("payByName").value="";
	document.getElementById("bank_name1").value="";
	document.getElementById("bank_name2").value="";
	document.getElementById("bank_name3").value="";
	document.getElementById("bank_account").value="";
	document.getElementById("bank_account1").value="";
			if(name==INVOICE_PERSON)
			{
				if(num==2)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplByRectId&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete2
				
					});
				}
				else if(num==0)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplByRectIds&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete3
				
					});
				}
				else if(num==1)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.custByRectId&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete2
				
					});
				}
				
			}
			else
			{
				$("#payByName").val("");
			}
			
};


function initAutoComplete2(data) { 
	dataList = data.dw; 
	$("#payByName").val(dataList[0].NAME);
	var numType=$("#numType").val();
	if(numType==0)
	{
		$("#bank_name").autocomplete(dataList, optionsssssNo);
		$("#bank_name").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}
	else if(numType==1)
	{
		$("#bank_name1").autocomplete(dataList, optionsssssNo);
		$("#bank_name1").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}
	else if(numType==2)
	{	
		$("#bank_name2").autocomplete(dataList, optionsssssNo);
		$("#bank_name2").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}	
	
		
} 

var optionsssssNo = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.BANK_NAME;
		if (row.BANK_ACCOUNT != null && row.BANK_ACCOUNT.length > 0) {
			rs += "【" + row.BANK_ACCOUNT + "】";
		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.PCCBA_ID + " " + row.BANK_NAME;
	},
	formatResult : function(row) {
		return row.BANK_NAME;
	}
};

var optionsssss = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.BANK_NAME;
		if (row.BANK_ACCOUNT != null && row.BANK_ACCOUNT.length > 0) {
			rs += "【" + row.BANK_ACCOUNT + "】";
		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.PCCBA_ID + " " + row.BANK_NAME;
	},
	formatResult : function(row) {
		return row.BANK_NAME;
	}
	
};


function initAutoComplete3(data) { 
	dataList = data.dw; 
	var numType=$("#numType").val();
	if(numType==0)
	{
		$("#payByName").autocomplete(dataList, optionsssssNo1);
		
		$("#payByName").result(function(event, data, formatted) {
				
				
				$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplBySuplIds&supl_id='+data.ID,
						dataType:'json' ,
						success: initAutoComplete4
				
					});
				
				
				
				
			}); 
	}
} 

function initAutoComplete4(data) { 
	dataList = data.dws; 
	 $("select[name='bank_name']").empty();
	var numType=$("#numType").val();
	if(numType==0)
	{
	
		// $("#bank_name").autocomplete(dataList, optionsssssNo2);
		$("select[name='bank_name']").empty();
		
		
		$("#bank_name").append("<option value=''>--请选择--</option>");
		for(i=0;i<dataList.length;i++){
   				$("#bank_name").append("<option value="+dataList[i].PCCBA_ID+">"+dataList[i].BANK_NAME+"</option>");
        	}
		 
	}
	
} 


var optionsssssNo1 = {
	minChars : 1,
	max : 20,
	mustMatch: false,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.NAME ;
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.ID + " " + row.NAME;
	},
	formatResult : function(row) {
		return row.NAME;
	}
};

    
function insertPayMoney()
    {
    var form = document.addForm;
   
   var form = document.addForm;
     var pay_Date = $.trim($(":input[name='expecteddate']").val());
    if (pay_Date.length <1) {
        alert("请填写预订支付日！")
        return false;
    }
    
    var pay_Date = $.trim($(":input[name='payByName']").val());
    if (pay_Date.length <1) {
        alert("请填写请款单位！");
        return false;
    }
    
     var numType=$.trim($(":input[name='numType']").val());
     
     var bank_name="";
     if(document.getElementById("backtype1").checked){
    	 bank_name= $.trim($(":input[name='bank_name2']").val());
     }else if(document.getElementById("backtype2").checked){
     	bank_name= $.trim($(":input[name='bank_names']").val());
    }else if(document.getElementById("backtype3").checked){
 	   	bank_name= $.trim($(":input[name='bank_name1']").val());
    }else{
    	bank_name= $.trim($(":input[name='bank_name3']").val());
    }
     $("#bank_name_text").val(bank_name);
     
  if(numType==1){
   	var pay_Date = $.trim($(":input[name='bank_name_text']").val());
   	if (pay_Date.length <1) {
       	alert("请填写开户行！");
       	return false;
   	}
   }
      
   if(numType==0 || numType==1)
    {
    	 var pay_Date = $.trim($(":input[name='bank_account']").val());
    	if (pay_Date.length <1) {
        	alert("请填写开户账号！");
        	return false;
    	}
    }
    else if(numType==2 || numType==3)
    {
    	 var pay_Date = $.trim($(":input[name='bank_account1']").val());
    	if (pay_Date.length <1) {
        	alert("请填写开户账号！");
        	return false;
    	}
    }
    
	// Add by Michael 2013 01-09  增加银行黑名单检查
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:{__action:'backMoney.checkBlackBank',
			BANK_NAME:bank_name},
		dataType:'json',
		success: function(dataBack){ 
			if(dataBack.count>0){
				alert("该开户银行或分行不存在，请再确认！");
				return false;
			}else{
			    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager");
			    $("#addForm").submit(); 
			}
		}
	});	
}

function changeDiv()
{
	 var form = document.addForm;
    var tname = $.trim($(":input[name='visit_results']").val());
    if(tname==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function changeTr(resul)
{
	if(resul==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function check()
{
var account = document.getElementById("bank_account").value;
if(isNaN(account))
{
    alert("格式错误，银行账号应该为数字！");
  document.getElementById("bank_account").value="";
}

}


function check1()
{
var account = document.getElementById("bank_account1").value;
if(isNaN(account))
{
    alert("格式错误，银行账号应该为数字！");
  document.getElementById("bank_account1").value="";
}

}

function radioNull()
{
	document.getElementById("bank_name3").type="text";
	document.getElementById("bank_name").type="hidden";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_account").type="hidden";
	document.getElementById("bank_account1").type="text";
	
	document.getElementById("payByName").value="";
	document.getElementById("bank_name").value="";
	document.getElementById("bank_name1").value="";
	document.getElementById("bank_name2").value="";
	document.getElementById("bank_name3").value="";
	document.getElementById("bank_account").value="";
	document.getElementById("bank_account1").value="";
	document.getElementById("numType").value="3";
}

function changeBank()
{
	var pccb_id=$("#bank_name").val();
	
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher",
		data:"__action=backMoney.suplBySuplIdss&pccba_id="+pccb_id,
		dataType:"json",
		success:function(json){
				dw=json.dwss;
				$("#bank_account").val("");
				if(dw!=null)
				{
					$("#bank_names").val(dw.BANK_NAME);
					$("#bank_account").val(dw.BANK_ACCOUNT);
				}
		},
		error:function(){
			
		   }
	     });
}


function leftPayUpdate(moneyCount,moneyed,payMoneying)
{
	var payMoneys=parseCurrency($("#pay_money").val());
	
	if(payMoneys>payMoneying)
	{
		alert("本次付款额已超出最大付款额");
		$("#pay_money").val("￥"+format(payMoneying));
	}
	var payMoney=parseCurrency($("#pay_money").val());
	var leftPay=moneyCount-moneyed-payMoney;
	$("#leftpay1").val("￥"+format(leftPay));
	document.getElementById("euqipTo").innerHTML=atoc(payMoney);
	$("#leftpay2").val("￥"+format(payMoney));
}

function format(th)
{
	var value=th+"";
	if(value!=null && value!="")
	{
		var str="";
		var len=value.length;
		var d=value.indexOf('.');
		if(d!=-1)
		{
			for(var i=d-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((d-i)%3==0 && i > 0)
				{
					str=','+str;
				}
			}
			var sub=Math.round(new Number("0"+value.substr(d))*100)/100;
			
			if(sub == 0)
			{
				str=str+".00";
			}
			else if(sub.toString().substr(2).length == 1)
			{
				str=str+"."+sub.toString().substr(2)+"0";
			}
			else if(sub.toString().substr(2).length == 2)
			{
				str=str+"."+sub.toString().substr(2);
			}
			else
			{
				str=str+"."+sub.toString().substr(2,4);
			}
		}
		else
		{
			for(var i=len-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((len-i)%3==0 && i>0)
				{
					str=','+str;
				}
			}
			str=str+".00";
		}
		return str;
}
}

function changeExpress(val){
	if(val=='其他'){
		$("#express").val("");
		$("#express").show();
	}else{
		$("#express").val(val);
		$("#express").hide();
	}
}
</script>
<body onLoad="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	<input type="hidden" name="state" value="0">
	<input type="hidden" id="numType" name="numType" value="1">
	<input type="hidden" name="backState" id="backState" value="1">
	<input type="hidden" name="bank_names"  id="bank_names">
	<input type="hidden" name="bank_name_text"  id="bank_name_text">
	<input type="hidden" name="CREDIT_ID" id="CREDIT_ID" value="${payMoney.CREDIT_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保证金请款凭证(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td colspan="3">预订支付日：      <input type="text" style="height:25px" name="expecteddate" id="datebegin" value="<fmt:formatDate value='${payMoney.EXPECTEDDATE }' pattern='yyyy-MM-dd'/>" readonly="readonly"/>   <font color='red'>*</font></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>实际支付日：      <input type="text" style="height:25px" name="pay_Date" readonly="readonly"  value=""/>   </td>
				<td>申请日期：      <input type="text" style="height:25px" name="application_date" readonly="readonly" value="<fmt:formatDate value='${payMoney.TIME }' pattern='yyyy-MM-dd'/>"/> 
					快递方式：<font color='red'>*</font><select onclick="changeExpress(this.value)">
						<c:forEach var="item" items="${express}">
							<option value="${item.CODE}" <c:if test="${defaultExpress eq item.CODE}">selected="selected"</c:if>>${item.FLAG}</option>
						</c:forEach>
					</select>
					<input name="express" id="express" value="${defaultExpress}" style="display:none">
					快递付款方式：<font color='red'>*</font><select name="express_pay_way">
						<c:forEach var="item" items="${express_pay_way }">
							<option value="${item.CODE}" <c:if test="${item.CODE eq 2 }">selected="selected"</c:if>>${item.FLAG}</option>
						</c:forEach>
					</select>	
				</td>
				<td colspan="2" align="right"> </td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款单位：</td>
			<td><input type="text" name="payByName" id="payByName" width="25px" <c:if test="${payMoney.NAME eq payMoney.INVOICE_PERSON }">value="${payMoney.INVOICE_PERSON }"</c:if> <c:if test="${payMoney.NAME!=payMoney.INVOICE_PERSON }">value=""</c:if> >    <font color='red'>*</font> &nbsp; <input type="radio" name="backtype" id="backtype1" checked="checked" onclick="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')"  value="0">发票人<input type="radio" name="backtype" id="backtype2" onclick="supl('${payMoney.CREDIT_ID }','1','1','0')"  value="1">供应商 <input type="radio" name="backtype" id="backtype3"  value="2" onclick="supl('${payMoney.CREDIT_ID }','1','1','1')">承租人 <input type="radio" name="backtype"  value="3" onclick="radioNull()">制造商 <input type="radio" name="backtype"  value="4" onclick="radioNull()">其他</td>
		</tr>

		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行及账号</td>
			<td><input type="text" name="bank_name2" onkeyup="mask(this)" id="bank_name2"><select name="bank_name"  onchange="changeBank()" style="width:135px;float:left;"  id="bank_name" width="100px"></select><input type="text" name="bank_name1" onkeyup="mask(this)" id="bank_name1"><input type="text" name="bank_name3" id="bank_name3"> <font color='red'>*</font> <input type="hidden" name="pccba_id" id="pccba_id" value="${ispccbaId }">   &nbsp;&nbsp;<input type="text" name="bank_account" id="bank_account"  readonly="readonly" value="" onBlur="check()"><input type="text" name="bank_account1" id="bank_account1" value="" onBlur="check1()">  <font color='red'>*</font>    支付方式：<select name="pay_way"><c:forEach items="${psTypeList}" var="psTypeList"><option value="${psTypeList.CODE}">${psTypeList.FLAG}</option></c:forEach></select></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td  rowspan="13">&quot;</td></tr>
		<tr id="3"  class="ui-widget-content jqgrow ui-row-ltr"><td>承租人：${payMoney.CUST_NAME }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>合同号：${payMoney.LEASE_CODE }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>购买总额： <fmt:formatNumber value="${payMoney.LEASE_TOPRIC }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>其他支出： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>应付总额（成本）： <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE }" type="currency" /><input type="hidden" name="paycount" id="paycount" value="${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE }"><c:set var="isPay" value="0" scope="page"></c:set><c:forEach items="${payDw }" var="payDw" varStatus="status"><c:set var="isPay" value="${isPay+payDw.PAY_MONEY }" scope="page"></c:set></c:forEach></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付预付款：<input type="hidden" name="payed" id="payed" value="${isPay }"> <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付应付款： <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额：<input type="text" name="pay_money" id="pay_money" onchange="leftPayUpdate('${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE }','${isPay }','${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE-isPay }')" value=" <fmt:formatNumber value='${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE-isPay }' type='currency' />">  <font color='red'>*</font>         剩余未付款：<input type="hidden" name="leftpay" id="leftpay" value=""> <input type="text" readonly="readonly" name="leftpay1" id="leftpay1" value="<fmt:formatNumber value='0' type='currency' />"></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>税金：       <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE }" type="currency" /> 入我司（代收款）</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC}" type="currency" />   入我司  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMPRICE}" type="currency" />  入我司税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE}" type="currency" />  我司入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAG}" type="currency" />  我司入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAGRATE}" type="currency" /></td></tr>
		<!--  <tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC }" type="currency" />   入我司</td></tr>  -->
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>用于平均抵冲金额：  <fmt:formatNumber value="${payMoney.PLEDGE_AVE_PRICE }" type="currency" />        	用于期末退还金额： <fmt:formatNumber value="${payMoney.PLEDGE_BACK_PRICE } " type="currency" />        用于最后抵冲金额/期数： <fmt:formatNumber value="${payMoney.PLEDGE_LAST_PRICE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>手续费： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 </td>
			<td>RMB：<!--  <fmt:formatNumber value="${isPay }" type="currency" />  --> <input name="leftpay2" id="leftpay2" readonly="readonly" value=" <fmt:formatNumber value='${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE-isPay }' type='currency' />">                  <span id="euqipTo"></span></td>
			<script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(${payMoney.PLEDGE_ENTER_MCTOAG+payMoney.PLEDGE_ENTER_MCTOAGRATE-isPay });</script> 
		</tr>
		<tr>
			<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" >
				<div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="insertPayMoney()"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div>
			</td>
		<tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>