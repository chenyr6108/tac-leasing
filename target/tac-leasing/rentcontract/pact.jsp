<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
<!--
jQuery(function($){

	// $("[id*='pucsContract_']").hide();
	// $("[id*='paylists_']").hide();
	// $("[id*='windList_']").hide();
	// $("[id*='deliveryNotices_']").hide();
	// $("[id*='payments_']").hide();
	// $("[id*='pactMore']").hide();

})
	function hideOrShow(id) {
		$("#"+id).toggle();
	}

 	function creditpdf(credit_idxx,contract_type){
	  	//var credit_idxx=$("#credit_idxx").val();
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportCreditPdfs.prePdf&credit_idxx='+credit_idxx+'&contract_type='+contract_type;
	}

	function leaseholdpdf(id){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayMoneyPdf.exportPayMoney&PUCT_ID='+id;
	}
	  
	function leaseholdpdfnew(credit_idxx){
	  		//var credit_idxx=$("#credit_idxx").val();
	  	/*	var chk_value =[];   
			$('input[name="credit_idxx"]:checked').each(function(){   
				 chk_value.push($(this).val());   
			});   
			if(chk_value.length==0){
				alert("你还没有选择合同");
			return false;}	 
	  	*/	
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePdf&credit_idxx='+credit_idxx;
	}
		  //导出密码作业
	function loadmimapdf(credit_idxx){
	 // 		var credit_idxx=$("#credit_idxx").val();
	 // alert(credit_idxx);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=passwordHomework.prePdf&credit_idxx='+credit_idxx;
	}
	 //导出银行账户信息通知
	function loadbanknoticepdf(credit_idxx){
	 // 		var credit_idxx=$("#credit_idxx").val();
	 // alert(credit_idxx);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expBankNoticepdf.prePdf&PRCD_ID='+credit_idxx;
	}
	// 导出确认函_合同管理
	function pdfRentConfirmationnew(rect_id,contract_type){
		//var credit_idxx=$("#credit_idxx").val();
		//var contract_type = $("#contract_type").val();
		if(contract_type==0){ 				// 一般租赁确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.includeLeases&RECT_ID="+rect_id;
		}else if(contract_type==1){			// 委托购买确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.consignmentFinancialLeasing&RECT_ID="+rect_id;
		}

	}
	 	 //设备价款支付协议（委托）
	function expEqmtPriceAgreeWT(credit_idxx,type){
	  //alert(credit_idxx);
	   // alert(type);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.prePdf&PRCD_ID='+credit_idxx+'&CONTRACT_TYPE='+type;
	} 
	 //设备价款支付协议（一般）
	function expEqmtPriceAgreeYB(credit_idxx,type){
	 //alert(credit_idxx);
	// alert(type);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeYBpdf.prePdf&PRCD_ID='+credit_idxx+'&CONTRACT_TYPE='+type;
	} 

	//导出回购合同
	function buybackpdf(rect_id,supl){
		if(supl==2){
			window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expPdf2&RECT_ID="+rect_id;
		}else{
			window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expPdf&RECT_ID="+rect_id;
		}
	}
	//导出确认书_合同管理
	function Confirmationpdf(rect_id,prcd_id){
		window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expConfirm&RECT_ID="+rect_id+"&PRCD_ID="+prcd_id;
	}
	//导出密码通知书
	function prePassWordNote(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePassWordNote&credit_idxx='+credit_idxx;
		}
	
	//增加开票资料确认书
	function exportValueAddTaxOpenInvoice(credit_idxx){
  		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.preValueAddTaxOpenInvoice&credit_idxx='+credit_idxx;
	}
	
	//直接租赁合同
	function outputContractForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/directContract.rptdesign","pdf",{"creditId":creditId});
	}
	//直接租赁付款指示书
	function outputPaymentInstructionForDirect(creditId){
		var bank = $("#bankAccount" + creditId).val();
		window.parent.callBirt("birtReport/contract/direct/paymentInstruction.rptdesign","pdf",{"creditId":creditId, "bank":encodeURI(bank)});
	}
	//直接租赁确认函（供应商）
	function outputConfirmLetterForSuplForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/confirmLetterForSupl.rptdesign","pdf",{"creditId":creditId});
	}
	//直接租赁三方支付协议
	function outputPaymentAgreementForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/paymentAgreement.rptdesign","pdf",{"creditId":creditId});
	}
	//直接租赁验收证明暨起租通知书
	function outputLeaseStartAdviceForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/leaseStartAdvice.rptdesign","pdf",{"creditId":creditId});
	}
	//导出交机承诺书
 	function exptMarkMachineCommitLetter(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expMarkMachineCommitLetter&credit_id='+credit_idxx;
	}
 	//租赁物情况表
	function outputItemSituationForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/itemSituation.rptdesign","pdf",{"creditId":creditId});
	}
	//导出咨询服务协议书
 	function exptConsultationAgree(credit_idxx,contract_type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.exptConsultationAgree&CONTRACT_TYPE='+contract_type+'&PRCD_ID='+credit_idxx;
	} 
 	//导出连保公司股东会决议
 	function exptVouchCorpMeeting(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expVouchCorpMettingResolutionPdfs&credit_id='+credit_idxx;
	} 
	//通知暨回执函
	function receiptPDF(creditId){
		window.parent.callBirt("birtReport/contract/direct/receipt.rptdesign","pdf",{"creditId":creditId});
	}
	
	function outputApprovalLetter(creditId){
		window.location.href="../servlet/defaultDispatcher?__action=exportApporvalletters.exportForOne&credit_id=" + creditId;;
	}
