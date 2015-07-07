<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/decompose.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
		<script type="text/javascript" src="goodDrag.js">
		<script type="text/javascript">
		$(function() {
			goodDrag('chanchu2', 'chanchu1',false);
		});
		</script>
		<title>分解单管理--分解列表</title>
	</head>

	<body>
		<c:set property="Map" value="${custIncomeMap}" var="incomeInfo">
		</c:set>
		<form name="decompose" id="decompose" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="__action" id="__action" value="decompose.handDecompose">
			<input type="hidden" name="CUST_NAME" value="${cust_name }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;分解单管理--分解列表</span>
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
					<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						${cust_name }&nbsp;
					</td>
					<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						所选金额合计：
					</td>
					<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
						<p id="select_price" align="left" ></p>
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						&nbsp;<!-- <input type="checkbox" name="item_num_all" id="item_num_all"
							onclick="checkall()"> -->
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
						应收金额
					</th>
					<th width="10" class="ui-state-default ui-th-ltr zc_grid_head">
						来款供应商
					</th>
				</tr>
				<c:set value="" var="num" ></c:set>
				<tbody style="overflow-x: hidden; height: 300; overflow-y: scroll;">
				<c:set value="0" var="num" ></c:set>
					<c:forEach items="${custDecomposeList}" var="decomposeList"
						varStatus="status">
						<c:if test="${not empty custDecomposeList}">
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<c:set value="${status.count }" var="num" ></c:set>
									<input type="hidden" name="item_count" id="item_count" value="${status.count }" />
									${status.count }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="radio" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${decomposeList.PAYLIST_ID }">
									${decomposeList.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${decomposeList.PAYLIST_CODE }">
									${decomposeList.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${decomposeList.SDATE }">
									${decomposeList.SDATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="${decomposeList.FICB_ITEM }"><!-- Add By Michael 2011 12/27 增加列出罚息明细，如果分解项次是租金罚息时，就可以显示出罚息明细 --><c:choose><c:when test="${decomposeList.SOBJ eq '租金罚息' }"><input name="input3" class="ui-state-default ui-corner-all" type="button" value="租金罚息明细" class="button_keda" onClick="showDunDetail('${decomposeList.PAYLIST_CODE }');"></c:when><c:otherwise>${decomposeList.SOBJ }</c:otherwise></c:choose></td>
								<c:choose>
									<c:when test="${decomposeList.SOBJ eq '违约金' }">
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="hidden" name="should_price" id="bocamount"
												value="${decomposeList.SPRICE }">
											<input type="text" name="bcamount" id="bcamount" onchange="changeField(this);" value="<fmt:formatNumber value='${decomposeList.SPRICE}' type='currency'></fmt:formatNumber>" />
										</td>
									</c:when>
									<c:otherwise>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="hidden" name="should_price"
												value="${decomposeList.SPRICE }">
											<fmt:formatNumber value="${decomposeList.SPRICE}"
												type="currency">
											</fmt:formatNumber>
										</td>
									</c:otherwise>
								</c:choose>
								<td class="ui-widget-content jqgrow ui-row-ltr">
								<c:choose>
									<c:when test="${decomposeList.PRICE_TYPE eq '11111'}">
										<select name="SUPL_CODE">
											<option value="">-请选供应商-</option>
											<c:forEach items="${suppList}" var="suppList"	varStatus="status">
												<c:if test="${decomposeList.PAYLIST_ID eq suppList.RECP_ID}">
													<option value="${suppList.CODE }">${suppList.NAME }</option>
												</c:if>
											</c:forEach>
										</select>
									</c:when>
									<c:otherwise>
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>
									</c:otherwise>
								</c:choose>
					
									<input type="hidden" name="recd_period"
										value="${decomposeList.RECD_PERIOD }">
									<input type="hidden" name="recd_type"
										value="${decomposeList.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${decomposeList.O }">
									<input type="hidden" name="select_tax_plan_code"
										value="${decomposeList.TAX_PLAN_CODE }">&nbsp;
								</td>
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							${num +1 }
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
							<input type="hidden" name="ficb_item"
										value="待分解来款">
							待分解来款
						</td>
						<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="should_price" id="waitmoney_should_price"
									value="${incomeInfo.INCOME_MONEY }">							
							<fmt:formatNumber value="${incomeInfo.INCOME_MONEY }"
								type="currency">
							</fmt:formatNumber>
						</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
				<tr>
					<td align="center" colspan="7">
						<input align="center" type="button" name="handDecom" value="手动生成分解单" class="ui-state-default ui-corner-all"
							onclick="handDecompose()" />
						<!-- <input type="button" name="autoDecom" value="自动生成分解单" class="ui-state-default ui-corner-all"
							onclick="autoDecompose()" /> -->
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<input type="hidden" name="select_recp_id" id="select_recp_id"
							value="" />
						<input type="hidden" name="select_recp_code" id="select_recp_code"
							value="" />
						<input type="hidden" name="select_pay_date" id="select_pay_date"
							value="" />
						<input type="hidden" name="select_ficb_item" id="select_ficb_item"
							value="" />
						<input type="hidden" name="select_should_price"
							id="select_should_price" value="" />
						<input type="hidden" name="select_recd_period"
							id="select_recd_period" value="" />
						<input type="hidden" name="select_recd_type" id="select_recd_type"
							value="" />
						<input type="hidden" name="select_item_order"
							id="select_item_order" value="" />
						<input type="hidden" name="select_item_count"
							id="select_item_count" value="" />
						<input type="hidden" name="select_income_id" id="select_income_id"
							value="${incomeInfo.FIIN_ID }">
						<input type="hidden" name="cust_code" id="cust_code"
							value="${cust_code }">
						<input type="hidden" name="recp_code" id="recp_code"
							value="${recp_code }">
						<input type="hidden" name="settle_flag" id="settle_flag"
							value="${settle_flag }">
						<input type="hidden" name="ficb_flag" id="ficb_flag"
							value="${ficb_flag }">
						<input type="hidden" name="tax_plan_code"
							id="tax_plan_code" value="" />
						<input type="hidden" name="select_supl_code"
							id="select_supl_code" value="" />							
					</td>
				</tr>
			</table>
		</form>
		<!-- Add by Michael 2011 12/27 增加弹出罚息明细 -->
		<!------------弹出层:弹出租金罚息明细------------>
		<div style="display: none;" id="dunDetailDiv" title="您当前的位置:租金罚息明细">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="maindun">
	           <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
			<table id="dunDetailTableID" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>支付表号</td>
					<td>期数</td>
					<td>支付日</td>
					<td>来款日</td>
					<td>应付金额</td>
					<td>实付金额</td>
					<td>逾期金额</td>
					<td>逾期天数</td>
					<td>罚息</td>
				</tr>
			</table>
			</div>
				</div>
				</div>
			</div>
	</body>
</html>
