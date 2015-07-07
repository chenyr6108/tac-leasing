<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>业管文审详细列表</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		

			function closeDialog(msg){
				$(msg).dialog('close');
			}

			function examRentFileForShow(credit_id,ID,CONTRACT_TYPE){
			    $("#rentfile").toggle(function(){
			        $("#rentfile").load("../servlet/defaultDispatcher?__action=backMoney.examRentFileForHW&saveFlag=false&CONTRACT_TYPE="+CONTRACT_TYPE+"&FSS_ID="+ID+"&CREDIT_ID=" + credit_id );
			        
					$("#rentfile").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 940
					    });
					    $("#rentfile").dialog('open');        
			    });
			}
			
			function backAduitedRentContractReport(){
				
				location.href="../servlet/defaultDispatcher?__action=aduitedRentContractReport.getReport&year=${year}";
			}
			
			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="aduitedRentContractReport.showDetail" />
			<input type="hidden" name="year" id="year" value="${year}" />
			<input type="hidden" name="month" id="month" value="${month}" />
			<input type="hidden" name="userid" id="userid" value="${userid}" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管文审详细列表（年份：${year} <c:if test="${not empty month }">  月份：${month}</c:if>）</span>
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
										送件状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务经办
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务行政
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										提交单位主管时间
									</th>										
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										单位主管确认时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										分派文审
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业管收件时间
									</th>	
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业管初审时间
									</th>	
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										处理时间(分钟)
									</th>																									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><a href="#" onclick="examRentFileForShow('${item.CREDIT_ID }','${item.ID }','${item.CONTRACT_TYPE }');"><c:if test="${item.STATE eq 9 and empty item.RECT_ID}">业管初审</c:if><c:if test="${item.STATE eq 8}">总经理驳回</c:if><c:if test="${item.STATE eq 7}">财务驳回</c:if><c:if test="${item.STATE eq 6}">业管主管驳回</c:if><c:if test="${item.STATE eq 9 and not empty item.RECT_ID }">已过案</c:if><c:if test="${item.STATE eq 1}">提交单位主管</c:if><c:if test="${item.STATE eq 2}">单位主管通过</c:if><c:if test="${item.STATE eq 3}">单位主管驳回</c:if><c:if test="${item.STATE eq 4}">业管收件</c:if><c:if test="${item.STATE eq 5}">业管退件</c:if></a></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.ASSISTANT_NAME }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.MODIFY_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.SALES_MANAGE_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;">${item.DISPATCH_NAME }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.HW_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.HW_AUDIT_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;">${item.DEAL_TIME }</td>								
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
				</div>
				</div>
				</div>
		</form>
				
					<div align="center"><input type="button"  class="ui-state-default ui-corner-all" value=返&nbsp;&nbsp;回 onClick="javascript:backAduitedRentContractReport();"></div>


			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 940px">
				<img src="${ctx }/images/loading.gif">
			</div>	
	
	</body>
</html>