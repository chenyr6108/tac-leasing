<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>导出小车委贷开票资料明细</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function doQuery(){
				$("#__action").val("insuranceReport.insuranceReportForCar");
				$("#form1").submit();				
			}
			
			$(function(){
				$("#date").datepicker($.datepicker.regional['zh-CN']);
				$("#date1").datepicker($.datepicker.regional['zh-CN']);
				$("#date2").datepicker($.datepicker.regional['zh-CN']);
			});
			
			function dateChange(date){
				$("#date").val(date.toString().substring(0,7)) ;
			}
			function exportDetail(){
				$("#__action").val("insuranceReport.exportInsuranceReportForCar");
				$("#form1").submit();	
			}
			function exportServiceCharge(){
				$("#__action").val("insuranceReport.exportServiceCharge");
				$("#form1").submit();	
			}
			
			function exportCheckApply(){
				window.parent.callBirt("birtReport/financial/checkApply.rptdesign","pdf",{"date":$("#date").val(),"companyCode":$("#companyCode").val()});
			}
			
			function exportRentDetail(){
				$("#exportRentDetail").dialog({
					modal : true,
					autoOpen : true,
					width : 600
				});
			}
			
			function exportRentDetailXls(){
				if($("#date2").val()==''){
					alert('结束日期不能为空！');
					$("#date2").focus();
					return false;
				}
				window.parent.callBirt("birtReport/financial/exportRentDetailXls.rptdesign","xls",{"date1":$("#date1").val(),"date2":$("#date2").val(),"companyCode":$("#companyCode").val()});
				$("#exportRentDetail").dialog("close");
			}
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="insuranceReport.insuranceReportForCar" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出小车委贷开票资料明细</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="40" class="ss_o"></td>
					        <td width="60%" class="ss_t" valign="center">
					          <table>
					          	<tr>
					          		<td>日期：<input type="text" name ="date" id="date" onchange="dateChange(this.value)" value="${date}"></td>
					          		<td>公司别：</td>
					          		<td>
									
									<select name="companyCode" id="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
									<td>内容:</td>
									<td><input type="text" name="content" value="${content}"/></td>		
								</tr>
							  </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜索</a></td>
					      </tr>
				    </table>
				
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td>
							<input type="button" name="btn" onclick="exportDetail()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出小车委贷开票资料明细">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="btn" onclick="exportServiceCharge()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出手续费月报表">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="btn" onclick="exportCheckApply()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出代开发票申请书">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="btn" onclick="exportRentDetail()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出支付表明细">
							</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<thead>
								<tr>
								     <th>合同号&nbsp;</th>
								     <th>客户名称&nbsp;</th>
								     <th>期数&nbsp;</th>
								     <th>支付时间&nbsp;</th>
								     <th>利息&nbsp;</th>
								     <th>区域办事处&nbsp;</th>
								</tr>															
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
								     	<td>${item.LEASE_CODE}&nbsp;</td>
								     	<td>${item.CUST_NAME}&nbsp;</td>
								     	<td>${item.PERIOD_NUM}&nbsp;</td>
								     	<td>${item.PAY_DATE}&nbsp;</td>
								     	<td>${item.REN_PRICE}&nbsp;</td>
								     	<td>${item.DECP_NAME_CN}&nbsp;</td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
						<!--
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u620.gif">
										status1
										<img src="${ctx }/images/u617.gif">
										status2&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
						-->
				</div>
				</div>
				</div>
		</form>
		<div title="导出支付表明细" style="display: none" id="exportRentDetail">
		<form id="devTransDivForm" name="devTransDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdTrans"/> 
			<input type="hidden" name="opType" value="13"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">拨款日：<span id="demandCodeHours"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: left; padding-left:20px;" colspan="2">
									开始日期：<input type="text" name ="date1" id="date1" readonly="readonly" />&nbsp;&nbsp;&nbsp;&nbsp;
									结束日期：<input type="text" name ="date2" id="date2" readonly="readonly" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="导出" onclick="exportRentDetailXls();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	</body>
</html>