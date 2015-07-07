<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function exportExcel1() {
				window.parent.callBirt("birtReport/exportInvoice/exportInvoiceColumn.rptdesign","xls",{"DATE":$("#selectDate").val(),"invoiceType":$("#invoiceType").val(),"isPay":"0","companyCode":$("#companyCode").val()});
			}
			
			function exportExcel2() {
				window.parent.callBirt("birtReport/exportInvoice/exportInvoiceRow.rptdesign","xls",{"DATE":$("#selectDate").val(),"invoiceType":$("#invoiceType").val(),"companyCode":$("#companyCode").val()});
			}
			function exportCustInfo(){
				
				  $("#__action").val("insuranceReport.exportInvoiceCustInfo");
				  $("#form1").submit();
				  $("#__action").val("insuranceReport.queryInvoice");
			}
			function exportOneBarcodeExcel() {
				$("#__action").val("oneBarcodeCommand.getOneCodeImage");
				$("#form1").submit(); 
				$("#__action").val("insuranceReport.queryInvoice");
				//window.parent.callBirt("birtReport/exportInvoice/invoiceForOneCode.rptdesign","doc",{"DATE":$("#selectDate").val(),"invoiceType":$("#invoiceType").val()});
			}
			function exportIsPayExcel() {
				window.parent.callBirt("birtReport/exportInvoice/exportInvoiceColumn.rptdesign","xls",{"DATE":$("#selectDate").val(),"invoiceType":$("#invoiceType").val(),"isPay":"1","companyCode":$("#companyCode").val()});
			}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="insuranceReport.queryInvoice">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;开票资料(新案)</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	           <div class="zc_grid_body jqgrowleft">
	           		<div>
	           			<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
								 <tr>
					          		<td>查询周期：</td>
					          		<td>
					          			<select name="selectDate" id="selectDate">
					          				<c:forEach var="item" items="${dateList }">
					          					<option value="${item.CODE }" <c:if test="${item.CODE eq selectDate }">selected="selected"</c:if>>
					          						${item.DESCR }
					          					</option>
					          				</c:forEach>
					          			</select>
					          		</td>	          
									<td>
										开票类型：
									</td>
									<td>
										<select name="invoiceType" id="invoiceType">
				          					<c:forEach var="item" items="${invoiceTypeList }">
					          					<option value="${item.CODE }" <c:if test="${item.CODE eq invoiceType }">selected="selected"</c:if>>
					          						${item.FLAG }
					          					</option>
					          				</c:forEach>
					          			</select>
									</td>
	     						 </tr>
	     						 <tr>
	     						<td>
									公司别：
								</td>
								<td>
									<select name="companyCode" id="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
	     						 	<td>查询内容：</td>
	     						 	<td colspan="2"><input name="content" value="${content }" style="width: 161px;"></td>
	     						 </tr>
					          </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
					      </tr>
					    </table>
	           		</div>
	           		<div class="ui-state-default ui-jqgrid-hdiv" style="background: white;">
	           			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td><input type="button" value="导出Excel(列)" class="ui-state-default ui-corner-all" onclick="exportExcel1()">
	           						<input type="button" value="导出Excel(行)" class="ui-state-default ui-corner-all" onclick="exportExcel2()">
	           						<input type="button" value="导出客户邮寄信息(Excel)" class="ui-state-default ui-corner-all" onclick="exportCustInfo()">
	           						<input type="button" value="导出条形码" class="ui-state-default ui-corner-all" onclick="exportOneBarcodeExcel()">
	           						<input type="button" value="导出报表(是否缴款)" class="ui-state-default ui-corner-all" onclick="exportIsPayExcel()"></td>
	           					</td>
								
								<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
							</tr>
						</table>
						<c:if test="${invoiceType eq 4 }">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										序号
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										单据编号
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										融资租赁本金
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										融资租赁本金<br>(用于一次抵充)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										融资租赁利息
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										税率
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										地址电话
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										开户行帐号
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head">
										税号
									</td>
								</tr>
							<c:forEach items="${dw.resultList }" var="item" varStatus="status">													
								<tr>
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.RUNNUM }&nbsp;</td>
									<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber value="${item.OWN_PRICE-item.PLEDGE_PRICE }" pattern="#,##0.00"/></td>
									<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" pattern="#,##0.00"/></td>
									<td style="text-align: right;"><fmt:formatNumber value="${item.REN_PRICE }" pattern="#,##0.00"/></td>
									<td style="text-align: right;">${item.TAX_RATE }</td>
									<td style="text-align: center;">${item.LINK_ADDRESS }&nbsp;</td>
									<td style="text-align: center;">${item.BANK_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CORP_TAX_CODE }</td>
								</tr>
							</c:forEach>
							</table>
						</c:if>
						<page:pagingToolbar pagingInfo="${dw }"/>
	           		</div>
	           </div>
	        </div>
		</form>
</html>