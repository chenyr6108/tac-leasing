<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function commitDecompose() {
				$("#__action").val("rentFinanceCommand.commitDecompose");
				$("form").submit();
			}
			
			//普通租金分解通过
			function confirmDecompose() {
				if(!confirm("确认通过?")) {
					return;
				}
				$("#__action").val("rentFinanceCommand.confirmDecompose");
				$("form").submit();
			}
			//普通租金分解驳回
			function rejectDecompose() {
				if(!confirm("确认驳回?")) {
					return;
				}
				$("#__action").val("rentFinanceCommand.rejectDecompose");
				$("form").submit();
			}
			//结清分解通过
			function confirmSettlementDecompose() {
				if(!confirm("确认通过?")) {
					return;
				}
				$("#__action").val("rentFinanceCommand.confirmSettlementDecompose");
				$("form").submit();
			}
			//结清分解驳回
			function rejectSettlementDecompose() {
				if(!confirm("确认驳回?")) {
					return;
				}
				$("#__action").val("rentFinanceCommand.rejectSettlementDecompose");
				$("form").submit();
			}
			
			function goBack(descomposeStatus,menu) {
				if(descomposeStatus==0) {
					location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryOnDecomposeMoney&cardFlag=1&menu="+menu;
				} else if(descomposeStatus==1) {
					location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryCommitFinanceMoney&cardFlag=2&menu="+menu;
				} else if(descomposeStatus==2) {
					location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryFinanceConfirm&cardFlag=3&menu="+menu
							+"&content="+$("#content").val()+"&fromMoney="+$("#fromMoney").val()+"&toMoney="+$("#toMoney").val()+"&fromDate="+$("#fromDate").val()+"&toDate="+$("#toDate").val();
				} else if(descomposeStatus==-1) {
					location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryFinanceReject&cardFlag=4&menu="+menu;
				}
			}
		</script>
	</head>
</html>
<body>
	<form method="post" id="form" action="${ctx}/servlet/defaultDispatcher">
	<input name="__action" id="__action" type="hidden">
	<input name="recpId_" type="hidden" value="${recpId }">
	<input id="content" type="hidden" value="${content }">
	<input id="fromDate" type="hidden" value="${fromDate }">
	<input id="toDate" type="hidden" value="${toDate }">
	<input id="fromMoney" type="hidden" value="${fromMoney }">
	<input id="toMoney" type="hidden" value="${toMoney }">
	<input name="is_settlement_decompose" id="is_settlement_decompose" type="hidden" value="${resultList[0].IS_SETTLEMENT_DECOMPOSE }">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 1000px;">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;
   			<c:if test="${resultList[0].IS_SETTLEMENT_DECOMPOSE==1 }">结清分解</c:if>
   			<c:if test="${resultList[0].IS_SETTLEMENT_DECOMPOSE==0 or empty resultList[0].IS_SETTLEMENT_DECOMPOSE }">租金分解</c:if>
   		</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
       <div class="zc_grid_body jqgrowleft">
		  <div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
		  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款户名：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_NAME }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款账户：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_ACCOUNT }&nbsp;
							</td>
						</tr>
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								客户名称：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_NAME_TRUE }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款时间：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_DATE }&nbsp;
							</td>
						</tr>
						<tr>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								财务确认时间：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								<fmt:formatDate value="${resultList[0].AUDIT_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款金额：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								￥<fmt:formatNumber pattern="#,##0.00" value="${resultList[0].TOTAL_MONEY}"/>&nbsp;
							</td>
						</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								序号
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								合同单位
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								开票单位
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								合同号
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								支付表号
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								分解项目
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								应收时间
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								应收金额
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								实收金额
							</td>
						</tr>
						<c:forEach var="item" items="${resultList }" varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${status.count }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.INCOME_NAME_TRUE }&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.INCOME_NAME_TRUE }&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.LEASE_CODE }&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.RECP_CODE }&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.descr }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.PAY_DATE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.SHOULD_PRICE }"/>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.REAL_PRICE }"/>
									<input type="hidden" name="bill_id" value="${item.BILL_ID }">
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="9" style="text-align: center;">
									<br>
									<c:if test="${decomposeStatus==0 }">
										<input value="提交财务" class="ui-state-default ui-corner-all" type="button" onclick="commitDecompose()">
									</c:if>
									<c:if test="${menu=='confirmDecompose'&&decomposeStatus==1 }">
										<c:if test="${resultList[0].IS_SETTLEMENT_DECOMPOSE==0 or empty resultList[0].IS_SETTLEMENT_DECOMPOSE }">
											<input value="通过" class="ui-state-default ui-corner-all" type="button" onclick="confirmDecompose()">
											<input value="驳回" class="ui-state-default ui-corner-all" type="button" onclick="rejectDecompose()">
										</c:if>	
										<c:if test="${resultList[0].IS_SETTLEMENT_DECOMPOSE==1 }">
											<input value="通过" class="ui-state-default ui-corner-all" type="button" onclick="confirmSettlementDecompose()">
											<input value="驳回" class="ui-state-default ui-corner-all" type="button" onclick="rejectSettlementDecompose()">
										</c:if>
									</c:if>	
										<input value="返回" class="ui-state-default ui-corner-all" type="button" onclick="goBack('${decomposeStatus }','${menu }')">
								</td>
							</tr>
				</table>
		  </div>
	   </div>
	</div>
	</form>
</body>