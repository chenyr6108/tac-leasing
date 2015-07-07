<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table id="checkPayTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
<tr>
	<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
		<b style="font-size: 14px;">支票还款&nbsp;&nbsp;&nbsp;<c:if test="${creditshemadetail.IS_CHECK_PAY eq 0 or empty creditshemadetail.IS_CHECK_PAY}">无</c:if><c:if test="${creditshemadetail.IS_CHECK_PAY eq 1 }"><input type="checkbox" name="IS_CHECK_PAY" id="IS_CHECK_PAY" <c:if test="${creditshemadetail.IS_CHECK_PAY==1 }">checked="checked"</c:if> disabled/></c:if><input type="hidden" name="IS_CHECK_PAY_VALUE" id="IS_CHECK_PAY_VALUE" value="${creditshemadetail.IS_CHECK_PAY }"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
	<td style="text-align: left;height: 24px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
		&nbsp;
	</td>
</tr>
<c:forEach var="item" items="${checkPaylines}" varStatus="status">
	<tr>
		<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			对应期次
		</td>
		<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			第<input type="text" name="CHECK_PAY_START" value="${item.CHECK_START}" style="width: 30px;text-align: center;" readonly="readonly">期到第<select name="CHECK_PAY_END" disabled>
				<c:forEach begin="1" end="${creditshemadetail.LEASE_TERM}" var="item1" step="1">
					<option value="${item1 }" <c:if test="${item.CHECK_END eq item1}">selected="selected"</c:if>>${item1 }</option>
				</c:forEach></select>期
		</td>
		<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
</c:forEach>
</table>