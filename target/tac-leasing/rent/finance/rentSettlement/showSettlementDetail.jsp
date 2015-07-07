<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/taglibs.jsp"%>
<title>结清审批详细信息</title>
<script type="text/javascript">

$(function(){
	$("#alertMsg").dialog({
		draggable: true,
		resizable:false, 
		modal: true,
		autoOpen:false,
		buttons: {
		 	关闭: function() {
		 		$(this).dialog("close");
				$("#submitRemark").focus();
		 	}
		}
	});
	$("#alertMsg1").dialog({
		draggable: true,
		resizable:false, 
		modal: true,
		autoOpen:false,
		buttons: {
		 	关闭: function() {
				window.location = '../servlet/defaultDispatcher?__action=rentFinanceCommand.queryCommitList&isMy=1';
		 	}
		}
	});
});

function approveReject(type) {
	if($("#submitRemark").val().trim() == ''){
		$("#alertMsgContent").html("请填写审批意见！");
		$("#alertMsg").dialog('open');
		return;
	}
	var id = $("#itemId").val();
	var recpId = $("#recpId").val();
	var stateCode = $("#stateCode").val();
	var remark = $("#submitRemark").val();
	var msg = "通过";
	var urlMethod = "approveSettlement";
	if(type == 0){
		msg = "驳回";
		urlMethod = "rejectSettlement";
	}
	if(!confirm("确认"+msg+"?")) {
		return;
	}
	$.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=rentFinanceCommand.'+urlMethod+'&id='+id+'&stateCode='+stateCode+'&remark='+remark+'&recpId='+recpId+'&opType='+type,
        dataType: 'json',
        success: function(flag) {
        	if(flag) {
        		$("#alertMsgContent1").html("操作完成!");
        		$("#alertMsg1").dialog('open');
        	} else {
        		$("#alertMsgContent").html("操作失败!");
        		$("#alertMsg").dialog('open');
        	}
        },
        error: function(data) {
    		$("#alertMsgContent").html("网络错误,请稍后重试!");
    		$("#alertMsg").dialog('open');
			return;
		}
    });
}
</script>
</head>
<body>
<div id="viewDiv">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;结清审批详细信息</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 100%;">
		<div class="zc_grid_body" >
			<div class="ui-state-default ui-jqgrid-hdiv" >
			  	<input type="hidden" id="itemId" value="${settlementPrice.ID }" />
			  	<input type="hidden" id="recpId" value="${settlementPrice.RECP_ID }" />
			  	<input type="hidden" id="stateCode" value="${settlementPrice.STATE_CODE }" />
				<table class="panel_table">
					<tr>
						<th colspan="5" style="text-align: left">
							&nbsp;&nbsp;基本信息
						</th>
					</tr>
					<tr>
						<th align="center">合同号</th>
						<th align="center">客户名称</th>
						<th align="center">合同租赁期数</th>
						<th align="center">合同已缴期数</th>
						<th align="center">合同已缴租金</th>
					</tr>
					<tr>
						<td style="text-align: center">${custInfo.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center">${custInfo.CUST_NAME }&nbsp;</td>
						<td style="text-align: center">${custInfo.PERIOD_NUM }&nbsp;</td>
						<td style="text-align: center">${custInfo.PAY_PERIOD }&nbsp;</td>
						<td style="text-align: center">${custInfo.PAY_PRICE }&nbsp;</td>
					</tr>
					<tr><td colspan="6" align="left">&nbsp;</td></tr>
					<tr><th colspan="5" style="text-align: left">&nbsp;&nbsp;结清明细</th></tr>
				</table>
				<table class="panel_table">
					<tr>
						<th style="text-align: center;width:25%;">试算项目</th>
						<th style="text-align: center;width:25%;">应付金额</th>
						<th style="text-align: center;width:25%;">申请还款金额</th>
						<th style="text-align: center;width:25%;">差额</th>
					</tr>
					<tr>
						<th style="text-align: right;">本金：</th>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_OWN_PRICE }"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_OWN_PRICE }"/>&nbsp;
						</td>
						<td style="text-align: right;<c:if test='${settlementPrice.PAY_OWN_PRICE != settlementPrice.SHOULD_OWN_PRICE }'>color:red;font-weight:bold;</c:if>">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_OWN_PRICE - settlementPrice.SHOULD_OWN_PRICE }"/>&nbsp;
						</td>
					</tr>
					<tr>
						<th style="text-align: right;">利息：</th>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_ACCRUAL_PRICE }"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_ACCRUAL_PRICE }"/>&nbsp;
						</td>
						<td style="text-align: right;<c:if test='${settlementPrice.PAY_ACCRUAL_PRICE != settlementPrice.SHOULD_ACCRUAL_PRICE }'>color:red;font-weight:bold;</c:if>">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_ACCRUAL_PRICE - settlementPrice.SHOULD_ACCRUAL_PRICE }"/>&nbsp;
						</td>
					</tr>
					<tr>
						<th style="text-align: right;">增值税：</th>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_ADDED_VALUE_TAX }"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_ADDED_VALUE_TAX }"/>&nbsp;
						</td>
						<td style="text-align: right;<c:if test='${settlementPrice.PAY_ADDED_VALUE_TAX != settlementPrice.SHOULD_ADDED_VALUE_TAX }'>color:red;font-weight:bold;</c:if>">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_ADDED_VALUE_TAX - settlementPrice.SHOULD_ADDED_VALUE_TAX }"/>&nbsp;
						</td>
					</tr>
					<tr>
						<th style="text-align: right;">罚息：</th>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_FINE }"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_FINE }"/>&nbsp;
						</td>
						<td style="text-align: right;<c:if test='${settlementPrice.PAY_FINE != settlementPrice.SHOULD_FINE }'>color:red;font-weight:bold;</c:if>">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_FINE - settlementPrice.SHOULD_FINE}"/>&nbsp;
						</td>
					</tr>
					<tr>
						<th style="text-align: right;">法务费用：</th>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_LAW_FEE }"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_LAW_FEE }"/>&nbsp;
						</td>
						<td style="text-align: right;<c:if test='${settlementPrice.PAY_LAW_FEE != settlementPrice.SHOULD_LAW_FEE }'>color:red;font-weight:bold;</c:if>">
							<fmt:formatNumber type="currency" value="${settlementPrice.PAY_LAW_FEE - settlementPrice.SHOULD_LAW_FEE }"/>&nbsp;
						</td>
				</tr>
				<tr>
					<th style="text-align: right;">期满购买金：</th>
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_STAY_FEE }"/>&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" value="${settlementPrice.PAY_STAY_FEE }"/>&nbsp;
					</td>
					<td style="text-align: right;<c:if test='${settlementPrice.PAY_STAY_FEE != settlementPrice.SHOULD_STAY_FEE }'>color:red;font-weight:bold;</c:if>">
						<fmt:formatNumber type="currency" value="${settlementPrice.PAY_STAY_FEE - settlementPrice.SHOULD_STAY_FEE }"/>&nbsp;
					</td>
				</tr>
				<tr>
					<th style="text-align: right;">其他费用：</th>
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" value="${settlementPrice.SHOULD_OTHER_FEE }"/>&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" value="${settlementPrice.PAY_OTHER_FEE }"/>&nbsp;
					</td>
					<td style="text-align: right;<c:if test='${settlementPrice.PAY_OTHER_FEE != settlementPrice.SHOULD_OTHER_FEE }'>color:red;font-weight:bold;</c:if>">
						<fmt:formatNumber type="currency" value="${settlementPrice.PAY_OTHER_FEE - settlementPrice.SHOULD_OTHER_FEE }"/>&nbsp;
					</td>
				</tr>
				<tr>
					<th style="text-align: right;">合计：</th>
					<c:set var="total" value="${settlementPrice.SHOULD_OWN_PRICE + settlementPrice.SHOULD_ACCRUAL_PRICE + settlementPrice.SHOULD_ADDED_VALUE_TAX + settlementPrice.SHOULD_FINE + settlementPrice.SHOULD_LAW_FEE + settlementPrice.SHOULD_STAY_FEE + settlementPrice.SHOULD_OTHER_FEE }" />
					<c:set var="totalPay" value="${settlementPrice.PAY_OWN_PRICE + settlementPrice.PAY_ACCRUAL_PRICE + settlementPrice.PAY_ADDED_VALUE_TAX + settlementPrice.PAY_FINE + settlementPrice.PAY_LAW_FEE + settlementPrice.PAY_STAY_FEE + settlementPrice.PAY_OTHER_FEE }" />
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" 
						value="${total }"/>&nbsp;
					</td>
					<td style="text-align: right;">
						<fmt:formatNumber type="currency" 
						value="${totalPay }"/>&nbsp;
					</td>
					<td style="text-align: right;<c:if test='${totalPay != total }'>color:red;font-weight:bold;</c:if>">
						<fmt:formatNumber type="currency" value="${totalPay - total }"/>&nbsp;
					</td>
				</tr>
				<tr><td colspan="6" align="left">&nbsp;</td></tr>
				<tr><th colspan="5" style="text-align: left">&nbsp;&nbsp;申请信息</th></tr>
				<tr class='ui-widget-content jqgrow ui-row-ltr'>
					<th style="text-align: center">&nbsp;&nbsp;申请人</th>
					<th style="text-align: center">&nbsp;&nbsp;申请时间</th>
					<th colspan="2" style="text-align: center;" >备注信息：</th>
				</tr>
				<tr>
					<td style="text-align: center;">${settlementPrice.NAME }</td>
					<td style="text-align: center;">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${settlementPrice.APPLY_TIME}" />&nbsp;
					</td>
					<td style="text-align: left; padding:0 6px; white-space:pre-wrap;" colspan="2">${settlementPrice.APPLY_REMARK }</td>
				</tr>
				<tr><td colspan="6" align="left">&nbsp;</td></tr>
				<tr>
					<th colspan="5" style="text-align: left">
						&nbsp;&nbsp;审批信息
					</th>
				</tr>
				<tr>
					<th style="text-align: right">
						&nbsp;&nbsp;审批流程：
					</th>
					<td colspan="4" style="text-align: left">
						<%-- <c:if test="${(total - totalPay) <= 500}">
							&nbsp;&nbsp;会计专员-->单位主管-->区域主管-->业务副总-->业管处-->财务专员-->财管部
						</c:if>
						<c:if test="${(total - totalPay) > 500}">
							&nbsp;&nbsp;会计专员-->单位主管-->区域主管-->业务副总-->总经理-->业管处-->财务专员-->财管部-->经管处
						</c:if> --%>
						<c:if test="${settlementPrice.STATE_CODE < 900 }">
							<c:forEach items="${dataType }" var="dt">
								<c:if test="${((dt.CODE==60 || dt.CODE==90) && (total - totalPay) > 500) || (dt.CODE!=60 && dt.CODE!=90)}">
									<span <c:if test="${dt.CODE==settlementPrice.STATE_CODE }">style='color:red;'</c:if>>${dt.FLAG }(<c:if test="${dt.CODE==30 }">${settlementPrice.UP_NAME }</c:if><c:if test="${dt.CODE==80 }">${areaLeaderName }</c:if>${states[dt.CODE].userName })</span> --> 
								</c:if>
							</c:forEach>
						</c:if>结束
					</td>
				</tr>
			</table>
			<table class="panel_table">
				<tr class='ui-widget-content jqgrow ui-row-ltr'>
					<th style="text-align: center; width:120px;">审批状态 -- 负责人</th>
					<th style="text-align: center; width:120px;">审批操作</th>
					<th style="text-align: center; width:100px;">审批人</th>
					<th style="text-align: center; width:120px;">审批时间</th>
					<th style="text-align: center; white-space:pre-wrap;">审批备注</th>
				</tr>
				<c:forEach items="${settlementLog}" var="item" varStatus="status">
					<tr class='ui-widget-content jqgrow ui-row-ltr'>
						<td style="text-align: center;">
							${states[item.STATE_CODE].chsName } -- <c:if test="${item.STATE_CODE==30 }">${settlementPrice.UP_NAME }</c:if><c:if test="${item.STATE_CODE==80 }">${areaLeaderName }</c:if>${states[item.STATE_CODE].userName }
						</td>
						<td style="text-align: center; width:100px;">
							<c:if test="${item.OP_STATE eq 1}">通过</c:if>
							<c:if test="${item.OP_STATE eq 0}">驳回</c:if>&nbsp;
						</td>
						<td style="text-align: center; width:100px;">${item.NAME}&nbsp;</td>
						<td style="text-align: center;">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${item.OP_TIME}" />&nbsp;
						</td>
						<td style="text-align:left; padding:0 6px; white-space:pre-wrap;">${item.OP_MSG}&nbsp;</td>
					</tr>
				</c:forEach>
				<c:if test="${auth eq 'Y' && showOnly ne 'Y'}">
					<tr><td colspan="6" align="left">&nbsp;</td></tr>
					<tr class='ui-widget-content jqgrow ui-row-ltr'>
						<th style="text-align: center; width:160px;">当前审批状态 -- 负责人</th>
						<th style="text-align: center; width:100px;">当前审批人</th>
						<th colspan="3" style="text-align: center; white-space:pre-wrap;">当前审批备注</th>
					</tr>
					<tr class='ui-widget-content jqgrow ui-row-ltr'>
						<td style="text-align: center;">
							${states[settlementPrice.STATE_CODE].chsName } -- ${settlementPrice.CURRENT_USER_NAME }&nbsp;
						</td>
						<td style="text-align: center;">
							${s_employeeName }&nbsp;
						</td>
						<td colspan="3" style="text-align:left;">
							<textarea id='submitRemark' style='width:100%; height:40px;'></textarea>&nbsp;
						</td>
					</tr>
				</c:if>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;" >
						<br>
						<c:if test="${auth eq 'Y' && showOnly ne 'Y' }">
							<input type="button" id="approveBtn" value="审批通过" onclick="approveReject(1)" class="ui-state-default ui-corner-all">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="rejectBtn" value="审批驳回" onclick="approveReject(0)" class="ui-state-default ui-corner-all">&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<input type="button" value="返&nbsp;回" onclick="history.go(-1)" class="ui-state-default ui-corner-all">
						<br><br>
					</td>
				</tr>
			</table>
     		</div>
 		</div>
	</div>
	<div id="alertMsg" style="display: none;" title="操作提示">
		<p id="alertMsgContent"></p>
	</div>
	<div id="alertMsg1" style="display: none;" title="操作提示">
		<p id="alertMsgContent1"></p>
	</div>
</div>
</body>
</html>