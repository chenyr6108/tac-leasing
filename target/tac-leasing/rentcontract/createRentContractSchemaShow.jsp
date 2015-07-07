<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript"> 
var baseRate = ${baseRateJson} 

			function checkTime(){
				var startDate = $("#START_DATE").val()
				var nowDate=new Date().format("yyyy-MM-dd");
				
				if(startDate<nowDate){
					alert("请选择今天之后的日期作为起租日期");
					//提示后清空
					$("#START_DATE").val("") ;		
				}	
												
			}
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
	//		function changePledgeAvePrice(){
	//			var pem=parseFloat($("#PLEDGE_ENTER_MCTOAG").val().replace(/[￥,]/g, ''));
	//			var pea=parseFloat($("#PLEDGE_ENTER_AG").val().replace(/[￥,]/g, ''));
	//			var pap = parseFloat($("#PLEDGE_AVE_PRICE").val().replace(/[￥,]/g, ''));
	//			if((pem != null && pem != '') || (pea != null && pea != '')){
	//				$("#PLEDGE_AVE_PRICE").val(pem + pea) ;
	//			}
	//		}

	function cannel(){
		return false;
	}
	
	//Add by Michael 2012 5-15 增加保险公司 的购买方式绑定
	function changeInsuranceCompany(insuranceCompany){

		if (insuranceCompany.value=="3"){
			document.getElementById("BUY_INSURANCE_TIME").value="2";
		}else if(insuranceCompany.value=="5"){
			document.getElementById("BUY_INSURANCE_TIME").value="1";
		}else{
			document.getElementById("BUY_INSURANCE_TIME").value="0";
		}
	}
	

