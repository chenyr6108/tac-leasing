<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		$(function() {
			$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
			$("#toDate").datepicker($.datepicker.regional['zh-CN']);
			$("#dFromDate").datepicker($.datepicker.regional['zh-CN']);
			$("#dToDate").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function createRedDecompose(billId) {
			if(!confirm("确认红冲?")) {
				return;
			}
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=rentFinanceCommand.checkRedDepositBCDecomposeIsLock&billId='+billId,
				dataType:'json',
				success:function(flag) {
					if(flag) {
						alert("此数据已经红冲!");
						$("#form1").submit();
					} else {
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=rentFinanceCommand.createDepositBCRed&billId='+billId,
							dataType:'json',
							success:function(data) {
								alert(data.msg);
								$("#form1").submit();
							}
						});
					}
				}
			});
		}
		</script>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="${__action }" />
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保证金B,C红冲</span>
			   	</div>
			   	<br>
			   	<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8" >&nbsp;</td>
						<td width="60" class="ss_o" >&nbsp;</td>
						<td class="ss_t" >
					         <table>
					         	<tr>
					         		<td>来款时间:</td>
					         		<td><input id="fromDate" name="fromDate" value="${fromDate }" readonly="readonly" style="width: 80px;">-
					         			<input id="toDate" name="toDate" value="${toDate }" readonly="readonly" style="width: 80px;">
					         		</td>
					         		<td>制单时间:</td>
					         		<td><input id="dFromDate" name="dFromDate" value="${dFromDate }" readonly="readonly" style="width: 80px;">-
					         			<input id="dToDate" name="dToDate" value="${dToDate }" readonly="readonly" style="width: 80px;">
					         		</td>
					         	</tr>
					         	<tr>
					         		<td>分解金额:</td>
					         		<td><input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 80px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 80px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
					         		<td>查询内容:</td>
					         		<td><input id="content" name="content" value="${content }" style="width: 167px;"></td>
					         	</tr>
			       			 </table>
	   					</td>
	   					<td width="55" class="ss_th" valign="top" >&nbsp;</td>
			            <td width="20%">
			       		 	<a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
				      </tr>
			    </table>
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-jqgrid-labels">
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											序号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="INCOME_DATE">来款日期</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="DECOMPOSE_TIME">制单时间</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											来款户名
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											分解此来款之客户
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											案件号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											合同号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="DECOMPOSE_PRICE">分解金额</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											制单人
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											确认人
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="DESCR">类型</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="HAS_RED_DECOMPOSE">操作</page:pagingSort>
										</th>
									</tr>
									<c:forEach items="${dw.resultList }" var="item" varStatus="status">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td style="text-align: center">
													${status.count }
												</td>
												<td style="text-align: center">
													${item.INCOME_DATE }&nbsp;
												</td>
												<td style="text-align: center">
													<fmt:formatDate value="${item.DECOMPOSE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp;
												</td>
												<td style="text-align: center">
													${item.INCOME_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.CUST_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.CREDIT_RUNCODE }&nbsp;
												</td>
												<td style="text-align: center">
													<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID}'" href="javascript:void(0);">${item.LEASE_CODE }&nbsp;
												</td>
												<td style="text-align: right">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.DECOMPOSE_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: center">
													${item.DECOMPOSE_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.AUDIT_NAME }&nbsp;
												</td>
												<td style="text-align: center;font-size: 11px;">
													${item.DESCR }&nbsp;
													<c:if test="${item.BILL_CODE eq 'DEPOSIT_B' }">
														抵充金额:￥<fmt:formatNumber pattern="#,##0.00" value="${item.PLEDGE_LAST_PRICE }"/>
														抵充最后期数:${item.PLEDGE_LAST_PERIOD }
													</c:if>
												</td>
												<td style="text-align: center">
													<c:if test="${item.HAS_RED_DECOMPOSE eq 0 }">
														<a href="javascript:void(0)" onclick="createRedDecompose('${item.BILL_ID}')">红冲</a>
													</c:if>
													<c:if test="${item.HAS_RED_DECOMPOSE eq 1 }">
														已红冲
													</c:if>
												</td>
											</tr>
									</c:forEach>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td><page:pagingToolbar pagingInfo="${dw }"/></td>
								</tr>
							</table>
						</div>
					</div>
			</form>
		</div>
	</body>
</html>