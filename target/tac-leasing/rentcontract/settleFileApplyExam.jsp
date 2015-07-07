<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>结清文件审批</title>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
function rentfile(id,prcd_id,TYPE,CONTRACT_TYPE){
    $("#rentfile").toggle(function(){
        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentContract.queryRentSettleFileDetail&CONTRACT_TYPE="+CONTRACT_TYPE+"&TYPE="+TYPE+"&prcd_id="+prcd_id+"&RECT_ID=" + id );
        
		$("#rentfile").dialog({
	        modal: true,
	        autoOpen: false,
	        width: 900
	    });
	    $("#rentfile").dialog('open');        
    });
}	
</script>
</head>
<body>
	<form id="form1" name="form1" method="POST"
		action="${ctx}/servlet/defaultDispatcher">
		<input type="hidden" name="__action" id="__action"
			value="rentContract.queryRentSettleFileExam" />
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;结清文件审批</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			id="main">
			<div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0"
						bgcolor="#ffffff">
						<tr>
							<td width="8">&nbsp;</td>
							<td width="60" class="ss_o"></td>
							<td width="60%" class="ss_t" valign="top">
								<table style="margin-left: 10px;">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>审核状态:</td>
										<td><select name="STATE" style="height: 18px;">
												<option value="0"
													<c:if test="${STATE eq 0}">selected='selected'</c:if>>
													待审核</option>
												<option value="1"
													<c:if test="${STATE eq 1}">selected='selected'</c:if>>
													通过</option>
												<option value="2"
													<c:if test="${STATE eq 2}">selected='selected'</c:if>>
													驳回</option>
										</select>&nbsp;</td>
									</tr>
									<tr>
										<td>查询内容：</td>
										<td colspan="5"><input type="text" name="QSEARCH_VALUE"
											value="${QSEARCH_VALUE }"
											style="width: 395px; height: 18px; font-size: 12px;">
										</td>
									</tr>
								</table>
							</td>
							<td width="55" class="ss_th" valign="top">&nbsp;</td>
							<td width="20%"><a href="#" name="search" id="search"
								onclick="doSearch()" class="blue_button">搜 索</a></td>
						</tr>
					</table>
				</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }" /></td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">结清文件状态</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort
										orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort
										orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">客户名称</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">区域办事处</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">客户经理</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dw.resultList}" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;"><c:if
											test="${item.STATE eq 0}">待审核</c:if>
											<c:if test="${item.STATE eq 1}">已审核</c:if>
										<c:if test="${item.STATE eq 2}">已驳回</c:if>&nbsp;</td>
									<td style="text-align: center;">${item.CREDIT_RUNCODE}&nbsp;</td>
									<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
									<td style="text-align: center;">${item.CUST_NAME }</td>
									<td style="text-align: center;">${item.DECP_NAME_CN}&nbsp;</td>
									<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									<td style="text-align: center;">
									<c:choose>
									<c:when test="${item.STATE eq 0}"><a href="javascript:void(0)" onclick="rentfile('${item.RECT_ID }','${item.PRCD_ID }','EXAM','${item.CONTRACT_TYPE }');">结清文件审批</a></c:when>
									<c:when test="${item.STATE eq 1}"><a href="javascript:void(0)" onclick="rentfile('${item.RECT_ID }','${item.PRCD_ID }','EXAM','${item.CONTRACT_TYPE }');">已审核</a></c:when>
									<c:otherwise>已驳回</c:otherwise>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:pagingToolbar pagingInfo="${dw }" />
				</div>
			</div>
		</div>
	</form>
		<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
			<img src="${ctx }/images/loading.gif">
		</div>	
</body>
</html>