<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
</head>
<body style="text-align:center;">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="1" cellpadding="1" border="0" style="width:900px;">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:30px;"><strong>序号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>税费方案</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>创建人</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>创建时间</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="width:80px;"><strong>操作</strong></td>
					</tr>
					<c:forEach items="${moneyRatePlanList}" var="item" varStatus="count">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${count.count }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.FLAG }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.NAME }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.CREATE_TIME }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><c:if test="${empty item.NAME}"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE=${item.CODE }'">增加方案</a></c:if><c:if test="${not empty item.NAME}">&nbsp;|&nbsp;<a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE=${item.CODE }'">修改方案</a></c:if>&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
	</body>
</html>