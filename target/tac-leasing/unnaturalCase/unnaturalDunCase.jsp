<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>案件逾期未回访</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	$(document).ready(function(){
		
        var content = {
            tipInfo: "<H5>查询内容包括:</H5><H5>案件号,客户名称,供应商名称</H5>"
        };
        $("#CONTENT").showTip(content);  

    });
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="unnaturalCaseCommand.queryDunCase">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;案件逾期未回访(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;02:00:00)</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">
									查找内容：
									<input id="CONTENT" name="CONTENT" value="${CONTENT }" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
									<select id="DATE" name="DATE">
										<c:forEach var="item" items="${dateList}">
											<option value="${item.DATE }" 
												<c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">selected="selected"</c:if></c:when>
														  <c:otherwise><c:if test="${item.DATE eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>${item.DATE }
											</option>
										</c:forEach>
									</select>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									类型：
									<select id="IS_UNNATURAL_CASE" name="IS_UNNATURAL_CASE">
										<option value="">--所有--</option>
										<option value="N" <c:if test="${IS_UNNATURAL_CASE eq 'N' }">selected="selected"</c:if>>逾期25天(含)未回访</option>
										<option value="Y" <c:if test="${IS_UNNATURAL_CASE eq 'Y' }">selected="selected"</c:if>>前3期逾期15天(含)未回访</option>
									</select>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									办事处：
									<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="item" items="${deptList}">
											<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${item.DEPT_NAME }
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table></td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
					</td>
				</tr>
			</table>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<br>
			&nbsp;&nbsp;<font color="red">*</font>&nbsp;${resultMap.DATE }的逾期未回访的<font color="red">客户数</font>为${resultMap.CUST_COUNT },包含的<font color="red">案件数</font>为${resultMap.CASE_COUNT }
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 30px;">
						<strong>序号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="creditRunCode" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>主管</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="recpCode" pagingInfo="${pagingInfo }"><strong>支付表号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="custId" pagingInfo="${pagingInfo }"><strong>客户名称</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="suplTrue" pagingInfo="${pagingInfo }"><strong>供应商责任</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>锁码方式</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="shouldPayDate" pagingInfo="${pagingInfo }"><strong>应付日期</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="dunTotalPrice" pagingInfo="${pagingInfo }"><strong>应付总额</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="dunDay" pagingInfo="${pagingInfo }"><strong>逾期天数</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="amerce" pagingInfo="${pagingInfo }"><strong>罚息</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 40px;">
						<strong>还款明细</strong>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.creditRunCode }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: center;">${item.name }&nbsp;</td>
						<td style="text-align: center;">${item.upName }&nbsp;</td>
						<td style="text-align: center;"><a title="点击查看支付表浏览" href="javascript:void(0)" onclick="window.location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.recpId }&RECT_ID=${item.rectId }'">${item.recpCode }</a>&nbsp;</td>
						<td style="text-align: center;">${item.custName }&nbsp;</td>
						<td style="text-align: center;"><c:forEach items="${item.suplList}" var="itemSuplName"><a title="点击查看供应商贡献度" href="javascript:void(0)" onclick="window.parent.openNewTab('..','supplerContributeCommand.query&SUPL_NAME=${itemSuplName.code }','供应商贡献度')">${itemSuplName.descr }</a>&nbsp;</c:forEach></td>
						<td style="text-align: center;">&nbsp;&nbsp;${item.suplTrue }&nbsp;&nbsp;</td>
						<td style="text-align: center;">${item.lockCode }&nbsp;</td>
						<td style="text-align: center;">${item.shouldPayDate }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value="${item.dunTotalPrice }" type="currency"/>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看逾期情况" onclick="javascript:location.href='../servlet/defaultDispatcher?__action=dunTask.getDunDetailByCustIdAndDate&RECP_CODE=${item.recpCode }&RECP_ID=${item.recpId }&CUST_NAME=${item.custName }'" href="javascript:void(0)">${item.dunDay }</a>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value="${item.amerce }" type="currency"/>&nbsp;</td>
						<td style="text-align: center;">&nbsp;<a title="点击查看还款明细" href="../servlet/defaultDispatcher?__action=statement.queryCustomerBillForSalesForNew&CUST_ID=${item.custId }&recp_id=${item.recpId }&cust_name=${item.custName }">还款明细</a></td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>