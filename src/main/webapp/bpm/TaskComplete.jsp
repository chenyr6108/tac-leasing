<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="panel_table">
	<thead>
		<tr>
			<th width="10%">结点</th>
			<th width="10%">开始时间</th>
			<th width="10%">完成时间</th>
			<th width="8%">负责人</th>
			<th width="8%">实际处理人</th>
			<th width="5%">操作</th>
			<th width="47%">备注</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${completeTasks}" var="task" varStatus="status">	
			<tr>
				<td style="text-align: center;">${task.flowName}</td>
				<td><fmt:formatDate value='${task.beginDate}' pattern='yyyy-MM-dd HH:mm'/></td>
				<td><fmt:formatDate value='${task.endDate}' pattern='yyyy-MM-dd HH:mm'/></td>
				<td style="text-align: center;">${task.chargeName}</td>
				<td style="text-align: center;">${task.operatorName}</td>
				<td style="text-align: center;">
					<c:if test="${task.result eq 'C'}">完成</c:if>
					<c:if test="${task.result eq 'A'}">同意</c:if>
					<c:if test="${task.result eq 'R'}">驳回</c:if>
					<c:if test="${task.result eq 'P'}">通过</c:if>
					<c:if test="${task.result eq 'I'}">转发</c:if>
				</td>
				<td>${task.comment}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
