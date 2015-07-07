<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>支票管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function checkPayCreate(PRCD_ID,LEASE_CODE,CUST_NAME,TYPE){
			    $("#checkPay").toggle(function(){
			        $("#checkPay").load("../servlet/defaultDispatcher?__action=rentContract.initRentCheck&TYPE="+TYPE+"&LEASE_CODE="+LEASE_CODE+"&CUST_NAME="+CUST_NAME+"&PRCD_ID=" + PRCD_ID );
			        
					$("#checkPay").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 840
					    });
					    $("#checkPay").dialog('open');  
						
			    });
			}
			
			function expandForShow(id,credit_id){
		        $("#" + id).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=rentContract.queryCheckPaySchema&credit_id=" + credit_id );
		        });
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentCheckManage" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支票管理</span>
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
						<td>&nbsp;</td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
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
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;cursor: pointer;" onClick="expandForShow('pactAffix${item.PRCD_ID}','${item.PRCD_ID}')"><a>${item.CREDIT_RUNCODE }</a>&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:void(0)" onclick="checkPayCreate('${item.PRCD_ID }','${item.LEASE_CODE}','${item.CUST_NAME }','SHOW');">查看支票明细</a>&nbsp;|&nbsp;<c:choose><c:when test="${salesKeyin}"><a href="javascript:void(0)" onclick="checkPayCreate('${item.PRCD_ID }','${item.LEASE_CODE}','${item.CUST_NAME }','SALES');">录入支票明细</a></c:when><c:otherwise>录入支票明细</c:otherwise></c:choose>&nbsp;|&nbsp;<c:choose><c:when test="${hwExam}"><a href="javascript:void(0)" onclick="checkPayCreate('${item.PRCD_ID }','${item.LEASE_CODE}','${item.CUST_NAME }','HW');">业管确认</a></c:when><c:otherwise>业管确认</c:otherwise></c:choose>&nbsp;|&nbsp;<c:choose><c:when test="${ financeExam }"><a href="javascript:void(0)" onclick="checkPayCreate('${item.PRCD_ID }','${item.LEASE_CODE}','${item.CUST_NAME }','FINANCE');">财务确认</a></c:when><c:otherwise>财务确认</c:otherwise></c:choose></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="6" align="left">
											<div id="pactAffix${item.PRCD_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
			<div id="checkPay" align="center" title="支票管理" style="display: none; width: 900px">
				<img src="${ctx }/images/loading.gif">
			</div>	
	</body>
</html>