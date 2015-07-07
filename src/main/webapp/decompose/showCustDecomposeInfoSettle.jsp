<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/decompose.js"></script>
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
						<input type="checkbox" name="item_num_all" id="item_num_all"
							onclick="checkall()">
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
						
					</th>
				</tr>
				<tbody style="overflow-x: hidden; height: 300; overflow-y: scroll;">
				<!-- 本金 -->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="1" />
									1
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id" value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code" value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date" value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item" value="结清本金">
									结清本金
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price" value="${custDecomposeMap.REAL_OWN_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_OWN_PRICE}" type="currency"/>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period" value="0">
									<input type="hidden" name="recd_type" value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order" value="${custDecomposeMap.O }">
									<input type="hidden" name="select_tax_plan_code"
										value="${custDecomposeMap.TAX_PLAN_CODE }">	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>	
								</td>
							</tr>
				<!-- 利息 -->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="2" />
									2
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清利息">
									结清利息
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_REN_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_REN_PRICE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
									<input type="hidden" name="select_tax_plan_code"
										value="${custDecomposeMap.TAX_PLAN_CODE }">		
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>												
								</td>
							</tr>
					<!-- 罚息 -->
				<tr>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="item_count" id="item_count" value="2" />
						3
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="recp_id"
							value="${custDecomposeMap.PAYLIST_ID }">
						${custDecomposeMap.LEASE_CODE }
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="recp_code"
							value="${custDecomposeMap.PAYLIST_CODE }">
						${custDecomposeMap.PAYLIST_CODE }
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="pay_date"
							value="${custDecomposeMap.SETTLE_DATE }">
						${custDecomposeMap.SETTLE_DATE }
					</td>
					<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="ficb_item"
							value="结清罚息">
						结清罚息
					</td>
					<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="should_price"
							value="${custDecomposeMap.REAL_DUN_PRICE }">
						<fmt:formatNumber value="${custDecomposeMap.REAL_DUN_PRICE}"
							type="currency">
						</fmt:formatNumber>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="recd_period"
							value="0">
						<input type="hidden" name="recd_type"
							value="${custDecomposeMap.RECD_TYPE }">
						<input type="hidden" name="item_order"
							value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>															
					</td>
				</tr>						
				<!-- 违约金-->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="3" />
									4
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清违约金">
									结清违约金
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_BREACH_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_BREACH_PRICE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">	
						<input type="hidden" name="select_supl_code"
							id="select_supl_code" value="" />	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>																		
								</td>
							</tr>
				<!-- 结清损害金 -->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="4" />
									5
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清损害金">
									结清损害金
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_DAMAGE_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_DAMAGE_PRICE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>																		
								</td>
							</tr>
				<!-- 结清留购价-->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="5" />
									6
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清留购价">
									结清留购价
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_STAYBUY_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_STAYBUY_PRICE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>																		
								</td>
							</tr>
						<!-- 结清法务费用-->	
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="7" />
									7
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清法务费用">
									结清法务费用
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_TOTAL_LAWYFEE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_TOTAL_LAWYFEE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>																		
								</td>
							</tr>
				<!-- 结清其他费用-->
							<tr>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="item_count" id="item_count" value="8" />
									8
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_id"
										value="${custDecomposeMap.PAYLIST_ID }">
									${custDecomposeMap.LEASE_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recp_code"
										value="${custDecomposeMap.PAYLIST_CODE }">
									${custDecomposeMap.PAYLIST_CODE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="pay_date"
										value="${custDecomposeMap.SETTLE_DATE }">
									${custDecomposeMap.SETTLE_DATE }
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="ficb_item"
										value="结清其他费用">
									结清其他费用
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="should_price"
										value="${custDecomposeMap.REAL_OTHER_PRICE }">
									<fmt:formatNumber value="${custDecomposeMap.REAL_OTHER_PRICE}"
										type="currency">
									</fmt:formatNumber>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="recd_period"
										value="0">
									<input type="hidden" name="recd_type"
										value="${custDecomposeMap.RECD_TYPE }">
									<input type="hidden" name="item_order"
										value="${custDecomposeMap.O }">
						<input type="hidden" name="select_tax_plan_code"
							value="${custDecomposeMap.TAX_PLAN_CODE }">	
										<select name="SUPL_CODE" style="display: none;">
											<option value="0">0</option>
										</select>																		
								</td>
							</tr>
					<tr>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="item_count" id="item_count" value="9" />
							9
						</td>
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="checkbox" name="item_num" value="" onclick="sumSelectPrice()">
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
							<input type="hidden" name="should_price"
									value="${incomeInfo.INCOME_MONEY }">							
							<fmt:formatNumber value="${incomeInfo.INCOME_MONEY }"
								type="currency">
							</fmt:formatNumber>
						</td>
						<td>
						</td>
					</tr>
				</tbody>
				<tr>
					<td align="center" colspan="7">
						<input type="button" name="handDecom" value="手动生成分解单" class="ui-state-default ui-corner-all"
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
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
