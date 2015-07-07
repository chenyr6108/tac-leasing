<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function commitDecompose() {
				$("form").submit();
			}
		</script>
	</head>
</html>
<body>
	<form method="post" id="form" action="${ctx}/servlet/defaultDispatcher?__action=rentFinanceCommand.commitDecompose">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 1000px;">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;租金分解</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
       <div class="zc_grid_body jqgrowleft">
		  <div class="ui-state-default ui-jqgrid-hdiv">
		  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款户名：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].income_name }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款账户：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].income_account }&nbsp;
							</td>
						</tr>
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								客户名称：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].income_name_true }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款时间：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].income_date }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款金额：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								￥<fmt:formatNumber pattern="#,##0.00" value="${resultList[0].income_money}"/>&nbsp;
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
									${item.income_name_true }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.income_name_true }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.lease_code }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.recp_code }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.descr }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.pay_date }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.should_price }"/>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.real_price }"/>
									<input type="hidden" name="bill_id" value="${item.bill_id }">
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="9" style="text-align: center;">
								<br>
								<input value="提交财务" class="ui-state-default ui-corner-all" type="button" onclick="commitDecompose()">
							</td>
						</tr>
				</table>
		  </div>
	   </div>
	</div>
	</form>
</body>