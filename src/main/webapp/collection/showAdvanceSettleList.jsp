<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>客户结清数据明细表</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		function notPositiveSettle(field, name) {
		 	
		    var value = $.trim(field.value);
		    
		    if(value == ""){
		    	value="0";
		    	field.value = value
		    	return false ;
		    }
		    value = value.replace(/[￥,]/g, '');
		    if (!/^[\+\-]?\d+(\.\d+)?$/.test(value)) {
		        alert(name + '只能输入数字！');
		        field.focus();
		        return true;
		    } else {
		        value = '' + parseFloat(value);
		        field.value = value
		        return false;
		    }
		}
		function changeRealTotal(){
			var REAL_SUM_VALUE_ADDED_TAX = checkNumber($("#REAL_SUM_VALUE_ADDED_TAX").val()) ;
			var REAL_OWN_PRICE = checkNumber($("#REAL_OWN_PRICE").val()) ;
			var REAL_REN_PRICE = checkNumber($("#REAL_REN_PRICE").val()) ;
			var REAL_BREACH_PRICE = checkNumber($("#REAL_BREACH_PRICE").val()) ;
			var REAL_DAMAGE_PRICE = checkNumber($("#REAL_DAMAGE_PRICE").val()) ;
			var REAL_STAYBUY_PRICE = checkNumber($("#REAL_STAYBUY_PRICE").val()) ;
			var REAL_OTHER_PRICE = checkNumber($("#REAL_OTHER_PRICE").val()) ;			
			//Add By Michael 2011 12/30 增加罚息
			var REAL_DUN_PRICE=checkNumber($("#REAL_DUN_PRICE").val()) ;
			//Add by Michael 2012 09-17 增加法务总费用
			var REAL_TOTAL_LAWYFEE=checkNumber($("#REAL_TOTAL_LAWYFEE").val()) ;
			
			var REAL_TOTAL =REAL_SUM_VALUE_ADDED_TAX+ REAL_OWN_PRICE + REAL_REN_PRICE + REAL_BREACH_PRICE + REAL_DAMAGE_PRICE + REAL_STAYBUY_PRICE + REAL_OTHER_PRICE+REAL_DUN_PRICE+REAL_TOTAL_LAWYFEE ;
			$("#REAL_TOTAL").val(Math.round(REAL_TOTAL * 100)/100) ;
			
			//Add By Michael 2011 12/30 增加试算金额-实际金额带出差额
			var SUM_VALUE_ADDED_TAX = checkNumber($("#SUM_VALUE_ADDED_TAX").val()) ;
			var OWN_PRICE = checkNumber($("#OWN_PRICE").val()) ;
			var REN_PRICE = checkNumber($("#REN_PRICE").val()) ;
			var BREACH_PRICE = checkNumber($("#BREACH_PRICE").val()) ;
			var DAMAGE_PRICE = checkNumber($("#DAMAGE_PRICE").val()) ;
			var STAYBUY_PRICE = checkNumber($("#STAYBUY_PRICE").val()) ;
			var OTHER_PRICE = checkNumber($("#OTHER_PRICE").val()) ;			
			var DUN_PRICE=checkNumber($("#DUN_PRICE").val()) ;
			//Add by Michael 2012 09-17 增加法务总费用
			var TOTAL_LAWYFEE=checkNumber($("#TOTAL_LAWYFEE").val()) ;
			
			var DIFF_SUM_VALUE_ADDED_TAX=SUM_VALUE_ADDED_TAX-REAL_SUM_VALUE_ADDED_TAX;
			var DIFF_OWN_PRICE=OWN_PRICE-REAL_OWN_PRICE;
			var DIFF_REN_PRICE=REN_PRICE-REAL_REN_PRICE;
			var DIFF_BREACH_PRICE=BREACH_PRICE-REAL_BREACH_PRICE;
			var DIFF_DAMAGE_PRICE=DAMAGE_PRICE-REAL_DAMAGE_PRICE;
			var DIFF_STAYBUY_PRICE=STAYBUY_PRICE-REAL_STAYBUY_PRICE;
			var DIFF_OTHER_PRICE=OTHER_PRICE-REAL_OTHER_PRICE;
			var DIFF_DUN_PRICE=DUN_PRICE-REAL_DUN_PRICE;
			//Add by Michael 2012 09-17 增加法务总费用
			var DIFF_TOTAL_LAWYFEE=TOTAL_LAWYFEE-REAL_TOTAL_LAWYFEE;
			
			var DIFF_TOTAL =DIFF_SUM_VALUE_ADDED_TAX+ DIFF_OWN_PRICE + DIFF_REN_PRICE + DIFF_BREACH_PRICE + DIFF_DAMAGE_PRICE + DIFF_STAYBUY_PRICE + DIFF_OTHER_PRICE+DIFF_DUN_PRICE+DIFF_TOTAL_LAWYFEE ;
			$("#DIFF_SUM_VALUE_ADDED_TAX").val(Math.round(DIFF_SUM_VALUE_ADDED_TAX * 100)/100) ;
			$("#DIFF_OWN_PRICE").val(Math.round(DIFF_OWN_PRICE * 100)/100) ;
			$("#DIFF_REN_PRICE").val(Math.round(DIFF_REN_PRICE * 100)/100) ;
			$("#DIFF_BREACH_PRICE").val(Math.round(DIFF_BREACH_PRICE * 100)/100) ;
			$("#DIFF_DAMAGE_PRICE").val(Math.round(DIFF_DAMAGE_PRICE * 100)/100) ;
			$("#DIFF_STAYBUY_PRICE").val(Math.round(DIFF_STAYBUY_PRICE * 100)/100) ;
			$("#DIFF_OTHER_PRICE").val(Math.round(DIFF_OTHER_PRICE * 100)/100) ;
			$("#DIFF_DUN_PRICE").val(Math.round(DIFF_DUN_PRICE * 100)/100) ;
			$("#DIFF_TOTAL_LAWYFEE").val(Math.round(DIFF_TOTAL_LAWYFEE * 100)/100) ;
			
			$("#DIFF_TOTAL").val(Math.round(DIFF_TOTAL * 100)/100) ;
		}
		function checkNumber(num){
			var value = $.trim(num);
		    if(value == ""){
		    	return 0 ;
		    }
		    value = parseFloat(value.replace(/[￥,]/g, ''));
		    return value ;
		}
		function expPayToPdf(id) {
					location.href='../servlet/defaultDispatcher?__action=exportPayToPdf.expPayToPdf&ids='+id;
		}	
		
		
		function paylineDetail(id){
			location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylineDetail&RECP_ID='+id;
		}	
		$(function (){
			$("#startDate").datepicker($.datepicker.regional['zh-CN']);
			$("#endDate").datepicker($.datepicker.regional['zh-CN']);
		});
		function insertSettle() {
			$("#form1").submit() ;
		}
		</script>
	</head>
	<body>
			<form action="${ctx }/servlet/defaultDispatcher" method="post" id="form1" name="form1">
			<input type="hidden" name="__action" value="rentFinanceCommand.expAdvanceSettlePDF"> 
			<!-- Marked by michael 2011 12/13 修正已缴期数数据带错Bug -->
			<!-- <input type="hidden" value="${realPeriod}" name="HAS_PERIOD_NUM" id="HAS_PERIOD_NUM"/>-->
			<input type="hidden" value="${settlementPrice.REAL_PERIOD}" name="HAS_PERIOD_NUM" id="HAS_PERIOD_NUM"/>
			<input type="hidden" value="${RECP_ID}" name="RECP_ID" id="RECP_ID"/>
			<input type="hidden" value="${FUND_TYPE}" name="fund_type" id="funcd_type"/>
			<input type="hidden" value="${QUERY_DATE}" name="QUERY_DATE" id="QUERY_DATE"/>
			<br>
				<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
					<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户结清数据明细表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预估结清日期：${QUERY_DATE}</span>
				   	</div>
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          			<div class="zc_grid_body jqgrowleft">
           				
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同编号：
													</td>
													<td width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														客户名称：
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														组织机构证：
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														租赁期数
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														已缴期数
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														已缴金额
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${custInfo.LEASE_CODE }&nbsp;
													</td>
													<td width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${custInfo.CUST_NAME }&nbsp;
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${custInfo.CORP_ORAGNIZATION_CODE}&nbsp;
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														 ${custInfo.PERIOD_NUM }&nbsp;
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${custInfo.PAY_PERIOD}&nbsp;
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">${custInfo.PAY_PRICE}&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="11" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>结清明细</b>
													</td>
												</tr>
												<tr >
													<td align="center" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														明细
													</td>
													<td align="center" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														试算金额
													</td>
													<td  align="center" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														实际金额
													</td>
													<td  align="center" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														差额
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														增值税&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.VALUE_ADDED_TAX }&nbsp;
															<input type="hidden" id="SUM_VALUE_ADDED_TAX" name="SUM_VALUE_ADDED_TAX" value="${settlementPrice.VALUE_ADDED_TAX}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.VALUE_ADDED_TAX }
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_SUM_VALUE_ADDED_TAX" name="DIFF_SUM_VALUE_ADDED_TAX" value="0" readonly="readonly"/>
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														本&nbsp;金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.OWN_PRICE}&nbsp;
															<input type="hidden" id="OWN_PRICE" name="OWN_PRICE" value="${settlementPrice.OWN_PRICE}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.OWN_PRICE}&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_OWN_PRICE" name="DIFF_OWN_PRICE" value="0" readonly="readonly"/>
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														利&nbsp;息
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.REN_PRICE }&nbsp;
															<input type="hidden" id="REN_PRICE" name="REN_PRICE" value="${settlementPrice.SUM_REN_PRICE}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.REN_PRICE }
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_REN_PRICE" name="DIFF_REN_PRICE" value="0" readonly="readonly"/>
														</td>
													</tr>
													<tr>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														罚&nbsp;息
													</td>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														￥${settlementPrice.FINE}&nbsp;
														<input type="hidden" id="DUN_PRICE" name="DUN_PRICE" onchange="changeRealTotal() ;" value="${settlementPrice.FINE}" readonly="readonly"/>
													</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.FINE}
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_DUN_PRICE" name="DIFF_DUN_PRICE" value="0" readonly="readonly"/>
														</td>																																			
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														期满购买金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.STAY_FEE}&nbsp;
															<input type="hidden" id="STAYBUY_PRICE" name="STAYBUY_PRICE" value="${settlementPrice.STAY_FEE}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.STAY_FEE}
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_STAYBUY_PRICE" name="DIFF_STAYBUY_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"></td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														法务费用 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.LAW_FEE}&nbsp;
															<input type="hidden" id="OTHER_PRICE" name="TOTAL_LAWYFEE" value="${settlementPrice.LAW_FEE}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.LAW_FEE}
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_OTHER_PRICE" name="DIFF_TOTAL_LAWYFEE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"></td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														其他费用 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.OTHER_FEE}&nbsp;
															<input type="hidden" id="OTHER_PRICE" name="OTHER_PRICE" value="${settlementPrice.OTHER_FEE}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															￥${settlementPrice.OTHER_FEE}
														</td>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_OTHER_PRICE" name="DIFF_OTHER_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"></td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合&nbsp;计
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settlementPrice.total}" type="currency" />
															<input type="hidden" id="TOTAL" name="TOTAL" value="${settlementPrice.total}" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settlementPrice.total}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input  type="text" id="DIFF_TOTAL" name="DIFF_TOTAL" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
													</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
							</div>
											
							</td>
						</tr>
						<tr align="center">
						<td align="center" colspan="4"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" id=""  class="ui-state-default ui-corner-all"  style="cursor:pointer;"    value="导出 PDF" onclick="insertSettle() ;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)" style="cursor:pointer;"/>
						</td>
						</tr>	
				</table>
			</form>
	</body>
</html>

