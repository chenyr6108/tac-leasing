<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
		function updateTableInfo() {
			$("#form1").submit();
		}
		
		function backQuery() {
			location.href='../servlet/defaultDispatcher?__action=dataDictionaryCommand.query';		
		}
		
		function showKey() {
			if($("#KEY").css('display')=='none') {
				$("#KEY").show('slow');
			} else {
				$("#KEY").hide('slow');
			}
		}
</script>
</head>
<body style="text-align: center;">
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="dataDictionaryCommand.update">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;数据库表结构维护</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<br><br>
		<div>
			<b>表名：</b><input type="hidden" value="${TABLE_NAME }" id="TABLE_NAME" name="TABLE_NAME">&nbsp;
			<c:if test="${tableConstraintList[0].columnName ==null }">
				<b>${TABLE_NAME }</b>
			</c:if>
			<c:if test="${tableConstraintList[0].columnName !=null }">
				<b><a href="#" onclick="showKey()" style="color: #576EAF">${TABLE_NAME }</a></b>&nbsp;&nbsp;(查看主外键关系)
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;<b>表名(中文)：</b>&nbsp;<input id="TABLE_CHINESE_NAME" name="TABLE_CHINESE_NAME" value="${tableDetailList[0].tableChineseName }" maxlength="50">
			<br>
			<span style="display: none;margin-left: 350px;" id="KEY">
			<br>
				<table>
					<tr class="ui-state-default ui-th-ltr zc_grid_head">
						<td align="center">
							栏位名
						</td>
						<td align="center">
							键
						</td>
					</tr>
					<c:forEach items="${tableConstraintList}" var="item" varStatus="index">
						<tr>
							<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
								${item.columnName }
							</td>
							<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
								${item.constraintName }
							</td>
						</tr>
					</c:forEach>
				</table>
			</span>
		</div>
		<br><br>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" style="width: 1200px;">
					<thead>
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head" width="50px;">
							<strong>序号</strong>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" width="300px;">
							<strong>栏位名 </strong>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" width="80px;">
							<strong>数据类型 </strong>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" width="400px;">
							<strong>描述 </strong>
						</th>
					</tr>
					</thead>
					<tbody id="grid-data">
						<c:forEach items="${tableDetailList}" var="item" varStatus="index">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center" style="text-align: center">${index.count }&nbsp;</td>
							<td align="center" style="text-align: center">${item.columnName }&nbsp;<input type="hidden" name="COLUMN_NAME" value="${item.columnName }"><input type="hidden" name="VERSION" value="${item.version }"></td>
							<td align="center" style="text-align: center">${item.dataType }&nbsp;<input type="hidden" name="DATE_TYPE" value="${item.dataType }"></td>
							<td align="center" style="text-align: center"><textarea name="DESCRIPTION" rows="3" cols="145">${item.description }</textarea></td>
						</tr>
						</c:forEach>
						<tr>
							<td>
								备注:
							</td>
							<td colspan="3">
								<textarea rows="6" cols="221" id="REMARK" name="REMARK">${tableDetailList[0].remark }</textarea>
							</td>
						</tr>
					</tbody>
					<tr>
						<td colspan="4" align="center"><br>
							<input type="button" value="保存" class="ui-state-default ui-corner-all" onclick="updateTableInfo()" style="cursor: pointer;">
							&nbsp;&nbsp;
							<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="backQuery();" style="cursor: pointer;">
						</td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</form>
</body>
<c:if test="${SYNC eq 'Y' }">
	<script type="text/javascript">
		alert("有栏位并发,请先返回!");
	</script>
</c:if>
</html>