</script>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
		<c:if test="${contract_type eq 7}">
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
									<td width="550"><a href="javascript:void(0);" onclick="outputContractForDirect('${PRCD_ID }');">买卖合同</a></td>
									<td width="59" align="center"></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">					
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="outputLeaseStartAdviceForDirect('${PRCD_ID}');">验收证明暨起租通知书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="outputLeaseStartAdviceForDirect('${PRCD_ID}');">验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!--  <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${ empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="222"><a href="javascript:void(0);" onclick="outputPaymentInstructionForDirect('${PRCD_ID }')">付款请示书或请款书</a></td>
									<td width="398" align="center">
									开户帐号:
									<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
									<c:forEach items="${allBankAccount }" var="item" >
						          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}">${item.OPEN_ACCOUNT_BANK }</option>
						            </c:forEach>
									</select>
									</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><a href="javascript:void(0);" onclick="outputConfirmLetterForSuplForDirect('${PRCD_ID}');">供应商确认函(自备款收款确认)</a></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="outputPaymentAgreementForDirect('${PRCD_ID}');">三方支付协议(出租人/承租人/供应商)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
								<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${PRCD_ID }','${supl.SUPL_TRUE}');"><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></a></c:if></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
												</tr>
											
								</table></td>
					</tr>
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
					
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty rentEquipmentList}">
								<tr  class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${creditEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.expPasswordPDF&eqmt_id=${item.EQMT_ID}">密码控管表</a></td>
													<td width="59" align="center">  &nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> --> &nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</c:if>
								<c:if test="${not empty rentEquipmentList}">
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.passwordControlTablePDF&eqmt_id=${item.EQMT_ID}">密码控管表</a></td>
													<td width="59" align="center"><!-- <a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a> -->&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty paylists}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByHu&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty paylists}">
								<tr id="paylists_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${paylists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<!--  <td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a></td>-->
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.expPayToPdf&ids=${item.RECP_ID }'">租金支付明细表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0)"  onclick="exportValueAddTaxOpenInvoice('${PRCD_ID}');" >增值税开票资料确认书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
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
									<td style="width: 50px;"><strong>12</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.outPutDirectContract&credit_idxx=${PRCD_ID }&contractType=0'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>	
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<%-- <c:if test="${empty paylists}"> --%>
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="outputItemSituationForDirect(${PRCD_ID })">租赁物情况表</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<%-- </c:if>
								<c:if test="${not empty paylists}">
								<tr id="paylists_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${paylists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<!--  <td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a></td>-->
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expCollectionZulwToPdf&ids=${item.RECP_ID }'">租赁物情况表(${item.RECP_CODE})</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</c:if> --%>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>14</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>15</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>19</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0)"  onclick="exptConsultationAgree('${PRCD_ID}','${contract_type}');" >咨询服务协议书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>20</strong></td>
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
						<td style="width: 50px;"><strong>16</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="prePassWordNote('${PRCD_ID}');">密码作业通知说明书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>17</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="receiptPDF('${PRCD_ID}');">通知暨回执函</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
					</tr>
			</table>
		</c:if>
		<c:if test="${contract_type eq 5}">
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
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('pucsContract_${PRCD_ID}');" >&nbsp;委托购买合同</td>
									<td width="59" align="center"><!-- <c:choose><c:when test="${pucsContractsFlag gt 0 and rcstatus eq 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.queryEquipment&RECT_ID=${RECT_ID }'" >新建</a></c:when><c:otherwise>新建</c:otherwise></c:choose>--></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<!--<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">委托购买合同(PDF)</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a></td>
												<td width="59" align="center"><img src="${ctx }/images/edt.gif" width="16" height="16" /><c:choose><c:when test="${rcstatus eq 0}"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.initUpdatePucsContract&PUCT_ID=${item.PUCT_ID }'">&nbsp;修改</a></c:when><c:otherwise>修改</c:otherwise></c:choose></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if> -->
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">委托购买合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
											
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer"  <c:if test="${not empty pucsContracts}">onClick="hideOrShow('Confirmation${PRCD_ID}');"</c:if>>确认书(承租人确认所有权归属)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="Confirmation${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="Confirmationpdf('${RECT_ID}','${PRCD_ID}');">导出确认书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>

					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprove${PRCD_ID}');">&nbsp;交货验收证明暨起租通知书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">租赁物验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty pucsContracts}">onClick="hideOrShow('equipmentcostpay${PRCD_ID}');"</c:if> >&nbsp;付款请示书或请款书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书或请款书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
				
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty RECT_ID}">onClick="hideOrShow('confirmletter${PRCD_ID}');"</c:if>>&nbsp;供应商确认函(自备款收款确认)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${RECT_ID}','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${isCONTRACT!=0}">onClick="hideOrShow('expEqmtPriceAgreeWT_${PRCD_ID}');"</c:if>>三方支付协议(出租人/承租人/供应商)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="expEqmtPriceAgreeWT_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="expEqmtPriceAgreeWT('${PRCD_ID}','${contract_type}');">设备价格支付协议</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer"  <c:if test="${not empty RECT_ID}">onClick="hideOrShow('buyback${PRCD_ID}');"</c:if>><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="buyback${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${supl.SUPL_TRUE}');">回购合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('applysupperpromise_${PRCD_ID }');">保证合同</c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="applysupperpromise_${PRCD_ID }" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty rentEquipmentList}">onClick="hideOrShow('equipment_${PRCD_ID}');"</c:if> >&nbsp;密码控管表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.passwordControlTablePDF&eqmt_id=${item.EQMT_ID}">密码控管表</a></td>
													<td width="59" align="center"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty paylists}">onClick="hideOrShow('paylists_${PRCD_ID}');"</c:if> >&nbsp;租金支付明细表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="paylists_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${paylists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">租金支付明细表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('beginCust${PRCD_ID}');">&nbsp;租赁案件起租档检核表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="beginCust${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>12</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprovebank${PRCD_ID}');">&nbsp;银行账户信息通知</td>
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
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty windLists}">onClick="hideOrShow('windList_${PRCD_ID}');"</c:if> >&nbsp;风控会议纪要</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="windList_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${windLists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditSee.selectRiskAuditForSee_zulin&credit_id=${PRCD_ID}&prc_id=${item.PRC_ID }'">${item.PRC_HAO}</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>14</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>15</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>16</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0);" onclick="prePassWordNote('${PRCD_ID}');">密码作业通知说明书</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>17</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
								</table></td>
				</tr>
			
			</table>
		</c:if>
		<c:if test="${contract_type eq 1}">
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
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('pucsContract_${PRCD_ID}');" >&nbsp;委托购买合同</td>
									<td width="59" align="center"><!-- <c:choose><c:when test="${pucsContractsFlag gt 0 and rcstatus eq 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.queryEquipment&RECT_ID=${RECT_ID }'" >新建</a></c:when><c:otherwise>新建</c:otherwise></c:choose>--></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<!--<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">委托购买合同(PDF)</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a></td>
												<td width="59" align="center"><img src="${ctx }/images/edt.gif" width="16" height="16" /><c:choose><c:when test="${rcstatus eq 0}"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.initUpdatePucsContract&PUCT_ID=${item.PUCT_ID }'">&nbsp;修改</a></c:when><c:otherwise>修改</c:otherwise></c:choose></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if> -->
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">委托购买合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
											
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer"  <c:if test="${not empty pucsContracts}">onClick="hideOrShow('Confirmation${PRCD_ID}');"</c:if>>确认书(承租人确认所有权归属)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="Confirmation${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="Confirmationpdf('${RECT_ID}','${PRCD_ID}');">导出确认书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>

					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprove${PRCD_ID}');">&nbsp;交货验收证明暨起租通知书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">租赁物验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty pucsContracts}">onClick="hideOrShow('equipmentcostpay${PRCD_ID}');"</c:if> >&nbsp;付款请示书或请款书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书或请款书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
				
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty RECT_ID}">onClick="hideOrShow('confirmletter${PRCD_ID}');"</c:if>>&nbsp;供应商确认函(自备款收款确认)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${RECT_ID}','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${isCONTRACT!=0}">onClick="hideOrShow('expEqmtPriceAgreeWT_${PRCD_ID}');"</c:if>>三方支付协议(出租人/承租人/供应商)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="expEqmtPriceAgreeWT_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="expEqmtPriceAgreeWT('${PRCD_ID}','${contract_type}');">设备价格支付协议</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer"  <c:if test="${not empty RECT_ID}">onClick="hideOrShow('buyback${PRCD_ID}');"</c:if>><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="buyback${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${supl.SUPL_TRUE}');">回购合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('applysupperpromise_${PRCD_ID }');">保证合同</c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="applysupperpromise_${PRCD_ID }" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty rentEquipmentList}">onClick="hideOrShow('equipment_${PRCD_ID}');"</c:if> >&nbsp;密码控管表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.passwordControlTablePDF&eqmt_id=${item.EQMT_ID}">密码控管表</a></td>
													<td width="59" align="center"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty paylists}">onClick="hideOrShow('paylists_${PRCD_ID}');"</c:if> >&nbsp;租金支付明细表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="paylists_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${paylists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">租金支付明细表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('beginCust${PRCD_ID}');">&nbsp;租赁案件起租档检核表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="beginCust${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>12</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprovebank${PRCD_ID}');">&nbsp;银行账户信息通知</td>
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
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty windLists}">onClick="hideOrShow('windList_${PRCD_ID}');"</c:if> >&nbsp;风控会议纪要</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="windList_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${windLists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditSee.selectRiskAuditForSee_zulin&credit_id=${PRCD_ID}&prc_id=${item.PRC_ID }'">${item.PRC_HAO}</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>14</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>15</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>16</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0);" onclick="prePassWordNote('${PRCD_ID}');">密码作业通知说明书</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>17</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
								</tr>
								</table></td>
				</tr>
			
			</table>
		</c:if>
		<c:if test="${contract_type eq 0}">
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
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('pucsContract_${PRCD_ID}');" >&nbsp;买卖合同</td>
									<td width="59" align="center"><!--<c:choose><c:when test="${pucsContractsFlag gt 0 and rcstatus eq 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.queryEquipment&RECT_ID=${RECT_ID }'" >新建</a></c:when><c:otherwise>新建</c:otherwise></c:choose>  -->&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<!--<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">(买卖合同)${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">买卖合同(PDF)</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a></td>
												<td width="59" align="center"><img src="${ctx }/images/edt.gif" width="16" height="16" /><c:choose><c:when test="${rcstatus eq 0}"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.initUpdatePucsContract&PUCT_ID=${item.PUCT_ID }'">&nbsp;修改</a></c:when><c:otherwise>修改</c:otherwise></c:choose></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if>  -->
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">买卖合同</a></td>
												<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
											
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">					
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprove${PRCD_ID}');">&nbsp;交货验收证明暨起租通知书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">导出租赁物验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty pucsContracts}">onClick="hideOrShow('equipmentcostpay${PRCD_ID}');"</c:if> >&nbsp;付款请示书</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty RECT_ID}">onClick="hideOrShow('confirmletter${PRCD_ID}');"</c:if>>&nbsp;供应商确认函(自备款收款确认)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${RECT_ID}','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer"  <c:if test="${isCONTRACT!=0}">onClick="hideOrShow('expEqmtPriceAgreeYB_${PRCD_ID}');"</c:if>>三方支付协议(出租人/承租人/供应商)</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="expEqmtPriceAgreeYB_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="expEqmtPriceAgreeYB('${PRCD_ID}','${contract_type}');">设备价格支付协议</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty RECT_ID}">onClick="hideOrShow('buyback${PRCD_ID}');"</c:if>><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="buyback${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${supl.SUPL_TRUE}');">回购合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('applysupperpromise_${PRCD_ID }');">保证合同</c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="applysupperpromise_${PRCD_ID }" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty rentEquipmentList}">onClick="hideOrShow('equipment_${PRCD_ID}');"</c:if> >&nbsp;密码控管表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.passwordControlTablePDF&eqmt_id=${item.EQMT_ID}">密码控管表</a></td>
													<td width="59" align="center"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty paylists}">onClick="hideOrShow('paylists_${PRCD_ID}');"</c:if> >&nbsp;租金支付明细表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<c:if test="${not empty paylists}">
								<tr id="paylists_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${paylists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">租金支付明细表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('beginCust${PRCD_ID}');">&nbsp;租赁案件起租档检核表</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="beginCust${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdsprovebank${PRCD_ID}');">&nbsp;银行账户信息通知</td>
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
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16">&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>12</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty windLists}">onClick="hideOrShow('windList_${PRCD_ID}');"</c:if> >&nbsp;风控会议纪要</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="windList_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${windLists}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditSee.selectRiskAuditForSee_zulin&credit_id=${PRCD_ID}&prc_id=${item.PRC_ID }'">${item.PRC_HAO}</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>&nbsp;</td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>		
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>14</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>15</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>16</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0);" onclick="prePassWordNote('${PRCD_ID}');">密码作业通知说明书</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>								
			</table>
		</c:if>
		<!--  乘用车合同 -->
