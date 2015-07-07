<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
				<td style="background-color: #e8e8e8;text-align: center;" width="70" align="center"><strong>应征份数</strong></td>
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
				<td style="width: 50px;text-align: center;" align="center">${insorupd._01 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="preCarLeaseBackContractPdf('${PRCD_ID }');">售后租回买卖合同</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>02</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._02 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="preCarLeaseBackMettingResolution('${PRCD_ID}');">股东会决议</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>03</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._03 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.expCarLeaseBackContractPdf&credtdxx=${PRCD_ID }'" >融资租赁合同</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
			</tr>	
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>04</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._04 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackPromiseBook('${PRCD_ID}');">承诺书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>05</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._05 }</td>
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
													
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>06</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._06 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackHoldPdf('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>

			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>07</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._07 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByValueAdded&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>08</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._08 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarMortgageContractPdf('${PRCD_ID}');">机动车辆抵押合同</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>09</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._09 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackRelyGrantBookPdf('${PRCD_ID}');">车辆处分授权委托书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>10</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._10 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackThreeProtocolPdf('${PRCD_ID}');">租赁物委托管理三方协议</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>11</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._11 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackCallLineGrantBookPdf('${PRCD_ID}');">授权书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>12</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._12 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportCarLeaseBackStatementPdf('${PRCD_ID}');">声明书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>			
		
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>13</strong></td>
				<td style="width: 50px;text-align: center;" align="center">0</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);"
											onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.expCarLeaseBackZulwToPdfForValueAdded&credit_id=${PRCD_ID }'">租赁物情况表</a>
										</td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
				</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>14</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._14 }</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="carLeaseBackManageAgrement('${PRCD_ID}');">车辆挂靠管理协议</a>
										</td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
				</table></td>
			</tr>

			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>15</strong></td>
			<td style="width: 50px;text-align: center;" align="center">0</td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>	
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>16</strong></td>
			<td style="width: 50px;text-align: center;">0</td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>17</strong></td>
						<td style="width: 50px;text-align: center;">0</td>
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
			<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>		
<%-- 			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>18</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="creditCarpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr> --%>		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>19</strong></td>
			<td style="width: 50px;text-align: center;" align="center">${insorupd._19 }</td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="exportMotorPdf(${PRCD_ID})" >扣款授权书</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>20</strong></td>
			<td style="width: 50px;text-align: center;" align="center">${insorupd._20 }</td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="exportNavigationPdf(${PRCD_ID})" >导航系统承诺书</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>21</strong></td>
				<td style="width: 50px;text-align: center;" align="center">${insorupd._21}</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0)"  onclick="exportValueAddTaxOpenInvoice('${PRCD_ID}');" >增值税开票资料确认书</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 50px;"><strong>22</strong></td>
					<td style="width: 50px;text-align: center;" align="center">${insorupd._22}</td>
					<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="550"><a href="javascript:void(0)"  onclick="exptCarConsultationAgree('${PRCD_ID}','${contract_type}');" >咨询服务协议书</a></td>
						<td width="59" align="center">&nbsp;</td>
						<td width="121" align="center">&nbsp;</td>
						<td width="50" align="center">&nbsp;</td>
					</tr></table></td>
			</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>23</strong></td>
						<td style="width: 50px;text-align: center;"  >0</td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><c:choose><c:when test="${isVouch ne 0 }"><a href="javascript:void(0)"  onclick="exptVouchCorpMeeting('${PRCD_ID}');" >连保公司股东会决议</a></c:when> <c:otherwise>连保公司股东会决议</c:otherwise></c:choose></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
				</tr>					
		</table>
			</td>
		</tr>
	</table>
