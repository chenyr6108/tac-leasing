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
			
			var REAL_TOTAL =REAL_SUM_VALUE_ADDED_TAX+REAL_OWN_PRICE + REAL_REN_PRICE + REAL_BREACH_PRICE + REAL_DAMAGE_PRICE + REAL_STAYBUY_PRICE + REAL_OTHER_PRICE+REAL_DUN_PRICE+REAL_TOTAL_LAWYFEE ;
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
			var form = document.form1 ;
			if(notPositiveSettle(form.SUM_VALUE_ADDED_TAX,"增值税")) {
				return ;
			}
			if(notPositiveSettle(form.OWN_PRICE,"本金")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_OWN_PRICE,"实收本金")) {
				return ;
			}
			if(notPositiveSettle(form.REN_PRICE,"利息")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_REN_PRICE,"实收利息")) {
				return ;
			}
			if(notPositiveSettle(form.BREACH_PRICE,"违约金")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_BREACH_PRICE,"实收违约金")) {
				return ;
			}
			if(notPositiveSettle(form.DAMAGE_PRICE,"损害金")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_DAMAGE_PRICE,"实收损害金")) {
				return ;
			}
			if(notPositiveSettle(form.STAYBUY_PRICE,"期满购买金")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_STAYBUY_PRICE,"实收期满购买金")) {
				return ;
			}
			//Add by Michael 2012 09-17 增加法务总费用
			if(notPositiveSettle(form.TOTAL_LAWYFEE,"法务费用")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_TOTAL_LAWYFEE,"实收法务费用")) {
				return ;
			}
			if(notPositiveSettle(form.OTHER_PRICE,"其他费用")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_OTHER_PRICE,"实收其他费用")) {
				return ;
			}
			if(notPositiveSettle(form.TOTAL,"总计")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_TOTAL,"实收总计")) {
				return ;
			}
			if(notPositiveSettle(form.REMIT,"汇款")) {
				return ;
			}
			if(notPositiveSettle(form.CASH, "现金")) {
				return ;
			}
			if(notPositiveSettle(form.NOTE,"票据")) {
				return ;
			}
			if(notPositiveSettle(form.OTHER,"其他")) {
				return ;
			}
			if(notPositiveSettle(form.REMIT,"汇款")) {
				return ;
			}
			if(notPositiveSettle(form.BACKOUT_COUNT,"张数")) {
				return ;
			}
			if(notPositiveSettle(form.BACKOUT_TOTAL,"票面总额")) {
				return ;
			}
			if(notPositiveSettle(form.NOT_RECEIVED_PRICE,"未收款金额")) {
				return ;
			}
			//Add by Michael 2011 12/30 增加罚息的检查
			if(notPositiveSettle(form.DUN_PRICE,"罚息")) {
				return ;
			}
			if(notPositiveSettle(form.REAL_DUN_PRICE,"实际罚息")) {
				return ;
			}
			
			$("#form1").submit() ;
		}
		</script>
	</head>
	<body>
			<form action="${ctx }/servlet/defaultDispatcher" method="post" id="form1" name="form1">
			<input type="hidden" name="__action" value="settleManage.create"> 
			<!-- Marked by michael 2011 12/13 修正已缴期数数据带错Bug -->
			<!-- <input type="hidden" value="${realPeriod}" name="HAS_PERIOD_NUM" id="HAS_PERIOD_NUM"/>-->
			<input type="hidden" value="${settleMap.REAL_PERIOD}" name="HAS_PERIOD_NUM" id="HAS_PERIOD_NUM"/>
			<input type="hidden" value="${RECP_ID}" name="RECP_ID" id="RECP_ID"/>
			<input type="hidden" value="${FUND_TYPE}" name="fund_type" id="funcd_type"/>
			<br>
				<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
					<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户结清数据明细表</span>
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
														${paylist.LEASE_CODE }&nbsp;
													</td>
													<td width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.CUST_NAME }&nbsp;
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.CORP_ORAGNIZATION_CODE}&nbsp;
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														 ${paylist.LEASE_PERIOD }&nbsp;
													</td>
													<td width="7%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${settleMap.REAL_PERIOD}&nbsp;
													</td>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${settleMoney}" type="currency"></fmt:formatNumber>&nbsp;
													</td>
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
													<td align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														试算金额
													</td>
													<td  align="center" colspan="1" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														实际金额
													</td>
													<td  align="center" colspan="1" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														差额
													</td>
													<td  align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														付款方式
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														增值税&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX}" type="currency" />&nbsp;
															<input type="hidden" id="SUM_VALUE_ADDED_TAX" name="SUM_VALUE_ADDED_TAX" value="<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX}" type="currency" />" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_SUM_VALUE_ADDED_TAX" name="REAL_SUM_VALUE_ADDED_TAX" onchange="changeRealTotal()" value="<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_SUM_VALUE_ADDED_TAX" name="DIFF_SUM_VALUE_ADDED_TAX" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														汇&nbsp;款：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REMIT" name="REMIT" value="" readonly="readonly"/>
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														本&nbsp;金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settleMap.SUM_OWN_PRICE}" type="currency" />&nbsp;
															<input type="hidden" id="OWN_PRICE" name="OWN_PRICE" value="<fmt:formatNumber value="${settleMap.SUM_OWN_PRICE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_OWN_PRICE" name="REAL_OWN_PRICE" onchange="changeRealTotal()" value="<fmt:formatNumber value="${settleMap.SUM_OWN_PRICE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_OWN_PRICE" name="DIFF_OWN_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														现&nbsp;金：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="CASH" name="CASH" value=""/>
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														利&nbsp;息
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settleMap.SUM_REN_PRICE}" type="currency"/>&nbsp;
															<input type="hidden" id="REN_PRICE" name="REN_PRICE" value="<fmt:formatNumber value="${settleMap.SUM_REN_PRICE}" type="currency"/>"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_REN_PRICE" name="REAL_REN_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.SUM_REN_PRICE}" type="currency"/>"/>
														</td>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_REN_PRICE" name="DIFF_REN_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														票&nbsp;据：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="NOTE" name="NOTE" value=""/>
														</td>	
													</tr>
													<tr>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														罚&nbsp;息
													</td>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${settleMap.DUN_PRICE}" type="currency" />&nbsp;
														<input type="hidden" id="DUN_PRICE" name="DUN_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.DUN_PRICE}" type="currency"/>"/>
													</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_DUN_PRICE" name="REAL_DUN_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.DUN_PRICE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_DUN_PRICE" name="DIFF_DUN_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														其&nbsp;它：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="OTHER" name="OTHER" value=""/>
														</td>																																				
													</tr>	
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														违约金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${weiYueJin}" type="currency" />&nbsp;
															<input type="hidden" id="BREACH_PRICE" name="BREACH_PRICE" value="<fmt:formatNumber value="${weiYueJin}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_BREACH_PRICE" name="REAL_BREACH_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${weiYueJin}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_BREACH_PRICE" name="DIFF_BREACH_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														损害金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${sunHaiJin}" type="currency" />&nbsp;
															<input type="hidden" id="DAMAGE_PRICE" name="DAMAGE_PRICE" value="<fmt:formatNumber value="${sunHaiJin}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_DAMAGE_PRICE" name="REAL_DAMAGE_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${sunHaiJin}" type="currency" />"/>
														</td>
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="DIFF_DAMAGE_PRICE" name="DIFF_DAMAGE_PRICE" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															&nbsp;
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														期满购买金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${settleMap.LGJ}" type="currency" />&nbsp;
															<input type="hidden" id="STAYBUY_PRICE" name="STAYBUY_PRICE" value="<fmt:formatNumber value="${settleMap.LGJ}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_STAYBUY_PRICE" name="REAL_STAYBUY_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.LGJ}" type="currency" />"/>
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
															<fmt:formatNumber value="${settleMap.TOTAL_LAWYFEE}" type="currency" />&nbsp;
															<input type="hidden" id="OTHER_PRICE" name="TOTAL_LAWYFEE" value="<fmt:formatNumber value="${settleMap.TOTAL_LAWYFEE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_OTHER_PRICE" name="REAL_TOTAL_LAWYFEE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.TOTAL_LAWYFEE}" type="currency" />"/>
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
															<fmt:formatNumber value="${qiTa}" type="currency" />&nbsp;
															<input type="hidden" id="OTHER_PRICE" name="OTHER_PRICE" value="<fmt:formatNumber value="${qiTa}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input type="text" id="REAL_OTHER_PRICE" name="REAL_OTHER_PRICE" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${qiTa}" type="currency" />"/>
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
															<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX+settleMap.SUM_OWN_PRICE + settleMap.SUM_REN_PRICE + settleMap.LGJ+settleMap.DUN_PRICE+settleMap.TOTAL_LAWYFEE}" type="currency" />&nbsp;
															<input type="hidden" id="TOTAL" name="TOTAL" value="<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX+settleMap.SUM_OWN_PRICE + settleMap.SUM_REN_PRICE + settleMap.LGJ+settleMap.DUN_PRICE+settleMap.TOTAL_LAWYFEE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input  type="text" id="REAL_TOTAL" name="REAL_TOTAL" onchange="changeRealTotal() ;" value="<fmt:formatNumber value="${settleMap.SUM_VALUE_ADDED_TAX+settleMap.SUM_OWN_PRICE + settleMap.SUM_REN_PRICE + settleMap.LGJ+settleMap.DUN_PRICE+settleMap.TOTAL_LAWYFEE}" type="currency" />"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<input  type="text" id="DIFF_TOTAL" name="DIFF_TOTAL" value="0" readonly="readonly"/>
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
													</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>撤票</b>
													</td>
												</tr>
												<tr >
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														张数:
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" name="BACKOUT_COUNT">
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														票面总额：
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" name="BACKOUT_TOTAL">
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														到期起迄:
														</td>
														<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" name="startDate" id="startDate" readonly="readonly" />&nbsp;~&nbsp;<input type="text" name="endDate" id="endDate" readonly="readonly" />
														</td>
													</tr>
											</table>
										</td>
									</tr>
										<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>成本</b>
													</td>
												</tr>
												<tr >
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
													1、未摊提保费
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														2、其他未摊提成本
														</td>
													</tr>
											</table>
										</td>
									</tr>
										<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>未收款项说明</b>
													</td>
												</tr>
												<tr >
													<td align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														未收款金额：<input type="text" name="NOT_RECEIVED_PRICE">
													</td>
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
						<td align="center" colspan="4"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" id=""  class="ui-state-default ui-corner-all"    value="保存" onclick="insertSettle() ;"> 
						<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
						</td>
						</tr>	
				</table>
			</form>
	</body>
</html>