<c:if test="${contract_type eq 8}">
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
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('personCreditContract.rptdesign','${PRCD_ID}')">个人委托贷款借款合同</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('getMoneyApply.rptdesign','${PRCD_ID}')">提 款 申 请 书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('cutMoneyApplyrptdesign.rptdesign','${PRCD_ID}')">委托扣款授权书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('creditPurposeStatement.rptdesign')">贷款用途声明书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('guaranteeContract.rptdesign','${PRCD_ID}')">委托贷款保证合同一式</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('carPledgeContract.rptdesign','${PRCD_ID}')">委托贷款設定抵押合同</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('repayment.rptdesign','${PRCD_ID}')">共同还款承诺函</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('entrustBook.rptdesign','${PRCD_ID}')">委托书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('payMoneyBook.rptdesign','${PRCD_ID}')">放款通知书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('repaymentPlan.rptdesign','${PRCD_ID}')">还款计划表</a></td>
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
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('inform.rptdesign','${PRCD_ID}')">核贷建议通知书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>12</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('insurance.rptdesign','${PRCD_ID}')">保险承诺函</a></td>
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
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('financePlanServiceBook.rptdesign','${PRCD_ID}')">财务规划服务协议书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
			</table>
			<script type="text/javascript">
			function exportPDF(pdfName,credit_id){
				window.parent.callBirt("birtReport/car/"+pdfName, "pdf", {"ID" : credit_id});
			}
			</script>
