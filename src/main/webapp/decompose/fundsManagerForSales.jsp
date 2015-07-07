<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>暂收款退款</title>
<script type="text/javascript" src="${ctx }/decompose/js/fillCustInfo.js"></script>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
<script type="text/javascript">
$(function (){
	$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
	$("#dateend").datepicker($.datepicker.regional['zh-CN']);
	var final_status = "${final_status}";
	var search_status = final_status.split(",");
	$.each(search_status, function(){
		$("#search_status_" + this).attr("checked", "checked");
	});
	var applyAmount = 0;
});

function disableAll(){
	$("input[type='button']").each(function (){
		$(this).attr("disabled", true);
	});
	$("a").each(function (){
		//alert($(this).attr("href"));
		$(this).css("display", "none");
	});
}
function enableAll(){
	$("input[type='button']").each(function (){
		$(this).attr("disabled", false);
	});
	$("a").each(function (){
		//alert($(this).attr("href"));
		$(this).css("display", "block");
	});
}

function showClaimReason(fiin_id, surplus_money){
	$("#fiin_id").val(fiin_id);
	$("#surplus_money").val(surplus_money);
	$("#claimReason").dialog({modal:true, autoOpen:false, width:500});
	$("#claimReason").dialog("open");
}

function subFundsClaim(){
	var reg = /^\d+\.?\d{0,4}$/;
	if(!reg.exec($.trim($("#amount_win").val()))){
		alert("金额必须是数字。");
		$("#amount_win").select();
		$("#amount_win").focus();
		return false;
	}
	if($.trim($("#reason_win").val()) == ""){
		alert("请输入认领原因。");
		$("#reason_win").select();
		$("#reason_win").focus();
		return false;
	}
	$("#amount").val($.trim($("#amount_win").val()));
	$("#reason").val($.trim($("#reason_win").val()));
	$("#is_openInvoice").val($.trim($("#is_openInvoice_win").val()));
	$("#sumBut").attr("disabled", true);
	$("#__action").val("decompose.subFundsClaim");
	$("#form1").submit();
}

function subFundsReturn(){
	if($.trim($("#payee").val()) == ""){
		alert("请输入受款人。");
		$("#payee").select();
		$("#payee").focus();
		return false;
	}
	if($.trim($("#reason_r").val()) == "0"){
		alert("请选择请款说明。");
		$("#reason_r").select();
		$("#reason_r").focus();
		return false;
	} else if ($.trim($("#reason_r").val()) == "-1") {
		if($.trim($("#reason_other_r").val()) == ""){
			alert("请选择请款说明。");
			$("#reason_other_r").select();
			$("#reason_other_r").focus();
			return false;
		}
	}
	var reg = /^\d+\.?\d{0,4}$/;
	if(!reg.exec($.trim($("#amount_r").val()))){
		alert("金额必须是数字。");
		$("#amount_r").select();
		$("#amount_r").focus();
		return false;
	}
	
	if($.trim($("#amount_r").val())<=0){
		alert("退款金额必须要大于0！");
		return false;
	}
	
	if($.trim($("#pay_type").val()) == "0"){
		alert("请选择支付方式。");
		$("#pay_type").select();
		$("#pay_type").focus();
		return false;
	}
	if($.trim($("#remark").val()) == ""){
		alert("请输入备注。");
		$("#remark").select();
		$("#remark").focus();
		return false;
	}
	if($.trim($("#bank_account").val()) == ""){
		alert("请输入银行账号。");
		$("#bank_account").focus();
		return false;
	}
	if($.trim($("#bank_name").val()) == ""){
		alert("请输入银行名称。");
		$("#bank_name").focus();
		return false;
	}
	
	$("#sumBut_r").attr("disabled", true);
	var bank_name=$.trim($("#bank_name").val());
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
				$("#funds_return_form").submit();
			}
		}
	});	
}

function passFundsReturn(fiin_id, surplus_money){
	if(confirm("确定要确认吗？")){
		$("#fiin_id").val(fiin_id);
		$("#surplus_money").val(surplus_money);
		$("#__action").val("decompose.passFundsReturn");
		$("#form1").submit();
	}
}

