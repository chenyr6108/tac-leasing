<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>修改支付表其他费用</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/support/js/supportUpdatePayMoney.js"></script>
		<script type="text/javascript">
			saveSupportUpdatePay = function () {
				$("input[name='__action']").val("supportUpdatePayMoney.savePayInslist");		
				if (submitPayForm2()) {
					$("[name='payForm']").submit();
				}
			}
			var insureTypeData = ${insureTypeJsonList};						
		</script>
	</head>
	<body>
		<center>
		<ul><c:forEach items="${errList}" var="item" varStatus="status"><li><font color="red"><b>${item }</b></font></li></c:forEach></ul>
			<form action="${ctx }/servlet/defaultDispatcher" name="payForm" method="post">
				<input type="hidden" name="__action" value="">
				<input type="hidden" name="RECP_ID" value="${paylist.RECP_ID }">
				<input type="hidden" name="RECT_ID" value="${paylist.RECT_ID }">
				<input type="hidden" name="LEASE_CODE" value="${paylist.LEASE_CODE }">
				<input type="hidden" name="RECP_CODE" value="${paylist.RECP_CODE }">
				<input type="hidden" name="CUST_NAME" value="${paylist.CUST_NAME }">
				<input type="hidden" name="LEASE_TOPRIC" value="${paylist.CONTRACT_PRICE }">
				<input type="hidden" name="TOTAL_PRICE" value="${paylist.LEASE_TOPRIC }">
				<input type="hidden" name="VERSION_CODE" value="${paylist.VERSION_CODE }">
				<input type="hidden" name="PAYDATE_FLAG" value="${paylist.PAYDATE_FLAG }">
				<input type="hidden" name="INSURANCE_COMPANY_ID2" value="${paylist.INSURANCE_COMPANY_ID}" id="INSURANCE_COMPANY_ID2">
				<br>
		<table width="1028" cellpadding="0" cellspacing="0" border="0"
				align="center">	
				<tr>
					<td>	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改支付表其他费用</span>
		   	</div>				
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           <div class="ui-state-default ui-jqgrid-hdiv ">	

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.LEASE_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														承租人：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.CUST_NAME }
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														支付表号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.RECP_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同总金额：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.CONTRACT_PRICE}" type="currency" />
														(大写：<script type="text/javascript">document.write(atoc(${paylist.CONTRACT_PRICE}));</script>)
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showEquipment.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>融资租赁方案</b>
		</td>
	</tr>
	<tr>
		<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁期数
		</td>
		<td width="25%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			 ${paylist.LEASE_PERIOD }
		</td>
		<td width="17%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁周期
		</td>
		<td width="43%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${paylist.LEASE_TERM eq 1 }">月份</c:if>
				<c:if test="${paylist.LEASE_TERM eq 3 }">季度</c:if>
				<c:if test="${paylist.LEASE_TERM eq 6 }">半年</c:if>
				<c:if test="${paylist.LEASE_TERM eq 12 }">年度</c:if>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁质押金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.PLEDGE_PRICE }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期租金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
		 <fmt:formatNumber value="${empty paylist.HEAD_HIRE ? 0 : paylist.HEAD_HIRE }" type="currency" />
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			差旅费
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.BUSINESS_TRIP_PRICE }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
<!-- Add by Michael 2012 01/14 费用参数化 -->				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b>管理费收入(影响TR计算)</b></font>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b>非管理费收入(不影响TR计算)</b></font>
			</td>
		</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
										value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
									value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
								value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->	
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 利率上浮比率 -->
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<%-- ${paylist.FLOAT_RATE }
			% --%>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			合同利率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.YEAR_INTEREST }" pattern="0.000" />
			<font color="red">(
			<c:if test="${paylist.YEAR_INTEREST_TYPE eq 1}">浮动</c:if>  
			<c:if test="${paylist.YEAR_INTEREST_TYPE eq 2}">固定</c:if> 
			)</font>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			日罚息率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
		${paylist.FINE_RATE }
		<font color="red">(
			<c:if test="${paylist.FINE_TYPE eq 1}">单利</c:if> 
			<c:if test="${paylist.FINE_TYPE eq 2}">复利</c:if> 
		)</font>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			概算成本（RZE）
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.LEASE_RZE }" type="currency" />
		</td>
	</tr>
	
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			支付方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:forEach items="${payWays}" var="item">
					<c:if test="${ paylist.PAY_WAY eq item.CODE }">${item.FLAG }</c:if> 
				</c:forEach>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatDate value="${paylist.START_DATE }" pattern="yyyy-MM-dd" />
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁物件设置场所
		</td>
		<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.EQUPMENT_ADDRESS }
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁期满处理方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:forEach items="${dealWays}" var="item">
					<c:if test="${ paylist.DEAL_WAY eq item.CODE }">${item.FLAG }</c:if>
				</c:forEach>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${ paylist.BUY_INSURANCE_WAY eq 1 }">自购</c:if>
				<c:if test="${ paylist.BUY_INSURANCE_WAY eq 2 }">代购</c:if>
					
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险公司
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<select name="INSURANCE_COMPANY_ID" id="INSURANCE_COMPANY_ID" onchange="updateCompanyId()">
				<option value="0">--请选择--</option>
				<c:forEach items="${insureCompanyList}" var="item">
					<option value="${item.INCP_ID }" <c:if test="${ paylist.INSURANCE_COMPANY_ID eq item.INCP_ID }"> selected="selected"</c:if>>${item.INCP_NAME }</option>
				</c:forEach>
			</select>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买时间
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${ paylist.BUY_INSURANCE_TIME eq 1 }">全年购买</c:if> 
			<c:if test="${ paylist.BUY_INSURANCE_TIME eq 2 }">分年购买</c:if> 
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险返利百分比
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.INSURE_REBATE_RATE }
			%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
