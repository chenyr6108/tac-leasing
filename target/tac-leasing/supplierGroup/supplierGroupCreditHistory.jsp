<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>供应商集团授信</title>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title grid_table">
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<c:set var="totalLeaseRze" value="${item.leaseRze + totalLeaseRze }"/>
					<c:if test="${item.flag eq 'UNION' }"><c:set var="totalLeaseRzeUnion" value="${item.leaseRze + totalLeaseRzeUnion }"/></c:if>
					<c:if test="${item.flag eq 'BUY_BACK' }"><c:set var="totalLeaseRzeBuyBack" value="${item.leaseRze + totalLeaseRzeBuyBack }"/></c:if>
				</c:forEach>
					<tr>
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
							总计
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<input id="totalLeaseRze" value="<fmt:formatNumber type="currency" value="${totalLeaseRze }"/>" type="hidden"><fmt:formatNumber type="currency" value="${totalLeaseRze }"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							连保：<input id="totalLeaseRze" value="<fmt:formatNumber type="currency" value="${totalLeaseRzeUnion }"/>" type="hidden"><fmt:formatNumber type="currency" value="${totalLeaseRzeUnion }"/>&nbsp;/&nbsp;回购：<input id="totalLeaseRze" value="<fmt:formatNumber type="currency" value="${totalLeaseRzeBuyBack }"/>" type="hidden"><fmt:formatNumber type="currency" value="${totalLeaseRzeBuyBack }"/>&nbsp;
						</td>
					</tr>
					<tr>
						<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
							案件号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
							供应商名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" align="right" style="background: #A7A7A7;color: #000000;">
							概算成本
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
							供应商保证
						</th>
					</tr>
					<c:forEach items="${resultList }" var="item" varStatus="index">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
								${index.count }&nbsp;
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
								${item.creditRunCode }&nbsp;
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
								${item.suplName }&nbsp;
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
								<fmt:formatNumber type="currency" value="${item.leaseRze }"/>&nbsp;
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
								<c:if test="${item.flag eq 'UNION' }">连保</c:if><c:if test="${item.flag eq 'BUY_BACK' }">回购</c:if>&nbsp;
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>