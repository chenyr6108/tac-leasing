<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${ctx }/rentcontract/js/createRentContractSchemaIrr.js"></script>
<input type="hidden" id="listLength" value="${fn:length(schemaIrrList)}">
<table id="irrMonthPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
			<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
		</td>
		<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
			<img src="${ctx }/images/u100.gif"><!-- <a href="javascript:void(0)" style="cursor: pointer;" onclick="addIrrMonthPriceRow();">添加</a> -->添加
		</td>
	</tr>
	<c:forEach var="item" items="${schemaIrrList}" varStatus="status">
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				未税应付租金<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left;" class="ui-widget-content jqgrow ui-row-ltr">
				<input readonly="readonly" type="text" name="PAY_IRR_MONTH_PRICE" class="input_right" style="width: 130px;"
					value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" pattern="#,##0.00" />" />
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				对应期次
			</td>
			<td style="text-align: left;" class="ui-widget-content jqgrow ui-row-ltr">
				第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;" />
				期到第<input type="text" name="PAY_IRR_MONTH_PRICE_END" value="${item.IRR_MONTH_PRICE_END}" readonly="readonly" style="width: 30px;text-align: center;" >期
				<!-- 
				<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);" >
						<c:forEach begin="1" end="${schema.LEASE_PERIOD}" var="item1" step="1">
							<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
						</c:forEach>
					</select>期
					 -->
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
				<span name="delSpan" <c:if test="${status.count ne fn:length(schemaIrrList)}">style="display: none;"</c:if>>
					<!-- <a href='javascript:void(0);' onclick='delRow(this);'>删除</a> --> 删除
				</span>
			</td>
		</tr>
	</c:forEach>
</table>