</table>
										</td>
									</tr>
									<tr>
										<td>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
	<tr>
		<td  colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<strong>保险费</strong>
		</td>
		<td  colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;"
				onclick="addInsureItem();">添加</a>
		</td>
	</tr>
	<tr>
		<th width="20%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险项目
		</th>
		<th width="20%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险期间
		</th>
		<th width="10%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费率
		</th>
		<th width="18%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费用
		</th>
		<th width="27%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
		<th width="5%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			操作
		</th>
	</tr>
	<c:set  var="insureTotal" value="0"></c:set>
	<c:forEach items="${paylist.payInusres }" var="item">
		<tr>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" >
				<select id="INSURE_ITEM0" name="INSURE_ITEM">
					<option value="-1">
						-请选择-
					</option>
					<c:forEach items="${insureTypeList }" var="insureTypeList">
						<option value="${insureTypeList.INTP_ID }"
							<c:if test="${insureTypeList.INTP_ID eq item.INSURE_ITEM }">selected="selected"</c:if>>
							${insureTypeList.INTP_NAME }
						</option>
					</c:forEach>
				</select>
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="START_DATE0" name="INSURE_START_DATE" size="11"
					value="${item.START_DATE }" />
				到
				<input id="END_DATE0" name="INSURE_END_DATE" size="11"
					value="${item.END_DATE }" />
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_RATE0" name="INSURE_RATE" size="4"
					value="${item.INSURE_RATE }">
				%
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" id="INSURE_PRICE0" name="INSURE_PRICE" onchange="changeField('INSURE_PRICE',this);" 
					size="15"
					value="<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" />">
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_MEMO0" name="INSURE_MEMO" size="25"
					value="${item.MEMO }">
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteInsureItemRow.call(this)">删除</a>
				<input type="hidden" name="RECI_ID" value="${item.RECI_ID }" id="RECI_ID0">
			</td>
		</tr>
		<c:set  var="insureTotal" value="${insureTotal + item.INSURE_PRICE}"></c:set>
	</c:forEach>
	<tr>
		<td colspan="4" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="showInsureTotalSpanUpper">
			<script type="text/javascript">document.write(atoc(${insureTotal}));</script>
			</span>
		</td>
		<td colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：
			<span id="showInsureTotalSpan">
			<fmt:formatNumber type="currency" value="${insureTotal }" />
			</span>
			）
		</td>
	</tr>

</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showOtherFee.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showPayline.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showFirstValue.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="gobackBut" onclick="saveSupportUpdatePay();" value=保&nbsp;&nbsp;存  class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
				</div>
				</div>
				</div>
	</td>
	</tr>
	</table>
			</form>
		</center>
	</body>
</html>

