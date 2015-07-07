<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
</head>
<script>
		$(function() {
			$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		});

		function doQuery() {
			$("#form1").submit();
		}
		
		function getTableDetail(param) {
			location.href='../servlet/defaultDispatcher?__action=dataDictionaryCommand.getTableDetail&TABLE_NAME='+param;		
		}
		
		function exportPdf() {
			window.parent.callBirt("birtReport/dbTableDataDictionary/dbTableDataDictionary.rptdesign","pdf");
		}
</script>
<body style="text-align: center;">
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="dataDictionaryCommand.query">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;数据库表结构维护</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">表名：<input id="TABLE_NAME" name="TABLE_NAME" value="${TABLE_NAME }" style="width: 200px;">
							&nbsp;&nbsp;&nbsp;
							维护人员：<select id="ID" name="ID">
											<option value="">所有</option>
										<c:forEach items="${itUserList}" var="item">
											<option value="${item.id }" <c:if test="${item.id eq ID }">selected="selected"</c:if>>${item.name }</option>
										</c:forEach>
									 </select>
							&nbsp;&nbsp;&nbsp;
							<%-- 是否维护完成：<select id="IS_MAINTENANCE" name="IS_MAINTENANCE"><option value="">全部</option><option value="Y" <c:if test="${IS_MAINTENANCE eq 'Y' }">selected="selected"</c:if>>是</option><option value="N" <c:if test="${IS_MAINTENANCE eq 'N' }">selected="selected"</c:if>>否</option></select> --%>
							</td>
						</tr>
						<tr>
							<td colspan="5">维护时间：<input id="START_DATE" name="START_DATE" readonly="readonly" style="width: 80px;" value="${START_DATE }">&nbsp;至&nbsp;<input id="END_DATE" name="END_DATE" readonly="readonly" style="width: 80px;" value="${END_DATE }"></td>
						</tr>
					</table>
				</td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a></td>
			</tr>
		</table>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr>
						<td><input value="导出数据字典" type="button" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="exportPdf()"></td>
						<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr class="ui-jqgrid-labels">
							<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>序号</strong>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="tableName"><strong>表名 </strong></page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="tableChineseName"><strong>表名(中文) </strong></page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="name"><strong>最后维护人 </strong></page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="lastUpdateOn"><strong>最后维护时间 </strong></page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="5%">
								<strong>是否维护完成 </strong>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="tableCreateTime"><strong>表创建时间 </strong></page:pagingSort>
							</th>
						</tr>
					</thead>
					<tbody id="grid-data">
						<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
							<tr	class="ui-widget-content jqgrow ui-row-ltr">
								<td align="center" style="text-align: center">${index.count }&nbsp;</td>
								<td align="center" style="text-align: center"><a href="#" onclick="getTableDetail('${item.tableName }')">${item.tableName }</a>&nbsp;</td>
								<td align="center" style="text-align: center">${item.tableChineseName }&nbsp;</td>
								<td align="center" style="text-align: center">${item.name }&nbsp;</td>
								<td align="center" style="text-align: center"><fmt:formatDate value="${item.lastUpdateOn }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
								<td align="center" style="text-align: center"><c:if test="${item.isMaintenanceTable eq 'Y'}">是</c:if><c:if test="${item.isMaintenanceTable eq 'N'}"><font color="red">否</font></c:if>&nbsp;</td>
								<td align="center" style="text-align: center"><fmt:formatDate value="${item.tableCreateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>
<c:if test="${RESULT eq 'Y' }">
	<script type="text/javascript">
		alert("保存成功!");
	</script>
</c:if>
</html>