<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
		<script type="text/javascript">				
			var baseRate = ${baseRateJson};
			$(function (){
				$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
			});
			function dateClick(){
				$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
			}
		</script>
	</head>
<body onload="loadEquipmentTypes();">
	<form action="../servlet/defaultDispatcher" name="schemeForm" id="form1" method="post">
			<input type="hidden" name="__action" value="creditReport.createScheme">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${creditMap.CONTRACT_TYPE }">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">		
			<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户购买意向</strong>
					</td>
					<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
						相关操作：
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addEquipmentRow();">添加</a>
					</td>
				</tr>
				<tr>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
						<strong>制造商</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
						<strong>厂牌</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>产品名称</strong>
					</th>
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
						<strong>规格型号</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>供应商</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>留购价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong> 含税单价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>单价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
						<strong> 数量</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="6%">
						<strong> 单位</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="12%">
						<strong> 合计</strong>
					</th>
					
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>锁码方式</strong>
					</th>
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="6%">
						操作
					</th>
				</tr>
				<c:forEach items="${equipmentList}" var="item" varStatus="status">
					<tr>
						<td align="center"  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="MANUFACTURER${ status.count }" name="MANUFACTURER" 
								onchange="loadEquipmentManufacturer(TYPE${ status.count },this.value);">
								<option value="${ status.count }">
									${item.MANUFACTURER }
								</option>
							</select>
						</td>
						<td align="center"  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="TYPE${ status.count }" name="TYPE" 
								onchange="loadEquipmentKinds(KIND${ status.count },this.value);$('#TYPE_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.THING_KIND }
								</option>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="KIND${ status.count }" name="KIND"
								onchange="loadEquipmentProducts(PRODUCT${ status.count },this.value);$('#KIND_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.THING_NAME }
								</option>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="PRODUCT${ status.count }" name="PRODUCT"
								onchange="loadEquipmentSuppliers(SUPPIER${ status.count },this.value);$('#PRODUCT_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.MODEL_SPEC }
								</option>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="SUPPIER${ status.count }" name="SUPPIER"
								onchange="showApplyGrant('SUPPIER${ status.count }',this.value);$('#SUPPIER_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ item.SUEQ_ID }">
									${item.BRAND }
								</option>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="STAYBUY_PRICE${ status.count }"
								name="STAYBUY_PRICE" size=8 value="<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" />" onchange="positive(this, '租赁物留购价');setFormatCurrency(this);" style="text-align: right">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="SHUI_PRICE${ status.count }" name="SHUI_PRICE" style="text-align: right;" 
								size=10 value="<fmt:formatNumber pattern='#,##0.00' value="${item.SHUI_PRICE }" />"  onchange="hunewupdateTotal('${ status.count }','${creditMap.CONTRACT_TYPE }');">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="UNIT_PRICE${ status.count }"
								name="UNIT_PRICE" size=12 value="<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" />"  onchange="updateTotal('${ status.count }');" style="text-align: right">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="AMOUNT${ status.count }" name="AMOUNT"
								size=3 value="${item.AMOUNT }" onchange="updateTotal('${ status.count }');">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<c:set var="tai" value=""></c:set>
							<c:set var="liang" value=""></c:set>
							<c:set var="tao" value=""></c:set>
							<c:set var="jian" value=""></c:set>
							<c:if test="${item.UNIT eq '台'}">
								<c:set var="tai" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '辆'}">
								<c:set var="liang" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '套'}">
								<c:set var="tao" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '件'}">
								<c:set var="jian" value="selected='selected'"></c:set>
							</c:if>
							<select name="UNIT" id="UNIT${ status.count }">
								<option value="台"${tai }>
									-台-
								</option>
								<option value="辆"${liang }>
									-辆-
								</option>
								<option value="套"${tao }>
									-套-
								</option>
								<option value="件"${jian }>
									-件-
								</option>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="TOTAL${ status.count }" name="TOTAL" style="text-align: right;" readonly="readonly"
								size=17 value="<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" />">
						</td>
						
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select name="LOCK_CODE">
							<c:forEach items="${lockList}" var="items">
								<c:choose>
									<c:when test="${items.CODE eq item.LOCK_CODE}">
										<option value="${items.CODE }" selected="selected">${items.FLAG }</option>
									</c:when>
									<c:otherwise>
										<option value="${items.CODE }">${items.FLAG }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<img src="${ctx }/images/u103.gif"><a href="#" onclick="deleteRow.call(this)">删除</a>
							<input type="hidden" name="TYPE_NAME"
								ID="TYPE_NAME${ status.count }" value="${item.THING_KIND }">
							<input type="hidden" name="KIND_NAME"
								ID="KIND_NAME${ status.count }" value="${item.THING_NAME }">
							<input type="hidden" name="PRODUCT_NAME"
								ID="PRODUCT_NAME${ status.count }" value="${item.MODEL_SPEC }">
							<input type="hidden" name="SUPPIER_NAME"
								ID="SUPPIER_NAME${ status.count }" value="${item.BRAND }">
						</td>
					</tr>
					
				</c:forEach>				
			</table>
			</div>
		</div>
	</div>
</form>
	</body>
</html>
