<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<html>
<head>
<script>
		$(function (){
			$("#BEGIN_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function doQuery() {
			$("#form").submit();
		}
		
		function getRemark(id) {
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=customerVisitCommand.viewRemark&id='+id,
				dataType:'json',
				success: function(dataBack)	{
					$("#REMARK").val(dataBack.REMARK);
					$("#remarkDiv").dialog({modal:true,autoOpen:false,width:600});
			        $("#remarkDiv").dialog("open");
				}	
				});
		}
		
		function viewStaffCustVisit(employeeId,employeeName,date) {
			location.href='${ctx }/servlet/defaultDispatcher?__action=customerVisitCommand.viewStaffCustVisit&employeeId='+employeeId+'&date='+date+'&employeeName='+employeeName;
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="customerVisitCommand.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;查询拜访记录</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:30px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:30px;" class="ss_bigt">
					<table style="margin-left: 50px;">
						<tr>
							<td align="right">
								办事处： 
							</td>
							<td>
								<select id="DEPT_ID" name="DEPT_ID" style="width:100px">
									<option value="">--所有办事处--</option>
									<c:forEach items="${deptList}" var="dept"
										varStatus="status">
										<option value="${dept.DEPT_ID}"
											<c:if test="${dept.DEPT_ID eq DEPT_ID}">selected='selected'</c:if>>${dept.DEPT_NAME}</option>
									</c:forEach>
								</select>
							</td>
							<td align="right">
								&nbsp;&nbsp;业务员：
							</td>
							<td>
								<select id="STAFF" name="STAFF" style="width:100px">
									<option value="">--所有业务员--</option>
									<c:forEach items="${staffList}" var="staff"
										varStatus="status">
										<option value="${staff.id}"
											<c:if test="${staff.id eq STAFF}">selected='selected'</c:if>>${staff.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								是否请假：
							</td>
							<td>
								<select id="IS_HOLIDAY" name="IS_HOLIDAY" style="width:100px">
									<option value="">--所有--</option>
									<option value="N" <c:if test="${IS_HOLIDAY eq 'N' }">selected="selected"</c:if>>否</option>
									<option value="Y" <c:if test="${IS_HOLIDAY eq 'Y' }">selected="selected"</c:if>>是</option>
								</select>
							</td>
							<td>
								&nbsp;&nbsp;是否主管陪同：
							</td>
							<td>
								<select id="IS_WITH_SUPERVISOR" name="IS_WITH_SUPERVISOR" style="width:100px">
									<option value="">--所有--</option>
									<option value="N" <c:if test="${IS_WITH_SUPERVISOR eq 'N' }">selected="selected"</c:if>>否</option>
									<option value="Y" <c:if test="${IS_WITH_SUPERVISOR eq 'Y' }">selected="selected"</c:if>>是</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right">
								开始时间：
							</td>
							<td><input id="BEGIN_DATE" name="BEGIN_DATE" value="${BEGIN_DATE }" readonly="readonly" style="width: 100px;"></td>
							<td align="right">
								&nbsp;&nbsp;结束时间：
							</td>
							<td><input id="END_DATE" name="END_DATE" value="${END_DATE }" readonly="readonly" style="width: 100px;"></td>
						</tr>
						<tr>
							<td align="right">
								查询内容：
							</td>
							<td colspan="3">
								<input id="CONTENT" name="CONTENT" value="${CONTENT }" style="width:299px">
							</td>
						</tr>
					</table>
		 		</td>
				<td style="width:10px;" class="ss_bigt" valign="middle" align="left">
					<a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:30px;">序号</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:50px;">业务员</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">时间</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:200px;">对象</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">开拓方式</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">目的</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:120px;">拜访地区</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:50px;">主管陪同</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">预计拜访时段</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">实际拜访时段</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:80px;">重点记录</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:50px;">备注<br>(点击查看)</th>
			</tr>
			<c:forEach items="${resultList}" var="item" varStatus="status">
				<tr>
					<c:if test="${item.holiday eq 'N' or item.holiday == '' or item.holiday == null }">
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${status.count }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><a href="#" onclick="viewStaffCustVisit('${item.employeeId}','${item.name}','${item.date }')">${item.name }</a>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.date }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.object }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.empolderWayDescr }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.intentDescr }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.provinceName }-${item.cityName }-${item.areaName }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><c:if test="${item.withSupervisor eq 'Y' }">是</c:if><c:if test="${item.withSupervisor eq 'N' }">否</c:if>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.expectFromTime }至${item.expectToTime }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.actualFromTime }至${item.actualToTime }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.importantRecordDescr }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><a href="#" onclick="getRemark('${item.id}')">......</a></td>
					</c:if>
					<c:if test="${item.holiday eq 'Y' }">
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;color:#FF0000;">${status.count }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;color:#FF0000;"><a href="#" onclick="viewStaffCustVisit('${item.employeeId}','${item.name}','${item.date }')">${item.name }</a>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;color:#FF0000;">${item.date }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;color:#FF0000;" colspan="6">请假:</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;color:#FF0000;">${item.holidayFromTime }至${item.holidayToTime }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;color:#FF0000;" colspan="2">&nbsp;</td>
					</c:if>
				<tr>
			</c:forEach>
		</table>
		</div>
		</div>
	</form>
	<div id="remarkDiv" style="display:none;" title="查看备注">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
       			<div class="zc_grid_body jqgrowleft">
       				<div class="ui-state-default ui-jqgrid-hdiv">
						<input type="hidden" id="LOAN_ID" name="LOAN_ID">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td>
										<textarea rows="10" cols="100" readonly="readonly" id="REMARK" name="REMARK"></textarea>
									</td>
								</tr>
								<tr>
									<td id="button_flag" style="text-align:center;">
									<br>
										<input type="button" value="关&nbsp;闭" onclick="$('#remarkDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</div>
</body>
</html>