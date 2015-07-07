<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
<!--
jQuery(function($){

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
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePdfFromCredit&credit_idxx='+credit_idxx;
	}
		  //导出密码作业
	function loadmimapdf(credit_idxx){
	 // 		var credit_idxx=$("#credit_idxx").val();
	 // alert(credit_idxx);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=passwordHomework.prePdf&credit_idxx='+credit_idxx;
	}
	
	function loadbanknoticepdf(credit_idxx){
	 // 		var credit_idxx=$("#credit_idxx").val();
	 // alert(credit_idxx);
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expBankNoticepdf.prePdf&PRCD_ID='+credit_idxx;
	}
	
	// 导出确认函_合同浏览
	function pdfRentConfirmationnew(credit_idxx,rect_id,contract_type){
		//var credit_idxx=$("#credit_idxx").val();
		//var contract_type = $("#contract_type").val();
		//alert(contract_type);
		if(contract_type==0){ 				// 一般租赁确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.includeLeasesPrjt&PRCD_ID="+credit_idxx+"&RECT_ID="+rect_id;
		}else if(contract_type==1||contract_type==5){//加入新品回租合同			// 委托购买确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.consignmentFinancialLeasingPrjt&PRCD_ID="+credit_idxx+"&RECT_ID="+rect_id;
		}

	}
		//设备价款支付协议（委托）
	function expEqmtPriceAgreeWT(credit_idxx,type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.prePdf&PRCD_ID='+credit_idxx+'&CONTRACT_TYPE='+type;
	}

	 //设备价款支付协议（一般）
	function expEqmtPriceAgreeYB(credit_idxx,type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeYBpdf.prePdf&PRCD_ID='+credit_idxx+'&CONTRACT_TYPE='+type;
	} 
	//导出密码通知书
	function prePassWordNote(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePassWordNote&credit_idxx='+credit_idxx;
	}

	//导出回购合同
	function buybackpdf(rect_id,prcd_id,supl){
		if(supl==2){//含灭失
			window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expPdf2prjt&RECT_ID="+rect_id+"&PRCD_ID="+prcd_id;
		}else{//不含灭失
			window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expPdfprjt&RECT_ID="+rect_id+"&PRCD_ID="+prcd_id;
		}
	}
		//导出确认书_合同浏览
	function Confirmationpdf(rect_id,prcd_id){
		window.location.href="../servlet/defaultDispatcher?__action=expBuyBackPdf.expConfirmprjt&RECT_ID="+rect_id+"&PRCD_ID="+prcd_id;;
	}
		
	//导出委托购买合同
	function outputPdf(prcd_id){
		$.post('${ctx }/servlet/defaultDispatcher',
				{__action : 'customer.checkDefaultLinkMan',
				prcd_id : prcd_id},
				function (data){
					if(data.defaultLinkMan > 1){
						alert("请维护客户联系人资料。\n（主要联系人只能有一个）");
					} else if(data.defaultLinkMan < 1){
						alert("请维护客户联系人资料。\n（至少需要一个主要联系人）");
					} else {
						location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=' + prcd_id;
					}
				},'json');
		//alert(PRCD_ID);
		//location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=' + PRCD_ID;
	}
	
	function pdf(param) {
		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayMoneyPdf.exportPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	
	}

	//Add by Michael 2012-3-23 导出重车委托购买合同
	function outputCarPdf(prcd_id){
		$.post('${ctx }/servlet/defaultDispatcher',
				{__action : 'customer.checkDefaultLinkMan',
				prcd_id : prcd_id},
				function (data){
					if(data.defaultLinkMan > 1){
						alert("请维护客户联系人资料。\n（主要联系人只能有一个）");
					} else if(data.defaultLinkMan < 1){
						alert("请维护客户联系人资料。\n（至少需要一个主要联系人）");
					} else {
						location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expCarContractCredit&rect_id=' + prcd_id;
					}
				},'json');
	}

	//导出重车确认书_合同浏览
	function ConfirmationCarpdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarPdfFromCredit&credit_idxx='+credit_idxx;
	}

	//导出重车抵押合同_合同浏览
	function CarMortgageRent(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarMortgageRent&credit_idxx='+credit_idxx;
	}	
	
	//导出重车承诺书_合同浏览
	function PromiseGrant(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarPromiseGrant&credit_idxx='+credit_idxx;
	}	

	//导出重车确认函_合同浏览
	function ConfirmationLetter(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarConfirmationLetter&credit_idxx='+credit_idxx;
	}	
	
	//导出重车起租通知书_合同浏览
	function CarRentNotice(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarRentNotice&credit_idxx='+credit_idxx;
	}
	
	//导出重车车辆挂靠协议_合同浏览
	function preCarManageAgreementPdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.preCarManageAgreementPdf&credit_idxx='+credit_idxx;
	}	
	RentEntrustManageAgreement	
	//导出重车租赁物委托管理协议_合同浏览
	function RentEntrustManageAgreement(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preRentEntrustManageAgreement&credit_idxx='+credit_idxx;
	}
	
	//导出重车挂靠授权书_合同浏览
	function RelyGrantBook(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preRelyGrantBook&credit_idxx='+credit_idxx;
	}
	
	//导出重车抵押过户授权书_合同浏览
	function CarMortgageSetupGrant(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.preCarMortgageSetupGrant&credit_idxx='+credit_idxx;
	}
	
	//导出重车起租检核表_合同浏览
	function creditCarpdf(credit_idxx,contract_type){
	  	//var credit_idxx=$("#credit_idxx").val();
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportCreditPdfs.preBeginCustPdfs&credit_idxx='+credit_idxx+'&contract_type='+contract_type;
	}
	//导出重车付款指示书_合同浏览
	function carPdf(param) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayMoneyPdf.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	
	}
	
	//导出重车价款支付协议
	function expCarPriceAgreeWT(credit_idxx,type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.preCarPdf&PRCD_ID='+credit_idxx+'&CONTRACT_TYPE='+type;
	}
	
	//导出回租买卖合同
	function preLeaseBackContractPdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackContractPdf&credit_idxx='+credit_idxx;
	}
	
	//导出回租股东会决议
	function preLeaseBackMettingResolution(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackMettingResolution&credit_idxx='+credit_idxx;
	}
	
	//导出回租承诺书
	function LeaseBackPromiseBook(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackPromiseBook&credit_idxx='+credit_idxx;
	}
	
	//导出回租付款指示书_合同浏览
	function leaseBackPdf(param) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	}
	//导出回租付款指示书_合同浏览(售后回租)
	function leaseBackPdf2(param) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.exportPayMoneyNotice&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	}
	//导出回租起租通知书
	function leaseBackHoldPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackLeaseHoldPdf&credit_idxx='+credit_idxx;
	}	

	//导出回租起租检核表_合同浏览

	function creditLeaseBackBeginpdf(credit_idxx,contract_type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preBeginCustPdfs&credit_idxx='+credit_idxx+'&contract_type='+contract_type;
	}
	
	//导出重车扣款授权书
	function exportMotorPdf(param) {
		window.parent.callBirt("birtReport/exportMotorPdf/motorAuthorizationPdf.rptdesign","pdf",{"credit_id":param});
	}
	
	//导出导航系统设置承诺书
	function exportNavigationPdf(param) {
		window.parent.callBirt("birtReport/exportMotorPdf/navigationPdf.rptdesign","pdf",{"credit_id":param});
	}
	
	//导出重车回租股东会决议
	function preCarLeaseBackMettingResolution(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preLeaseBackMettingResolution&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租买卖合同
	function preCarLeaseBackContractPdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preLeaseBackContractPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租付款指示书_合同浏览
	function exportCarLeaseBackPdf(param) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	
	}
	
	//导出重车回租起租通知书
	function exportCarLeaseBackHoldPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preLeaseBackLeaseHoldPdf&credit_idxx='+credit_idxx;
	}
	//导出重车回租承诺书
	function exportCarLeaseBackPromiseBook(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preLeaseBackPromiseBook&credit_idxx='+credit_idxx;
	}
	//导出重车回租抵押合同
	function exportCarMortgageContractPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preMortgageContractPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租车辆处分授权委托书
	function exportCarLeaseBackRelyGrantBookPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preRelyGrantBookPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租租赁物委托管理三方协议
	function exportCarLeaseBackThreeProtocolPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preThreeProtocolPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租挂靠行授权书
	function exportCarLeaseBackCallLineGrantBookPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preCallLineGrantBookPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租声明书
	function exportCarLeaseBackStatementPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preCarLeaseBackStatementPdf&credit_idxx='+credit_idxx;
	}
	
	//导出重车回租付款指示书_合同浏览
	function carLeaseBackPdfPayMoney(param) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	}
	
	function carLeaseBackManageAgrement(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.preCarManageAgrementPdf&credit_idxx='+credit_idxx;
	}
	
	//导出新品回租买卖合同
	function preNewLeaseBackContractPdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preNewLeaseBackContractPdf&credit_idxx='+credit_idxx;
	}
	
	function newLeaseholdpdfnew(credit_idxx){
  		window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePdfFromNewCredit&credit_idxx='+credit_idxx;
	}
	
	//增加开票资料确认书
	function exportValueAddTaxOpenInvoice(credit_idxx){
  		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.preValueAddTaxOpenInvoice&credit_idxx='+credit_idxx;
	}
	
	//导出咨询服务协议书
 	function exptConsultationAgree(credit_idxx,contract_type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.exptConsultationAgree&CONTRACT_TYPE='+contract_type+'&PRCD_ID='+credit_idxx;
	} 

	//导出重车咨询服务协议书
 	function exptCarConsultationAgree(credit_idxx,contract_type){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=expEqmtPriceAgreeWTpdf.exptCarConsultationAgree&CONTRACT_TYPE='+contract_type+'&PRCD_ID='+credit_idxx;
	} 
	
 	//导出连保公司股东会决议
 	function exptVouchCorpMeeting(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expVouchCorpMettingResolutionPdfs&credit_id='+credit_idxx;
	} 
 	//导出交机承诺书
 	function exptMarkMachineCommitLetter(credit_idxx){
	  	window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expMarkMachineCommitLetter&credit_id='+credit_idxx;
	} 	

	//导出乘用车回租买卖合同
	function prePassengerCarContractPdf(credit_idxx){
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.preLeaseBackContractPdf&credit_idxx='+credit_idxx;
	}
	//导出乘用车回租付款指示书_合同浏览
	function exportPassengerCarPdf(param) {		
		//共用0504付款指示书
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expCarLeaseBackPDF.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
		//window.location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.exportCarPayMoneyNOT&PRCD_ID='+param+'&bankAccount'+param+'='+$("#bankAccount"+param).val();
	}
	//导出乘用车回租起租通知书
	function exportPassengerCarHoldPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.preLeaseBackLeaseHoldPdf&credit_idxx='+credit_idxx;
	}
	//导出乘用车回租承诺书
	function exportPassengerCarPromiseBook(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.preLeaseBackPromiseBook&credit_idxx='+credit_idxx;
	}
	//导出乘用车回租抵押合同
	function exportPassengerCarMortgagePdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.preMortgageContractPdf&credit_idxx='+credit_idxx;
	}
	
	//导出乘用车回租车辆处分授权委托书
	function exportPassengerCarRelyGrantBookPdf(credit_idxx) {		
		window.location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.preRelyGrantBookPdf&credit_idxx='+credit_idxx;
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
	//租赁物情况表
	function outputItemSituationForDirect(creditId){
		window.parent.callBirt("birtReport/contract/direct/itemSituation.rptdesign","pdf",{"creditId":creditId});
	}

//-->

	//通知暨回执函
	function receiptPDF(creditId){
		window.parent.callBirt("birtReport/contract/direct/receipt.rptdesign","pdf",{"creditId":creditId});
	}
	
	//核准函
	function outputApprovalLetter(creditId){
		window.location.href="../servlet/defaultDispatcher?__action=exportApporvalletters.exportForOne&credit_id=" + creditId;;
	}
</script>

<div>
	<input type="hidden" name="PRCD_ID" id="PRCD_ID" value="${PRCD_ID}" />
	<input type="hidden" name="RECT_ID" id="RECT_ID" value="${RECT_ID}" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
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
								<c:if test="${empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<%-- <td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">委托购买合同</a></td> --%>
									<td width="550"><a href="javascript:void(0);" onclick="outputPdf('${PRCD_ID }');">委托购买合同</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">委托购买合同(PDF)</a><!--&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a>  --></td>
												<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--  <fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="Confirmationpdf('${RECT_ID}','${PRCD_ID}');">确认书(承租人确认所有权归属)</a></td>
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
									<td width="550"><a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">租赁物验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${ empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="222"><a href="javascript:void(0);" onclick="pdf('${PRCD_ID }')">付款请示书或请款书</a></td>
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
								<c:if test="${not empty pucsContracts}">
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书或请款书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
				
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${RECT_ID }','${contract_type}');">供应商确认函(自备款收款确认)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${RECT_ID }','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!--  <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="expEqmtPriceAgreeWT('${PRCD_ID}','${contract_type}');">三方支付协议(出租人/承租人/供应商)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<%--<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="alert('暂未开放')">供应商回购合同/回购(含减失)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</table></td>
					--%>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${PRCD_ID }','${supl.SUPL_TRUE}');"><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></a></c:if></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty rentEquipmentList}">
								<tr  class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${creditEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.expPasswordPDF&eqmt_id=${item.EQMT_ID}&PRCD_ID=${PRCD_ID }">密码控管表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
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
													<td width="121" align="center"><!-- <fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
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
													<!-- <td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a></td> -->
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.expPayToPdf&ids=${item.RECP_ID }'">租金支付明细表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr>
								</c:if>
								</table></td>
					</tr>
					<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
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
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr> --%>
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
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }&contractType=1'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>14</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty paylists}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expZulwToPdf_new&credit_id=${PRCD_ID }'">租赁物情况表</a></td>
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
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expCollectionZulwToPdf&ids=${item.RECP_ID }'">租赁物情况表(${item.RECP_CODE})</a></td>
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
									<td style="width: 50px;"><strong>15</strong></td>
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
		
		<!-- 新品回租合同 -->
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
								<c:if test="${empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<%-- <td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">委托购买合同</a></td> --%>
									<td width="550"><a href="javascript:void(0);" onclick="outputPdf('${PRCD_ID }');">委托购买合同</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">委托购买合同(PDF)</a><!--&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a>  --></td>
												<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--  <fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="preNewLeaseBackContractPdf('${PRCD_ID }');">新品租回买卖合同</a></td>
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
									<td width="550"><a href="javascript:void(0);" onclick="Confirmationpdf('${RECT_ID}','${PRCD_ID}');">确认书(承租人确认所有权归属)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="newLeaseholdpdfnew('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="leaseholdsprove${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display:none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">租赁物验收证明暨起租通知书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${ empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="222"><a href="javascript:void(0);" onclick="pdf('${PRCD_ID }')">付款请示书或请款书</a></td>
									<td width="398" align="left">开户帐号:<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
									<c:forEach items="${allBankAccount }" var="item" >
						          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}">${item.OPEN_ACCOUNT_BANK }</option>
						            </c:forEach>
									</select></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书或请款书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
				
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>06</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${RECT_ID }','${contract_type}');">供应商确认函(自备款收款确认)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${RECT_ID }','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!--  <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="expEqmtPriceAgreeWT('${PRCD_ID}','${contract_type}');">三方支付协议(出租人/承租人/供应商)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>08</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<c:if test="${supl.SUPL_TRUE != 2 && supl.SUPL_TRUE != 3}">供应商回购合同/回购</c:if><c:if test="${supl.SUPL_TRUE == 2 || supl.SUPL_TRUE == 3}"><a href="javascript:void(0);" onclick="buybackpdf('${RECT_ID}','${PRCD_ID }','${supl.SUPL_TRUE}');"><c:choose><c:when test="${supl.SUPL_TRUE eq 2}">供应商回购合同/回购(含灭失)</c:when><c:otherwise>供应商回购合同/回购</c:otherwise></c:choose></a></c:if></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" >&nbsp;</td>
												</tr>
											
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>09</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><c:if test="${supl.SUPL_TRUE != 1 }">保证合同</c:if><c:if test="${supl.SUPL_TRUE == 1}"><a href="${ctx}/servlet/defaultDispatcher?__action=exportApplySupperPromise.expPromiseContract&rect_id=${PRCD_ID }">保证合同</a></c:if></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty rentEquipmentList}">
								<tr  class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${creditEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}       <a href="${ctx}/servlet/defaultDispatcher?__action=rentContract.expPasswordPDF&eqmt_id=${item.EQMT_ID}&PRCD_ID=${PRCD_ID }">密码控管表</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
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
													<td width="121" align="center"><!-- <fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>-->&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>11</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByValueAdded&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</table></td>
					</tr>
					<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>12</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
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
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr> --%>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
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
									<td style="width: 50px;"><strong>14</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<%-- <td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }&contractType=5'" >融资租赁合同</a></td> --%>
										<td width="550"><a onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.preLeaseBackPdf&credit_idxx=${PRCD_ID }'" href="javascript:void(0)">融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>15</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expZulwToPdfByValueAdded&credit_id=${PRCD_ID }'">租赁物情况表</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="width: 50px;"><strong>16</strong></td>
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
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
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>18</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0)"  onclick="exportValueAddTaxOpenInvoice('${PRCD_ID}');" >增值税开票资料确认书</a></td>
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
						<td style="width: 50px;"><strong>21</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><c:choose><c:when test="${isMarkMachine ne 0 }"><a href="javascript:void(0)"  onclick="exptMarkMachineCommitLetter('${PRCD_ID}');" >交机承诺书</a></c:when> <c:otherwise>交机承诺书</c:otherwise></c:choose></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
				</tr>		
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>22</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0)"  onclick="exportCheckNotice('${PRCD_ID}');" >发票告知函</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
				</tr>	
				<script>
					function exportCheckNotice(credit_id){
						window.parent.callBirt("birtReport/contract/back/CheckNotice.rptdesign", "pdf", {"ID" : credit_id});			
					}
				</script>			
					</table></td>
				</tr>
			</table>
		</c:if>

		<!-- 乘用车回租合同 -->
		<c:if test="${contract_type eq 6}">
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
							<td width="550"><a href="javascript:void(0);" onclick="prePassengerCarContractPdf('${PRCD_ID }');">买卖合同</a></td>
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
					<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expPassengerCarPDF.expCarLeaseBackContractPdf&credtdxx=${PRCD_ID }'" >融资租赁合同</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
			</tr>	
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>03</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportPassengerCarPromiseBook('${PRCD_ID}');">承诺授权书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>04</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="222"><a href="javascript:void(0);" onclick="exportPassengerCarPdf('${PRCD_ID }')">付款请示书或请款书</a></td>
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
				<td style="width: 50px;"><strong>05</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportPassengerCarHoldPdf('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>06</strong></td>
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
				<td style="width: 50px;"><strong>07</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportPassengerCarMortgagePdf('${PRCD_ID}');">机动车辆抵押合同</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>08</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="exportPassengerCarRelyGrantBookPdf('${PRCD_ID}');">车辆处分授权委托书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>09</strong></td>
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
						<td width="550"><a href="javascript:void(0)"  onclick="exptCarConsultationAgree('${PRCD_ID}','${contract_type}');" >咨询服务协议书</a></td>
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
		</table>
			</td>
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
								<c:if test="${empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContractCredit&rect_id=${PRCD_ID }'">买卖合同</a></td>
									<td width="59" align="center"></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">买卖合同(PDF)</a><!--&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a>  --></td>
												<td width="59" align="center"><!--<img src="${ctx }/images/edt.gif" width="16" height="16" /><c:choose><c:when test="${rcstatus eq 0}"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.initUpdatePucsContract&PUCT_ID=${item.PUCT_ID }'">&nbsp;修改</a></c:when><c:otherwise>修改</c:otherwise></c:choose>  -->&nbsp;</td>
													<td width="121" align="center"><!--<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>--></td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">					
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="leaseholdpdfnew('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
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
													<td width="50" align="center" ><!--  <img src="${ctx }/images/ytq.gif" width="16" height="16">-->&nbsp;</td>
												</tr>
										</table></td>
								</tr>
								</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayMoneyPdf.exportPayMoneyNOT&PRCD_ID=${PRCD_ID }'">付款请示书</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${RECT_ID }','${contract_type}');">供应商确认函(自备款收款确认)</a></td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								<tr id="confirmletter${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="pdfRentConfirmationnew('${PRCD_ID}','${contract_type}');">导出确认函</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>05</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="expEqmtPriceAgreeYB('${PRCD_ID}','${contract_type}');">三方支付协议(出租人/承租人/供应商)</a></td>
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
					<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
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
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr> --%>
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
										<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.prePdf&credit_idxx=${PRCD_ID }&contractType=0'" >融资租赁合同</a></td>
										<td width="59" align="center">&nbsp;</td>
										<td width="121" align="center">&nbsp;</td>
										<td width="50" align="center">&nbsp;</td>
									</tr></table></td>
					</tr>	
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>13</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${empty paylists}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expZulwToPdf_new&credit_id=${PRCD_ID }'">租赁物情况表</a></td>
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
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expCollectionZulwToPdf&ids=${item.RECP_ID }'">租赁物情况表(${item.RECP_CODE})</a></td>
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
					
			</table>
		</c:if>
		
		
<!-- Add by Michael 2012-3-23 增加重车导出合同 -->				
	<c:if test="${contract_type eq 3}">
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
						<c:if test="${empty pucsContracts}">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="outputCarPdf('${PRCD_ID }');">委托购买合同</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</c:if>
						<c:if test="${not empty pucsContracts}">
						<tr id="pucsContract_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
							<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
									<c:forEach items="${pucsContracts}" var="item" varStatus="status">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pucsContract.showPucsContract&FLAG=1&PUCT_ID=${item.PUCT_ID }'">${item.PUCT_CODE}</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportContractPdf.expContract&rect_id=${item.PUCT_ID }'">委托购买合同(PDF)</a><!--&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">设备价款支付指示(PDF)</a>  --></td>
										<td width="59" align="center">&nbsp;</td>
											<td width="121" align="center">&nbsp;</td>
											<td width="50" align="center" >&nbsp;</td>
										</tr>
									</c:forEach>
								</table></td>
						</tr></c:if></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>02</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="ConfirmationCarpdf('${PRCD_ID}');">确认书</a></td>
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
							<td width="550"><a href="javascript:void(0);" onclick="CarMortgageRent('${PRCD_ID}');">抵押合同</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>04</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="PromiseGrant('${PRCD_ID}');">承诺授权书</a></td>
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
							<td width="550"><a href="javascript:void(0);" onclick="ConfirmationLetter('${PRCD_ID}');">重车确认函</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						
						</table></td>
			</tr>										
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>06</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="CarRentNotice('${PRCD_ID}');">交货验收证明暨起租通知书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>07</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<c:if test="${ empty pucsContracts}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="222"><a href="javascript:void(0);" onclick="carPdf('${PRCD_ID }')">付款请示书或请款书</a></td>
									<td width="398" align="center">开户帐号:<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
									<c:forEach items="${allBankAccount }" var="item" >
						          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}">${item.OPEN_ACCOUNT_BANK }</option>
						            </c:forEach>
									</select></td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr>
								</c:if>
								<c:if test="${not empty pucsContracts}">
								<tr id="equipmentcostpay${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr" >
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${pucsContracts}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;<a href="javascript:void(0);" onclick="leaseholdpdf(${item.PUCT_ID })">付款请示书或请款书</a></td>
													<td width="59" align="center">&nbsp;</td>
													<td width="121" align="center">&nbsp;</td>
													<td width="50" align="center" ><!-- <img src="${ctx }/images/ytq.gif" width="16" height="16"> -->&nbsp;</td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></c:if></table></td>
					</tr>
		
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>08</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="preCarManageAgreementPdf('${PRCD_ID}');">车辆挂靠管理协议</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>09</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="RentEntrustManageAgreement('${PRCD_ID}');">租赁物委托管理协议</a></td>
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
							<td width="550"><a href="javascript:void(0);" onclick="expCarPriceAgreeWT('${PRCD_ID}','${contract_type}');">三方支付协议(出租人/承租人/供应商)</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>11</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="RelyGrantBook('${PRCD_ID}');">挂靠行授权书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center" >&nbsp;</td>
						</tr>		
						</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>12</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="CarMortgageSetupGrant('${PRCD_ID}');">车辆处分授权委托书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>14</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByValueAdded&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
						</table></td>
			</tr>
			<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>15</strong></td>
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
				<td style="width: 50px;"><strong>17</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expContract.preCarPdf&credit_idxx=${PRCD_ID }'" >融资租赁合同</a></td>
					<td width="59" align="center">&nbsp;</td>
					<td width="121" align="center">&nbsp;</td>
					<td width="50" align="center">&nbsp;</td>
				</tr></table></td>
			</tr>			
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>18</strong></td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1"><tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0);"onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=expQuoToPdf.expCarZulwToPdfByValueAdded&credit_id=${PRCD_ID }'">租赁物情况表</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr>
				</table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>19</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${PRCD_ID}'" >现场调查报告</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>	
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>20</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><c:if test="${not empty RECT_ID }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${RECT_ID }'" >租赁方案</a></c:if><c:if test="${empty RECT_ID }">租赁方案</c:if></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>21</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="exportMotorPdf(${PRCD_ID})" >扣款授权书</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td style="width: 50px;"><strong>22</strong></td>
			<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="550"><a href="javascript:void(0)" onclick="exportNavigationPdf(${PRCD_ID})" >导航系统承诺书</a></td>
				<td width="59" align="center">&nbsp;</td>
				<td width="121" align="center">&nbsp;</td>
				<td width="50" align="center">&nbsp;</td>
			</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="width: 50px;"><strong>23</strong></td>
							<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="550"><a href="javascript:void(0)"  onclick="exportValueAddTaxOpenInvoice('${PRCD_ID}');" >增值税开票资料确认书</a></td>
								<td width="59" align="center">&nbsp;</td>
								<td width="121" align="center">&nbsp;</td>
								<td width="50" align="center">&nbsp;</td>
							</tr></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>24</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td width="550"><a href="javascript:void(0)"  onclick="exptConsultationAgree('${PRCD_ID}','${contract_type}');" >咨询服务协议书</a></td>
							<td width="59" align="center">&nbsp;</td>
							<td width="121" align="center">&nbsp;</td>
							<td width="50" align="center">&nbsp;</td>
						</tr></table></td>
				</tr>	
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>24</strong></td>
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
</c:if>		
<!-- Add by Michael 导出重车合同 -->		
		


