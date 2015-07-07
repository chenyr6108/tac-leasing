<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>上传水单</title>
	</head>
	<body>
		<table class="panel_table">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<th>文件名称(点击产看)</th>
				<th>上传人</th>
				<th>上传日期</th>
			</tr>	
			<c:forEach items="${uploadList}" var="item" varStatus="status">	
					<tr>						
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFinanceCommand.viewFile&id=${item.ID }&incomeId=${item.INCOME_ID }'">${item.FILE_NAME}</a></td>	
						<td style="text-align: center;">${item.NAME}</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>		
			</c:forEach>		
		</table>	
	</body>
</html>