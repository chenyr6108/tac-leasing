<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>合同控管表</title>
</head>
<body>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
        	<div class="ui-state-default ui-jqgrid-hdiv" style="background-color: white;">
        		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
        			<tr>
        				<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							案件号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							合同号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							客户名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							供应商名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							保证金金额
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							保证金入供应商金额
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							保证金入我司金额
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							保证金冲抵金额
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							设备总价款
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							拨款日
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							拨款金额
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							设备起租日
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							设备租赁周期
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							支付方式
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							业务员
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							办事处
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;background: gray;color: #000000">
							拨款顺序
						</th>
        			</tr>
        			<c:forEach items="${resultList}" var="item" varStatus="index">
        				<c:if test="${payOrder ne item.PAY_ORDER }">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${index.count }</td>
								<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
								<td style="text-align: center;">${item.LEASE_CODE }</td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.BACKCOMP }</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_ENTER_AG }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_ENTER_CMPRICE }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.AVG_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: center;">${item.START_DATE }</td>
								<td style="text-align: right;">${item.LEASE_TERM }&nbsp;</td>
								<td style="text-align: center;">${item.PAY_WAY }</td>
								<td style="text-align: center;">${item.NAME }</td>
								<td style="text-align: center;">${item.DECP_NAME_CN }</td>
								<td style="text-align: center;">${item.PAY_ORDER }</td>
							</tr>
						</c:if>
						<c:if test="${payOrder eq item.PAY_ORDER }">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: center;font-size: 12px;">${index.count }</th>
								<th style="text-align: center;font-size: 12px;">${item.CREDIT_RUNCODE }</th>
								<th style="text-align: center;font-size: 12px;">${item.LEASE_CODE }</th>
								<th style="text-align: center;font-size: 12px;">${item.CUST_NAME }</th>
								<th style="text-align: center;font-size: 12px;">${item.BACKCOMP }</th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.PLEDGE_ENTER_AG }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.PLEDGE_ENTER_CMPRICE }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.AVG_PRICE }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: center;background: gray;font-size: 12px;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></th>
								<th style="text-align: right;font-size: 12px;"><fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/>&nbsp;</th>
								<th style="text-align: center;font-size: 12px;">${item.START_DATE }</th>
								<th style="text-align: right;font-size: 12px;">${item.LEASE_TERM }&nbsp;</th>
								<th style="text-align: center;font-size: 12px;">${item.PAY_WAY }</th>
								<th style="text-align: center;font-size: 12px;">${item.NAME }</th>
								<th style="text-align: center;font-size: 12px;">${item.DECP_NAME_CN }</th>
								<th style="text-align: center;font-size: 12px;">${item.PAY_ORDER }</th>
							</tr>
						</c:if>
					</c:forEach>
        		</table>
        	</div>
        </div>
    </div>
</body>
</html>