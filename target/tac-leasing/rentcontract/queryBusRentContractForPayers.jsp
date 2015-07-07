<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>维护缴款通知人</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		

	  
	  function queryPayers(creditId){

	   $("#addDiv").load("${ctx}/servlet/defaultDispatcher?__action=payerCommand.getPayers&creditId="+creditId);

		$("#addDiv").dialog({
			title:"维护缴款通知人",
			height: 480,
			width:520,
			modal: true,
			resizable:false
		});
	  }
</script>	
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContractEquiMDF.queryBusRentContractForPayers" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;维护缴款通知人</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="40" class="ss_o"></td>
					        <td width="60%" class="ss_t" valign="center">
					          <table>
					          	<tr>
									<td>查询内容：</td>
						           <td colspan="3"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
						          style=" width:395px;height:18px; font-size: 12px;">
						          </td>
								</tr>
							</table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" onclick="doSearch();" class="blue_button">搜 索</a></td>
					      </tr>
				    </table>
	          </div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
				<%@ include file="/common/pageControl.jsp"%>
						<table class="grid_table">
							<thead>
								<tr>
									<th>
										案件号
									</th>
									<th>
										合同编号
									</th>
									<th>
										客户名称
									</th>
									<th>
										区域
									</th>
									<th>
										区域办事处
									</th>
									<th>
										客户经理
									</th>
									<th>
										供货商
									</th>
									<th>
										签订时间
									</th>
									<th>
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">													
									<tr>
										<td style="text-align: center;" >${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;" >${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;" >${item.CUST_NAME }</td>
										<td style="text-align: center;" >${item.AREA }</td>
										<td style="text-align: center;" >${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;" >${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;" >${item.BRAND }&nbsp;</td>
										<td style="text-align: center;" >&nbsp;<c:if test='${item.LESSOR_TIME!=null && item.LESSOR_TIME!="" &&item.LESSOR_TIME!="1900-01-01 00:00:00.0"}'><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;">
										<a href="javascript:void(0)" onclick="queryPayers(${item.PRCD_ID })">维护缴款通知人</a>
										</td>
									</tr>
									<tr>
										<th colspan="11" class="pact">
											<div id="detail${item.PRCD_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
				</div>			
		</form>
		<!-- 增加缴款通知人 -->
		<div id="addDiv" style="display:none">

		</div>
	</body>
</html>