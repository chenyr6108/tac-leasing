<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<table cellspacing="1" cellpadding="0" class="grid_table">
	<thead>
	<tr>
		<th width="5%">序号</th>
		<th width="10%">操作人</th>
		<th width="10%">操作时间</th>
		<th width="75%">驳回原因</th>
	</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty errorMsg }">
				<tr><td colspan="4"><font color="red">${errorMsg }</font></td></tr>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${empty resultList }">
						<tr><td colspan="4"><font color="red">没有查询到驳回记录。</font></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${resultList}" var="v" varStatus="index">
							<tr>
								<td>${index.count }&nbsp;</td>
								<td>${v.create_by }&nbsp;</td>
								<td><fmt:formatDate value="${v.create_date }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
								<td>${v.reject_memo }&nbsp;</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</div>
