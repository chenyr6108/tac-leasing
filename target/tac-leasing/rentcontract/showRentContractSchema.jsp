<%@ page language="java" pageEncoding="utf-8"%>

<table  width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
	<tr>
		<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>融资租赁方案</b>
		</td>
	</tr>
	<tr>
		<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
			租赁期数
		</td>
		<td width="25%"  class="ui-widget-content jqgrow ui-row-ltr">
			${schema.LEASE_PERIOD } &nbsp; 
		</td>
		<td width="17%"  class="ui-widget-content jqgrow ui-row-ltr">
			租赁周期
		</td>
		<td width="43%"  class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${schema.LEASE_TERM eq 1 }">月份</c:if>
			<c:if test="${schema.LEASE_TERM eq 2 }">双月</c:if>
			<c:if test="${schema.LEASE_TERM eq 3 }">季度</c:if>
			<c:if test="${schema.LEASE_TERM eq 6 }">半年</c:if>
			<c:if test="${schema.LEASE_TERM eq 12 }">年度</c:if> &nbsp; 
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			保证金
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${schema.PLEDGE_PRICE }" type="currency" />
			(${schema.PLEDGE_PRICE_RATE }%) &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			实际使用保证金
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${schema.PLEDGE_REALPRIC }" type="currency" />&nbsp; 
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			首期租金
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
		<fmt:formatNumber value="${schema.HEAD_HIRE }" type="currency" />
			(${schema.HEAD_HIRE_PERCENT }%) &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp; &nbsp; &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp; &nbsp; &nbsp; 
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
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 利率上浮比率 -->
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<%-- ${schema.FLOAT_RATE }% &nbsp;  --%>
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			合同利率
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			${schema.YEAR_INTEREST }
			<c:if test="${schema.YEAR_INTEREST_TYPE eq 1}">(浮动)</c:if>
			<c:if test="${schema.YEAR_INTEREST_TYPE eq 2}">(固定)</c:if> &nbsp; 
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>客户TR</b></font>
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>实际TR</b></font>
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			日罚息率
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			${schema.FINE_RATE }%
			<c:if test="${schema.FINE_TYPE eq 1}">(单利)</c:if>
			<c:if test="${schema.FINE_TYPE eq 2}">(复利)</c:if> &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			概算成本（RZE）
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${schema.LEASE_RZE }" type="currency" /> &nbsp; 
		</td>
	</tr>
	
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			支付方式
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${payWays}" var="item">
				<c:if test="${ schema.PAY_WAY eq item.CODE }">${item.FLAG }</c:if>
			</c:forEach> &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatDate value="${schema.START_DATE }" pattern="yyyy-MM-dd" /> &nbsp; 
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			差旅费
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${schema.BUSINESS_TRIP_PRICE }"type="currency" /> &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			租赁物件设置场所
		</td>
		<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
			${schema.EQUPMENT_ADDRESS } &nbsp; 
		</td>
	</tr>
	
	<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schema.SUPL_TRUE}">										
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
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			租赁期满处理方式
		</td>
		<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${dealWays}" var="item">
				<c:if test="${ schema.DEAL_WAY eq item.CODE }">${item.FLAG }</c:if>
			</c:forEach> &nbsp; 
		</td>
		<!--  <td  class="ui-widget-content jqgrow ui-row-ltr">
			购买方式
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${ schema.BUY_INSURANCE_WAY eq 1 }">自购</c:if>
			<c:if test="${ schema.BUY_INSURANCE_WAY eq 2 }">代购</c:if> &nbsp; 
		</td>-->
	</tr>
	<tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			保险公司
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<c:forEach items="${insureCompanyList}" var="item">
				<c:if test="${ schema.INSURANCE_COMPANY_ID eq item.INCP_ID }">${item.INCP_NAME }</c:if>
			</c:forEach> &nbsp; 
		</td>
	     <td  class="ui-widget-content jqgrow ui-row-ltr">
			购买时间
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${ schema.BUY_INSURANCE_TIME eq 1 }">全年购买</c:if>
			<c:if test="${ schema.BUY_INSURANCE_TIME eq 2 }">分年购买</c:if> &nbsp; 
		</td> 
	</tr>
	<!--  <tr>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			保险返利百分比
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			${schema.INSURE_REBATE_RATE } % &nbsp; 
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; 
		</td>
	</tr>-->
</table>
