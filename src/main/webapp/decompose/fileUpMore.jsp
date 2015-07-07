<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>上传水单</title>
	</head>
	<body>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>文件名称</td>
				<td>上传人</td>
				<td>上传日期</td>
			</tr>	
			<c:forEach items="${logFileUpList}" var="item" varStatus="status">	
					<tr id="fileup${status.count }" class="ui-widget-content jqgrow ui-row-ltr">						
						<td style="text-align: left;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=decompose.download&name=${item.FILE_NAME }&path=${item.PATH }'"><input type="button" style="cursor: pointer;" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.FILE_NAME}" name="showRentFile"></a></td>	
						<td style="text-align: left;">${item.NAME}</td>
						<td style="text-align: left;">${item.CREATE_DATE}</td>
					</tr>		
			</c:forEach>		
		</table>	
	</body>
</html>	
