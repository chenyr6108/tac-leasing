<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<table class="grid_table">
	<tr>
		<th style="background-color: gray;color: black">
			停开时间
		</th>
		<th style="background-color: gray;color: black">
			停开原因
		</th>
		<th style="background-color: gray;color: black">
			停开操作人员
		</th>
		<th style="background-color: gray;color: black">
			复开时间
		</th>
		<th style="background-color: gray;color: black">
			复开原因
		</th>
		<th style="background-color: gray;color: black">
			复开操作人员
		</th>
	</tr>
	<c:forEach items="${resultList}" var="item" varStatus="index">
		<tr>
			<td>
				<fmt:formatDate value="${item.STOP_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
				${item.STOP_REMARK }
			</td>
			<td>
				${item.STOP_NAME }
			</td>
			<td>
				<fmt:formatDate value="${item.START_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
				${item.START_REMARK }
			</td>
			<td>
				${item.START_NAME }
			</td>
		</tr>
	</c:forEach>
</table>
</div>