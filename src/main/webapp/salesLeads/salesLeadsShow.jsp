<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>销售机会管理-查看</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />	
	</head>
	<body>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;销售机会管理-查看</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="10%">负责人</td>
						<td colspan="3">${PRINCIPAL }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>主题</td>
						<td colspan="3">${THEME }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td>${ CUST_NAME }</td>
						<td width="10%">联系人</td>
						<td>${ LINKMAN_NAME }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>电话</td>
						<td>${ PHONE }&nbsp;</td>
						<td>来源</td>
						<td><c:forEach items="${sourcesList}" var="it"><c:if test="${it.CODE == SOURCES_ID}">${it.FLAG}</c:if></c:forEach>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>预计完成日期</td>
						<td><fmt:formatDate value="${ FINISH_DATE }"/></td>
						<td>机会阶段</td>
						<td><c:forEach items="${chanceStageList}" var="it"><c:if test="${it.CODE == CHANCE_STAGE_ID}">${it.FLAG}</c:if></c:forEach></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>预期金额</td>
						<td>${ EXPECT_MONEY }</td>
						<td>可能性（%）</td>
						<td>${ POSSIBILITY }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>预期收益</td>
						<td>${ EXPECT_INCOME_MONEY }&nbsp;</td>
						<td>货币</td>
						<td><c:forEach items="${currencyList}" var="it"><c:if test="${it.CODE == CHANCE_STAGE_ID}">${it.FLAG}</c:if></c:forEach></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td><textarea cols="56" rows="4" name="content" readonly="readonly">${ CONTENT }</textarea></td>
						<td>备注</td>
						<td><textarea cols="56" rows="4" name="remark" readonly="readonly">${ REMARK }</textarea></td>
					</tr>
				</table>
				<center>
					<input type="button" onclick="javascript:history.go(-1);" class="ui-state-default ui-corner-all" value="返回">
				</center>
				</div>
				</div>
			</div>	
	</body>
</html>