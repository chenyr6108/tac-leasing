<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/date.js"> </script>
<script type="text/javascript"> 
var baseRate = ${baseRateJson};
</script>
    <script type="text/javascript">
		$(function (){
			

			$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#FIRST_PAYDATE").datepicker($.datepicker.regional['zh-CN']);
		});
		function judgeRatePrice(){
			var cmprice=$("#PLEDGE_ENTER_CMPRICE").val();
			var mctoagrate=$("#PLEDGE_ENTER_MCTOAGRATE").val();
			cmprice=cmprice.replace(",","");
			mctoagrate=mctoagrate.replace(",","");
			if(parseFloat(cmprice)<parseFloat(mctoagrate)){
				alert("我司入供应商的税金不能大于入我司的金额！");
				$("#PLEDGE_ENTER_MCTOAGRATE").val("0.00");
			}
		}
	</script> 
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<b>&nbsp;&nbsp;融资租赁方案</b>
		</td>
	</tr>
	<tr>
		<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁期数
		</td>
		<td width="25%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeField('LEASE_PERIOD',this);"  name="LEASE_PERIOD" id="LEASE_PERIOD" value="${contractSchema.LEASE_PERIOD }" style="width: 60px;" readonly="readonly">
		</td>
		<td width="17%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁周期
		</td>
		<td width="43%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${contractSchema.LEASE_TERM eq 1 }">
					月份
					<input type="hidden" name="LEASE_TERM" value="1"/>
				</c:if>
				<c:if test="${contractSchema.LEASE_TERM eq 2 }">
					双月
					<input type="hidden" name="LEASE_TERM" value="2"/>
				</c:if>
				<c:if test="${contractSchema.LEASE_TERM eq 3 }">
					季度
					<input type="hidden" name="LEASE_TERM" value="3"/>
				</c:if>
				<c:if test="${contractSchema.LEASE_TERM eq 6 }">
					半年
					<input type="hidden" name="LEASE_TERM" value="6"/>
				</c:if>
				<c:if test="${contractSchema.LEASE_TERM eq 12 }">
					年度
					<input type="hidden" name="LEASE_TERM" value="12"/>
				</c:if>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
			保证金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeField('PLEDGE_PRICE_RATE',this);" name="PLEDGE_PRICE_RATE" id="PLEDGE_PRICE_RATE" value="${contractSchema.PLEDGE_PRICE_RATE }"
				style="width: 40px;" readonly="readonly">
			%
			<input type="text" onchange="changeField('PLEDGE_PRICE',this);" name="PLEDGE_PRICE" id="PLEDGE_PRICE" value="<fmt:formatNumber value="${contractSchema.PLEDGE_PRICE }" type="currency" />"
				class="input_right" style="width: 150px;" readonly="readonly">
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
			&nbsp;
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<input type="hidden" name="PLEDGE_REALPRIC" id="PLEDGE_REALPRIC" value="<fmt:formatNumber value="${contractSchema.PLEDGE_REALPRIC }" type="currency" />"
				class="input_right" style="width: 150px;" readonly="readonly">
		</td>
	</tr>
	<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于平均抵冲金额
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PLEDGE_AVE_PRICE" onchange="changeRZE();changePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_AVE_PRICE ?0:contractSchema.PLEDGE_AVE_PRICE }" />" style="text-align: right" readonly="readonly">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PLEDGE_BACK_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_BACK_PRICE ?0 :contractSchema.PLEDGE_BACK_PRICE }" />" style="text-align: right" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于最后抵冲含税金额/期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PLEDGE_LAST_PRICE" onchange="changeRZE();changePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${(empty contractSchema.PLEDGE_LAST_PRICE?0:contractSchema.PLEDGE_LAST_PRICE)+(empty contractSchema.PLEDGE_LAST_PRICE_TAX?0:contractSchema.PLEDGE_LAST_PRICE_TAX) }" />" style="text-align: right" readonly="readonly">
						<input type="text" name="PLEDGE_LAST_PERIOD" size="8"
							value="${empty contractSchema.PLEDGE_LAST_PERIOD?0:contractSchema.PLEDGE_LAST_PERIOD }" style="text-align: center;" readonly="readonly">
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						延迟拨款期数<!--	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="DEFER_PERIOD" size="8"
							value="${empty contractSchema.DEFER_PERIOD?0:contractSchema.DEFER_PERIOD }" style="text-align: center;" readonly="readonly">
						<input type="hidden" name="PLEDGE_PERIOD" size="8"
							value="${empty contractSchema.PLEDGE_PERIOD?0:contractSchema.PLEDGE_PERIOD }" style="text-align: center;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty paylist.PLEDGE_ENTER_WAY or paylist.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;
						<input type="text" style="text-align: right;" id="PLEDGE_ENTER_CMPRICE" name="PLEDGE_ENTER_CMPRICE" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_CMPRICE?0:contractSchema.PLEDGE_ENTER_CMPRICE}" />"  readonly="readonly">&nbsp;&nbsp;税金&nbsp;
						<input type="text" name="PLEDGE_ENTER_CMRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_CMRATE?0:contractSchema.PLEDGE_ENTER_CMRATE}" />" readonly="readonly">&nbsp;&nbsp;我司入供应商&nbsp;
						<input type="text" name="PLEDGE_ENTER_MCTOAG" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_MCTOAG?0:contractSchema.PLEDGE_ENTER_MCTOAG}" />" readonly="readonly">&nbsp;&nbsp;税金&nbsp;
						<input type="text" id="PLEDGE_ENTER_MCTOAGRATE" name="PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_MCTOAGRATE?0:contractSchema.PLEDGE_ENTER_MCTOAGRATE}" />" onchange="judgeRatePrice();" readonly="readonly">
						<br>
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="2" <c:if test="${paylist.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;
						<input type="text" name="PLEDGE_ENTER_AG" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_AG?0:contractSchema.PLEDGE_ENTER_AG }" />" readonly="readonly">&nbsp;&nbsp;税金&nbsp;
						<input type="text" name="PLEDGE_ENTER_AGRATE"  onchange="update2222();" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty contractSchema.PLEDGE_ENTER_AGRATE?0:contractSchema.PLEDGE_ENTER_AGRATE}" />" readonly="readonly">
					</td>
				</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期租金
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeField('HEAD_HIRE_PERCENT',this);" name="HEAD_HIRE_PERCENT" id="HEAD_HIRE_PERCENT" value="${contractSchema.HEAD_HIRE_PERCENT }"
				style="width: 40px;" readonly="readonly">
			%
			<input type="text" onchange="changeField('HEAD_HIRE',this);" name="HEAD_HIRE" id="HEAD_HIRE"
				class="input_right" style="width: 150px;"
				value="<fmt:formatNumber value="${empty contractSchema.HEAD_HIRE ? 0 : contractSchema.HEAD_HIRE }" type="currency" />" readonly="readonly">
			<!-- 管理费 -->
			<input type="hidden" onchange="changeField('MANAGEMENT_FEE_RATE',this);" name="MANAGEMENT_FEE_RATE" id="MANAGEMENT_FEE_RATE" value="${contractSchema.MANAGEMENT_FEE_RATE}"
				id="management_fee_rate" style="width: 40px;" readonly="readonly">
			
			<input type="hidden" onchange="changeField('MANAGEMENT_FEE',this);" name="MANAGEMENT_FEE" id="MANAGEMENT_FEE" value="<fmt:formatNumber value="${contractSchema.MANAGEMENT_FEE }" type="currency" />"
				class="input_right" style="width: 150px;" readonly="readonly">
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${contractSchema.TAX_PLAN_CODE eq '5' or contractSchema.TAX_PLAN_CODE eq '7'}">
				佣金：
			</c:if>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${contractSchema.TAX_PLAN_CODE eq '5' or contractSchema.TAX_PLAN_CODE eq '7'}">
			${SALES_PAY }
			</c:if>
		</td>
	</tr>
	<c:if test="${contractSchema.TAX_PLAN_CODE eq '5' }">
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
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" 
									 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
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
							 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
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
								value="${empty item.FEE?0:item.FEE }" style="text-align: right" readonly="readonly">来源：<select name="${item.CREATE_FILED_NAME }_select" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
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
			<input type="text" onchange="changeField('FLOAT_RATE',this);"  name="FLOAT_RATE" id="FLOAT_RATE" value="${contractSchema.FLOAT_RATE }"
				style="width: 80px;display: none;" readonly="readonly">
			%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			合同利率
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeField('YEAR_INTEREST',this);"  name="YEAR_INTEREST" id="YEAR_INTEREST" value="${contractSchema.YEAR_INTEREST }"
				style="width: 80px;" readonly="readonly">
			% &nbsp;&nbsp;
			<input type="radio" name="YEAR_INTEREST_TYPE" onclick="return false;" value="1" <c:if test="${contractSchema.YEAR_INTEREST_TYPE eq 1}">checked="checked"</c:if> readonly="readonly">
			&nbsp;浮动 &nbsp;&nbsp;
			<input type="radio" name="YEAR_INTEREST_TYPE" onclick="return false;" value="2" <c:if test="${contractSchema.YEAR_INTEREST_TYPE eq 2}">checked="checked"</c:if> readonly="readonly">
			&nbsp;固定
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>客户TR</b></font>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<input type="text" name="TR_RATE" id="TR_RATE" value="<fmt:formatNumber value="${contractSchema.TR_RATE }" pattern="##0.000"/>" class="input_right" style="width: 50px;" readonly="readonly">&nbsp;</b>%
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>实际TR</b></font>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<input type="text" name="TR_IRR_RATE" id="TR_IRR_RATE" value="<fmt:formatNumber value="${contractSchema.TR_IRR_RATE}" pattern="##0.000"/>" 
				class="input_right" style="width: 50px;" readonly="readonly">&nbsp;</b>%
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			概算成本（RZE）
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="LEASE_RZE" id="LEASE_RZE" value="<fmt:formatNumber value="${contractSchema.LEASE_RZE }" type="currency" />"
				class="input_right" style="width: 150px;" readonly="readonly">
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			利差
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="RATE_DIFF" id="RATE_DIFF" value="${empty contractSchema.RATE_DIFF ? 0 : contractSchema.RATE_DIFF }"
				class="input_right" style="width: 100px;" readonly="readonly">&nbsp;
		</td>
	</tr>	
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			支付方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<select name="PAY_WAY" id="PAY_WAY" onchange="changeField('PAY_WAY',this);" disabled="disabled">
				<option value="0">
					--请选择--
				</option>
				<c:forEach items="${payWays}" var="item">
				<c:if test="${ contractSchema.PAY_WAY eq item.CODE }">
					<option value="${item.CODE }"  selected="selected">
						${item.FLAG }
					</option>
					<input type="hidden" name="PAY_WAY" value="${contractSchema.PAY_WAY }"/>
				</c:if>
				</c:forEach>
			</select>
		</td>
		<!-- <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td><input type="text" value="<fmt:formatDate value="${paylist.START_DATE }" pattern="yyyy-MM-dd" />" id="START_DATE" name="START_DATE"></td>
		 -->
		 <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" readonly="readonly" value="<fmt:formatDate value="${contractSchema.START_DATE }" pattern="yyyy-MM-dd" />" id="FIRST_PAYDATE" name="FIRST_PAYDATE" onchange="checkStartDate()">
			<input type="hidden"  value="${contractSchema.ESTIMATES_PAY_DATE }" id="ESTIMATES_PAY_DATE">
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			差旅费
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="BUSINESS_TRIP_PRICE" value="<fmt:formatNumber value="${contractSchema.BUSINESS_TRIP_PRICE }" type="currency" />"
				id="business_trip_price" class="input_right" style="width: 150px;" readonly="readonly"/>
		</td>
		<!-- <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期支付日期
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" value="<c:choose><c:when test="${paylist.FIRST_PAYDATE eq null}"><fmt:formatDate value="${paylist.START_DATE }" pattern="yyyy-MM-dd" /></c:when><c:otherwise><fmt:formatDate value="${paylist.FIRST_PAYDATE }" pattern="yyyy-MM-dd" /></c:otherwise></c:choose>" id="FIRST_PAYDATE" name="FIRST_PAYDATE">
		</td>
		-->
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			首期支付日期
		</td>
		<td><input type="text" readonly="readonly" value="<c:choose><c:when test="${contractSchema.FIRST_PAYDATE eq null}"><fmt:formatDate value="${contractSchema.START_DATE }" pattern="yyyy-MM-dd" /></c:when><c:otherwise><fmt:formatDate value="${contractSchema.FIRST_PAYDATE }" pattern="yyyy-MM-dd" /></c:otherwise></c:choose>" id="START_DATE" name="START_DATE"></td>
		 
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			租赁物件设置场所
		</td>
		<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="EQUPMENT_ADDRESS" id="EQUPMENT_ADDRESS" value="${contractSchema.EQUPMENT_ADDRESS }"
				style="width: 300px;" readonly="readonly">
		</td>
	</tr>
	
	<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq contractSchema.SUPL_TRUE}">										
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
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<select name="DEAL_WAY" id="DEAL_WAY" disabled="disabled">
				<option value="0">
					--请选择--
				</option>
				<c:forEach items="${dealWays}" var="item">
				<c:if test="${ contractSchema.DEAL_WAY eq item.CODE }"> 
					<option value="${item.CODE }" selected="selected">
						${item.FLAG }
					</option>
					<input type="hidden" name="DEAL_WAY" value="${contractSchema.DEAL_WAY }"/>
				</c:if>
				</c:forEach>
			</select>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<input type="hidden" name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY" value="0"><input type="hidden" name="BUY_INSURANCE_TIME" id="BUY_INSURANCE_TIME" value="0"><input type="hidden" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="0.00"></td>
		<!--  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买方式
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<select name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY">
				<option value="1" <c:if test="${ paylist.BUY_INSURANCE_WAY eq 1 }"> selected="selected"</c:if>>
					自购
				</option>
				<option value="2" <c:if test="${ paylist.BUY_INSURANCE_WAY eq 2 }"> selected="selected"</c:if>>
					代购
				</option>
			</select>
		</td>-->
	</tr>
	<input type="hidden" name="INSURANCE_COMPANY_ID" id="INSURANCE_COMPANY_ID" value="1" />
	<%-- <tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险公司
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
		
			<select name="INSURANCE_COMPANY_ID" id="INSURANCE_COMPANY_ID" disabled="disabled">
				<option value="0">--请选择--</option>
				<c:forEach items="${insureCompanyList}" var="item">
				<c:if test="${ contractSchema.INSURANCE_COMPANY_ID eq item.INCP_ID }">
					<option value="${item.INCP_ID }"  selected="selected">${item.INCP_NAME }</option>
					<input type="hidden" name="INSURANCE_COMPANY_ID" value="${contractSchema.INSURANCE_COMPANY_ID }"/>
				</c:if>
				</c:forEach>
			</select>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
		<!--  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			购买时间
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="radio" name="BUY_INSURANCE_TIME" value="1"  <c:if test="${ paylist.BUY_INSURANCE_TIME eq 1 }">checked="checked"</c:if>>
			&nbsp;全年购买 &nbsp;&nbsp;
			<input type="radio" name="BUY_INSURANCE_TIME" value="2" <c:if test="${ paylist.BUY_INSURANCE_TIME eq 2 }">checked="checked"</c:if>>
			&nbsp;分年购买
		</td>-->
	</tr> --%>
	<!--  <tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险返利百分比
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="${paylist.INSURE_REBATE_RATE }"
				style="width: 40px;">
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