</script>
<table width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
		<input type="hidden" name="RECS_ID" value="${schema.RECS_ID }">
			<b>&nbsp;&nbsp;融资租赁方案</b>
		</td>
	</tr>
	<tr>
		<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
			租赁期数
		</td>
		<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
			${schema.LEASE_PERIOD }
			<input type="hidden" name="LEASE_PERIOD" onchange="changeField('LEASE_PERIOD',this);"  id="LEASE_PERIOD" value="${schema.LEASE_PERIOD }"
				style="width: 60px;">
		</td>
		<td width="17%" class="ui-widget-content jqgrow ui-row-ltr">
			租赁周期
		</td>
		<td width="43%" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${schema.LEASE_TERM eq 1 }">
					月份
					<input type="hidden" name="LEASE_TERM" value="1"/>
				</c:if>
				<c:if test="${schema.LEASE_TERM eq 2 }">
					双月
					<input type="hidden" name="LEASE_TERM" value="2"/>
				</c:if>
				<c:if test="${schema.LEASE_TERM eq 3 }">
					季度
					<input type="hidden" name="LEASE_TERM" value="3"/>
				</c:if>
				<c:if test="${schema.LEASE_TERM eq 6 }">
					半年
					<input type="hidden" name="LEASE_TERM" value="6"/>
				</c:if>
				<c:if test="${schema.LEASE_TERM eq 12 }">
					年度
					<input type="hidden" name="LEASE_TERM" value="12"/>
				</c:if>
			</select>
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			保证金
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="PLEDGE_PRICE_RATE" onchange="changeField('PLEDGE_PRICE_RATE',this);" id="PLEDGE_PRICE_RATE" value="${schema.PLEDGE_PRICE_RATE }"
				style="width: 80px;">
			${schema.PLEDGE_PRICE_RATE }%${schema.PLEDGE_PRICE }
			<input type="hidden" name="PLEDGE_PRICE" onchange="changeField('PLEDGE_PRICE',this);" id="PLEDGE_PRICE" value="<fmt:formatNumber value="${schema.PLEDGE_PRICE }" type="currency" />"
				class="input_right">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="PLEDGE_REALPRIC"   id="PLEDGE_REALPRIC" value="<fmt:formatNumber value="${schema.PLEDGE_REALPRIC }" type="currency" />"
				class="input_right">
		</td>
	</tr>
	<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				用于平均抵冲金额
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_AVE_PRICE ?0:schema.PLEDGE_AVE_PRICE }" />
				<input type="hidden" id="PLEDGE_AVE_PRICE" name="PLEDGE_AVE_PRICE" onchange="changeRZE();changePledgeRealPrice();"
					value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_AVE_PRICE ?0:schema.PLEDGE_AVE_PRICE }" />" style="text-align: right">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				用于期末退还金额
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_BACK_PRICE ?0 :schema.PLEDGE_BACK_PRICE }" />
				<input type="hidden" id="PLEDGE_BACK_PRICE" name="PLEDGE_BACK_PRICE" 
					value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_BACK_PRICE ?0 :schema.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				用于最后抵冲含税金额/期数
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber pattern='#,##0.00' value="${(empty schema.PLEDGE_LAST_PRICE?0:schema.PLEDGE_LAST_PRICE)+(empty schema.PLEDGE_LAST_PRICE_TAX?0:schema.PLEDGE_LAST_PRICE_TAX) }" />/
				${empty schema.PLEDGE_LAST_PERIOD?0:schema.PLEDGE_LAST_PERIOD }
				<input type="hidden" id="PLEDGE_LAST_PRICE" name="PLEDGE_LAST_PRICE" onchange="changeRZE();changePledgeRealPrice();"
					value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_LAST_PRICE?0:schema.PLEDGE_LAST_PRICE }" />" style="text-align: right">
				<input type="hidden" name="PLEDGE_LAST_PERIOD" size="8"
					value="${empty schema.PLEDGE_LAST_PERIOD?0:schema.PLEDGE_LAST_PERIOD }" style="text-align: center;">
				<input type="hidden" name="PLEDGE_LAST_PRICE_TAX" size="30"
					value="${empty schema.PLEDGE_LAST_PRICE_TAX?0:schema.PLEDGE_LAST_PRICE_TAX }" style="text-align: center;">
			</td>
			<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				延迟拨款期数<!--	收入时间 -->
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="DEFER_PERIOD" size="8"
					value="${empty schema.DEFER_PERIOD?0:schema.DEFER_PERIOD }" style="text-align: center;" readonly>
				<!-- 第${empty schema.PLEDGE_PERIOD?0:schema.PLEDGE_PERIOD }--><input type="hidden" name="PLEDGE_PERIOD" size="8"
					value="${empty schema.PLEDGE_PERIOD?0:schema.PLEDGE_PERIOD }" style="text-align: center;">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				保证金入账
			</td>
			<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty schema.PLEDGE_ENTER_WAY or schema.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="PLEDGE_ENTER_CMPRICE" name="PLEDGE_ENTER_CMPRICE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_CMPRICE?0:schema.PLEDGE_ENTER_CMPRICE}" />">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_CMPRICE?0:schema.PLEDGE_ENTER_CMPRICE}" />
				&nbsp;&nbsp;税金&nbsp;
				<input type="hidden" name="PLEDGE_ENTER_CMRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_CMRATE?0:schema.PLEDGE_ENTER_CMRATE}"/>">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_CMRATE?0:schema.PLEDGE_ENTER_CMRATE}"/>
				&nbsp;&nbsp;我司入供应商&nbsp;
				<input type="hidden" id="PLEDGE_ENTER_MCTOAG" name="PLEDGE_ENTER_MCTOAG"  style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_MCTOAG?0:schema.PLEDGE_ENTER_MCTOAG}" />">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_MCTOAG?0:schema.PLEDGE_ENTER_MCTOAG}" />
				&nbsp;&nbsp;税金&nbsp;
				<input type="hidden" id="PLEDGE_ENTER_MCTOAGRATE" name="PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_MCTOAGRATE?0:schema.PLEDGE_ENTER_MCTOAGRATE}" />" onchange="judgeRatePrice();">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_MCTOAGRATE?0:schema.PLEDGE_ENTER_MCTOAGRATE}" />
				<br>
				<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="2" <c:if test="${schema.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;
				<input type="hidden" id="PLEDGE_ENTER_AG" name="PLEDGE_ENTER_AG"  style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_AG?0:schema.PLEDGE_ENTER_AG }"/>">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_AG?0:schema.PLEDGE_ENTER_AG }"/>
				&nbsp;&nbsp;税金&nbsp;
				<input type="hidden" name="PLEDGE_ENTER_AGRATE"  onchange="update2222();" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_AGRATE?0:schema.PLEDGE_ENTER_AGRATE}" />">
				<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_ENTER_AGRATE?0:schema.PLEDGE_ENTER_AGRATE}" />
			</td>
		</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			首期租金
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
		<input type="hidden" name="HEAD_HIRE_PERCENT"  onchange="changeField('HEAD_HIRE_PERCENT',this);"  id="HEAD_HIRE_PERCENT" value="${schema.HEAD_HIRE_PERCENT }"
				style="width: 80px;">
			${schema.HEAD_HIRE_PERCENT }%<fmt:formatNumber value="${schema.HEAD_HIRE }" type="currency" />
			<input type="hidden" name="HEAD_HIRE" id="HEAD_HIRE"  onchange="changeField('HEAD_HIRE',this);"
				class="input_right" 
				value="<fmt:formatNumber value="${schema.HEAD_HIRE }" type="currency" />">
		<!--  
			<input type="hidden" name="MANAGEMENT_FEE_RATE" onchange="changeField('MANAGEMENT_FEE_RATE',this);" value="${schema.MANAGEMENT_FEE_RATE}"
				id="MANAGEMENT_FEE_RATE" style="width: 80px;">
			${schema.MANAGEMENT_FEE_RATE}%<fmt:formatNumber value="${schema.MANAGEMENT_FEE }" type="currency" />
			<input type="hidden" name="MANAGEMENT_FEE" onchange="changeField('MANAGEMENT_FEE',this);" id="MANAGEMENT_FEE" value="<fmt:formatNumber value="${schema.MANAGEMENT_FEE }" type="currency" />"
				class="input_right" >
		-->
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${schema.TAX_PLAN_CODE eq '5' or schema.TAX_PLAN_CODE eq '7' }">佣金</c:if>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${schema.TAX_PLAN_CODE eq '5' or schema.TAX_PLAN_CODE eq '7' }">${SALES_PAY }</c:if>
		</td>
	</tr>
	<c:if test="${schema.TAX_PLAN_CODE eq '5' }">
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
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 利率上浮比率 -->
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="FLOAT_RATE" onchange="changeField('FLOAT_RATE',this);" id="FLOAT_RATE" value="${schema.FLOAT_RATE }"
				style="width: 80px;display: none;">
			${schema.FLOAT_RATE }%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			合同利率
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="YEAR_INTEREST" onchange="changeField('YEAR_INTEREST',this);"  id="YEAR_INTEREST" value="${schema.YEAR_INTEREST }"
				style="width: 80px;">
			${schema.YEAR_INTEREST }% &nbsp;&nbsp;
			<input type="radio" name="YEAR_INTEREST_TYPE" onclick="return false;" value="1" <c:if test="${schema.YEAR_INTEREST_TYPE eq 1}">checked="checked"</c:if>>
			&nbsp;浮动 &nbsp;&nbsp;
			<input type="radio" name="YEAR_INTEREST_TYPE" onclick="return false;" value="2" <c:if test="${schema.YEAR_INTEREST_TYPE eq 2}">checked="checked"</c:if>>
			&nbsp;固定
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>客户TR</b></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
			<input type="hidden" name="TR_RATE" value="${schema.TR_RATE }">
			<input type="hidden" name="TR_IRR_RATE" value="${schema.TR_IRR_RATE }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="RED"><b>实际TR</b></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
		</td>
	</tr>
	<!-- 
	<tr style="display: none;">
		<td class="ui-widget-content jqgrow ui-row-ltr">
			印花税租赁总价比率
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="STAMP_TAX_TOPRIC" id="STAMP_TAX_TOPRIC" value="${empty schema.STAMP_TAX_TOPRIC ? 0.03 : schema.STAMP_TAX_TOPRIC }" style="width: 80px;">
			%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			印花税租金总计比率
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="STAMP_TAX_MONTHPRIC" id="STAMP_TAX_MONTHPRIC" value="${empty schema.STAMP_TAX_MONTHPRIC ? 0.1 : schema.STAMP_TAX_MONTHPRIC }"
				style="width: 80px;">
			%&nbsp;&nbsp;印花税保险比率&nbsp;&nbsp;
			<input type="text" name="STAMP_TAX_INSUREPRIC" id="STAMP_TAX_INSUREPRIC" value="${empty schema.STAMP_TAX_INSUREPRIC ? 0.1 : schema.STAMP_TAX_INSUREPRIC }"
				style="width: 80px;">
			%
		</td>
	</tr>
	 -->
	<tr>

		<td class="ui-widget-content jqgrow ui-row-ltr">
			概算成本（RZE）
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${schema.LEASE_RZE }" type="currency" />
			<input type="hidden" name="LEASE_RZE" readonly="readonly" id="LEASE_RZE" value="<fmt:formatNumber value="${schema.LEASE_RZE }" type="currency" />"
				class="input_right" style="width: 100px;">
		</td>
		<!-- Modify by Michael 增加利差 -->
		<td class="ui-widget-content jqgrow ui-row-ltr">
			利差&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${empty schema.RATE_DIFF ? 0 :schema.RATE_DIFF }" type="currency" />
			<input type="hidden" name="RATE_DIFF" value="${empty schema.RATE_DIFF ? 0 :schema.RATE_DIFF }">&nbsp;
		</td>
	</tr>

	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			支付方式
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<!-- <select name="PAY_WAY" id="PAY_WAY" onchange="changeField('PAY_WAY',this);" readonly="true">
				<option value="-1">
					--请选择--
				</option> -->
				<c:forEach items="${payWays}" var="item">
					<%-- <option value="${item.CODE }"  --%>
					<c:if test="${ schema.PAY_WAY eq item.CODE }"> <!-- selected="selected" -->
						${item.FLAG }
						<input type="hidden" name="PAY_WAY" value="${item.CODE }"/>
					</c:if><!-- > -->
						
					</option>
				</c:forEach>
			<!-- </select> -->
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			起租日期
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="START_DATE" id="START_DATE" value="<fmt:formatDate value="${schema.START_DATE }" pattern="yyyy-MM-dd" />"
				style="width: 100px;" readonly="readonly" onchange="checkStartDate()">
			<input type="hidden" name="ESTIMATES_PAY_DATE" id="ESTIMATES_PAY_DATE" value="${schema.ESTIMATES_PAY_DATE }" >
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			差旅费
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="BUSINESS_TRIP_PRICE"  value="<fmt:formatNumber value="${schema.BUSINESS_TRIP_PRICE }" type="currency" />"
				id="BUSINESS_TRIP_PRICE" class="input_right" style="width: 80px;">
			<fmt:formatNumber value="${schema.BUSINESS_TRIP_PRICE }" type="currency" />
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			租赁物件设置场所
		</td>
		<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			${schema.EQUPMENT_ADDRESS }
			<input type="hidden" name="EQUPMENT_ADDRESS" id="EQUPMENT_ADDRESS" value="${schema.EQUPMENT_ADDRESS }"
				style="width: 600px;">
		</td>
	</tr>
	<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						<!-- <select name="SUPL_TRUE" disabled="disabled"> -->
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schema.SUPL_TRUE}">
										<%-- <option value="${item.CODE }" selected="selected"> --%>
											${item.FLAG }
											<input type="hidden" name="SUPL_TRUE" value="${item.CODE }"/>
										<!-- </option> -->
									</c:when>
									<%-- <c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise> --%>
								</c:choose>
							</c:forEach>
						</select>
					</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			租赁期满处理方式
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" colspan="3">
			<!-- <select name="DEAL_WAY" id="DEAL_WAY" disabled="disabled">
				<option value="-1">
					--请选择--
				</option> -->
				<c:forEach items="${dealWays}" var="item">
					<%-- <option value="${item.CODE }"  --%>
					<c:if test="${ schema.DEAL_WAY eq item.CODE }"><!--  selected="selected" -->
						${item.FLAG }
						<input type="hidden" name="DEAL_WAY" value="${item.CODE }"/>
					</c:if><!-- > -->
					</option>
				</c:forEach>
			</select>
		</td>
		<!-- <td class="ui-widget-content jqgrow ui-row-ltr">
			购买方式
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<select name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY">
				<option value="1" <c:if test="${ schema.BUY_INSURANCE_WAY eq 1 }"> selected="selected"</c:if>>
					自购
				</option>
				<option value="2" <c:if test="${ schema.BUY_INSURANCE_WAY eq 2 }"> selected="selected"</c:if>>
					代购
				</option>
			</select>
		</td>  -->
	</tr>
	<tr style="display: none;">
		<td class="ui-widget-content jqgrow ui-row-ltr">
			保险公司
		</td>
		<td  class="ui-widget-content jqgrow ui-row-ltr">
			<select name="INSURANCE_COMPANY_ID" id="INSURANCE_COMPANY_ID" onchange="changeInsuranceCompany(this);">
				<option value="0">--请选择--</option>
				<c:forEach items="${insureCompanyList}" var="item">
					<option value="${item.INCP_ID }" <c:if test="${ schema.INSURANCE_COMPANY_ID eq item.INCP_ID }"> selected="selected"</c:if>>${item.INCP_NAME }</option>
				</c:forEach>
			</select>
		</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
			购买时间
		</td>
		<input type="hidden" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="0.00">
		<input type="hidden" name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY" value="0"></td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<select name="BUY_INSURANCE_TIME" id="BUY_INSURANCE_TIME">
				<option value="1" <c:if test="${ schema.BUY_INSURANCE_TIME eq 1 || schema.INSURANCE_COMPANY_ID eq 5}">selected="selected"</c:if>>全年购买</option>
				<option value="2" <c:if test="${ schema.BUY_INSURANCE_TIME eq 2 || schema.INSURANCE_COMPANY_ID eq 3}">selected="selected"</c:if>>分年购买</option>
			</select>
			<%-- <input type="radio" name="BUY_INSURANCE_TIME" onclick="return false;" value="1"  <c:if test="${ schema.BUY_INSURANCE_TIME != 2 }">checked="checked"</c:if>>
			&nbsp;全年购买 &nbsp;&nbsp;
			<input type="radio" name="BUY_INSURANCE_TIME" onclick="return false;" value="2" <c:if test="${ schema.BUY_INSURANCE_TIME eq 2 }">checked="checked"</c:if>>
			&nbsp;分年购买 --%>
		</td>
	</tr>
	<!-- <tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			保险返利百分比
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="${schema.INSURE_REBATE_RATE }"
				style="width: 40px;">
			%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>-->
	</tr> 
	<input type="hidden" name="TAX_PLAN_CODE" value="${schema.TAX_PLAN_CODE }" id="TAX_PLAN_CODE"/>	
</table>
