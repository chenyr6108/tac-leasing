<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<table class="grid_table">
	<tr>
		<th style="background-color: gray;color: black">
			设定时间
		</th>
		<th style="background-color: gray;color: black">
			设定类型
		</th>
		<th style="background-color: gray;color: black">
			设定操作人员
		</th>
		<th style="background-color: gray;color: black">
			设定原因
		</th>
		<c:if test="${JOB eq '9' }">
		<th style="background-color: gray;color: black">
			设定来源
		</th>
		</c:if>
	</tr>
	<c:forEach items="${resultList}" var="item" varStatus="index">
		<tr>
			<td>
				<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
				<c:if test="${item.TYPE eq 'NOT_STOP' }">设定为不自动停开</c:if>
				<c:if test="${item.TYPE eq 'NOT_OPEN' }">设定为不自动复开</c:if>
			</td>
			<td>
				${item.NAME }
			</td>
			<td>
				${item.REMARK }
			</td>
			<c:if test="${JOB eq '9' }">
			<td>
				<c:if test="${item.OPERATE_FROM eq 'AUTO_FUNCTION' }">操作来源于自动停复开票管理</c:if>
				<c:if test="${item.OPERATE_FROM eq 'MANUAL_FUNCTION' }">操作来源于手动停复开票管理</c:if>
			</td>
			</c:if>
		</tr>
	</c:forEach>
</table>
</div>