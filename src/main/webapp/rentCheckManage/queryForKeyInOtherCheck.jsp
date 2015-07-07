<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>支票管理——其他支票录入</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function keyInOtherRentCheck(credit_id,LEASE_CODE,CUST_NAME){
			    $("#rentCheckDetail").toggle(function(){
			        $("#rentCheckDetail").load("../servlet/defaultDispatcher?__action=rentContract.queryRentCheckSchema&CUST_NAME="+CUST_NAME+"&LEASE_CODE="+LEASE_CODE+"&credit_id=" + credit_id );
			        
					$("#rentCheckDetail").dialog({
				        modal: true,
				        autoOpen: false,
				        width: 400
				    });
				    $("#rentCheckDetail").dialog('open');        
			    });
			}
			function checkPayCreate(PRCD_ID,LEASE_CODE,CUST_NAME){
			    $("#checkPay").toggle(function(){
			        $("#checkPay").load("../servlet/defaultDispatcher?__action=rentContract.initRentCheckForSales&LEASE_CODE="+LEASE_CODE+"&CUST_NAME="+CUST_NAME+"&PRCD_ID=" + PRCD_ID );
			        
					$("#checkPay").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 840
					    });
					    $("#checkPay").dialog('open');  
						
			    });
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryForKeyInOtherCheckManage" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支票管理——其他支票录入</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:25px; font-size: 12px;">
				          </td>
				          <td>&nbsp;</td>
				          <td>&nbsp;</td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
						<td>
							&nbsp;
						</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
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
										办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										供货商
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										核准日
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										签订时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}"><img src="${ctx }/images/u604.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS == 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BRAND }&nbsp;</td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.WIND_RESULT_DATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">&nbsp;<c:if test='${item.LESSOR_TIME!=null && item.LESSOR_TIME!="" &&item.LESSOR_TIME!="1900-01-01 00:00:00.0"}'><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;"><a href="javascript:void(0)" onclick="keyInOtherRentCheck('${item.PRCD_ID }','${item.LEASE_CODE }','${item.CUST_NAME }');">录入支票期数</a>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="checkPayCreate('${item.PRCD_ID }','${item.LEASE_CODE }','${item.CUST_NAME }');">录入支票明细</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
										<img src="${ctx }/images/u604.gif">&nbsp;正常结清&nbsp;&nbsp;
										<img src="${ctx }/images/u614.gif">&nbsp;提前结清&nbsp;&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
				<div id="rentCheckDetail" align="center" title="录入支票期数" style="display: none; width: 400px">
					<img src="${ctx }/images/loading.gif">
				</div>
			<div id="checkPay" align="center" title="支票管理" style="display: none; width: 900px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		</form>
	</body>
</html>