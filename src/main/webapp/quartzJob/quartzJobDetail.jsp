<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function openPath(path){
	var url = $("#url").val();
	window.parent.openNewTab(url,path,'Job明细');
}
</script>
<div>
<input type="hidden" id="url" name="url" value="${ctx }"/>
<table class="grid_table">
	<thead>
	<tr>
		<th>编号</th>
		<th>执行时间</th>
		<th>执行结果</th>
		<th>错误代码</th>
		<th>说明</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${detail}" var="d" varStatus="index">
		<tr>
			<td>${index.count }</td>
			<td><fmt:formatDate value="${d.fireTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td>${d.fireStatus }</td>
			<td>${d.errorCodeStr }</td>
			<td>${d.remark }</td>
		</tr>
		<c:if test="${index.count == 20}">
			<tr>
				<td colspan="3"><a href="javascript:void(0);" onclick="openPath('jobCommand.getAllDetail&jobName=${d.jobName }');">更多...</a></td>
			</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
</div>
