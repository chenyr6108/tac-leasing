<%@ page language="java" pageEncoding="UTF-8"%>

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
				<c:if test="${paylist.LEASE_TERM eq 2 }">双月</c:if>
				<c:if test="${paylist.LEASE_TERM eq 3 }">季度</c:if>
				<c:if test="${paylist.LEASE_TERM eq 6 }">半年</c:if>
				<c:if test="${paylist.LEASE_TERM eq 12 }">年度</c:if>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保证金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.PLEDGE_PRICE }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
	<!-- 
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			实际使用保证金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.PLEDGE_REALPRIC }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保证金处理方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${paylist.PLEDGE_WAY eq 1 }">用于平均抵冲金额</c:if>
			<c:if test="${paylist.PLEDGE_WAY eq 0 }">用于期末退还金额</c:if>
			<c:if test="${paylist.PLEDGE_WAY eq 2 }">用于最后抵冲金额/期数</c:if>
			<span style="display: none;">&nbsp;&nbsp;期数&nbsp;&nbsp;${paylist.PLEDGE_PERIOD}</span>
		</td>
	</tr>
	 -->
	<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于平均抵冲金额
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_AVE_PRICE ?0:paylist.PLEDGE_AVE_PRICE }" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_BACK_PRICE ?0 :paylist.PLEDGE_BACK_PRICE }" />
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于最后抵冲含税金额/期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber pattern='#,##0.00' value="${(empty paylist.PLEDGE_LAST_PRICE?0:paylist.PLEDGE_LAST_PRICE)+(empty paylist.PLEDGE_LAST_PRICE_TAX?0:paylist.PLEDGE_LAST_PRICE_TAX) }" />
						${empty paylist.PLEDGE_LAST_PERIOD?0:paylist.PLEDGE_LAST_PERIOD }
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						延迟拨款期数<!-- 	收入时间  -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						${empty paylist.DEFER_PERIOD?0:paylist.DEFER_PERIOD }<!-- 第${empty paylist.PLEDGE_PERIOD?0:paylist.PLEDGE_PERIOD }期 -->
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty paylist.PLEDGE_ENTER_WAY or paylist.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> disabled="disabled">-->入我司&nbsp;&nbsp;&nbsp;
						${empty paylist.PLEDGE_ENTER_CMPRICE?0:paylist.PLEDGE_ENTER_CMPRICE}&nbsp;&nbsp;税金&nbsp;
						${empty paylist.PLEDGE_ENTER_CMRATE?0:paylist.PLEDGE_ENTER_CMRATE}&nbsp;&nbsp;我司入供应商&nbsp;
						<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_MCTOAG?0:paylist.PLEDGE_ENTER_MCTOAG}" />&nbsp;&nbsp;税金&nbsp;
						<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_MCTOAGRATE?0:paylist.PLEDGE_ENTER_MCTOAGRATE}" />
						<br>
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="2" <c:if test="${paylist.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if> disabled="disabled">-->入供应商&nbsp;
						${empty paylist.PLEDGE_ENTER_AG?0:paylist.PLEDGE_ENTER_AG }&nbsp;&nbsp;税金&nbsp;
						<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_AGRATE?0:paylist.PLEDGE_ENTER_AGRATE}" />
					</td>
				</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期租金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			 <fmt:formatNumber value="${empty paylist.HEAD_HIRE ? 0 : paylist.HEAD_HIRE }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${paylist.TAX_PLAN_CODE eq '5' }">业务员佣金</c:if>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
		    <c:if test="${paylist.TAX_PLAN_CODE eq '5' }">${SALES_PAY }</c:if>
		</td>
	</tr>
	<c:if test="${paylist.TAX_PLAN_CODE eq '5' }">
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				手续费收入：${INCOME_PAY }
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				手续费收入税额：${INCOME_PAY*0.055 }
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				银行手续费：${OUT_PAY }
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
	</c:if>
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
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" 
										value="${empty item.FEE?0:item.FEE }"  style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select><input type="hidden" name="${item.CREATE_FILED_NAME }_SOURCE" value="${ item.SOURCE_CODE}">
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
									 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" readonly="readonly" >来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select><input type="hidden" name="${item.CREATE_FILED_NAME }_SOURCE" value="${ item.SOURCE_CODE}">
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
							 value="${empty item.FEE?0:item.FEE }" style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select><input type="hidden" name="${item.CREATE_FILED_NAME }_SOURCE" value="${ item.SOURCE_CODE}">
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
							 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select><input type="hidden" name="${item.CREATE_FILED_NAME }_SOURCE" value="${ item.SOURCE_CODE}">
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
			<%-- <fmt:formatNumber value="${paylist.FLOAT_RATE }" pattern="0.000" />
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
			<font color="RED"><b>客户TR</b></font>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${paylist.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>实际TR</b></font>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${paylist.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
		</td>
	</tr>
	<!-- 
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			营业税率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.SALES_TAX_RATE }
			%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.INSURE_BASE_RATE }
			%
		</td>
	</tr>
	<tr style="display: none;">
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			印花税租赁总价比率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.STAMP_TAX_TOPRIC }
			%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			印花税租金总计比率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			${paylist.STAMP_TAX_MONTHPRIC }
			%
			&nbsp;&nbsp;印花税保险比率&nbsp;&nbsp;${paylist.STAMP_TAX_INSUREPRIC }
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
	-->
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			概算成本（RZE）
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.LEASE_RZE }" type="currency" />
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			利差&nbsp;
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${paylist.RATE_DIFF }" type="currency" />
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
		<!--  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatDate value="${paylist.START_DATE }" pattern="yyyy-MM-dd" />
		</td>
		-->
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatDate value="${paylist.FIRST_PAYDATE }" pattern="yyyy-MM-dd" />
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			差旅费
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${paylist.BUSINESS_TRIP_PRICE }" type="currency" />
		</td>
		<!-- <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期支付日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatDate value="${paylist.FIRST_PAYDATE }" pattern="yyyy-MM-dd" />
		</td>
		 -->
		  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期支付日期
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
					<td class="ui-widget-content jqgrow ui-row-ltr">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq paylist.SUPL_TRUE}">										
											${item.FLAG }&nbsp;
									</c:when>
									<c:otherwise>
											&nbsp;
									</c:otherwise>
								</c:choose>
							</c:forEach>
						
					</td>
	</tr>
	
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁期满处理方式
		</td>
		<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:forEach items="${dealWays}" var="item">
					<c:if test="${ paylist.DEAL_WAY eq item.CODE }">${item.FLAG }</c:if>
				</c:forEach>
		</td>
		<!--  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${ paylist.BUY_INSURANCE_WAY eq 1 }">自购</c:if>
				<c:if test="${ paylist.BUY_INSURANCE_WAY eq 2 }">代购</c:if>
					
		</td>-->
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险公司
		</td>
		<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
		<c:forEach items="${insureCompanyList}" var="item">
			<c:if test="${ paylist.INSURANCE_COMPANY_ID eq item.INCP_ID }">${item.INCP_NAME }</c:if> 
		</c:forEach>
		</td>
		<!--  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买时间
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${ paylist.BUY_INSURANCE_TIME eq 1 }">全年购买</c:if> 
			<c:if test="${ paylist.BUY_INSURANCE_TIME eq 2 }">分年购买</c:if> 
		</td>-->
	</tr>
	<!--  <tr>
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
	</tr>-->
</table>
