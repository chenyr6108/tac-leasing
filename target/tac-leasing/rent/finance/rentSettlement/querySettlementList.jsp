<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function createDecomposeDetailList() {
				var chk_value=[];   
			    $('input[name="bill_code"]:checked').each(function() {   
			   		chk_value.push($(this).val());   
			  	});   
			  	if(chk_value.length==0) {
			  		alert("请选择一条记录.");
			  		return;
			  	}
			  	
			  	$("#decomposeBtn").attr("disabled",true);
			  	
			  	$("#form").submit();
			}
			
			function goback() {
				location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.queryUnDecomposeMoney&cardFlag=0";
			}
			
			function checkIsLock(isLock,radio) {
				if(isLock=='Y') {
					alert("此条数据在提交中或者提交财务处理中,处于锁定中,如有疑问请联系管理员");
					radio.checked=false;
				}
			}
			
			function control(checkBox,billCode) {
				if(checkBox.checked) {
					$("#settlement_from_"+billCode).attr("disabled",false);
				} else {
					$("#settlement_from_"+billCode).attr("disabled",true);
				}
			}
		</script>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 1000px;">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;结清分解列表</span>
	   	</div>
	   	<form id="form" method="post" action="../servlet/defaultDispatcher?__action=rentFinanceCommand.createSettlementDetailList">
	   		<input type="hidden" name="income_id" value="${custMap.INCOME_ID }">
			<input type="hidden" name="income_money" value="${custMap.INCOME_MONEY }">
			<input type="hidden" name="recp_id" value="${custMap.RECP_ID }">
			
			<input type="hidden" name="income_name" value="${custMap.INCOME_NAME }">
			<input type="hidden" name="income_account" value="${custMap.INCOME_ACCOUNT }">
			<input type="hidden" name="income_name_true" value="${custMap.INCOME_NAME_TRUE }">
			<input type="hidden" name="income_date" value="${custMap.INCOME_DATE }">
	   		<!-- 提交后台处理的数据 -->
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
	            <div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款户名：
								</td>
								<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${custMap.INCOME_NAME }&nbsp;
								</td>
								<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款账户：
								</td>
								<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${custMap.INCOME_ACCOUNT }&nbsp;
								</td>
							</tr>
							<tr>
								<td width="8%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									客户名称：
								</td>
								<td width="42%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									${custMap.INCOME_NAME_TRUE }&nbsp;
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
									${custMap.INCOME_DATE }&nbsp;
								</td>
								<td width="10%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									来款金额：
								</td>
								<td width="40%" align="left" class="ui-widget-content jqgrow ui-row-ltr">
									￥<fmt:formatNumber pattern="#,##0.00" value="${custMap.INCOME_MONEY }"/>&nbsp;
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
							<c:forEach items="${settlementList }" var="item" varStatus="status">
								<tr>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										${status.count }
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="bill_code" value="${item.BILL_CODE}*<fmt:formatDate value='${item.SETTLE_DATE }' pattern='yyyy-MM-dd HH:mm:ss'/>*${item.SHOULD_PRICE}*${item.LEASE_CODE }*${item.RECP_CODE }*${item.DESCR }" style="cursor: pointer;" onclick="checkIsLock('${item.IS_LOCK }',this),control(this,'${item.BILL_CODE}')" <c:if test="${item.SHOULD_PRICE<=0 }">disabled=disabled</c:if>>
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										${item.LEASE_CODE }
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										${item.RECP_CODE }
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										<fmt:formatDate value='${item.SETTLE_DATE }' pattern='yyyy-MM-dd HH:mm:ss'/>
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										${item.DESCR }
									</td>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
										￥<fmt:formatNumber value="${item.SHOULD_PRICE }" pattern="#,##0.00"/>
									</td>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
										<select style="width: 60px;cursor: pointer;" name="settlement_from" disabled="disabled" id="settlement_from_${item.BILL_CODE }">
											<option value="客户">
												客户
											</option>
											<option value="供应商">
												供应商
											</option>
											<option value="其他">
												其他
											</option>
										</select>
									</td>
								</tr>
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