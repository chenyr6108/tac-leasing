<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
	function selectAll() {
		if($("#selAll").attr("checked")) {
			$("input[name='selVal']").attr("checked",true);
		} else {
			$("input[name='selVal']").attr("checked",false);
		}
	}
	
	function save() {
		if($("#remark").val()=="") {
			if($("#FLAG").val()=='STOP') {
				alert("请填写停开原因");
				$("#remark").focus();
			} else {
				alert("请填写复开原因");
				$("#remark").focus();
			}
			return;
		}
		
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=invoiceManagementCommand.checkDuplicate&RECP_ID='+$("#RECP_ID").val()+"&FLAG="+$("#FLAG").val(),
			dataType:'json',
			success: function(flag)	{
				if(flag) {
					alert("发票状态重复更新,请关闭页面,重新搜索后进行操作!");
				} else {
					$("input[name='btn']").attr("disabled","disabled");
					$("#form2").submit();
				}
			}	
		});
	}
</script>
</head>
<body>
	<div align="center"> 
		<form name="form2" id="form2" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="invoiceManagementCommand.updateInvoicePaymentDetail"/>
		<input type="hidden" id="FLAG" name="FLAG" value="${FLAG }">
		<input type="hidden" id="RECP_ID" name="RECP_ID" value="${RECP_ID }">
			<table class="ui-jqgrid-htable zc_grid_title" style="width:740px;">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="color: red;text-align: center;"><c:if test="${FLAG eq 'STOP' }">停开</c:if><c:if test="${FLAG eq 'OPEN' }">复开</c:if><br>原因</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><textarea rows="3" cols="98" id="remark" name="remark" maxlength="500" style="resize:none"></textarea></td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<c:if test="${FLAG eq 'STOP' }">
							<input type="button" value="停开" class="panel_button" style="height: 66px;" onclick="save()" name="btn">
						</c:if>
						<c:if test="${FLAG eq 'OPEN' }">
							<input type="button" value="复开" class="panel_button" style="height: 64px;" onclick="save()" name="btn">
						</c:if>
					</td>
				</tr>
			</table>
			<table class="ui-jqgrid-htable zc_grid_title" style="width:740px;">
				<tr class="ui-state-default ui-th-ltr zc_grid_head">
					<th style="text-align:center;">状态<input type="hidden" id="selAll" style="cursor: pointer;" onclick="selectAll()"></th>
					<th style="text-align:center;">生效时间</th>
					<th style="text-align:center;">期数</th>
					<th style="text-align:center;">支付日</th>
					<c:if test="${TAX_PLAN_CODE eq '4' }">
					<th style="text-align:center;">一次抵充保证金</th>
					<th style="text-align:center;">融资租赁本金</th>
					</c:if>
					<th style="text-align:center;">融资租赁利息</th>
				</tr>
				<c:forEach items="${resultList}" var="item" varStatus="index">
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="height: 5px;">
					<td style="text-align:center;">
						<c:if test="${FLAG eq 'STOP' }"><!-- 停开href打开此页面 -->
							<c:if test="${item.IS_OPEN eq 'Y' }">已开票</c:if>
							<c:if test="${item.IS_OPEN eq 'N' }">未开票
								<input type="hidden" id="selVal${item.PERIOD_NUM }" name="selVal" style="cursor: pointer;" value="${item.RECP_ID }*${item.PERIOD_NUM }">
							</c:if>
						</c:if>
						<c:if test="${FLAG eq 'OPEN' }"><!-- 复开href打开此页面 -->
							<c:if test="${item.IS_OPEN eq 'Y' }">已开票</c:if>
							<c:if test="${item.IS_OPEN eq 'N' and item.IS_STOP eq 'Y' }">已停开
								<input type="hidden" id="selVal${item.PERIOD_NUM }" name="selVal" style="cursor: pointer;" value="${item.RECP_ID }*${item.PERIOD_NUM }">
							</c:if>
						</c:if>
					</td>
					<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${item.IS_OPEN eq 'N' }">${item.EFFECT_DATE }</c:if>&nbsp;</td>
					<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">${item.PERIOD_NUM }&nbsp;</td>
					<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">${item.PAY_DATE }&nbsp;</td>
					<c:if test="${TAX_PLAN_CODE eq '4' }">
					<td style="text-align:right;" class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${item.DEPOSIT_A>0 }">￥</c:if><fmt:formatNumber value="${item.DEPOSIT_A }" pattern="#,##0.00"/>&nbsp;</td>
					<td style="text-align:right;" class="ui-widget-content jqgrow ui-row-ltr">￥<fmt:formatNumber value="${item.OWN_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
					</c:if>
					<td style="text-align:right;" class="ui-widget-content jqgrow ui-row-ltr">￥<fmt:formatNumber value="${item.REN_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
				</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>