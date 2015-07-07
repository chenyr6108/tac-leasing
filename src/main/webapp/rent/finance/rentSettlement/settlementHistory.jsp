<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 85%;">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: center;"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>状态</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>应收罚息</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>减免罚息</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>财务专员检核</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>会记专员检核</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>业务主管审批</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>业务副总审批</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>业管主管审批</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>总经理审批</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>财务审批</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>结清提交人员</strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>操作</strong></td>
					</tr>
				<c:forEach items="${resultList }" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${status.count }</td>
						<td style='text-align: center;<c:if test="${item.STATE==-1 }">color: red;</c:if>'>
							<c:if test="${item.STATE==0 }">审批中</c:if>
							<c:if test="${item.STATE==1 }">通过</c:if>
							<c:if test="${item.STATE==-1 }">驳回</c:if>
							&nbsp;
						</td>
						<td style="text-align: right;">￥<fmt:formatNumber pattern="#,##0.00" value="${item.SHOULD_FINE }"/>&nbsp;</td>
						<td style="text-align: right;">￥<fmt:formatNumber pattern="#,##0.00" value="${item.FINE }"/>&nbsp;</td>
						<td style="text-align: center;"><c:if test="${empty item.FINANCIAL_STAFF }">审批中</c:if><c:if test="${not empty item.FINANCIAL_STAFF }">${item.FINANCIAL_STAFF }</c:if>&nbsp;</td>
						<td style="text-align: center;"><c:if test="${empty item.ACCOUNTANCY_STAFF and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.ACCOUNTANCY_STAFF}">${item.ACCOUNTANCY_STAFF }</c:if>&nbsp;</td>
						<td style="text-align: center;"><c:if test="${empty item.SALES_MANAGER and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.SALES_MANAGER}">${item.SALES_MANAGER }</c:if>&nbsp;</td>
						<td style="text-align: center;"><c:if test="${empty item.SALES_DIRECT and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.SALES_DIRECT}">${item.SALES_DIRECT }</c:if>&nbsp;</td>
						<td style="text-align: center;"><c:if test="${empty item.SERVICE_DIRECT and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.SERVICE_DIRECT}">${item.SERVICE_DIRECT }</c:if>&nbsp;</td>
						<td style="text-align: center;">
							<c:if test="${item.SHOULD_FINE >0}">
								<c:if test="${empty item.GENERAL_MANAGER and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.GENERAL_MANAGER }">${item.GENERAL_MANAGER }</c:if>
							</c:if>
							<c:if test="${item.SHOULD_FINE <=0}">
								没有应缴罚息,无需总经理审批
							</c:if>
							&nbsp;
						</td>
						<td style="text-align: center;"><c:if test="${empty item.FINANCIAL and item.STATE!=-1}">审批中</c:if><c:if test="${not empty item.FINANCIAL }">${item.FINANCIAL }</c:if>&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<a onclick="showSettlement('${item.ID }','${item.RECP_ID }')" href="javascript:void(0)">查看结清单</a>&nbsp;</td>
					</tr>
					<tr><td>
					 <div style="display: none;" title="结清单查看" id="settlementDiv${item.ID }">
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 600px;margin: auto;">
				           <div class="zc_grid_body jqgrowleft" style="width: 600px;">
							  <div class="ui-state-default ui-jqgrid-hdiv" style="width: 600px;">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-state-default ui-th-ltr zc_grid_head">
										<th colspan="5" style="text-align: left">
											基本信息
										</th>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">合同号</td>
										<td style="text-align: center;">客户名称</td>
										<td style="text-align: center;">合同租赁期数</td>
										<td style="text-align: center;">合同已缴期数</td>
										<td style="text-align: center;">合同已缴租金</td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><p id="${item.ID }_lease_code"></p></td>
										<td style="text-align: center;"><p id="${item.ID }_cust_name"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_period_num"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_period"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_price"></p></td>
									</tr>
									<tr class="ui-state-default ui-th-ltr zc_grid_head">
										<th colspan="5" style="text-align: left">
											结清明细
										</th>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;width: 50px;">试算项目</td>
										<td style="text-align: center;width: 100px;">应付金额</td>
										<td style="text-align: center;width: 100px;">申请还款金额</td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">本金:</td>
										<td style="text-align: right;"><p id="${item.ID }_own_price"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_own_price"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">利息:</td>
										<td style="text-align: right;"><p id="${item.ID }_ren_price"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_ren_price"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">增值税:</td>
										<td style="text-align: right;"><p id="${item.ID }_value_added_tax"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_value_added_tax"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">罚息:</td>
										<td style="text-align: right;"><p id="${item.ID }_fine"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_fine"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">法务费用:</td>
										<td style="text-align: right;"><p id="${item.ID }_law_fee"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_law_fee"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">期满购买金:</td>
										<td style="text-align: right;"><p id="${item.ID }_stay_fee"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_stay_fee"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">其他费用:</td>
										<td style="text-align: right;"><p id="${item.ID }_other_fee"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_other_fee"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">合计:</td>
										<td style="text-align: right;"><p id="${item.ID }_total_fee"></p></td>
										<td style="text-align: right;"><p id="${item.ID }_pay_total_fee"></p></td>
									</tr>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: right;">备注:</td>
										<td style="text-align: left;" colspan="2"><p id="${item.ID }_remark"></p></td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">
											<br><input type="button" value="关&nbsp;闭" onclick="closeDialog('settlementDiv${item.ID }')" class="ui-state-default ui-corner-all">
										</td>
									</tr>
								</table>
						     </div>
						  </div>
						</div>
					</div>
					</td></tr>
				 </c:forEach>
			</table>
		</div>
	</div>
