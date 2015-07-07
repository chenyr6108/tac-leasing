<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script>
	function exportCheckNotice(credit_id){
		window.parent.callBirt("birtReport/contract/back/CheckNotice.rptdesign", "pdf", {"ID" : credit_id});			
	}
</script>	
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="background-color: #e8e8e8;" width="608"><strong>资料名称</strong></td>
					<td style="background-color: #e8e8e8;" width="120"><strong>日期</strong></td>
					<td style="background-color: #e8e8e8;" width="50"><strong>状态</strong></td>
				</tr>
			</table></td>
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
		<td style="width: 50px;"><strong>01</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="preLeaseBackContractPdf('${PRCD_ID }');">售后租回买卖合同</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				</table></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>02</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="preLeaseBackMettingResolution('${PRCD_ID}');">股东会决议</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				
				</table></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>03</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackPdf&credit_idxx=${PRCD_ID }'" >融资租赁合同</a></td>
			<td width="59" align="center">&nbsp;</td>
			<td width="121" align="center">&nbsp;</td>
			<td width="50" align="center">&nbsp;</td>
		</tr></table></td>
	</tr>	
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>04</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="LeaseBackPromiseBook('${PRCD_ID}');">承诺书</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				</table></td>
	</tr>
	
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>05</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="222"><a href="javascript:void(0);" onclick="leaseBackPdf2('${PRCD_ID }')">付款请示书或请款书</a></td>
						<td width="398" align="left">开户帐号:<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
							<c:forEach items="${allBankAccount }" var="item" >
				          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}=${item.TYPE}">${item.OPEN_ACCOUNT_BANK }</option>
				            </c:forEach>
							</select>
						</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				</table></td>
	</tr>
											
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>06</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="leaseBackHoldPdf('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				</table></td>
	</tr>

	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>07</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByHu&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr>
				</table></td>
	</tr>

	<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>08</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="creditLeaseBackBeginpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr> --%>

	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="width: 50px;"><strong>09</strong></td>
		<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			
				<tr class="ui-widget-content jqgrow ui-row-ltr">
<%-- 							<td width="550"><a href="javascript:void(0);"
											onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expZulwToPdf_new&credit_id=${PRCD_ID }'">租赁物情况表</a>
										</td> --%>
					<td width="550"><a href="javascript:void(0);"
									onclick="outputItemSituationForDirect(${PRCD_ID })">租赁物情况表</a>
								</td>
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
		<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
		<td width="59" align="center">&nbsp;</td>
		<td width="121" align="center">&nbsp;</td>
		<td width="50" align="center">&nbsp;</td>
	</tr></table></td>
	</tr>	
	<tr class="ui-widget-content jqgrow ui-row-ltr">
	<td style="width: 50px;"><strong>11</strong></td>
	<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
		<td width="59" align="center">&nbsp;</td>
		<td width="121" align="center">&nbsp;</td>
		<td width="50" align="center">&nbsp;</td>
	</tr></table></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>12</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="loadbanknoticepdf('${PRCD_ID}');">银行账户信息通知</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						<tr id="leaseholdsprovebank${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
							<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
									
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="550">&nbsp;<a href="javascript:void(0);" onclick="loadbanknoticepdf('${PRCD_ID}');">银行账户信息通知</a></td>
											<td width="59" align="center">&nbsp;</td>
											<td width="121" align="center">&nbsp;</td>
											<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
										</tr>
									
								</table></td>
						</tr>
						</table></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 50px;"><strong>13</strong></td>
					<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0)"  onclick="exportValueAddTaxOpenInvoice('${PRCD_ID}');" >增值税开票资料确认书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr></table></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>14</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)"  onclick="exptConsultationAgree('${PRCD_ID}','${contract_type}');" >咨询服务协议书</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
	</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>15</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><c:choose><c:when test="${isVouch ne 0 }"><a href="javascript:void(0)"  onclick="exptVouchCorpMeeting('${PRCD_ID}');" >连保公司股东会决议</a></c:when> <c:otherwise>连保公司股东会决议</c:otherwise></c:choose></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
		</tr>	
		<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>16</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><c:choose><c:when test="${isMarkMachine ne 0 }"><a href="javascript:void(0)"  onclick="exptMarkMachineCommitLetter('${PRCD_ID}');" >交机承诺书</a></c:when> <c:otherwise>交机承诺书</c:otherwise></c:choose></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
		</tr>					
		<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>17</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0)"  onclick="exportCheckNotice('${PRCD_ID}');" >发票告知函</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
		</tr>	
		
	</table>
		</td>
	</tr>
</table>
