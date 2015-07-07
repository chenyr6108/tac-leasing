<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>供应商集团授信</title>
		
		<script type="text/javascript">
		
			$(function () {
				$("input[name$='DATE']").datepicker($.datepicker.regional['zh-CN']);
			    var modal = "${modal}";
			    if(modal == "show"){
			    	$("#saveBut").hide();
			    }
			    $("#formaddupd").find("input").each(function (){
			    	if(modal == "show"){
			    		$(this).attr("disabled", true);
			    	} else {
			    		if($(this).attr("type") == "radio"){
				    		$(this).data("old_data", $(this).attr("checked"));
				    	} else {
				    		$(this).data("old_data", $(this).val().replace(/,/g, ""));
				    	}
			    	}
				});
			});
			
			function defaultDate(){
				var now = new Date();
				$("#credit_table").find("tr").each(function (){
					var texts = $(this).find("input");
					if (texts.length > 0 && $.trim(texts.eq(0).val()) != "") {
						$(this).find("input[name$='DATE']").each(function (){
							if ($.trim($(this).val()) == "") {
								$(this).val(now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate());
							}
						});
					}
			    });
			}
			
			function backToPage(){
				$("#backFrom").submit();
			}
			
			function updateLastCredit(creditId, lastId){
				var last = $("#" + lastId).val().replace(/,/g, "");
				var credit = $("#" + creditId).val().replace(/,/g, "");
				if($.trim(credit) == "" || parseFloat(credit) == 0){
					$("#" + creditId).val("0");
					$("#" + lastId).val("0");
					cleanDateRange($("#" + creditId));
					$("#" + creditId).parent().parent().find("input[type='checkbox']").each(function (){
						$(this).attr("checked", false);
						$("#" + $(this).attr("class")).val("N");
					});
				} else {
					var old_last = parseFloat($("#" + lastId).data("old_data") == "" ? 0 : $("#" + lastId).data("old_data"));
					var old_credit = parseFloat($("#" + creditId).data("old_data") == "" ? 0 : $("#" + creditId).data("old_data"));
					var credit = parseFloat(credit);
					$("#" + lastId).val(old_last + (credit - old_credit));
					defaultDateRange($("#" + creditId));
					$("#" + creditId).parent().parent().find("input[type='checkbox']").each(function (){
						$(this).attr("checked", true);
						$("#" + $(this).attr("class")).val("Y");
					});
				}
				
			}
			
			function cleanDateRange(e){
				$(e).parent().parent().find("input[type='text'][name$='DATE']").each(function (){
					$(this).val("");
				});
			}
			
			function defaultDateRange(e){
				var date = new Date();
				$(e).parent().parent().find("input[type='text'][name$='DATE']").each(function (){
					if ($.trim($(this).val()) == "" || $.trim($(this).val()) == "0") {
						if($(this).attr("name").indexOf("_START_DATE") != -1){
							date = date;
						} else if ($(this).attr("name") == "ADVANCE_END_DATE") {
							date.setDate(date.getDate() + 3 * 30);
						} else {
							date.setDate(date.getDate() + 365);
						}
						$(this).val(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
					}
				});
			}
			
			function saveProductCredit(){
				var canSubmit = true;
				$("input[type='text']").each(function (){
					$(this).val($(this).val().replace(/,/g, ""));
				});
				$("#credit_table").find("td").each(function (){
					if($(this).attr("cellIndex") == 2){
						$(this).find("input").each(function (){
							var reg_int = /^\d+(.\d+)?$/;
							if ($.trim($(this).val()) != "" && !reg_int.exec($(this).val())){
								alert("授信额度必须是数字！");
								$(this).select();
								$(this).focus();
								canSubmit = false;
								return false;
							}
						});
						if (!canSubmit) {
							return false;
						}
					}
				});
				if (canSubmit) {
					$("#formaddupd").submit();
				}
			}
			
			function changeHasValue(e){
				if($(e).attr("checked")){
					$("#" + $(e).attr("class")).val("Y");
					$(e).parent().parent().find("input[type!='hidden']").each(function (){
						if($(this).attr("type") == "radio"){
							$(this).attr("checked", $(this).data("old_data"));
						}
						if($.trim($(this).val()) == ""){
							$(this).val($(this).data("old_data") == "" ? "0" : $(this).data("old_data"));
						}
					});
					defaultDateRange($(e));
				} else {
					$("#" + $(e).attr("class")).val("N");
					$(e).parent().parent().find("input[type!='hidden']").each(function (){
						if($(this).attr("type") == "radio" && $(this).attr("value") == "1"){
							$(this).attr("checked", false);
						} else if($(this).attr("type") == "radio" && $(this).attr("value") == "0"){
							$(this).attr("checked", true);
						} else {
							$(this).val("");
						}
					});
				}
			}
			
			function goBack() {
				window.location.href="../servlet/defaultDispatcher?__action=supplierGroupCommand.query";
			}
			
		</script>
	</head>
	<body>
		<%-- <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="supplierGroupCommand.addGroupCredit">
			<input type="hidden" id="unionAmount" value="${unionAmount }">
			<input type="hidden" id="buyBackAmount" value="${buyBackAmount }">
			<input type="hidden" id="payBeforeAmount" value="${payBeforeAmount }">
			<input type="hidden" name="suplGroupCode" value="${suplGroupCode }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;供应商集团授信 </span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           		<div class="ui-state-default ui-jqgrid-hdiv">
	           			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td rowspan="${fn:length(suplList)+1}" style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">供应商集团名称：&nbsp;</td>
	           					<td rowspan="${fn:length(suplList)+1}">${suplGroupName }&nbsp;</td>
	           					<td rowspan="${fn:length(suplList)+1}" style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">包含的供应商：&nbsp;</td>
	           				</tr>
	           				<c:forEach items="${suplList }" var="item">
		           				<tr class="ui-widget-content jqgrow ui-row-ltr">
		           					<td>&nbsp;${item.suplName }</td>
		           				</tr>
	           				</c:forEach>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">
	           						<font color="#FF0000">*</font>签呈编号：&nbsp;
	           					</td>
	           					<td style="width: 220px;">
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="SIGN_NUM" name="SIGN_NUM" style="width: 116px;" value="${result.signNum }">
	           					</td>
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">
	           						授信状态：&nbsp;
	           					</td>
	           					<td>
	           						<c:if test="${empty result.signNum }"><font color="#FF0000">&nbsp;未授信</font></c:if><c:if test="${not empty result.signNum }"><font color="#FF0000">&nbsp;已授信</font></c:if>
	           					</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head" rowspan="4">
	           						授信金额：&nbsp;
	           					</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;连保金额：<input id="UNION" name="UNION" style="width: 116px;" onchange="countAmountUnion()" onkeyup="clearNoNum(this)" value='<fmt:formatNumber type="currency" value="${result.union }"></fmt:formatNumber>'></td>
	           					<td rowspan="3" style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">是否循环拨款：</td>
	           					<td><input type="radio" style="cursor: pointer;" name="IS_LOOP_UNION" value="Y" <c:if test="${result.unionLoopFlag eq 'Y' }">checked="checked"</c:if>>是&nbsp;&nbsp;<input type="radio" <c:if test="${result.unionLoopFlag eq 'N' or empty result.unionLoopFlag}">checked="checked"</c:if> style="cursor: pointer;" name="IS_LOOP_UNION" value="N">否</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回购金额：<input id="BUY_BUCK" name="BUY_BUCK" style="width: 116px;" onchange="countAmountBuyBack()" onkeyup="clearNoNum(this)" value='<fmt:formatNumber type="currency" value="${result.buyBack }"></fmt:formatNumber>'></td>
	           					<td><input type="radio" style="cursor: pointer;" name="IS_LOOP_BUY_BACK" value="Y" <c:if test="${result.buyBackLoopFlag eq 'Y' }">checked="checked"</c:if>>是&nbsp;&nbsp;<input type="radio" <c:if test="${result.buyBackLoopFlag eq 'N' or empty result.buyBackLoopFlag }">checked="checked"</c:if> style="cursor: pointer;" name="IS_LOOP_BUY_BACK" value="N">否</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">	           				
	           					<td><span style="display: none;">交机前拨款金额：<input id="PAY_BEFORE" name="PAY_BEFORE" style="width: 116px;" onchange="countAmountPayBefore()" onkeyup="clearNoNum(this)" value='<fmt:formatNumber type="currency" value="${result.payBefore }"></fmt:formatNumber>'></span>&nbsp;</td>
	           					<td><span style="display: none;"><input type="radio" style="cursor: pointer;" name="IS_LOOP_PAY_BEFORE" value="Y" <c:if test="${result.payBeforeLoopFlag eq 'Y' }">checked="checked"</c:if>>是&nbsp;&nbsp;<input type="radio" <c:if test="${result.payBeforeLoopFlag eq 'N' or empty result.payBeforeLoopFlag }">checked="checked"</c:if> style="cursor: pointer;" name="IS_LOOP_PAY_BEFORE" value="N">否</span>&nbsp;</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">
	           						授信总金额：&nbsp;
	           					</td>
	           					<td colspan="3">
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input readonly="readonly" name="CREDIT_TOTAL_MONEY" id="CREDIT_TOTAL_MONEY" style="width: 116px;">
	           					</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head" rowspan="4">
	           						授信余额：&nbsp;
	           					</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;连保余额：<input id="UNION_REST" name="UNION_REST" style="width: 116px;" readonly="readonly"></td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回购余额：<input id="BUY_BUCK_REST" name="BUY_BUCK_REST" style="width: 116px;" readonly="readonly"></td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td colspan="3"><span style="display: none;">交机前拨款余额：<input id="PAY_BEFORE_REST" name="PAY_BEFORE_REST" style="width: 116px;" readonly="readonly">&nbsp;&nbsp;</span><a href="javascript:void(0)" onclick="viewHistory(${suplGroupCode})">查看供应商历史案件</a></td>
	           				</tr>
	           				<tr>
								<td style="text-align:center;" colspan="4">
									<div id="creditHistory" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
							</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">
	           						<font color="#FF0000">*</font>授信日期：&nbsp;
	           					</td>
	           					<td colspan="3">
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="FROM_DATE" name="FROM_DATE" style="width: 116px;" readonly="readonly" value="${result.fromDate }">-<input id="TO_DATE" name="TO_DATE" style="width: 116px;" readonly="readonly" value="${result.toDate }">
	           					</td>
	           				</tr>
	           				<tr class="ui-widget-content jqgrow ui-row-ltr">
	           					<td colspan="4" style="text-align: center;"><input type="button" value="保&nbsp;存" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="saveCredit()">&nbsp;&nbsp;<input type="button" value="返&nbsp;回" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="goBack()"></td>
	           				</tr>
	           			</table>
	           		</div>
	           </div>
	        </div>
		</form> --%>
		
		<!-- ****************************************************************************************************** -->
		<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
		<input type="hidden" name="__action" id="__action" value="supplierGroupCommand.addGroupCredit">
		<input type="hidden" name="modal" id="modal" value="${modal }"/>
		<input type="hidden" name="suplGroupCode" value="${suplGroupCode }">
		<input type="hidden" name="suplGroupName" value="${suplGroupName }">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信管理</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		
		<table class="panel_table" style="width: 100%">
			<tr>
				<th style="text-align: left; width: 10%">供应商集团名称：</th>
				<td style="text-align: left; width: 40%">${suplGroupName }&nbsp;</td>
				<th style="text-align: left; width: 10%">包含的供应商：</th>
				<td style="text-align: left; width: 40%">
						<c:forEach items="${suplList }" var="item">
	           				<div style="padding-top: 5px; padding-left: 10px; border-bottom: 1px solid black; width: inherit;">
	           					${item.suplName }&nbsp;
	           				</div>
           				</c:forEach>
				</td>
			</tr>
			
			<tr>
				<th style="text-align: left;">签呈编号：</th>
				<td style="text-align: left;">
					<input type="text" name="SIGN_NUM" id="SIGN_NUM" value="${result.SIGN_NUM }" class="panel_text" style="width: 200px;">
					<font style="color: red;">*</font>
				</td>
				<th style="text-align: left;">授信状态：</th>
				<td style="text-align: left;">
					<c:if test="${not empty result.SIGN_NUM}"><font style="color: red;">已授信</font></c:if>
					<c:if test="${empty result.SIGN_NUM}"><font style="color: red;">未授信</font></c:if>&nbsp;
				</td>
			</tr>
			<tr>
				<th colspan="4">
					<table class="panel_table" id="credit_table">
						<tr>
							<th>是否授信</th>
							<th>授信类型</th>
							<th>授信额度</th>
							<th>是否循环</th>
							<th>授信日期</th>
							<th>授信余额</th>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${result.UNION_HAS eq 'Y' }">checked="checked"</c:if> class="UNION_HAS">
								<input type="hidden" name="UNION_HAS" id="UNION_HAS" value="${result.UNION_HAS }">
							</td>
							<td>连保</td>
							<td>
								<input type="text" name="UNION" id="UNION" value="<fmt:formatNumber pattern="#,##0.00" value="${result.UNION }"/>" onchange="updateLastCredit('UNION', 'UNION_LAST');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="UNION_LOOP_FLAG" value="Y" <c:if test="${result.UNION_LOOP_FLAG eq 'Y' }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="UNION_LOOP_FLAG"  <c:if test="${result.UNION_LOOP_FLAG eq 'N' or empty result.UNION_LOOP_FLAG }">checked="checked"</c:if> value="N">否
							</td>
							<td>
								<input type="text" class="panel_text" name="FROM_DATE" value="${result.FROM_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="TO_DATE" value="${result.TO_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="UNION_LAST" id="UNION_LAST" value="<fmt:formatNumber pattern="#,##0.00" value="${result.UNION_LAST }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${result.BUY_BACK_HAS eq 'Y' }">checked="checked"</c:if> class="BUY_BACK_HAS">
								<input type="hidden" name="BUY_BACK_HAS" id="BUY_BACK_HAS" value="${result.BUY_BACK_HAS }">
							</td>
							<td>回购</td>
							<td>
								<input type="text" name="BUY_BACK" id="BUY_BACK" value="<fmt:formatNumber pattern="#,##0.00" value="${result.BUY_BACK }"/>" onchange="updateLastCredit('BUY_BACK', 'BUY_BACK_LAST');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="BUY_BACK_LOOP_FLAG" value="Y" <c:if test="${result.BUY_BACK_LOOP_FLAG eq 'Y' }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="BUY_BACK_LOOP_FLAG"  <c:if test="${result.BUY_BACK_LOOP_FLAG eq 'N' or empty result.BUY_BACK_LOOP_FLAG}">checked="checked"</c:if> value="N">否
							</td>
							<td>
								<input type="text" class="panel_text" name="BUY_BACK_START_DATE" value="${result.BUY_BACK_START_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="BUY_BACK_END_DATE" value="${result.BUY_BACK_END_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="BUY_BACK_LAST" id="BUY_BACK_LAST" value="<fmt:formatNumber pattern="#,##0.00" value="${result.BUY_BACK_LAST }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${result.PAY_BEFORE_HAS eq 'Y' }">checked="checked"</c:if> class="PAY_BEFORE_HAS">
								<input type="hidden" name="PAY_BEFORE_HAS" id="PAY_BEFORE_HAS" value="${result.PAY_BEFORE_HAS }">
							</td>
							<td>交机前拨款</td>
							<td>
								<input type="text" name="PAY_BEFORE" id="PAY_BEFORE" value="<fmt:formatNumber pattern="#,##0.00" value="${result.PAY_BEFORE }"/>" onchange="updateLastCredit('PAY_BEFORE', 'PAY_BEFORE_LAST');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="PAY_BEFORE_LOOP_FLAG" value="Y" <c:if test="${result.PAY_BEFORE_LOOP_FLAG eq 'Y' }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="PAY_BEFORE_LOOP_FLAG"  <c:if test="${result.PAY_BEFORE_LOOP_FLAG eq 'N' or empty result.PAY_BEFORE_LOOP_FLAG }">checked="checked"</c:if> value="N">否
							</td>
							<td>
								<input type="text" class="panel_text" name="PAY_BEFORE_START_DATE" value="${result.PAY_BEFORE_START_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="PAY_BEFORE_END_DATE" value="${result.PAY_BEFORE_END_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="PAY_BEFORE_LAST" id="PAY_BEFORE_LAST" value="<fmt:formatNumber pattern="#,##0.00" value="${result.PAY_BEFORE_LAST }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${result.INVOICE_HAS eq 'Y' }">checked="checked"</c:if> class="INVOICE_HAS">
								<input type="hidden" name="INVOICE_HAS" id="INVOICE_HAS" value="${result.INVOICE_HAS }">
							</td>
							<td>发票待补</td>
							<td>
								<input type="text" class="panel_text" id="INVOICE" name="INVOICE" value="<fmt:formatNumber pattern="#,##0" value="${result.INVOICE}"/>" onchange="updateLastCredit('INVOICE', 'INVOICE_LAST');">
							</td>
							<td>
								<input type="radio" class="panel_text" value="Y" <c:if test="${result.INVOICE_LOOP_FLAG eq 'Y'}">checked="checked"</c:if> name="INVOICE_LOOP_FLAG">是&nbsp;
								<input type="radio" class="panel_text" value="N" <c:if test="${result.INVOICE_LOOP_FLAG eq 'N' or empty result.INVOICE_LOOP_FLAG}">checked="checked"</c:if> name="INVOICE_LOOP_FLAG">否
							</td>
							<td>
								<input type="text" class="panel_text" name="INVOICE_START_DATE" value="${result.INVOICE_START_DATE}" >~
								<input type="text" class="panel_text" name="INVOICE_END_DATE" value="${result.INVOICE_END_DATE}" >
							</td>
							<td>
								<input type="text" class="panel_text" id="INVOICE_LAST" name="INVOICE_LAST"  value="<fmt:formatNumber pattern="#,##0" value="${result.INVOICE_LAST}"/>" readonly="readonly">
							</td>
						</tr>
					</table>
				</th>
			</tr>
			<tr>
	   			<th style="text-align: center;" colspan="6">
		   			<button type="button" name="saveBut" id="saveBut" onclick="saveProductCredit();" class="panel_button">保  存</button>
		   			<button type="button" onclick="goBack();" class="panel_button">返回</button>
	   			</th>
	   		</tr>
	   </table>
	   
	</div>
	</div>
	</div>
	</form>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" style="margin-top: -11px;">
		<input type="hidden" name="__action" id="__action" value="supplierGroupCommand.getCreditDetail">
		<input type="hidden" name="modal" value="${modal }"/>
		<input type="hidden" name="suplGroupCode" value="${suplGroupCode }">
		<input type="hidden" name="suplGroupName" value="${suplGroupName }">
		<table class="panel_table" style="margin-top: 0px;">
			<tr>
				<th colspan="7" style="text-align: left;">
					授信历史记录
				</th>
			</tr>
			<tr>
				<th colspan="7" style="text-align: right;">
					<page:pagingToolbarTop pagingInfo="${logInfo }"/>
				</th>
			</tr>
			<tr>
				<th rowspan="2">序号</th>
				<th colspan="4">内容(额度，是否循环，日期区间)</th>
				<th rowspan="2">修改时间</th>
				<th rowspan="2">修改人</th>
			</tr>
			<tr>
				<th>连保</th>
				<th>回购</th>
				<th>交机前拨款</th>
				<th>发票待补次数</th>
			</tr>
			<c:set var="indext"/>
			<c:forEach items="${logInfo.resultList }" var="item" varStatus="i">
			<c:choose>
				<c:when test="${i.count == fn:length(logInfo.resultList)}">
					<c:set var="indext" value="${i.count - 1}"/>
				</c:when>
				<c:otherwise>
					<c:set var="indext" value="${i.count}"/>
				</c:otherwise>
			</c:choose>
			<tr>
				<td>${i.count }</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].UNION != item.UNION }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.UNION }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].UNION_LOOP_FLAG != item.UNION_LOOP_FLAG }">style="color: red"</c:if>>
						<c:if test="${item.UNION_LOOP_FLAG eq 'Y' }">是</c:if>
						<c:if test="${item.UNION_LOOP_FLAG eq 'N' or empty item.UNION_LOOP_FLAG }">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].FROM_DATE != item.FROM_DATE }">style="color: red"</c:if>>
						${item.FROM_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].TO_DATE != item.TO_DATE }">style="color: red"</c:if>>
						${item.TO_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].BUY_BACK != item.BUY_BACK }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.BUY_BACK }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].BUY_BACK_LOOP_FLAG != item.BUY_BACK_LOOP_FLAG }">style="color: red"</c:if>>
						<c:if test="${item.BUY_BACK_LOOP_FLAG eq 'Y' }">是</c:if>
						<c:if test="${item.BUY_BACK_LOOP_FLAG eq 'N' or empty item.BUY_BACK_LOOP_FLAG}">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].BUY_BACK_START_DATE != item.BUY_BACK_START_DATE }">style="color: red"</c:if>>
						${item.BUY_BACK_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].BUY_BACK_END_DATE != item.BUY_BACK_END_DATE }">style="color: red"</c:if>>
						${item.BUY_BACK_END_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].PAY_BEFORE != item.PAY_BEFORE }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.PAY_BEFORE }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].PAY_BEFORE_LOOP_FLAG != item.PAY_BEFORE_LOOP_FLAG }">style="color: red"</c:if>>
						<c:if test="${item.PAY_BEFORE_LOOP_FLAG eq 'Y' }">是</c:if>
						<c:if test="${item.PAY_BEFORE_LOOP_FLAG eq 'N' or empty item.PAY_BEFORE_LOOP_FLAG }">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].PAY_BEFORE_START_DATE != item.PAY_BEFORE_START_DATE }">style="color: red"</c:if>>
						${item.PAY_BEFORE_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].PAY_BEFORE_END_DATE != item.PAY_BEFORE_END_DATE }">style="color: red"</c:if>>
						${item.PAY_BEFORE_END_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].INVOICE != item.INVOICE }">style="color: red"</c:if>>
						${item.INVOICE}
					</font>，
					<font <c:if test="${logInfo.resultList[indext].INVOICE_LOOP_FLAG != item.INVOICE_LOOP_FLAG }">style="color: red"</c:if>>
						<c:if test="${item.INVOICE_LOOP_FLAG eq 'Y'}">是</c:if>
						<c:if test="${item.INVOICE_LOOP_FLAG eq 'N' or empty item.INVOICE_LOOP_FLAG}">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].INVOICE_START_DATE != item.INVOICE_START_DATE }">style="color: red"</c:if>>
						${item.INVOICE_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].INVOICE_END_DATE != item.INVOICE_END_DATE }">style="color: red"</c:if>>
						${item.INVOICE_END_DATE}
					</font>
				</td>
				<td><fmt:formatDate value="${item.CREATE_ON }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.CREATE_BY}</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="7" style="text-align: right;">
					
				</th>
			</tr>
		</table>
		<page:pagingToolbar pagingInfo="${logInfo }"/>
	</form>
	
	<form action="../servlet/defaultDispatcher" name="backFrom" id="backFrom" method="post">
		<input type="hidden" name="__action" value="productCredit.queryAllProductCredit">
		<input type="hidden" name="res" value="ccm">
	</form>	
	</body>
</html>