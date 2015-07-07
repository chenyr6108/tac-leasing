<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("insuranceReport.exportValueAddOpenInvoiceByMonthToExcel");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.queryValueAddOpenInvoiceByMonth");
		}	
		
		function expToExcel1(){
			  $("#__action").val("insuranceReport.exportValueAddOpenInvoiceByMonthToExcel1");
			  $("#form1").submit();
			  $("#__action").val("insuranceReport.queryValueAddOpenInvoiceByMonth");
			}	
		
		function expCustInfoToExcel(){
			  $("#__action").val("insuranceReport.exportValueAddOpenInvoiceCustInfoByMonthToExcel");
			  $("#form1").submit();
			  $("#__action").val("insuranceReport.queryValueAddOpenInvoiceByMonth");
			
		}
		
		  $(function (){
				$("#startDate").datepicker($.datepicker.regional['zh-CN']);
			});
		  
			function updateDateMonth(){
				var date = $("#startDate").val() ;
				$("#startDate").val(date.toString().substring(0,7)) ;
			}	
			function exportOneBarcodeExcel() {
				$("#__action").val("oneBarcodeCommand.getOneCodeImageForOld");
				$("#form1").submit(); 
				$("#__action").val("insuranceReport.queryValueAddOpenInvoiceByMonth");
			}
			function expToIsPayExcel(){
				  $("#__action").val("insuranceReport.expToIsPayExcel");
				  $("#form1").submit();
				  $("#__action").val("insuranceReport.queryValueAddOpenInvoiceByMonth");
			}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="taxPlanCode" id="taxPlanCode"
				value="${taxPlanCode }">
			<input type="hidden" name="__action" id="__action"
				value="insuranceReport.queryValueAddOpenInvoiceByMonth">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;增值税内含开票资料--旧案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
					<table width="85%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				     	 <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
						          查询日期：<input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:150px; height:18px;">
						</td>
				        <td class="ss_t">				        
					            公司别：
						<select name="companyCode">
							<option value="">全部</option>
							<c:forEach items="${companys}" var="item">
								<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
							</c:forEach>
						</select>	
				        </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出增值税内含开票资料--旧案(列)"  onclick="expToExcel();"></td>
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出增值税内含开票资料--旧案(行)"  onclick="expToExcel1();"></td>
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出客户邮寄信息(EXCEL)"  onclick="expCustInfoToExcel();"></td>
					<td><input type="button" value="导出条形码" class="ui-state-default ui-corner-all" onclick="exportOneBarcodeExcel()"></td>
					<td><input type="button" value="导出报表(是否缴款)" class="ui-state-default ui-corner-all" onclick="expToIsPayExcel()"></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>单据编号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地址电话</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>开户行帐号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<c:if test="${taxPlanCode eq 4 }">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>融资租赁本金</strong>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>融资租赁本金<br>(用于一次抵充)</strong>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>融资租赁利息</strong>
						</th>
					</c:if>
					<c:if test="${taxPlanCode ne 4 }">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>金额</strong>
						</th>
					</c:if>					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税率</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>备注1</strong>
					</th>
				</tr>

				<c:forEach items="${dw.resultList}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.RUNNUM }&nbsp;</td>
						<td style="text-align: center;">${item.LINK_ADDRESS }&nbsp;</td>
						<td style="text-align: center;">${item.CORP_TAX_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.BANK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PRODUCT_NAME }&nbsp;</td>
						<c:if test="${taxPlanCode eq 4 }">
							<td style="text-align: right;"><fmt:formatNumber value="${item.OWN_PRICE-item.PLEDGE_PRICE }" type="currency" />&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" type="currency" />&nbsp;</td>
						</c:if>
						<td style="text-align: right;"><fmt:formatNumber value="${item.REN_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;">${item.TAX_RATE}&nbsp;</td>
						<td style="text-align: center;">${item.REMARK1 }&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>			
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>