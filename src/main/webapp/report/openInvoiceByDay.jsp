<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("insuranceReport.exportOpenInvoiceByDayToExcel");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.exportOpenInvoiceByDay");
		}	
		
	    $(function (){
			$("#startDate").datepicker($.datepicker.regional["zh-CN"]);
			$("#endDate").datepicker($.datepicker.regional["zh-CN"]);
		});
		  
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="insuranceReport.exportOpenInvoiceByDay">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出开票资料--新案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
					<table width="85%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				        <td width="9%" class="ss_t">起始日期:<input type="text" name="startDate" style=" width: 80px; height: 18px;" readonly="readonly" id="startDate" value="${startDate }">    结束日期:<input type="text" name="endDate" id="endDate" style=" width: 80px; height: 18px;" readonly="readonly" value="${endDate }"></td>
			            <td class="ss_t">
						公司别：
						<select name="companyCode">
							<option value="">全部</option>
							<c:forEach items="${companys}" var="item">
								<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
							</c:forEach>
						</select>			          
						</td>
			            <td width="12%" class="ss_t">&nbsp;</td>
			            <td width="15%" class="ss_t">&nbsp;</td>
					</td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>单位主管</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>利息</strong>
					</th>					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>预期租金</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>计税依据</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>备注</strong>
					</th>
				</tr>

				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.REN_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.MONTH_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;">${item.CORP_TAX_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.REMARK }&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>			
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>