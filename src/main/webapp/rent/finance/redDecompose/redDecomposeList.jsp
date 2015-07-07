<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function goBack() {
				location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryRedDecomposeMoney";
			}
			
			function commitRedDecompose() {
				if($("#redRemark").val()=="") {
					alert("请填写红冲备注！");
					$("#redRemark").focus();
					return;
				}
				$("#btn").attr("disabled",true);
				location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.commitRedDecomposeMoney&incomeId="+$("#incomeId").val()+"&recpId="+$("#recpId").val()+"&periodNum="+$("#periodNum").val()+"&redRemark="+$("#redRemark").val();
			}
		</script>
	</head>
</html>
<body>
	<form method="post" id="form" action="${ctx}/servlet/defaultDispatcher">
	<input name="__action" id="__action" type="hidden">
	<input id="incomeId" type="hidden" value="${incomeId }">
	<input id="recpId" type="hidden" value="${recpId }">
	<input id="periodNum" type="hidden" value="${periodNum }">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 1000px;">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;租金红冲</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
       <div class="zc_grid_body jqgrowleft">
		  <div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
		  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款户名：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_NAME }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款账户：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_ACCOUNT }&nbsp;
							</td>
						</tr>
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								客户名称：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_NAME_TRUE }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款时间：
							</td>
							<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								${resultList[0].INCOME_DATE }&nbsp;
							</td>
							<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								来款金额：
							</td>
							<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
								￥<fmt:formatNumber pattern="#,##0.00" value="${TOTAL_PRICE }"/>&nbsp;
							</td>
						</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								合同单位
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								开票单位
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								合同号
							</td>
							<c:if test="${resultList[0].PERIOD_NUM>0 }">
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									期数
								</td>
							</c:if>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								分解项目
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								应收时间
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								应收金额
							</td>
							<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
								红冲金额
							</td>
						</tr>
						<c:forEach var="item" items="${resultList }">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.INCOME_NAME_TRUE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.INCOME_NAME_TRUE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.LEASE_CODE }
								</td>
								<c:if test="${resultList[0].PERIOD_NUM>0 }">
									<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
										${item.PERIOD_NUM }
									</td>
								</c:if>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.DESCR }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.PAY_DATE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.SHOULD_PRICE }"/>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.DECOMPOSE_PRICE }"/>
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td style="text-align: right;">
									<font color="red">*</font>红冲备注：
								</td>
								<td colspan="8">
									<textarea style="resize:none" cols="110" id="redRemark" name="redRemark"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="9" style="text-align: center;">
									
									<br>
										<input value="提交财务" class="ui-state-default ui-corner-all" type="button" onclick="commitRedDecompose()" id="btn">
										<input value="返回" class="ui-state-default ui-corner-all" type="button" onclick="goBack()">
								</td>
							</tr>
				</table>
		  </div>
	   </div>
	</div>
	</form>
</body>