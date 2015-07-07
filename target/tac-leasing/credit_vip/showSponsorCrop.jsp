<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>介绍人管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="${ctx }/common/js/check.js"></script>	

</head>
<body> 
	<form action="${ctx}/servlet/defaultDispatcher" id="form1"  method="post">
		<input type="hidden" name="__action" value="creditReport.getSponsorByName" />
		<input type="hidden" name="SPONSORNAME" value="${SPONSORNAME }" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;介绍人业绩</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">

		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户编号 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>区域 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>区域主管 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户经理 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>风控纪要 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>生成时间 </strong>
					</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count}</td>
					<td style="text-align: center;">${item.TYPE}</td>
					<td style="text-align: center;">${item.CUST_CODE}</td>
					<td style="text-align: center;">${item.CUST_NAME}</td>
					<td style="text-align: center;">${item.PROVINCE}</td>
					<td style="text-align: center;">${item.CLERK_NAME}</td>
					<td style="text-align: center;">${item.SENSOR_NAME}</td>
					<td style="text-align: center;"><c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}">已提交</c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}">无条件通过</c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}">不通过附条件</c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}">不通过</c:if></td>
					<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.CREATE_DATE }"/>&nbsp;</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
		</div>
	</div>
	</form>
	
</body>
</html>