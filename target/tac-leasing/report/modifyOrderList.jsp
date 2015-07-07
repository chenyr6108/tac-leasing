<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>更改單用時详细列表</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		

			
			function backModifyOrderReport(){
				
				location.href="../servlet/defaultDispatcher?__action=modifyOrderReport.getReport&year=${year}";
			}
			
			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="modifyOrderReport.showDetail" />
			<input type="hidden" name="year" id="year" value="${year}" />
			<input type="hidden" name="month" id="month" value="${month}" />
			<input type="hidden" name="userid" id="userid" value="${userid}" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;更改單用時详细列表（年份：${year} <c:if test="${not empty month }">  月份：${month}</c:if>）</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">

									<th class="ui-state-default ui-th-ltr zc_grid_head">
										更改单号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="APPLY_NAME" pagingInfo="${dw}">申请人</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="APPLY_TIME" pagingInfo="${dw}">申请时间</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										审批时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										处理时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										结束时间
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										处理时间（分钟）
									</th>										
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="USERNAME" pagingInfo="${dw}">处理人</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										结束时间（分钟）
									</th>																								
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.MODIFY_ORDER_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.APPLY_NAME }&nbsp;</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.APPLY_TIME}">N/A</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${item.APPLY_TIME}" />
											</c:otherwise>
											</c:choose>										
										</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.ADUIT_TIME}">N/A</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${item.ADUIT_TIME}" />
											</c:otherwise>
											</c:choose>		
										</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.DEAL_TIME}">N/A</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${item.DEAL_TIME}" />
											</c:otherwise>
											</c:choose>		
										</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.END_TIME}">N/A</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="MM-dd HH:mm:ss" type="both" value="${item.END_TIME}" />
											</c:otherwise>
											</c:choose>	
										</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.DEAL_TIMES}">N/A</c:when>
											<c:otherwise>
												${item.DEAL_TIMES}
											</c:otherwise>
											</c:choose>											
										</td>
										<td style="text-align: center;">${item.USERNAME }&nbsp;</td>
										<td style="text-align: center;">
											<c:choose>
											<c:when test="${empty item.END_TIMES}">N/A</c:when>
											<c:otherwise>
												${item.END_TIMES}
											</c:otherwise>
											</c:choose>											
										</td>							
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
				</div>
				</div>
				</div>
		</form>
				
		<div align="center"><input type="button"  class="ui-state-default ui-corner-all" value=返&nbsp;&nbsp;回 onClick="javascript:backModifyOrderReport();"></div>

	
	</body>
</html>