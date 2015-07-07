<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		$(function() {
			$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
			$("#toDate").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function createRedDecompose(incomeId,recpId,periodNum,isLock) {
			if(isLock=="Y") {
				alert("此数据提交财务处理中或非最后笔操作,不得进行操作!");
				return;
			} else {
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=rentFinanceCommand.checkRedDecomposeIsLock&incomeId='+incomeId+'&recpId='+recpId+'&periodNum='+periodNum,
					dataType:'json',
					success:function(flag) {
						if(flag) {
							alert("此数据提交财务处理中或非最后笔操作,不得进行操作!");
						} else {
							location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.createRedDecomposeList&incomeId="+incomeId+"&recpId="+recpId+"&periodNum="+periodNum;
						}
					}
				});
			}
		}
		</script>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryRedDecomposeMoney" />
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;租金红冲</span>
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
					         		<td>分解金额:</td>
					         		<td><input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
					         	</tr>
					         	<tr>
					         		<td>查询内容:</td>
					         		<td><input id="content" name="content" value="${content }" style="width: 169px;"></td>
					         		<td style="text-align: right">来源:</td>
					         		<td>
						         		<select name="from">
						         			<option value="-1" <c:if test="${from eq '-1' }">selected='selected'</c:if>>全部</option>
						         			<option value="0" <c:if test="${from eq '0' }">selected='selected'</c:if>>租金分解</option>
						         			<option value="1" <c:if test="${from eq '1' }">selected='selected'</c:if>>结清分解</option>
						         		</select>
					         		</td>
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
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
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
											来款户名
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											分解此来款之客户
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											来款帐号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											虚拟帐号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											支付表号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											期数
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="INCOME_MONEY">分解金额</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="IS_SETTLEMENT_DECOMPOSE">来源</page:pagingSort>
										</th>
										<%-- <th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="DESCR">类型</page:pagingSort>
										</th> --%>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											操作
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
													${item.INCOME_NAME }&nbsp;
													<input type="hidden" id="income_name_${item.INCOME_ID }" value="${item.INCOME_NAME }">
												</td>
												<td style="text-align: center">
													${item.CUST_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.INCOME_ACCOUNT }&nbsp;
												</td>
												<td style="text-align: center">
													${item.VIRTUAL_ACCOUNT }&nbsp;
												</td>
												<td style="text-align: center">
													${item.RECP_CODE }&nbsp;
												</td>
												<td style="text-align: center">
													&nbsp;
													<c:if test="${item.PERIOD_NUM>0 }">
														${item.PERIOD_NUM }
													</c:if>
													&nbsp;
												</td>
												<td style="text-align: right">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.DECOMPOSE_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: center">
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==0 or empty item.IS_SETTLEMENT_DECOMPOSE}">租金分解</c:if>
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==1 }">结清分解</c:if>
												</td>
												<%-- <td style="text-align: center">
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==0 or empty item.IS_SETTLEMENT_DECOMPOSE}">
														${item.DESCR }
													</c:if>
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==1 }">
														结清费用
													</c:if>&nbsp;
												</td> --%>
												<td style="text-align: center">
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==0 or empty item.IS_SETTLEMENT_DECOMPOSE}">
														<a href="javascript:void(0)" onclick="createRedDecompose('${item.INCOME_ID }','${item.RECP_ID }','${item.PERIOD_NUM }','${item.IS_LOCK }')">红冲单制作</a>
													</c:if>
													<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==1 }">
														红冲单制作
													</c:if>
												</td>
											</tr>
									</c:forEach>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td><page:pagingToolbar pagingInfo="${dw }"/></td>
								</tr>
							</table>
						</div>
					</div>
			</form>
			<font color="red">*</font>结清分解来源不予红冲<br>
			<font color="red">*</font>保证金B,C不予红冲,请联系资讯人员红冲
		</div>
	</body>
</html>