<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>操作日志</title>
	</head>
	<body>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-jqgrid-labels">						
				<th>操作人</th>	
				<th>操作时间</th>	
				<th>操作说明</th>	
			</tr>	
			<c:forEach items="${logList}" var="item" varStatus="status">	
					<tr class="ui-widget-content jqgrow ui-row-ltr">						
						<td>${item.NAME}&nbsp;</td>
						<td><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
						<td>${item.MEMO}&nbsp;</td>	
					</tr>		
			</c:forEach>		
		</table>	
	</body>
</html>	
