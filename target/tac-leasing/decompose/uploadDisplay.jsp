<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>uploadDisplay</title>
		<script type="text/javascript"
			src="${ctx }/decompose/js/uploadDisplay.js"></script>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#main{overflow-y: auto; width: 2000px; }
	</style>
	</head>
	<body>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<span> <c:forEach items="${errorList}" var="err">
				<li>
					<c:out value="${err}" />
				</li>
			</c:forEach></span>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;">序号</td>
				<td style="text-align: center;">收款账号</td >
				<td style="text-align: center;">收款单位</td>
				<td style="text-align: center;">交易时间</td>
				<td style="text-align: center;">交易时间戳</td>
				<td style="text-align: center;">收入金额</td >
				<td style="text-align: center;">支出金额</td>
				<td style="text-align: center;">本次金额</td>
				<td style="text-align: center;">手续费总额</td>
				<td style="text-align: center;">交易方式</td>
				<td style="text-align: center;">交易行名</td>
				<td style="text-align: center;">交易类别</td>
				<td style="text-align: center;">对方省市</td>
				<td style="text-align: center;">对方帐号</td>
				<td style="text-align: center;">对方户名</td>
				<td style="text-align: center;">(系统匹配)对方户名</td>
				<td style="text-align: center;">虚拟帐号</td>
				<td style="text-align: center;">备注</td>
				<td style="text-align: center;">交易说明</td>
				<td style="text-align: center;">交易摘要</td>
				<td style="text-align: center;">交易附言</td>
			
			</tr>
			<c:forEach items="${composes}" var="compose">
				<c:set var="comp" value="${compose}" />
				<c:set value="" var="bgcolor" />
				<c:choose>
					<c:when test="${comp.isError == '1'}">
						<!-- <tr id="${comp.rowNumber}" bgcolor="orange"> -->
						<c:set value="orange" var="bgcolor" />
					</c:when>
					<c:otherwise>
						<c:set value="" var="bgcolor" />
						<!-- <tr id="${comp.rowNumber}"> -->
					</c:otherwise>
				</c:choose>
				<tr class="ui-widget-content jqgrow ui-row-ltr" id="${comp.rowNumber}" ${bgcolor }>
				<td style="text-align: center;"> &nbsp;${comp.rowNumber}</td>
				<td style="text-align: center;"> &nbsp;${comp.receipt_bankno}</td>
				<td style="text-align: center;"> &nbsp;${comp.receipt_unit}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_date}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_dateTag}</td>
				<td style="text-align: right;" ><fmt:formatNumber value="${comp.income_money}" type="currency" /> &nbsp;</td>
				<td style="text-align: right;" ><fmt:formatNumber value="${comp.payment_money}" type="currency" /> &nbsp;</td>
				<td style="text-align: right;" ><fmt:formatNumber value="${comp.left_money}" type="currency" /> &nbsp;</td>
				<td style="text-align: right;" ><fmt:formatNumber value="${comp.commission_money}" type="currency" /> &nbsp;</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_type}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_bankName}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_flag}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_address}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_bankno}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_unit}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_unit_true}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_xuli}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_memo}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_explain}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_summary}</td>
				<td style="text-align: center;"> &nbsp;${comp.opposing_postscript}</td>
				
				</tr>
			</c:forEach>
			<tr>
				<td colspan="18" align="center">
					<c:set value="${errorList}" var="error" />
					<c:if test="${empty error}">
						<input class="ui-state-default ui-corner-all" type="submit" value="提交" name="submitSaveData"
							id="submitSaveData" onclick="submitSaveData()" />
					</c:if>
					<input class="ui-state-default ui-corner-all" type="submit" value="取消" name="submitCancelData"
						id="submitCancelData" onclick="submitCancelData()" />
				</td>
			</tr>
		</table>
		</div>
		</div>
	</div>
	
	</body>
</html>
