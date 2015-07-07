<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>催收记录列表</title>
		
	</head>
	<body> 
		<div>
			<div
				class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="height: 30px">
				<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;催收记录(${dunRecordsList[0].CUST_NAME })</span>
			</div>
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									编号
								</th>
								<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
									时间
								</th>
								<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
									打电话人
								</th>
								<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
									接电话人
								</th>
								<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
									联系电话
								</th>
								<th width="32%" class="ui-state-default ui-th-ltr zc_grid_head">
									简要记录
								</th>
								<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
									反馈信息
								</th> 
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dunRecordsList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.CALL_DATE }"
									pattern="yyyy-MM-dd HH:mm" /></td>
								<td style="text-align: center;">${item.CALL_USER_NAME }</td>
								<td style="text-align: center;">${item.ANSWERPHONE_NAME }</td>
								<td style="text-align: center;">${item.PHONE_NUMBER }</td>
								<td>${item.CALL_CONTENT }</td>
								<td>${item.FEEDBACK_CONTENT }&nbsp;</td> 
							</tr> 
						</c:forEach>
							<tr>
								<td colspan="7" align="center"><input type="button" value="返回" onclick="javascript:history.go(-1)" class="ui-state-default ui-corner-all"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>