<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/decomposebill.js"></script>
		<script type="text/javascript" src="goodDrag.js">
		<script type="text/javascript">
		$(function() {
			goodDrag('chanchu2', 'chanchu1',false);
		});
		</script>
		<title>分解单管理--来款分解单</title>
	</head>

	<body>
		<c:set var="incomeInfo" value="${incomeMap}" property="map" >
		</c:set>
		<c:set var="decomposeEmpInfo" value="${decomposeEmpMap}" property="map" >
		</c:set>
		<form name="commitform" id="commitform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" id="__action" value="decompose.commitDecomposeBill"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;分解单管理--来款分解单</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
						发票号码：
					</td>
					<td>

					</td>
				</tr>
				<tr>
					<td>
						K3接口凭证号：
					</td>
					<td>

					</td>
					<td>
						K3接口凭证制单人：
					</td>
					<td>

					</td>
					<td>
						收据号码：
					</td>
					<td>

					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="select_income_id" id="select_income_id" value="${incomeInfo.FIIN_ID }">
						来款合同分解单--分解单编号：${incomeInfo.FIIN_ID }
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						分解状态：
						<c:choose>
							<c:when test="${incomeInfo.DECOMPOSE_STATUS eq 1}">
								财务驳回
							</c:when>
							<c:when test="${incomeInfo.DECOMPOSE_STATUS eq 3}">
								分解中
							</c:when>
							<c:when test="${incomeInfo.DECOMPOSE_STATUS eq 4}">
								提交财务
							</c:when>
							<c:when test="${incomeInfo.DECOMPOSE_STATUS eq 5}">
								财务确认
							</c:when>
						</c:choose>
					</td>
				</tr>
				<c:choose>
					<c:when test="${not empty incomeInfo.RED_ID}">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								冲红原因：
							</td>
							<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;
							</td>
						</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						来款时间：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_DATE }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						来款单位：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_UNIT }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						来款金额：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber value="${incomeInfo.INCOME_MONEY}" type="currency" >
						</fmt:formatNumber>&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						收款银行：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.BANK_NAME }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						收款账号：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.ACCOUNT_NO }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						收款类型：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_TYPE }&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						承租人：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.CUST_NAME }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						来款账号：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_BANKO }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						金额合计：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber value="${decomposeEmpInfo.REAL_PRICE }" type="currency" >
						</fmt:formatNumber>&nbsp;<input type="hidden" name="ficb_flag" id="ficb_flag" value="${ficb_flag }">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						待分解来源：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${not empty incomeInfo.LEFT_ID}">
								分解单：<a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${incomeInfo.LEFT_ID }">${incomeInfo.LEFT_ID }</a>
							</c:when>
							<c:otherwise>
								非待分解来款
							</c:otherwise>
						</c:choose>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						待分解去处：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${not empty incomeInfo.NEXT_LEFT_ID}">
								分解单：<a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${incomeInfo.NEXT_LEFT_ID }">${incomeInfo.NEXT_LEFT_ID }</a>
							</c:when>
							<c:otherwise>
								未剩余待分解款
							</c:otherwise>
						</c:choose>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>	
					<td class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						冲红单来源：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${not empty incomeInfo.RED_ID}">
								分解单：<a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${incomeInfo.RED_ID }">${incomeInfo.RED_ID }</a>
							</c:when>
							<c:otherwise>
								非冲红单
							</c:otherwise>
						</c:choose>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						被冲红分解单：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${not empty incomeInfo.NEXT_RED_ID}">
								分解单：<a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${incomeInfo.NEXT_RED_ID }">${incomeInfo.NEXT_RED_ID }</a>
							</c:when>
							<c:otherwise>
								未被冲红
							</c:otherwise>
						</c:choose>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						来款备注：
					</td>
					<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_SUMMARY }&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						交易附言：
					</td>
					<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_POSTSCRIPT }&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						资金备注：
					</td>
					<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${not empty incomeInfo.OPERATE_TIME}">
								${incomeInfo.OPERATE_REMARK }  --  ${incomeInfo.OPERATE_NAME }  ${incomeInfo.OPERATE_TIME }↓
							</c:when>
							<c:otherwise>
								&nbsp;
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						制单人：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.DECOMPOSE_NAME }&nbsp;
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						制单时间：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.DECOMPOSE_DATE }&nbsp;
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						分解确认人：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.CHECK_NAME }&nbsp;
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						确认时间：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.CHECK_DATE }&nbsp;
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						冲红确认人：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.RED_CHECK_NAME }&nbsp;
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						确认时间：
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						${decomposeEmpInfo.RED_CHECK_DATE }&nbsp;
					</td>					
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同单位
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						开票单位
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						支付表编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						分解项目
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						应收时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						应收金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						实收金额
					</th>
				</tr>
				<c:forEach var="decomposeBill" items="${decomposeBillList}" varStatus="status" >
					<tr>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.CUST_NAME }&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.CUST_NAME }&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.LEASE_CODE }&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.RECP_CODE }&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.FICB_ITEM }&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${decomposeBill.PAY_DATE }&nbsp;
						</td>
						<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber value="${decomposeBill.SHOULD_PRICE }" type="currency">
							</fmt:formatNumber>&nbsp;
						</td>
						<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber value="${decomposeBill.REAL_PRICE }" type="currency">
							</fmt:formatNumber>&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8" align="center">
						<c:choose>
							<c:when test="${operate_flag eq 1}">
								<input type="submit" name="commitDecompose" value="提交财务">
								<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
							</c:when>
							<c:when test="${operate_flag eq 2}">
								<c:choose>
									<c:when test="${incomeInfo.DECOMPOSE_STATUS eq 4}">
										<input type="hidden" name="check_flag" id="check_flag" value="">
										<input type="button" name="passDecom" value="通过"
											onclick="passDecompose()">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" name="backDecom" value="驳回"
											onclick="backDecompose()">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:when>
								</c:choose>
								<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
							</c:when>
							<c:when test="${operate_flag eq 3}">
								<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
							</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