function showFundsReturn(fiin_id, surplus_money){
	$("#funds_return_form").get(0).reset();
	$(".amount-input").css("display", "none");
	var now = new Date();
	$("#return_date").val(now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate());
	$("#fiin_id_return").val(fiin_id);
	$("#surplus_money_return").val(surplus_money);
	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:{__action:'decompose.getFundsDetailByFiinID',
			FIIN_ID:fiin_id},
		dataType:'json',
		success: function(dataBack){ 
			$("#payee").val(dataBack.fundsDetail.OPPOSING_UNIT);
			$("#amount_r").val(surplus_money);
			applyAmount = surplus_money;
			$("#bank_account").val(dataBack.fundsDetail.OPPOSING_BANKNO);
		}
	});
	$("#fundsReturn").dialog({modal:true, autoOpen:false, width:620});
	$("#fundsReturn").dialog("open");
	reasonOther($("#reason_r"));
}

function showClaimDetail(fiin_id){
	$("#pactAffix_" + fiin_id).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=decompose.showFundsDetail&BIZ_TYPE=1&fiin_id=" + fiin_id);
    });
}

function getRealAmount(inputAmount){
	var handlingCharge = null;
	var realAmount = null;
	if(inputAmount <= 10000){
		handlingCharge = 5.5;
	} else if (inputAmount <= 100000) {
		handlingCharge = 10.5;
	} else if (inputAmount <= 500000) {
		handlingCharge = 15.5;
	} else if (inputAmount <= 1000000) {
		handlingCharge = 20.5;
	} else {
		handlingCharge = inputAmount * 0.2 / 1000 + 0.5;
	}
	if(handlingCharge > 200.5){
		handlingCharge = 200.5;
	}
	realAmount = inputAmount - handlingCharge;
	if (realAmount < 0) {
		realAmount = 0;
	}
	return realAmount;
}

function getHandlingCharge(inputAmount){
	var handlingCharge = null;
	if(inputAmount <= 10000){
		handlingCharge = 5.5;
	} else if (inputAmount <= 100000) {
		handlingCharge = 10.5;
	} else if (inputAmount <= 500000) {
		handlingCharge = 15.5;
	} else if (inputAmount <= 1000000) {
		handlingCharge = 20.5;
	} else {
		handlingCharge = inputAmount * 0.2 / 1000 + 0.5;
	}
	if(handlingCharge > 200.5){
		handlingCharge = 200.5;
	}
	return handlingCharge;
}

function reasonOther(e){
	if ($(e).val() == -1) {
		$(".reason_other_r").css("display", "block");
		$("#handling_charge_item").hide();
		$("#amount_input").val("");
		$("#handling_charge").val("");
		$("#amount_r").val(applyAmount);
	} else if("误汇款" == $(e).val() || "保险退款" == $(e).val()) {
		$(".reason_other_r").css("display", "none");
		$("#handling_charge_item").show();
		$("#amount_input").val(applyAmount);
		$("#amount_r").val(getRealAmount(applyAmount));
		$("#handling_charge").val(getHandlingCharge(applyAmount));
	} else {
		$(".reason_other_r").css("display", "none");
		$("#handling_charge_item").hide();
		$("#amount_input").val("");
		$("#handling_charge").val("");
		$("#amount_r").val(applyAmount);
	}
}

/*
 * Add by Michael 2012 4-28 增加显示与来款金额一致案件信息
 */
