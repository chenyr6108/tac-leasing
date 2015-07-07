<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table class="grid_table">
	<tr>
		<th>序号</th>
		<th>发票状态</th>
		<th>发票号</th>
		<th>出票人</th>
		<th>金额</th>
		<th>发票类型</th>
		<th>备注</th>
		<th>操作时间</th>
		<th>操作人</th>
	</tr>
	<c:set var="indext"/>
	<c:forEach items="${logs}" var="item" varStatus="i">
	<c:choose>
		<c:when test="${i.count == fn:length(logs)}">
			<c:set var="indext" value="${i.count - 1}"/>
		</c:when>
		<c:otherwise>
			<c:set var="indext" value="${i.count}"/>
		</c:otherwise>
	</c:choose>
	<tr>
		<td>
			${i.count}&nbsp;
		</td>
		<td <c:if test="${logs[indext].status != item.status }">style="color: red"</c:if>>
			<c:if test="${item.status eq 0 }">正常</c:if>
			<c:if test="${item.status eq -1 }">作废</c:if>
			&nbsp;
		</td>
		<td <c:if test="${logs[indext].invoice_code != item.invoice_code }">style="color: red"</c:if>>
			${item.invoice_code}&nbsp;</td>
		<td <c:if test="${logs[indext].drawer != item.drawer }">style="color: red"</c:if>>
			${item.drawer}&nbsp;
		</td>
		<td <c:if test="${logs[indext].invoice_money != item.invoice_money }">style="color: red"</c:if>>
			<fmt:formatNumber type="currency" value="${item.invoice_money }"/>&nbsp;
		</td>
		<td <c:if test="${logs[indext].invoice_type_desc != item.invoice_type_desc }">style="color: red"</c:if>>
			${item.invoice_type_desc}&nbsp;
		</td>
		<td <c:if test="${logs[indext].memo != item.memo }">style="color: red"</c:if>>
			${item.memo}&nbsp;
		</td>
		<td>
			<fmt:formatDate value="${item.create_date }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;
		</td>
		<td>
			${item.create_by }&nbsp;
		</td>
	</tr>
	</c:forEach>
</table>

