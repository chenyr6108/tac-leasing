<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>uploadDisplay</title>
		<style type="text/css">
			#main{overflow-y: auto; width: 2000px; }
		</style>
	<script type="text/javascript">	
		//保存来款上传到本地
			function saveOneCode(){
				document.getElementById("saveOneCode").disabled=true;
				document.getElementById("cancelOneCode").disabled=true;
				window.location.href="../servlet/defaultDispatcher?__action=oneBarcodeCommand.saveOneCode";	
			}
			
			function cancelOneCode(){
				location.href="../servlet/defaultDispatcher?__action=oneBarcodeCommand.writeOneBarcode";
				
			}
	</script>
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
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 700px;">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;">序号</td>
				<td style="text-align: center;">支付表号</td>
				<td style="text-align: center;">期数</td>
				<td style="text-align: center;">快递单号</td>
				<td style="text-align: center;">快递公司</td>
			</tr>
			<c:forEach items="${composes}" var="compose">
				<c:set var="comp" value="${compose}" />
				<c:set value="" var="bgcolor" />
				<c:choose>
					<c:when test="${comp.isError == '1'}">
						<c:set value="orange" var="bgcolor" />
					</c:when>
					<c:otherwise>
						<c:set value="" var="bgcolor" />
					</c:otherwise>
				</c:choose>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					 <td style="text-align: center;"> &nbsp;${comp.rowNumber}</td>
					<td style="text-align: center;"> &nbsp;${comp.RECP_CODE}</td>
					<td style="text-align: center;"> &nbsp;${comp.PERIOD}</td>
					<td style="text-align: center;"> &nbsp;${comp.EXPRESS_ID}</td>
					<td style="text-align: center;"> &nbsp;${comp.EXPRESS_NAME_ID}</td>
				
				</tr>
			</c:forEach>
			<tr>
				<td colspan="18" align="center">
					<c:set value="${errorList}" var="error" />
					<c:if test="${empty error}">
						<input class="ui-state-default ui-corner-all" type="submit" value="提交" name="saveOneCode"
							id="saveOneCode" onclick="saveOneCode()" />
					</c:if>
					<input class="ui-state-default ui-corner-all" type="submit" value="取消" name="cancelOneCode"
						id="cancelOneCode" onclick="cancelOneCode()" />
				</td>
			</tr>
		</table>
		</div>
		</div>
	</div>
	
	</body>
</html>
