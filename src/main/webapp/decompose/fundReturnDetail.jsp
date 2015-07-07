<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>退款单</title>

<script type="text/javascript">
	$(function (){
		$("input").each(function (){
			$(this).attr("readonly", true);
		});
		window.print();
	});
</script>
<style type="text/css">
	.tb_return {border-bottom: 1px solid black; border-left: 1px solid white; 
		border-right: 1px solid white; border-top:1px solid white;
		width: 180px; height: 22px; background-color: white;
		font-size: 13px;
		text-align: center;
	}
	.tb_return_2 {border-bottom: 1px solid black; border-left: 1px solid white; 
		border-right: 1px solid white; border-top:1px solid white;
		width: 420px; height: 22px; background-color: white;
		font-size: 13px;
	}
	#table1 tr {height: 35px; vertical-align: middle; }
	#table1 td {font-size: 13px; font-weight: bold;}
	.solid_td {background-color: white;}
</style>
</head>
<body>
<table cellspacing="0" cellpadding="5" border="0" style="width: 650px; text-align: center;">
	<tr>
		<td align="left"><img src="${ctx }/images/taclogo.jpg" width="169" height="31"></td>
	</tr>
	<tr>
		<td style="font-size: 25px; font-weight: bold;"><%=Constants.COMPANY_NAME %></td>
	</tr>
	<tr>
		<td style="font-size: 20px;">退&nbsp;款&nbsp;单</td>
	</tr>
	<tr height="15px">
		<td>&nbsp;</td>
	</tr>
</table>
<div style="border: 1px solid black; padding: 1px; width: 650px;">
<table cellspacing="0" cellpadding="5" border="0" style="width: 650px; border: 1px solid black; padding-left: 5px; padding-right: 5px;" id="table1">
	<tr>
		<td align="right">受款人：</td>
		<td><input type="text" name="payee" class="tb_return" value="${resultMap.PAYEE }"/></td>
		<td align="right">退款日期：</td>
		<td><input type="text" id="return_date" name="return_date" class="tb_return" value="${resultMap.RETURN_DATE }"/></td>
	</tr>
	<tr>
		<td align="right">请款说明：</td>
		<td colspan="2">
			<c:choose><c:when test="${resultMap.REASON eq '误汇款'}">■</c:when><c:otherwise>□</c:otherwise></c:choose>误汇款
			<c:choose><c:when test="${resultMap.REASON eq '供应商代垫租金'}">■</c:when><c:otherwise>□</c:otherwise></c:choose>供应商代垫租金
			<c:choose><c:when test="${resultMap.REASON eq '保险退款'}">■</c:when><c:otherwise>□</c:otherwise></c:choose>保险退款
			<c:choose><c:when test="${resultMap.REASON != '误汇款' && resultMap.REASON != '供应商代垫租金' && resultMap.REASON != '保险退款'}"
				>■</c:when><c:otherwise>□</c:otherwise></c:choose>其他原因
		</td>
		<td>
			<c:if test="${resultMap.REASON != '误汇款' && resultMap.REASON != '供应商代垫租金' && resultMap.REASON != '保险退款'}">
				<c:set var="other_reason" value="${resultMap.REASON }"></c:set>
			</c:if>
			<input type="text" name="reason_other" id="reason_other" class="tb_return" value="${other_reason }"/>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<table cellspacing="0" cellpadding="5" border="1" style="background-color: black; text-align: center; width: 100%">
				<tr>
					<td class="solid_td" width="20%" rowspan="3">入款明细</td>
					<td class="solid_td" width="25%">汇款日期</td>
					<td class="solid_td" width="15%">汇款金额</td>
					<td class="solid_td" width="25%">汇款人</td>
					<td class="solid_td" width="15%" style="font-size: 10px;">备注(财务确认)</td>
				</tr>
				<tr>
					<td class="solid_td">${resultMap.OPPOSING_DATE }&nbsp;</td>
					<td class="solid_td"><fmt:formatNumber type="currency" value="${resultMap.INCOME_MONEY }"/>&nbsp;</td>
					<td class="solid_td">${resultMap.OPPOSING_UNIT }&nbsp;</td>
					<td class="solid_td">□</td>
				</tr>
				<tr>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">□</td>
				</tr>
				<tr>
					<td class="solid_td">合计</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">□</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td align="right">支付方式：</td>
		<td colspan="3">
			<c:choose><c:when test="${resultMap.PAY_TYPE eq '网银'}">■</c:when><c:otherwise>□</c:otherwise></c:choose>网银
			&nbsp;&nbsp;&nbsp;&nbsp;
			<c:choose><c:when test="${resultMap.PAY_TYPE eq '转账支票'}">■</c:when><c:otherwise>□</c:otherwise></c:choose>转账支票
		</td>
	</tr>
	<tr>
		<td align="right">退款金额：</td>
		<td colspan="3"><input type="text" name="amount" id="amount_r" value="<fmt:formatNumber type="currency" value="${resultMap.AMOUNT }"/>" class="tb_return_2"/></td>
	</tr>
	<tr>
		<td align="right">银行名称：</td>
		<td colspan="3"><input type="text" name="bank_name" value="${resultMap.BANK_NAME }" class="tb_return_2"/></td>
	</tr>
	<tr>
		<td align="right">银行账号：</td>
		<td colspan="3"><input type="text" name="bank_account" value="${resultMap.BANK_ACCOUNT }" class="tb_return_2"/></td>
	</tr>
	<tr>
		<td align="right">备注：</td>
		<td colspan="3">
			<input type="text" value="${resultMap.REMARK }" class="tb_return_2"/>
		</td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4">
			<table cellspacing="0" cellpadding="5" border="1" style="background-color: black; text-align: center; width: 100%">
				<tr>
					<td class="solid_td" width="16%">总经理</td>
					<td class="solid_td" width="42%" colspan="3">业管部</td>
					<td class="solid_td" width="42%" colspan="3">申请单位</td>
				</tr>
				<tr>
					<td class="solid_td" width="14%" rowspan="2">&nbsp;</td>
					<td class="solid_td" width="14%">部主管</td>
					<td class="solid_td" width="14%">科主管</td>
					<td class="solid_td" width="14%">业管行政</td>
					<td class="solid_td" width="14%">核准</td>
					<td class="solid_td" width="14%">审核</td>
					<td class="solid_td" width="14%">申请人</td>
				</tr>
				<tr>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		<td colspan="2">
			<table cellspacing="0" cellpadding="5" border="1" style="background-color: black; text-align: center; width: 100%">
				<tr>
					<td class="solid_td" width="100%" colspan="3">财务部</td>
				</tr>
				<tr>
					<td class="solid_td" width="33.33%">部主管</td>
					<td class="solid_td" width="33.33%">审核</td>
					<td class="solid_td" width="33.33%">出纳</td>
				</tr>
				<tr>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
					<td class="solid_td">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
</table>
</div>		
</body>
</html>