<!-- Add by Michael 2012-4-9 导出回租合同 -->				
	<c:if test="${contract_type eq 2}">
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
							<td width="222"><a href="javascript:void(0);" onclick="leaseBackPdf('${PRCD_ID }')">付款请示书或请款书</a></td>
								<td width="398" align="left">开户帐号:<select id="bankAccount${PRCD_ID }" name="bankAccount${PRCD_ID }">
									<c:forEach items="${allBankAccount }" var="item" >
						          	  <option value="${item.NAME}=${item.BANK_ACCOUNT}=${item.OPEN_ACCOUNT_BANK}=${item.MONEY}">${item.OPEN_ACCOUNT_BANK }</option>
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
							<td width="550"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.exportPaylistBeforeByValueAdded&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
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
											onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=leaseBackContractPDF.expLeaseBackZulwToPdfByValueAdded&credit_id=${PRCD_ID }'">租赁物情况表</a>
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
				<script>
					function exportCheckNotice(credit_id){
						window.parent.callBirt("birtReport/contract/back/CheckNotice.rptdesign", "pdf", {"ID" : credit_id});			
					}
				</script>			
		</table>
			</td>
		</tr>
	</table>
</c:if>		
<!-- Add by Michael 导出回租合同 -->	
		</div>
	</div>