function showCustRecp(found){
	$.ajax({
		type:"POST",
		data: '__action=decompose.getCustRecpFundReturn&FOUND='+found,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			var memos="";
			var tt=databack.writeBackDetails.length;

			memos="<tr class=\"ui-jqgrid-labels\">"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">承租人</th>"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">合同号</th>"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">期数</th>"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">支付日期</th>"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">应付租金</th>"+
			"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">业务经办</th>"+
			"</tr>";
			
			for(var i=0;i<tt;i++){
				memos+="<tr class='ui-widget-content jqgrow ui-row-ltr'>";
				memos+="<td>"+databack.writeBackDetails[i].CUST_NAME+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].LEASE_CODE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].PERIOD_NUM+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].PAY_DATE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].IRR_MONTH_PRICE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].NAME+"</td>";
				memos+="</tr>";
			}

			$("#showCustRecpTableID").html(memos);
		},
		error:function(databack){
			alert("网络错误，请稍后重试！");
			return ;
		}
	});
	$("#showCustRecp").dialog({
		modal:true,
		autoOpen: false,
		width: 600
	});
	$("#showCustRecp").dialog('open');
}
//--------------------------------------------------------------------------------------------

//--------------------------上传水单---------------------------------------------------
function upLoadTransferCertificate(fiin_id,income_finance_code){
	document.uploadForm.fiinID.value=fiin_id;
	document.uploadForm.incomeFinanceCode.value=income_finance_code;
	$("#upLoad").dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$("#upLoad").dialog('open');
}

function funUploadFile(){
	alert("确定要上传！");
	$("#uploadForm").submit();
}