</div>
	<div style="display: none;" title="备注" id="remarkDiv">
  		<p id="remark" class="ui-widget-content jqgrow ui-row-ltr"></p>
  		<div style="text-align: center;">
  			<input type="button" value="关&nbsp;闭" onclick="closeDialog('remarkDiv')" class="ui-state-default ui-corner-all">
  		</div>
	</div>
	<script>
		function viewRemark(remark) {
			$("#remarkDiv").dialog({
			position:['center',200], hide:'slide', show:'slide',
			modal:true,
			autoOpen:false,
			width:800
			});
			$("#remark").html(remark);
			$(".ui-dialog-titlebar-close").hide();
			$("#remarkDiv").dialog('open');
		}
		
		function closeDialog(id) {
			$("#"+id).dialog("close");
		}
		
		function showSettlement(id,recpId) {
				$.ajax({
			        type: 'post',
			        url: '../servlet/defaultDispatcher',
			        data: '__action=rentFinanceCommand.viewSettlementDetail&recpId='+recpId+'&id='+id,
			        dataType: 'json',
			        success: function(data) {
			        	$("#"+id+"_remark").html(data.settlementPrice.REMARK);
			    		$("#"+id+"_lease_code").html(data.custInfo.LEASE_CODE);
			    		$("#"+id+"_cust_name").html(data.custInfo.CUST_NAME);
			    		$("#"+id+"_period_num").html(data.custInfo.PERIOD_NUM);
			    		$("#"+id+"_pay_period").html(data.custInfo.PAY_PERIOD);
			    		$("#"+id+"_pay_price").html("￥"+data.custInfo.PAY_PRICE);
			    		
			    		$("#"+id+"_own_price").html("￥"+data.settlementPrice.SHOULD_OWN_PRICE);
			    		$("#"+id+"_ren_price").html("￥"+data.settlementPrice.SHOULD_ACCRUAL_PRICE);
			    		$("#"+id+"_value_added_tax").html("￥"+data.settlementPrice.SHOULD_ADDED_VALUE_TAX);
			    		$("#"+id+"_law_fee").html("￥"+data.settlementPrice.SHOULD_LAW_FEE);
			    		$("#"+id+"_stay_fee").html("￥"+data.settlementPrice.SHOULD_STAY_FEE);
			    		$("#"+id+"_other_fee").html("￥"+data.settlementPrice.SHOULD_OTHER_FEE);
			    		$("#"+id+"_fine").html("￥"+data.settlementPrice.SHOULD_FINE);
			    		
			    		$("#"+id+"_total_fee").html("￥"+(parseFloat(data.settlementPrice.SHOULD_OWN_PRICE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_ACCRUAL_PRICE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_ADDED_VALUE_TAX.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_LAW_FEE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_OTHER_FEE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_FINE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.SHOULD_STAY_FEE.replace(",",""))));
			    		
			    		$("#"+id+"_pay_own_price").html("￥"+data.settlementPrice.PAY_OWN_PRICE);
			    		$("#"+id+"_pay_ren_price").html("￥"+data.settlementPrice.PAY_ACCRUAL_PRICE);
			    		$("#"+id+"_pay_value_added_tax").html("￥"+data.settlementPrice.PAY_ADDED_VALUE_TAX);
			    		$("#"+id+"_pay_law_fee").html("￥"+data.settlementPrice.PAY_LAW_FEE);
			    		$("#"+id+"_pay_stay_fee").html("￥"+data.settlementPrice.PAY_STAY_FEE);
			    		$("#"+id+"_pay_other_fee").html("￥"+data.settlementPrice.PAY_OTHER_FEE);
			    		$("#"+id+"_pay_fine").html("￥"+data.settlementPrice.PAY_FINE);
			    		
			    		$("#"+id+"_pay_total_fee").html("￥"+(parseFloat(data.settlementPrice.PAY_OWN_PRICE.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_ACCRUAL_PRICE.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_ADDED_VALUE_TAX.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_LAW_FEE.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_OTHER_FEE.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_FINE.replace(",",""))+
											    				   parseFloat(data.settlementPrice.PAY_STAY_FEE.replace(",",""))));
			        },
			        error: function(data) {
						alert("网络错误,请稍后重试!");
						return;
					}
			    });
			    
				$("#settlementDiv"+id).dialog({
					position:['center',50], hide:'slide', show:'slide',
					modal:true,
					autoOpen:false,
					width:650
				});
				$(".ui-dialog-titlebar-close").hide();
				$("#settlementDiv"+id).dialog('open');
		}
	</script>
