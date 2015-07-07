<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>uploadDisplay</title>
		<script type="text/javascript"
			src="${ctx }/bonus/js/uploadBonusDisplay.js"></script>
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
				<td style="text-align: center;">合同号</td >
				<td style="text-align: center;">姓名</td>
				<c:forEach items="${bonus }" var="bonus">
					<td style="text-align: center;">${bonus.BONUS_NAME }</td>
				</c:forEach>
				<td style="text-align: center;">备注</td>
			</tr>
			<c:forEach items="${composes}" var="compose" >
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
				<td style="text-align: center;"> &nbsp;${comp.contract_code}</td>
				<td style="text-align: center;"> &nbsp;${comp.name}</td>
				<!-- 
				<c:forEach items="${bonus }" var="bonus"  varStatus="status">
					<td style="text-align: right;" >${comp.type } &nbsp;</td>
				</c:forEach>
				 -->
				<c:set var="type" value="type1" />
				<c:forEach items="${bonus }" var="bonus"  varStatus="status">
				<c:set var="type" value="type${status.count }" />
				<td style="text-align: right;" ><fmt:formatNumber value="${comp[type]}" type="currency" /> &nbsp;</td>
				</c:forEach>
				
				<td style="text-align: center;"> &nbsp;${comp.remark}</td>
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