function expand(FIIN_ID){	
    $("#pactAffix"+FIIN_ID).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=decompose.queryFileUpMore&FIIN_ID=" + FIIN_ID);
    });
}
//--------------------------上传水单---------------------------------------------------
function showMailMemo(fiin_id,memo){
	$("#updateKey").val(fiin_id);
	$("#mailMemo").val(memo);
	$("#memoDiv").dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$("#memoDiv").dialog('open');
}
</script>
<style type="text/css">
	.tb_return{border: 1px solid #AFAFAF; width: 200px; height: 22px;}
	.tb_return_ro{border: 1px solid #AFAFAF; width: 200px; height: 22px;}
	.tb_return_i{
		border: 1px solid #A6C9E2; 
		width: 200px; 
		height: 22px;
	}
	.amount-input{
		display: none;
	}
	.reason_other_r{
		display: none;
	}
</style>
</head>
<body>
<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="${__action }" />
	<input type="hidden" id="fiin_id" name="fiin_id" value="${fiin_id }"/>
	<input type="hidden" id="surplus_money" name="surplus_money" value="${surplus_money }"/>
	<input type="hidden" id="amount" name="amount"/>
	<input type="hidden" id="reason" name="claimReason"/>
	<input type="hidden" id="is_openInvoice" name="is_openInvoice"/>
	<input type="hidden" id="BIZ_TYPE" name="BIZ_TYPE" value="1"/>

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;暂收款退款管理</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="900" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
      <tr valign="center">
        <td width="54" class="ss_bigo">&nbsp;</td>
        <td width="600" class="ss_bigt" valign="center" >
         <table>
         <tr>
           <td width="9%">起始日期:</td>
           <td width="15%"><input type="text" value="${search_startdate}" name="search_startdate" id="datebegin" readonly="readonly" style="width:80px; height:18px;"></td>
         <td width="12%">结束日期:</td>
         <td width="15%" ><input type="text" value="${search_enddate}" name="search_enddate" id="dateend" readonly="readonly" style="width:80px; height:18px;"></td>
        	<td>来款金额:</td>
         <td>从
           <input type="text" id="search_startmoney"
						value="${search_startmoney}" name="search_startmoney"
						style="width: 100px;"
						onkeypress="if (event.keyCode == 13) { selectincome() }" />
           -
           <input type="text" id="search_endmoney" value="${search_endmoney}"
						name="search_endmoney" style="width: 100px;"
						onkeypress="if (event.keyCode == 13) { selectincome() }" /></td>
         
       </tr>
       <tr>
       	<td width="8%">银行：</td>
         <td colspan="5"><select name="search_bankname" id="search_bankname" onChange="showbankno()">
			<option value="all">
				全部
			</option>
			<c:forEach items="${bankList }" var="bank"
				varStatus="status">
				<c:choose>
					<c:when test="${bank.BANK_NAME eq search_bankname}">
						<option value="${bank.BANK_NAME }" selected="selected">
							${bank.BANK_NAME }
						</option>
					</c:when>
					<c:otherwise>
						<option value="${bank.BANK_NAME }">
							${bank.BANK_NAME }
						</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
           &nbsp;&nbsp;
           <select name="search_bankno" id="search_bankno">
			<c:choose>
				<c:when test="${not empty search_bankno }">
					<option value="${search_bankno }" selected="selected">
						${search_bankno }
					</option>
				</c:when>
				<c:otherwise>
					<option value="全部">
						全部	
					</option>
				</c:otherwise>
			</c:choose>
		</select></td>
       </tr>
       <tr>
         <td width="10%">查询内容:</td>
         <td colspan="3">
         <input type="text" name="search_content" id="search_content" value="${search_content }" style="width: 220px"
										onKeyPress="if (event.keyCode == 13) { selectincome() }">
         </td>
         <td>暂收款状态:</td>
         <td>
         	<input type="checkbox" name="search_status" id="search_status_2" value="1,2"/> 初始&nbsp;&nbsp;
         	<input type="checkbox" name="search_status" id="search_status_6" value="6"/> 已申请
         </td>
       </tr>
        <tr>
       	<td>是否备注:</td><td><select name="search_memo"><option value="">全部</option><option value="Y" <c:if test="${search_memo eq 'Y' }">selected='selected'</c:if>>已备注</option><option value="N" <c:if test="${search_memo eq 'N' }">selected='selected'</c:if>>未备注</option></select></td>
      	<td>是否上传水单:</td><td><select name="search_file"><option value="">全部</option><option value="Y" <c:if test="${search_file eq 'Y' }">selected='selected'</c:if>>已上传水单</option><option value="N" <c:if test="${search_file eq 'N' }">selected='selected'</c:if>>未上传水单</option></select></td>
       </tr>
 			 </table>
 			</td>
   <td width="100" class="ss_bigt" valign="middle">
   <a href="javaScript:void(0)" id="search" onclick="selectincome();" class="blue_button">搜 索</a></td>
     <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
  </tr>
</table>
</div>
<br/>
<font color="red">${errorMsg_rej}</font>
<font color="red">${returnStr}</font>
<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr >
			<td>
				<page:pagingToolbarTop pagingInfo="${dw}"/>
			</td>
		</tr>
	</table>
<table class="grid_table">
	<tr>
		<th style="width: 4%">编号</th>
		<th style="width: 13%">是否上<br>传水单</th>
		<th style="width: 10%">流水号</th>
		<th style="width: 10%"><page:pagingSort pagingInfo="${dw }" orderBy="OPPOSING_DATE">来款时间</page:pagingSort></th>
		<th style="width: 10%">对方户名</th>
		<th style="width: 10%">对方账号</th>
		<th style="width: 10%">虚拟账号</th>
		<th style="width: 10%">来款类型</th>
		<th style="width: 10%"><page:pagingSort pagingInfo="${dw }" orderBy="INCOME_MONEY">来款金额</page:pagingSort></th>
		<th style="width: 10%"><page:pagingSort pagingInfo="${dw }" orderBy="DETAIL_COUNT">认退记录</page:pagingSort></th>
		<th style="width: 10%"><page:pagingSort pagingInfo="${dw }" orderBy="SURPLUS_MONEY">剩余金额</page:pagingSort></th>
		<th style="width: 8%">操作</th>
	</tr>
	<c:forEach items="${dw.resultList}" var="fund" varStatus="index">
		<tr>
			<td style="text-align: center;">${index.count }&nbsp;</td>
			<td style="text-align: center;" <c:if test="${fund.HAS_FILE >0 }">onclick="expand('${fund.FIIN_ID}');"</c:if>>&nbsp;<c:if test="${fund.HAS_FILE >0 }"><img src="${ctx }/images/attach.jpg" title="已有水单上传" style="cursor: pointer;">${fund.HAS_FILE }份</c:if></td>
			<td style="text-align:right">${fund.INCOME_FINANCE_CODE }&nbsp;</td>
			<td style="text-align:center"><fmt:formatDate value="${fund.OPPOSING_DATE }" pattern="yyyy-MM-dd"/> &nbsp;</td>
			<td style="text-align:center">${fund.OPPOSING_UNIT }&nbsp;</td>
			<td style="text-align:right">${fund.OPPOSING_BANKNO }&nbsp;</td>
			<td style="text-align:right">${fund.VIRTUAL_CODE }&nbsp;</td>
			<td style="text-align:center">${fund.OPPOSING_TYPE }&nbsp;</td>
			<td style="text-align:right"><fmt:formatNumber type="currency" value="${fund.INCOME_MONEY }"/>&nbsp;</td>
			<td style="text-align:right"><c:if test="${fund.DETAIL_COUNT > 0 }"><a href="javascript:void(0);" onclick="showClaimDetail(${fund.FIIN_ID});">${fund.DETAIL_COUNT }</a></c:if><c:if test="${fund.DETAIL_COUNT <= 0 }">0</c:if>&nbsp;</td>
			<td style="text-align:right"><fmt:formatNumber type="currency" value="${fund.SURPLUS_MONEY }"/>&nbsp;</td>
			<td style="text-align:center"><a href="javascript:void(0);" onclick="showFundsReturn(${fund.FIIN_ID},${fund.SURPLUS_MONEY })">[退款]</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="upLoadTransferCertificate(${fund.FIIN_ID},${fund.INCOME_FINANCE_CODE })">[上传水单]</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="showMailMemo(${fund.FIIN_ID},'${fund.MAIL_MEMO}')">[查看备注]</a></td>
		</tr>
		<!-- Add by Michael 2012 05-24 查看上传水单 -->
		<tr>
			<th class="pact">
				<div id="pactAffix${fund.FIIN_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</th>											
		</tr>
		<!-- Add by Michael 2012 05-24 查看上传水单 -->
		<tr>
			<th class="pact" colspan="12">
				<div id="pactAffix_${fund.FIIN_ID}" align="center"
					style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</th>
		</tr>
	</c:forEach>
</table>
	<page:pagingToolbar pagingInfo="${dw}"/>
</div>
</div>
</div>
</form>

<c:if test="${errorMsg != null }">
<script type="text/javascript">
	$("#claimReason").dialog({modal:true, autoOpen:false, width:500});
	$("#claimReason").dialog("open");
</script>
</c:if>

<div style="display:none;" id="fundsReturn" title="请填写退款单">
	<font color="red">${errorMsg_return }</font>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="../servlet/defaultDispatcher" id="funds_return_form" method="post">
				<input type="hidden" id="__action" name="__action" value="decompose.subFundsReturn" />
				<input type="hidden" id="fiin_id_return" name="fiin_id" value="${fundReturn.fiin_id }"/>
				<input type="hidden" id="BIZ_TYPE" name="BIZ_TYPE" value="1"/>
				<input type="hidden" id="surplus_money_return" name="surplus_money" value="${fundReturn.surplus_money }"/>
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">受款人:<font color="red">*</font></td>
						<td><input type="text" name="payee" id="payee" class="tb_return" value="${fundReturn.payee }" readonly="readonly"/></td>
						<td align="right">退款日期</td>
						<td><input type="text" id="return_date" name="return_date" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">请款说明:<font color="red">*</font></td>
						<td>
							<select name="reason" id="reason_r" onchange="reasonOther(this);" class="tb_return">
								<option value="0">--------------请选择--------------</option>
								<option value="误汇款">误汇款</option>
								<option value="供应商代垫租金">供应商代垫租金</option>
								<option value="保险退款" >保险退款</option>
								<option value="保证金入我司">保证金入我司</option>
								<option value="我司转入供应商">我司转入供应商</option>
								<option value="-1" id="other">其他</option>
							</select>
						</td>
						<td align="right">
							<span class="reason_other_r">其他说明:<font color="red">*</font></span>
						</td>
						<td>
							<span class="reason_other_r"><input type="text" name="reason_other" id="reason_other_r" class="tb_return"/></span>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv" id="handling_charge_item">
						<td align="right">退款总额:<font color="red">*</font></td>
						<td>
							<input type="text" id="amount_input" name="amount_input" value="${fundReturn.amount_input }" class="tb_return" readonly="readonly"/>
						</td>
						<td align="right">手续费:<font color="red">*</font></td>
						<td>
							<input type="text" id="handling_charge" name="handling_charge" value="${fundReturn.handling_charge }" readonly="readonly" class="tb_return_ro"/>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">实际退款金额:<font color="red">*</font></td>
						<td><input type="text" name="amount" id="amount_r" value="${fundReturn.surplus_money }" class="tb_return" readonly="readonly"/></td>
						<td align="right">支付方式:<font color="red">*</font></td>
						<td><select name="pay_type" class="tb_return" id="pay_type">
							<option value="0">--------------请选择--------------</option>
							<option value="网银" <c:if test="${fundReturn.pay_type eq '网银' }">selected</c:if>>网银</option>
							<option value="转账支票" <c:if test="${fundReturn.pay_type eq '转账支票' }">selected</c:if>>转账支票</option>
						</select></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">银行名称:<font color="red">*</font></td>
						<td><input type="text" id="bank_name" name="bank_name" value="${fundReturn.bank_name }" class="tb_return_i"/></td>
						<td align="right">银行账号:<font color="red">*</font></td>
						<td><input type="text" name="bank_account" id="bank_account" value="${fundReturn.bank_account }" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">备注:<font color="red">*</font></td>
						<td colspan="3">
							<textarea id="remark" name="remark" rows="8" cols="76" style="border: 1px solid #A6C9E2;">${fundReturn.remark }</textarea>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="4" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut_r" value="确&nbsp;定" onclick="subFundsReturn()" class="ui-state-default ui-corner-all" >
							<input type="button" value="关&nbsp;闭" onclick="$('#fundsReturn').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<c:if test="${errorMsg_return != null }">
<script type="text/javascript">
	var now = new Date();
	$("#return_date").val(now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate());
	$("#fundsReturn").dialog({modal:true, autoOpen:false, width:600});
	$("#fundsReturn").dialog("open");
</script>
<c:if test="${fundReturn.reason != '误汇款' && fundReturn.reason != '供应商代垫租金' && fundReturn.reason != '保险退款'}">
	<script type="text/javascript">
		$("#other").attr("selected", true);
		$("#reason_other_r").val('${fundReturn.reason}');
		$("#reason_other_r").css("display", "block");
	</script>
</c:if>
</c:if>

<!------------弹出层:与来款金额相同的案件明细------------>
<div style="display: none;" id="showCustRecp" title="您当前的位置:暂收款管理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showCustRecpTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">承租人</td>
						<td style="text-align: center;">合同号</td>
						<td style="text-align: center;">期数</td>
						<td style="text-align: center;">支付日期</td>
						<td style="text-align: center;">应付租金</td>
						<td style="text-align: center;">业务经办</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- Add by Michael 2012 05-24 增加水单上传功能 -->
<!------------弹出层:增加水单上传功能------------>
<div style="display: none;" id="upLoad" title="您当前的位置:暂收款管理-上传水单">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="BIZ_TYPE" name="BIZ_TYPE" value="1"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">请选择要上传文件</TD>
					</TR>			
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">&nbsp;<input class="ui-state-default ui-corner-all" size="30" type="file" name="upLoadFile" id="upLoadFile"/></TD>
						<input name="fiinID" type="hidden"/>
						<input name="incomeFinanceCode" type="hidden"/>	
						<input type="hidden" id="__action" name="__action" value="decompose.uploadAll" />					
					</TR>
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%"><input type="button" id="subUpload" value="确&nbsp;定" onclick="funUploadFile()" class="ui-state-default ui-corner-all" ></TD>
					</TR>						
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<div style="display: none;" id="memoDiv" title="查看备注">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr">
				<form name="memoForm" id="memoForm" method="post">
				<input id="updateKey" name="updateKey" type="hidden">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td align="right">备注:</td>
						<td><textarea rows="5" cols="30" id="mailMemo" name="mailMemo"></textarea></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>