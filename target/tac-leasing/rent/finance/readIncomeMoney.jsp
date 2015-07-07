<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title></title>
	<style type="text/css">
		#main {overflow-y: auto; width: 1500px; }
	</style>
	</head>
	<body>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<span> 
			<c:forEach items="${errorList}" var="err">
				<li>
					<c:out value="${err}"/>
				</li>
			</c:forEach>
		</span>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<th style="text-align: center;width: 20px;">序号</th>
				<th style="text-align: center;width: 110px;">收款账号</th>
				<th style="text-align: center;width: 60px;">收款单位</th>
				<th style="text-align: center;width: 60px;">交易时间</th>
				<th style="text-align: center;width: 70px;">收入金额</th>
				<th style="text-align: center;width: 60px;">交易方式</th>
				<th style="text-align: center;width: 110px;">对方帐号</th>
				<th style="text-align: center;width: 110px;">对方户名</th>
				<th style="text-align: center;width: 110px;">(系统匹配)对方户名</th>
				<th style="text-align: center;width: 110px;">虚拟帐号</th>
				<th style="text-align: center;">备注</th>
				<th style="text-align: center;">身份证</th>
			</tr>
			<c:forEach items="${composeList }" var="comp">
				<c:set value="" var="bgcolor"/>
				<c:choose>
					<c:when test="${comp.isError == '1'}">
						<c:set value="orange" var="bgcolor"/>
					</c:when>
					<c:otherwise>
						<c:set value="" var="bgcolor"/>
					</c:otherwise>
				</c:choose>
				<tr class="ui-widget-content jqgrow ui-row-ltr" id="${comp.rowNumber}" ${bgcolor }>
				<td style="text-align: center;">&nbsp;${comp.rowNumber}&nbsp;</td>
				<td style="text-align: center;"> ${comp.receipt_bankno}&nbsp;</td>
				<td style="text-align: center;"> ${comp.receipt_unit}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_date}&nbsp;</td>
				<td style="text-align: right;" > <fmt:formatNumber value="${comp.income_money}" type="currency"/>&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_type}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_bankno}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_unit}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_unit_true}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_xuli}&nbsp;</td>
				<td style="text-align: center;"> ${comp.opposing_memo}&nbsp;</td>
				<td style="text-align: center;"> ${comp.ID}&nbsp;</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="18" align="center">
					<c:set value="${errorList}" var="error"/>
					<c:if test="${empty error}">
					<input class="ui-state-default ui-corner-all" type="submit" value="提交" name="submitSaveData" id="submitSaveData" onclick="submitSaveData()"/>
					</c:if>
					<input class="ui-state-default ui-corner-all" type="submit" value="取消" name="submitCancelData" id="submitCancelData" onclick="submitCancelData()"/>
				</td>
			</tr>
		</table>
		</div>
		</div>
	</div>
	</body>
	<script type="text/javascript">
		function submitSaveData() {
			document.getElementById("submitSaveData").disabled=true;
			document.getElementById("submitCancelData").disabled=true;
			window.location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.saveExcelToDiskAndSaveData";
		}
		
		function submitCancelData() {
			document.getElementById("submitSaveData").disabled=true;
			document.getElementById("submitCancelData").disabled=true;
			window.location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.goToUploadIncomeMoneyPage";
		}
	</script>
</html>
