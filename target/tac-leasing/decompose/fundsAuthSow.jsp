<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>暂收款认退记录</title>

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

function expand(FIIN_ID){	
    $("#pactAffix"+FIIN_ID).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=decompose.queryFileUpMore&FIIN_ID=" + FIIN_ID);
    });
}
</script>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px; text-align: center;}
</style>
</head>
<body>
<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
<input type="hidden" id="__action" name="__action" value="decompose.fundsAuthSow" />

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;暂收款认退记录</span>
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
					<td>查询内容：</td>
					<td colspan="5"><input type="text" value="${search_content}" name="search_content" id="search_content" style="width: 228px;"/></td>
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
			<td><%@ include file="/common/pageControlTop.jsp"%></td>
		</tr>
	</table>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">流水号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">来款日期</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">对方户名</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">来款金额</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">款别</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请金额</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请原因</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请时间</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">确认人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">确认时间</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${dw.rs}" var="fund" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td onclick="expand('${fund.FIIN_ID}');" style="cursor: pointer;text-align: center;"><input type="button" style="cursor: pointer;" class="ui-state-default ui-corner-all" value="${index.count }">&nbsp;</td>
			<td align="center">${fund.INCOME_FINANCE_CODE }&nbsp;</td>
			<td align="center"><fmt:formatDate value="${fund.OPPOSING_DATE }" pattern="yyyy-MM-dd"/> &nbsp;</td>
			<td align="center">${fund.OPPOSING_UNIT }&nbsp;</td>
			<td align="center"><fmt:formatNumber type="currency" value="${fund.INCOME_MONEY }"/>&nbsp;</td>
			<td align="center"><c:if test="${fund.FUND_TYPE == 1 }">认领款</c:if><c:if test="${fund.FUND_TYPE == 2 }">退款</c:if>&nbsp;</td>
			<td align="center"><fmt:formatNumber type="currency" value="${fund.AMOUNT }"/>&nbsp;</td>
			<td align="center">${fund.REASON }&nbsp;</td>
			<td align="center">${fund.MODIFY_BY }&nbsp;</td>
			<td align="center"><fmt:formatDate value="${fund.MODIFY_DATE }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;</td>
			<td align="center">${fund.AUTH_BY }&nbsp;</td>
			<td align="center"><fmt:formatDate value="${fund.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;</td>
			<td align="center"><c:if test="${fund.FUND_TYPE == 2}"><a href="javascript:void(0);" onclick="exportFundDetail('${fund.ID}');">[打印退款单]</a></c:if>&nbsp;</td>
		</tr>
		<!-- Add by Michael 2012 05-24 查看上传水单 -->
		<tr>
			<td style="text-align: center;" colspan="10"  align="center">
				<div id="pactAffix${fund.FIIN_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</td>											
		</tr>
		<!-- Add by Michael 2012 05-24 查看上传水单 -->		
	</c:forEach>
	</tbody>
</table>
	<%@ include file="/common/pageControl.jsp"%>
</div>
</div>
</div>
</form>
</body>
</html>