<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title>更改单时间详细表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
function avgOrder(){
	 location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.getAvgtimeForOrder";
}
</script>
</head>
<body>
	<input type="button" name="addbutton" onclick="avgOrder();" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="返回列表">
	<br>
	<table cellpadding="3" cellspacing="1" style="width: 70%"
		class="grid_table">
		<tr>
			<th style="width: 5%">序号</th>
			<th style="width: 10%">更改单号</th>
			<th style="width: 5%">申请人</th>
			<th style="width: 10%">申请时间</th>
			<th style="width: 10%">审批时间</th>
			<th style="width: 10%">处理时间</th>
			<th style="width: 10%">结束时间</th>
			<th style="width: 17%">处理时间(分钟)</th>
			<th style="width: 5%">处理人</th>
			<th style="width: 18%">结束时间(分钟)</th>
			
		</tr>


		<c:forEach items="${list}" var="dayList" varStatus="status">
			
			<tr style="cursor: pointer;" >
				<td style="text-align: center;">${status.count}</td>
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.MODIFY_ORDER_CODE}">N/A</c:when>
					<c:otherwise>
						${dayList.MODIFY_ORDER_CODE}
					</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">${dayList.APPLY_NAME}</td>
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.STIME}">N/A</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${dayList.STIME}" />
					</c:otherwise>
					</c:choose>
			    </td>
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.PASSTIME}">N/A</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${dayList.PASSTIME}" />
					</c:otherwise>
					</c:choose>
					
				</td>
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.ALTERTIME}">N/A</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${dayList.ALTERTIME}" />
					</c:otherwise>
					</c:choose>
					
				</td>
						
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.OTIME}">N/A</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${dayList.OTIME}" />
					</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">
					<c:choose>
					<c:when test="${empty dayList.HOURVALUEALTER}">N/A</c:when>
					<c:otherwise>
						${dayList.HOURVALUEALTER}
					</c:otherwise>
					</c:choose>
					
				</td>
				<td style="text-align: center;">
				<c:choose>
					<c:when test="${empty dayList.ALTERNAME}">N/A</c:when>
					<c:otherwise>
						${dayList.ALTERNAME}
					</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">
				<c:choose>
					<c:when test="${empty dayList.HOURVALUEOVER}">N/A</c:when>
					<c:otherwise>
						${dayList.HOURVALUEOVER}
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<tr>
			
		</tr>

	</table>
</body>
</html>