</div>



<!-- Add by Michael 2012-7-12 导出重车回租合同 -->				
	<c:if test="${contract_type eq 4}">
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
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 50px;"><strong>24</strong></td>
				<td style="width: 50px;text-align: center;"  >3</td>
				<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="550"><a href="javascript:void(0);" onclick="exportPDF('autoCutMoneyBook.rptdesign','${PRCD_ID}')">银行自动转账授权书</a></td>
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
<!-- Add by Michael 导出重车回租合同 -->	

<!-- 直接租赁合同 -->
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
													<td width="550">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=exportPayToPdf.expPayToPdf&ids=${item.RECP_ID }&credit_id=${PRCD_ID }'">租金支付明细表</a></td>
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
					<%-- Marked by Michael 2012 12-19 取消导出检核表  --%>
<%-- 					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>10</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="creditpdf('${PRCD_ID}','${contract_type}');">租赁案件起租档检核表</a></td>
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
													<td width="50" align="center" ><!--<img src="${ctx }/images/ytq.gif" width="16" height="16">  -->&nbsp;</td>
												</tr>
											
										</table></td>
								</tr>
								</table></td>
					</tr> --%>
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
<!--  乘用车合同 -->
<c:if test="${contract_type eq 8 or contract_type eq 14}">
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
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>14</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><a href="javascript:void(0);" onclick="exportPDF('autoCutMoneyBook.rptdesign','${PRCD_ID}')">银行自动转账授权书</a></td>
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
<!-- 设备售后回租 -->
<c:if test="${contract_type eq 9}">
	<jsp:include page="equipmentBackLease/leaseContract.jsp"></jsp:include>
</c:if>
<!-- 商用车售后回租 -->
<c:if test="${contract_type eq 11}">
	<jsp:include page="busCarBackLease/leaseContract.jsp"></jsp:include>
</c:if>

<!-- 乘用车售后回租 -->
<c:if test="${contract_type eq 10 or contract_type eq 12 or contract_type eq 13}">
	<jsp:include page="carBackLease/leaseContract.jsp"></jsp:include>
</c:if>