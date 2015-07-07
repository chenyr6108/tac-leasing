<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>归户查询</title>
		<script type="text/javascript">
		function openNewTab(path,title,vip){
			window.parent.openTab({tabName:title,location:'${ctx }/servlet/defaultDispatcher?__action='+path});			
		}
		
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="riskAudit.getGuiHuForAudit">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;归户查询</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		   	<div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr>
							<td width="8">&nbsp;</td>
							<td width="60" class="ss_o"></td>
							<td width="60%" class="ss_t" valign="center">
								<table style="margin-left: 10px;">
									<tr>
										<td>客户名称：</td>
										<td><input type="text" name="cust_name" value="${cust_name }" style="width: 200px;"></td>
										<td>供应商名称：</td>
										<td><input type="text" name="supl_name" value="${supl_name }" style="width: 200px;"></td>
									</tr>
									<tr>
										<td>案件状态：</td>
										<td><cs:creditStatusCombox name="business_status" displayValue="${business_status }" style="width: 200px;" /></td>
										<td>保证状态：</td>
										<td><select name="supl_true" style="width: 200px;">
												<option value="">全部</option>
												<option value="1" <c:if test="${supl_true eq 1 }">selected="selected"</c:if>>连保</option>
												<option value="2" <c:if test="${supl_true eq 2 }">selected="selected"</c:if>>回购含灭失</option>
												<option value="3" <c:if test="${supl_true eq 3 }">selected="selected"</c:if>>回购</option>
												<option value="4" <c:if test="${supl_true eq 4 }">selected="selected"</c:if>>无</option>
										</select></td>
									</tr>
								</table>

							</td>
							<td width="55" class="ss_th" valign="top">&nbsp;</td>
							<td width="20%"><a href="#" name="search" id="search"
								onClick="$('#form1').submit();" class="blue_button">搜 索</a></td>
						</tr>
					</table>
				</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
		
						<page:pagingToolbarTop pagingInfo="${pagingInfo}"/>
	
						<table class="grid_table">
							<tr>
								<th>
									<strong>序号</strong>
								</th>
								<th>
									<strong>起租日期</strong>
								</th>
								<th>
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo}"><strong>案件号</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="RECP_CODE" pagingInfo="${pagingInfo}"><strong>支付表号</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo}"><strong>客户名称</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="SUPL_NAME" pagingInfo="${pagingInfo}"><strong>供应商名称</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="UNIT_PRICE" pagingInfo="${pagingInfo}"><strong>合同总额</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="PAY_MONEY" pagingInfo="${pagingInfo}"><strong>拨款金额</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="REST_MONEY" pagingInfo="${pagingInfo}"><strong>实际剩余本金</strong></page:pagingSort>
								</th>
								<th>
									<strong>还款明细</strong>
								</th>
								<th>
									<page:pagingSort orderBy="REST_PERIOD" pagingInfo="${pagingInfo}"><strong>剩余期数</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="DUN_COUNT_BY_LEASE" pagingInfo="${pagingInfo}"><strong>逾期次数</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="BUSINESS_STATUS" pagingInfo="${pagingInfo}"><strong>案件状态</strong></page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="SUPL_TRUE" pagingInfo="${pagingInfo}"><strong>保证状态</strong></page:pagingSort>
								</th>
							</tr>
							<c:set var="UNIT_PRICE_TOTAL" value="0"/>
							<c:set var="PAY_MONEY_TOTAL" value="0"/>
							<c:set var="REST_MONEY_TOTAL" value="0"/>
							<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
								<c:set var="UNIT_PRICE_TOTAL" value="${item.UNIT_PRICE + UNIT_PRICE_TOTAL}"/>
								<c:set var="PAY_MONEY_TOTAL" value="${item.PAY_MONEY + PAY_MONEY_TOTAL}"/>
								<c:set var="REST_MONEY_TOTAL" value="${item.REST_MONEY + REST_MONEY_TOTAL}"/>
								<tr>
									<td style="text-align: center;">${index.count }&nbsp;</td>
									<td style="text-align: center;">${item.FIRST_PAYDATE }&nbsp;</td>
									<td style="text-align: center;">
									<c:if test="${item.VIP_FLAG eq 0}">
										<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.CREDIT_ID}'">${item.CREDIT_RUNCODE}</a>
									</c:if>								
									<c:if test="${item.VIP_FLAG eq 1}">
										<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.selectCreditForShow&credit_id=${item.CREDIT_ID}'">${item.CREDIT_RUNCODE}</a>
									</c:if>
									</td>
									<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">${item.RECP_CODE}</a></td>
									<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.UNIT_PRICE }"/>&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEY }"/>&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.REST_MONEY }"/>&nbsp;</td>
									<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.showNewDunDetailByDecpId&RECP_CODE=${item.RECP_CODE}&RECP_ID=${item.RECP_ID }&CUST_NAME=${item.CUST_NAME }'">还款明细</a></td>
									<td style="text-align: center;">${item.REST_PERIOD }&nbsp;</td>
									<td style="text-align: center;">${item.DUN_COUNT_BY_LEASE }&nbsp;</td>
									<td style="text-align: center;">${item.BUSINESS_STATUS }&nbsp;</td>
									<td style="text-align: center;">${item.SUPL_TRUE }&nbsp;</td>
								</tr>
							</c:forEach>
							<tr>
								<th colspan="6" style="text-align: right;">本页合计：</th>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${UNIT_PRICE_TOTAL }"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${PAY_MONEY_TOTAL }"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${REST_MONEY_TOTAL }"/>&nbsp;</td>
								<th colspan="5" style="text-align: center;">&nbsp;</th>
							</tr>
							<tr>
								<th colspan="6" style="text-align: right;">总计：</th>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sum.UNIT_PRICE_SUM }"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sum.PAY_MONEY_SUM }"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sum.REST_MONEY_SUM }"/>&nbsp;</td>
								<th colspan="5" style="text-align: center;">&nbsp;</th>
							</tr>
						</table>
						<page:pagingToolbar pagingInfo="${pagingInfo}"/>
				</div>
				</div>
			</div>
			<font color="#FF0000">*</font>逾期次数：曾经逾期超过15天(含15天)之期数，<br/>&nbsp;
			此数据截止到<font color="#FF0000">
			<fmt:formatDate value="${pagingInfo.resultList[0].CREATE_ON}" pattern="yyyy-MM-dd HH:mm"/>
			</font>
		</form>
	</body>
</html>