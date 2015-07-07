<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>暂收款认领、退回。</title>

<script type="text/javascript" src="${ctx }/decompose/js/fillCustInfo.js"></script>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function (){
	$("#opp_data_from").datepicker($.datepicker.regional['zh-CN']);
	$("#opp_data_to").datepicker($.datepicker.regional['zh-CN']);
});

function exportFundDetail(id){
/* 	var url = "${ctx }";
	window.parent.openCredit(url,"decompose.showFundReturnDetail&detail_id=" + id); */
	window.parent.callBirt("birtReport/financeReport/exportFundReturnDetail.rptdesign","pdf",{"detail_id":id});
}

function expandUploadFile(incomeId) {	
    $("#pactAffix"+incomeId).toggle(function() {
        $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.showUploadFileList&incomeId="+incomeId);
    });
}
</script>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px; text-align: center;}
</style>
</head>
<body>
<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.fundsAuthSow" />

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;认退记录</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
      <tr valign="center">
        <td width="54" class="ss_bigo">&nbsp;</td>
        <td width="600" class="ss_bigt" valign="center" >
			<table>
				<tr>
					<td>来款日期：从</td>
					<td><input type="text" value="${opp_data_from}" name="opp_data_from" id="opp_data_from" readonly="readonly" style="width:100px;"/></td>
					<td>到：<input type="text" value="${opp_data_to}" name="opp_data_to" id="opp_data_to" readonly="readonly" style="width:100px;"/></td>
					<td>来款金额：从
					<td><input type="text" id="income_money_from" value="${income_money_from}" name="income_money_from" style="width: 100px;"/></td>
					<td>至：<input type="text" id="income_money_to" value="${income_money_to}" name="income_money_to" style="width: 100px;"/></td>
				</tr>
				<tr>
					<td>申请金额：从</td>
					<td><input type="text" value="${amount_from}" name="amount_from" id="amount_from" style="width:100px;"></td>
					<td>至：<input type="text" value="${amount_to}" name="amount_to" id="amount_to" style="width:100px;"/></td>
					<td>认退款别：</td>
					<td colspan="2">
						<select id="fund_type" name="fund_type" style="width: 228px;">
							<option value="">--------------全部--------------</option>
							<option value="1" <c:if test="${fund_type == 1}">selected="selected"</c:if>>认领款</option>
							<option value="2" <c:if test="${fund_type == 2}">selected="selected"</c:if>>退款</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					公司别：
					<select name="companyCode">
						<option value="">全部</option>
						<c:forEach items="${companys}" var="item">
							<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
						</c:forEach>
					</select>			          
					</td>
					<td>查询内容：</td>
					<td colspan="3"><input type="text" value="${search_content}" name="search_content" id="search_content" style="width: 228px;"/></td>
				</tr>
			</table>
 		</td>
   <td width="100" class="ss_bigt" valign="middle">
   <a href="javaScript:void(0)" id="search" onclick="$('#form1').submit();" class="blue_button">搜 索</a></td>
     <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
  </tr>
</table>
</div>
<br/>
<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr >
			<td>
				<page:pagingToolbarTop pagingInfo="${dw }"/>
			</td>
		</tr>
	</table>
<table class="grid_table">
	<thead>
	<tr>
		<th>编号</th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="INCOME_DATE">来款日期</page:pagingSort></th>
		<th>对方户名</th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="INCOME_MONEY">来款金额</page:pagingSort></th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="TYPE">款别</page:pagingSort></th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="AMOUNT">申请金额</page:pagingSort></th>
		<th>申请原因</th>
		<th>申请人</th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="CREATE_TIME">申请时间</page:pagingSort></th>
		<th>确认人</th>
		<th><page:pagingSort pagingInfo="${dw }" orderBy="AUTH_TIME">确认时间</page:pagingSort></th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${dw.resultList}" var="fund" varStatus="index">
		<tr>
			<td>
				${index.count }
			</td>
			<td>${fund.INCOME_DATE }&nbsp;</td>
			<td>${fund.INCOME_NAME }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber type="currency" value="${fund.INCOME_MONEY }"/>&nbsp;</td>
			<td>${fund.TYPE }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber type="currency" value="${fund.AMOUNT }"/>&nbsp;</td>
			<td>${fund.REASON }&nbsp;</td>
			<td>${fund.CU }&nbsp;</td>
			<td><fmt:formatDate value="${fund.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;</td>
			<td>${fund.AU }&nbsp;</td>
			<td><fmt:formatDate value="${fund.AUTH_TIME }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;</td>
			<td><c:if test="${fund.TYPE eq '退款' }"><a href="javascript:void(0);" onclick="exportFundDetail('${fund.ID}');">[打印退款单]</a></c:if>&nbsp;</td>
		</tr>
		<tr>
			<th colspan="14" class="pact">
				<div id="pactAffix${item.INCOME_ID}" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:40%">
					<img src="${ctx }/images/029.gif">
				</div>
			</th>											
		</tr>
	</c:forEach>
	</tbody>
</table>
	<page:pagingToolbar pagingInfo="${dw }"/>
</div>
</div>
</div>
</form>
</body>
</html>