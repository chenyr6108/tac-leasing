<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function createDecomposeDetailList() {
				var chk_value=[];   
			    $('input[name="radio"]:checked').each(function() {   
			   		chk_value.push($(this).val());   
			  	});   
			  	if(chk_value.length==0) {
			  		alert("请选择一条记录.");
			  		return;
			  	}
			  	
			  	$('input[name="recp_id"]').val($("#recp_id_"+chk_value[0]).val());
			  	$('input[name="period_num"]').val($("#period_num_"+chk_value[0]).val());
			  	$('input[name="tax_plan_code"]').val($("#tax_plan_code_"+chk_value[0]).val());
			  	$('input[name="should_price"]').val($("#should_price_"+chk_value[0]).val());
			  	$('input[name="ficb_code"]').val($("#ficb_code_"+chk_value[0]).val());
			  	$('input[name="lease_code"]').val($("#lease_code_"+chk_value[0]).val());
			  	$('input[name="recp_code"]').val($("#recp_code_"+chk_value[0]).val());
			  	$('input[name="decompose_from"]').val($("#decompose_from_"+chk_value[0]).val());
			  	$('input[name="pay_date"]').val($("#pay_date_"+chk_value[0]).val());
			  	$('input[name="fee"]').val($("#fee_"+chk_value[0]).val());
			  	$('input[name="fee_id"]').val($("#fee_id_"+chk_value[0]).val());
			  	$("#decomposeBtn").attr("disabled",true);
			  	
			  	$("#form").submit();
			}
			
			function goback() {
				location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryUnDecomposeMoney&cardFlag=0";
			}
			
			function checkIsLock(isLock,radio,descr,shouldPrice) {
				if(descr=="保证金B"&&($("#income_money").val()-shouldPrice)<0) {
					alert("来款金额小于保证金B应付金额,不予销帐");
					radio.checked=false;
				}
				if(isLock=='Y') {
					alert("此条数据在提交中或者提交财务处理中,处于锁定中,如有疑问请联系管理员");
					radio.checked=false;
				}
			}
		</script>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 1000px;">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;租金分解列表</span>
	   	</div>
	   	<form id="form" method="post" action="../servlet/defaultDispatcher?__action=rentFinanceCommand.createDecomposeDetailList">
	   		<!-- 提交后台处理的数据 -->
	   		<input type="hidden" name="recp_id">
	   		<input type="hidden" name="period_num">
	   		<input type="hidden" name="tax_plan_code">
	   		<input type="hidden" name="should_price">
	   		<input type="hidden" name="ficb_code">
	   		<input type="hidden" name="lease_code">
	   		<input type="hidden" name="recp_code">
	   		<input type="hidden" name="decompose_from">
	   		<input type="hidden" name="pay_date">
	   		<input type="hidden" name="fee">
	   		<input type="hidden" name="fee_id">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
	            <div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款户名：
								</td>
								<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${rentFinanceMap.INCOME_NAME }&nbsp;
									<input type="hidden" name="income_id" id="income_id" value="${rentFinanceMap.INCOME_ID }">
									<input type="hidden" name="income_name" id="income_name" value="${rentFinanceMap.INCOME_NAME }">
									<input type="hidden" name="income_account" id="income_account" value="${rentFinanceMap.INCOME_ACCOUNT }">
									<input type="hidden" name="income_date" id="income_date" value="${rentFinanceMap.INCOME_DATE }">
									<input type="hidden" name="income_name_true" id="income_name_true" value="${rentFinanceMap.INCOME_NAME_TRUE }">
								</td>
								<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款账户：
								</td>
								<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${rentFinanceMap.INCOME_ACCOUNT }&nbsp;
								</td>
							</tr>
							<tr>
								<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									客户名称：
								</td>
								<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${rentFinanceMap.INCOME_NAME_TRUE }&nbsp;
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
									${rentFinanceMap.INCOME_DATE }&nbsp;
								</td>
								<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款金额：
								</td>
								<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									￥<fmt:formatNumber pattern="#,##0.00" value="${rentFinanceMap.INCOME_MONEY }"/>&nbsp;
									<input type="hidden" name="income_money" id="income_money" value="${rentFinanceMap.INCOME_MONEY }">
								</td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									选项
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									合同号
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									支付表号
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									应收时间
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									分解项目
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									应收租金
								</td>
								<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
									来款来源
								</td>
							</tr>
							<c:forEach var="item" items="${resultList }" varStatus="status">
							<c:if test="${item.SHOULD_PRICE>0 }">
							<c:set var="index" value="${index+1 }"></c:set>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${index }
									<input type="hidden" id="recp_id_${item.RECD_ID }" value="${item.RECP_ID }">
									<input type="hidden" id="period_num_${item.RECD_ID }" value="${item.PERIOD_NUM }">
									<input type="hidden" id="tax_plan_code_${item.RECD_ID }" value="${item.TAX_PLAN_CODE }">
									<input type="hidden" id="should_price_${item.RECD_ID }" value="${item.SHOULD_PRICE }">
									<input type="hidden" id="ficb_code_${item.RECD_ID }" value="${item.FICB_CODE }">
									<input type="hidden" id="lease_code_${item.RECD_ID }" value="${item.LEASE_CODE }">
									<input type="hidden" id="recp_code_${item.RECD_ID }" value="${item.RECP_CODE }">
									<input type="hidden" id="pay_date_${item.RECD_ID }" value="${item.PAY_DATE }">
									<input type="hidden" id="fee_${item.RECD_ID }" value="${item.FEE }">
									<input type="hidden" id="fee_id_${item.RECD_ID }" value="${item.ID }"><!-- 管理费表的主键 -->
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									<input type="radio" name="radio" value="${item.RECD_ID }" style="cursor: pointer;" onclick="checkIsLock('${item.IS_LOCK }',this,'${item.DESCR }','${item.SHOULD_PRICE }')">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.LEASE_CODE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.RECP_CODE }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									${item.PAY_DATE }&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;<c:if test='${item.DESCR=="租金罚息" }'>color:red</c:if>">
									${item.DESCR }
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right">
									￥<fmt:formatNumber pattern="#,##0.00" value="${item.SHOULD_PRICE }"/>&nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">
									<select id="decompose_from_${item.RECD_ID }" style="width: 60px;cursor: pointer;">
										<option value="客户">
											客户
										</option>
										<c:if test="${item.FICB_CODE ne 'RENT' }">
											<option value="供应商">
												供应商
											</option>
										</c:if>
										<option value="其他">
											其他
										</option>
									</select>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							<tr>
								<td colspan="8" style="text-align: center;background: white;">
									<br>
									<input type="button" value="手动生成分解单" class="ui-state-default ui-corner-all" onclick="createDecomposeDetailList()" id="decomposeBtn">
									&nbsp;&nbsp;&nbsp;
									<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="goback()">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>