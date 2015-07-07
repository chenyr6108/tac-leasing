<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script>
function exportCarBackLeaseFile(fileName,credit_id){
	window.parent.callBirt("birtReport/carBackLease/"+fileName+".rptdesign", "pdf", {"ID" : credit_id});			
}
function exportCarPDF(fileName,credit_id){
	window.parent.callBirt("birtReport/car/"+fileName+".rptdesign", "pdf", {"ID" : credit_id});	
}
//原车回租
function carLeaseBackPdfPayMoneyForCar(param) {		
	window.location.href='${ctx }/servlet/defaultDispatcher?__action=carBackLeaseCommand.exportCarPayMoneyNOT&PRCD_ID='+param;
}
</script>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
			<td colspan="4">
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="608"><strong>资料名称</strong></td>
						<td style="background-color: #e8e8e8;" width="120"><strong>日期</strong></td>
						<td style="background-color: #e8e8e8;" width="50"><strong>状态</strong></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>00</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="outputApprovalLetter('${PRCD_ID }');">核准函</a></td>
						<td width="59" align="center"></td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>1</strong></td>
			<td colspan="4">
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0)"  onclick="exportCarBackLeaseFile('leaseContract','${PRCD_ID}');" >融资租赁合同</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>2</strong></td>
			<td colspan="4">
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550">
							<a href="javascript:void(0);"
								onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=carBackLeaseCommand.expCarLeaseBackZulwToPdfForValueAdded&credit_id=${PRCD_ID }'">租赁物情况表</a>
						</td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:if test="${contract_type eq 10 or contract_type eq 12}">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>3</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="222"><a href="javascript:void(0);" onclick="carLeaseBackPdfPayMoney('${PRCD_ID }')">付款请示书或请款书</a></td>
						<td width="398" align="center">开户帐号:<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
						<c:forEach items="${allBankAccount }" var="item" >
			          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}">${item.OPEN_ACCOUNT_BANK }</option>
			            </c:forEach>
						</select></td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
					</table></td>
		</tr>
		</c:if>
		<c:if test="${ contract_type eq 13}">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>3</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="carLeaseBackPdfPayMoneyForCar('${PRCD_ID }')">付款请示书或请款书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
					</table></td>
		</tr>
		</c:if>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>4</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('buyAndSaleContract','${PRCD_ID}');">买卖合同</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>	
		<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>5</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('promiseBook','${PRCD_ID}');">承诺暨授权书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
				</table></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>6</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('pledgeContract','${PRCD_ID}');">机动车辆抵押合同</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>7</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('entrustBook','${PRCD_ID}');">车辆处分授权委托书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>8</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('entrustBook2','${PRCD_ID}');">授权委托书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>	
		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>9</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('promiseBook2','${PRCD_ID}');">承诺函</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>
		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>10</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('repaymentPlan','${PRCD_ID}')">还款计划表</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>11</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('insurance','${PRCD_ID}');">保险承诺书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
			</table></td>
		</tr>

	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>12</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="exportCarPDF('financePlanServiceBook','${PRCD_ID}')">财务规划服务协议书</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>13</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('autoCutMoneyBook','${PRCD_ID}')">银行自动转账授权书</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>14</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarBackLeaseFile('noticeBook','${PRCD_ID}');">验收证明暨起租通知书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
				</table></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>15</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0);" onclick="exportCarPDF('inform','${PRCD_ID}')">核贷建议通知书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr>
				</table>
			</td>
	</tr>		
</table>
