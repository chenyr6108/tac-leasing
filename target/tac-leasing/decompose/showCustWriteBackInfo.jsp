<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>

		<script type="text/javascript">

		function makeWriteBackAll(){
			if(confirm("确定整单冲红？")){
				document.getElementById("decompose").submit();
			}
		}
		</script>
		<title>冲红单管理--冲红列表</title>
	</head>

	<body>
		<c:set property="Map" value="${custIncomeMap}" var="incomeInfo">
		</c:set>
		<form name="decompose" id="decompose" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="__action" id="__action" value="checkDecompose.writeBackTranction">
			<input type="hidden" name="select_income_id" id="select_income_id" value="${select_income_id }">
			<input type="hidden" name="recp_code" id="recp_code" value="${recp_code }">
			<input type="hidden" name="cust_name" id="cust_name" value="${cust_name }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;冲红单管理（整单）--冲红列表</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						来款银行：
					</td>
					<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_BANKNAME }&nbsp;
					</td>
					<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						来款账户：
					</td>
					<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_BANKNO }&nbsp;
					</td>
				</tr>
				<tr>
					<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						来款单位：
					</td>
					<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_UNIT }&nbsp;
					</td>
					<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						来款金额：
					</td>
					<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="income_money" id="income_money" value="${incomeInfo.INCOME_MONEY }">
						<input type="hidden" name="opposing_date" id="opposing_date" value="${incomeInfo.OPPOSING_DATE }">
						<fmt:formatNumber value="${incomeInfo.INCOME_MONEY }"
							type="currency"></fmt:formatNumber>&nbsp;
					</td>
				</tr>
				<tr>
					<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						来款备注：
					</td>
					<td align="left" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_SUMMARY }&nbsp;
					</td>
				</tr>
				<tr>
					<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						交易附言：
					</td>
					<td align="left" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						${incomeInfo.OPPOSING_POSTSCRIPT }&nbsp;
					</td>
				</tr>
				<tr>
					<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						承租人：
					</td>
					<td colspan="3" width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						${cust_name }&nbsp;
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						支付表号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						应收时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						分解项目
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						对应期次
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						应收金额
					</th>
					<!--  <th class="ui-state-default ui-th-ltr zc_grid_head">
						实收金额-->
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						冲红金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						
					</th>

				</tr>
				<c:set value="" var="num" ></c:set>
				<tbody style="overflow-x: auto; height: 300; overflow-y: scroll;">
				<c:set value="0" var="num" ></c:set>
					<c:forEach items="${custDecomposeList}" var="custDecomposeList"
						varStatus="status">
						<c:if test="${not empty custDecomposeList}">
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									${status.count }&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									${custDecomposeList.RECP_ID }&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									
									${custDecomposeList.RECP_CODE }&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									
									${custDecomposeList.PAY_DATE }&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									
									${custDecomposeList.FICB_ITEM }&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									
									${custDecomposeList.RECD_PERIOD }&nbsp;
								</td>
								
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber type="currency" value="${custDecomposeList.SHOULD_PRICE }"></fmt:formatNumber>&nbsp;
								</td>
								<!-- <td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber type="currency" value="${custDecomposeList.REAL_PRICE}"></fmt:formatNumber>&nbsp;
								</td> -->
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber type="currency" value="${custDecomposeList.REAL_PRICE-2*custDecomposeList.REAL_PRICE }"></fmt:formatNumber>&nbsp;
								</td>
								<td align="right" width="10%" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
							
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					

						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							整单冲红总金额
						</td>
						<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="should_price"
									value="${incomeInfo.INCOME_MONEY }">							
							<fmt:formatNumber value="${incomeInfo.INCOME_MONEY }"
								type="currency">
							</fmt:formatNumber>
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
				</tbody>
				<tr>
					<td align="center" colspan="7">
						<input type="button" name="handDecom" value="提交" class="ui-state-default ui-corner-all"
							onclick="makeWriteBackAll();" />
						<input type="button" name="autoDecom" value=返回 class="ui-state-default ui-corner-all"
							onclick="javascript:history.go(-1);" />
					</td>
				</tr>
			</table>
		
		</form>
	</body>
</html>
