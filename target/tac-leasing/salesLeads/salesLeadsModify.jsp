<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>销售机会管理-修改</title>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/salesLeads/js/salesOperate.js"></script>
		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="${ctx}/salesLeads/js/fillCustInfo.js"></script>
		<script type="text/javascript">
			$(function (){
				$("#finish_date").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />	
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="modifyForm" id="modifyForm" method="post">
			<input type="hidden" name="__action" value="salesLeads.upSalesLeads">
			<input type="hidden" name="sales_id" value="${salesMap.SALES_ID }">
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;销售机会管理-修改</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="10%">负责人<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="principal" id="principal" value="${salesMap.PRINCIPAL }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>主题<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="theme" id="theme" style="width: 300;" value="${salesMap.THEME }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户<input type="hidden" name="cust_id" id="cust_id" value="${salesMap.CUST_ID }"><font color="red">*</font></td>
						<td><input type="text" name="cust_info" id="cust_info" value="${salesMap.CUST_NAME }"><input type="hidden" name="cust_name" id="cust_name" value="${salesMap.CUST_NAME }"></td>
						<td width="10%">联系人<input type="hidden" name="linkman_id" id="linkman_id" value="LINKMAN_ID"></td>
						<td><input type="text" name="link_info" id="link_info" value="${salesMap.LINKMAN_NAME }"><input type="hidden" name="linkman_name" id="linkman_name" value="${salesMap.LINKMAN_NAME }"></td>
					</tr>
					<tr >
						<td class="ui-widget-content jqgrow ui-row-ltr">电话</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="phone" value="${salesMap.PHONE }"></td>
						<td class="ui-widget-content jqgrow ui-row-ltr">来源</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<select name="sources_id">
								<option value="">--请选择--</option>
								<c:forEach items="${sourcesList}" var="item">
									<c:choose>
										<c:when test="${item.CODE eq salesMap.SOURCES_ID}">
											<option value="${item.CODE }" selected='selected'>${item.FLAG }</option>
										</c:when>
										<c:otherwise>
											<option value="${item.CODE }">${item.FLAG }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr >
						<td class="ui-widget-content jqgrow ui-row-ltr">预计完成日期<font color="red">*</font></td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="finish_date" id="finish_date" readonly="readonly" value="<fmt:formatDate value="${salesMap.FINISH_DATE }"/>"></td>
						<td class="ui-widget-content jqgrow ui-row-ltr">机会阶段<font color="red">*</font></td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<select name="chance_stage_ids" id="chance_stage_id">
							<option value="">--请选择--</option>
							<c:forEach items="${chanceStageList}" var="item">
							<c:choose>
							<c:when test="${item.CODE eq salesMap.CHANCE_STAGE_ID}">
								<option value="${item.CODE }" selected='selected'>${item.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${item.CODE }">${item.FLAG }</option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>预期金额<font color="red">*</font></td>
						<td><input type="text" name="expect_money" id="expect_money" value="${salesMap.EXPECT_MONEY }"></td>
						<td>可能性（%）</td>
						<td><input type="text" name="possibility" id="possibility" value="${salesMap.POSSIBILITY }"></td>
					</tr>
					<tr >
						<td class="ui-widget-content jqgrow ui-row-ltr">预期收益</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="expect_income_money" id="expect_income_money" value="${salesMap.EXPECT_INCOME_MONEY }"></td>
						<td class="ui-widget-content jqgrow ui-row-ltr">货币<font color="red">*</font></td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<select name="currency_id" id="currency_id">
							<option value="">--请选择--</option>
							<c:forEach items="${currencyList}" var="item">
							<c:choose>
							<c:when test="${item.CODE eq salesMap.CURRENCY_ID}">
								<option value="${item.CODE }" selected='selected'>${item.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${item.CODE }">${item.FLAG }</option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td><textarea cols="56" rows="4" name="contents">${salesMap.CONTENT }</textarea></td>
						<td>备注</td>
						<td><textarea cols="56" rows="4" name="remark">${salesMap.REMARK }</textarea></td>
					</tr>
				</table>
				<center>
					<input type="button" onclick="upSales();" class="ui-state-default ui-corner-all" value="修 改">
					<input type="button" onclick="javascript:history.go(-1);" class="ui-state-default ui-corner-all" value="返回">
				</center>
				</div>
				</div>
			</div>	
		</form>
	</body>
</html>