</c:if>
		
		
		<TABLE cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr"><td colspan="2" style="text-align: center;"><strong>备注信息</strong></td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				
					<td  style="width: 100px;text-align: right;"><TEXTAREA NAME="cont${PRCD_ID}" ROWS="4" COLS="110" id="cont${PRCD_ID}"></TEXTAREA>&nbsp;</td>
					<td  style="width: 50px;text-align: left;">&nbsp;<input  type="button" onclick="inserttoremarke('${PRCD_ID}','${RECT_ID}','${contract_type }');"
						  style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(${ctx }/images/save_big_white.gif);
						  BORDER-LEFT: 0px; WIDTH: 55px; BORDER-BOTTOM: 0px; HEIGHT: 55px; cursor: pointer;"
						  value="" onMouseOver="this.style.backgroundImage='url(${ctx }/images/save_big_lan.gif)'" 
								  onMouseOut="this.style.backgroundImage='url(${ctx }/images/save_big_white.gif)'" />
					</td>
				</tr>
		</TABLE>
		<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">						
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="100%" colspan="6">&nbsp;<font color="#3300CC">最新备注:</font>${memoMap.REMARK}</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">   
					<td width="100%" colspan="6">&nbsp;【<font style="font-weight:bolder">备注人:</font> ${memoMap.NAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight:bolder">时间：</font><fmt:formatDate value="${memoMap.CREATE_TIME}" pattern="yyyy-MM-dd"/>】</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="100%" colspan="6">&nbsp;<a href="javascript:void(0);" onclick="ex('pactMore${PRCD_ID}','${PRCD_ID }','${RECT_ID }','manage');">查看更多备注</a></td>
				</tr>	
				<tr>
					<td align="center" colspan="9">
						<div id="pactMore${PRCD_ID}" align="center"
							style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
							<img src="${ctx }/images/loading.gif">
						</div>
					</td>
				</tr>
			</table>		
		</div>
	</div>
</div>

<!-- 

<tr style="background-color: #ffffff;"
	onMouseOver="this.style.backgroundColor='#f6fbff'"
	onMouseOut="this.style.backgroundColor='#ffffff'">
	<td width="70" align="center">
		11
	</td>
	<td height="22" align="left">
		<table width="780" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" class="pa" width="608">
					呈批件
				</td>
				<td width="120" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
				<td width="120" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
				<td width="50" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
 -->
