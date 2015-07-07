<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<title>尽职调查报告</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
		<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>

		<script type="text/javascript">			
		$(function (){
			if($("#TAX_PLAN_CODE").val()==4) {
				$("#lab1").html("用于一次抵冲租金");
			} else {
				$("#lab1").html("用于平均抵冲金额");
			}
		});
		function saveReScheme() {

			form=document.schemeForm;
			
			if(form.H_CONTRACT_TYPE.value=="5"){
			    if (notPositive(form.PLEDGE_ENTER_AGRATE, '保证金税金入供应商')) {
			        return;
			    }
			    if(parseInt(form.PLEDGE_ENTER_AGRATE.value)<=0){
			    	alert("请输入保证金税金入供应商金额");
			    	return false;
			    }
			    
			    if (notPositive(form.PLEDGE_AVE_PRICE, '平均冲抵保证金')) {
			        return;
			    }
			    if (notPositive(form.BEGMONEY, '申请拨款金额')) {
			        return;
			    }
			  
			    if((form.TOTAL_TAX_LEASEPRICE.value-form.BEGMONEY.value-form.PLEDGE_AVE_PRICE.value)!=form.PLEDGE_ENTER_AGRATE.value){
			    	alert("保证金税金入供应商部分与拨款金额、设备含税总价款不一致");
			    	return;
			    }
			}
			
		    if (notPositive(form.PLEDGE_ENTER_CMRATE, '保证金税金入我司')) {
		        return;
		    }
			var PLEDGE_LAST_PERIOD = parseInt(form.PLEDGE_LAST_PERIOD.value);
			var PLEDGE_LAST_PRICE_TAX = parseInt(form.PLEDGE_LAST_PRICE_TAX.value);
			
			//Add by Michael 2013 01-08 如有期末抵充，则要在入我司税金keyIn相应金额
			if (PLEDGE_LAST_PERIOD>0){
				if (form.PLEDGE_ENTER_CMRATE.value!=parseInt(form.PLEDGE_ENTER_CMRATE.value)){ 
					alert("保证金税金入我司部分不能输入小数");
					return false;
				}
				if (parseInt(form.PLEDGE_ENTER_CMRATE.value)<PLEDGE_LAST_PRICE_TAX){ 
					alert("有期末抵充时，保证金税金入我司部分要大于或等于"+PLEDGE_LAST_PRICE_TAX);
					return false;
				}
			}
			
			if(form.TAX_PLAN_CODE.value=="2" && (form.TOTAL_VALUEADDED_TAX.value=="" || form.TOTAL_VALUEADDED_TAX.value==0)){
				alert("此案增值税没有测算出来，请到租金测算中将方案加入对比后保存后再提交！");
				return false;
			}
			
			form.RATE_DIFF.value=parseCurrency(form.RATE_DIFF.value);
			if (form.RATE_DIFF.value !=parseCurrency(form.RATE_DIFF_OLD.value)){
				var strMsg="此次提交计算出的利差为："+form.RATE_DIFF.value+"与上次方案计算出的利差"+form.RATE_DIFF_OLD.value+"不一致是否确认提交"
				if (confirm(strMsg))  {  

				}else{
					return false;
				}
			}
			
		    form.submit();
		}		
		
		</script>
	</head>

	<body>
		<form action="../servlet/defaultDispatcher" name="schemeForm" id="form1" method="post">
			<input type="hidden" name="__action" value="creditReportVip.createReScheme">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${creditMap.CONTRACT_TYPE }">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
	
			<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="12" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户购买意向</strong>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>厂牌</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>制造商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>产品名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>规格型号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>留购价(元)</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>含税单价(元)</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>单价(元)</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong> 数量</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong> 单位</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong> 合计</strong>
					</th>
					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>锁码方式</strong>
					</th> 
				</tr>
				<c:set value="0" var="TOTAL_TAX_LEASEPRICE"/>
				<c:forEach items="${equipmentsList}" var="item" varStatus="status">
					<tr>
						<td  class="ui-widget-content jqgrow ui-row-ltr">
							${item.BRAND } &nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							${item.THING_KIND }  &nbsp; 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							${item.MANUFACTURER }  &nbsp; 
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr">
							${item.THING_NAME } &nbsp;
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr">
							${item.MODEL_SPEC }  &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.SHUI_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							${item.AMOUNT } &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"> 
							${item.UNIT} &nbsp;
						</td>
						<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" /> &nbsp;
						</td>
						<c:set value="${TOTAL_TAX_LEASEPRICE + (item.SHUI_PRICE * item.AMOUNT) }" var="TOTAL_TAX_LEASEPRICE" />
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<c:forEach items="${lockList}" var="items">
								<c:if test="${item.LOCK_CODE eq items.CODE}">${items.FLAG }</c:if>
							</c:forEach>&nbsp;
						</td> 
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="leaseTopricBig"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${schemeMap.LEASE_TOPRIC });</script>
					</td>
					<td colspan="6" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）
						<input name="LEASE_TOPRIC" readonly="readonly" value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC }" />" id="LEASE_TOPRIC" style="text-align: right;">
						<input type="hidden" name="TOTAL_TAX_LEASEPRICE" value="${TOTAL_TAX_LEASEPRICE }">
					</td>
				</tr>
				
			</table>
			
			<table align="center" width="1300" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">					
				<tr style="display: block" id="shownowgranthidden">
					<td colspan="12" width="1300" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose><c:when test="${supperGrantMap eq null }">&nbsp;</c:when>			
							 
						<c:otherwise>
						<div >当前供应商：${supperGrantMap.SUPNAME }的授信额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${supperGrantMap.GRANT_PRICE }" type="currency"/>授信余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${supperGrantMap.LAST_PRICE }" type="currency"/>&nbsp;</div>
						</c:otherwise></c:choose>
					</td>	
				</tr>
				<c:choose><c:when test="${custGrantMap eq null }">
				<tr>
					<td colspan="12" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
					当前客户没有授信
					</td>
				</tr>
				</c:when><c:otherwise>
				<tr>
					<td colspan="12" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose><c:when test="${custGrantMap.GRANT_PRICE eq null }">当前客户：${custGrantMap.CUST_NAME }没有授信</c:when>
						<c:otherwise>当前客户：${custGrantMap.CUST_NAME }的授信额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.GRANT_PRICE}" type="currency"/>
						</c:otherwise></c:choose>
						<c:choose><c:when test="${supperGrantMap.LAST_PRICE eq null}">&nbsp;</c:when>
						<c:otherwise>授信余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.LAST_PRICE }" type="currency"/>
						</c:otherwise></c:choose>
					</td>
				</tr>
				</c:otherwise></c:choose>				
				<tr style="display: none" id="shownowgranttr" >
					<td colspan="12" class="ui-widget-content jqgrow ui-row-ltr">
						<div id="shownowgrant"></div>&nbsp;
					</td>
				</tr>
				<tr  id="custgrant" style="display: none;text-align: left" >
					<td colspan="12" class="ui-widget-content jqgrow ui-row-ltr">
						 <div id="showcustgrant"></div><input type="hidden" id="custgrantprice" value="${custGrantMap.LAST_PRICE }"/><input type="hidden" id="custgrantprices" value="${custGrantMap.GRANT_PRICE }"/>&nbsp;
					</td>
				</tr>
			</table>
			<br />
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="left" colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>租赁方案</strong>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁期数
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="LEASE_TERM" id="LEASE_TERM" value="${schemeMap.LEASE_PERIOD }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁周期
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<select name='LEASE_COURSE_OLD' onchange="updateYearInterest();updateManagementFee();" disabled>
							<option value="1" <c:if test="${schemeMap.LEASE_COURSE eq 1}">selected='selected'</c:if>>
								-月份-
							</option>
							<option value="2" <c:if test="${schemeMap.LEASE_COURSE eq 2}">selected='selected'</c:if>>
								-双份-
							</option>
							<option value="3" <c:if test="${schemeMap.LEASE_COURSE eq 3}">selected='selected'</c:if>>
								-季度-
							</option>
							<option value="6" <c:if test="${schemeMap.LEASE_COURSE eq 6}">selected='selected'</c:if>>
								-半年-
							</option>
							<option value="12" <c:if test="${schemeMap.LEASE_COURSE eq 12}">selected='selected'</c:if>>
								-年度-
							</option>
						</select>
						<input type="hidden" name="LEASE_COURSE" value="${schemeMap.LEASE_COURSE }"/>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="PLEDGE_PRICE_RATE" size="8"
							value="${empty schemeMap.PLEDGE_PRICE_RATE ? 0 : schemeMap.PLEDGE_PRICE_RATE }"  onchange="updatePledgePrice();updatePledgeRealPrice();">
						%
						<input readonly="readonly" type="text" name="PLEDGE_PRICE" id="PLEDGE_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_PRICE?0:schemeMap.PLEDGE_PRICE }" />" onchange="updatePledgePriceRate();updatePledgeRealPrice();" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="PLEDGE_REALPRIC" 
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_REALPRIC ? 0 : schemeMap.PLEDGE_REALPRIC }" />" style="text-align: right">&nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<span id="lab1" style="font-size: 14px;">用于平均抵冲金额</span>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="PLEDGE_AVE_PRICE" id="PLEDGE_AVE_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_AVE_PRICE ?0:schemeMap.PLEDGE_AVE_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="PLEDGE_BACK_PRICE" id="PLEDGE_BACK_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_BACK_PRICE ?0 :schemeMap.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于最后抵冲期数                                  
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="hidden" name="PLEDGE_LAST_PRICE" id="PLEDGE_LAST_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_LAST_PRICE?0:schemeMap.PLEDGE_LAST_PRICE }" />" style="text-align: right">
						<input readonly="readonly" type="text" name="PLEDGE_LAST_PERIOD" size="8"
							value="${empty schemeMap.PLEDGE_LAST_PERIOD?0:schemeMap.PLEDGE_LAST_PERIOD }" style="text-align: center;">
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						延迟拨款期数<!--	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<select name="DEFER_PERIOD" id="DEFER_PERIOD">
							<option value="0" <c:if test="${empty schemeMap.DEFER_PERIOD and schemeMap.DEFER_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="${schemeMap.LEASE_PERIOD }" step="1">
							  <option value="${i }" <c:if test="${not empty schemeMap.DEFER_PERIOD and schemeMap.DEFER_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select> 
						<input type="hidden" name="PLEDGE_PERIOD" size="8"
							value="${empty schemeMap.PLEDGE_PERIOD?0:schemeMap.PLEDGE_PERIOD }" style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty schemeMap.PLEDGE_ENTER_WAY or schemeMap.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_CMPRICE" id="PLEDGE_ENTER_CMPRICE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMPRICE?0:schemeMap.PLEDGE_ENTER_CMPRICE}" />" >&nbsp;&nbsp;税金&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_CMRATE"  style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMRATE?0:schemeMap.PLEDGE_ENTER_CMRATE}" />">&nbsp;&nbsp;我司入供应商&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_MCTOAG" id="PLEDGE_ENTER_MCTOAG"  onchange="updatePrice1();" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAG?0:schemeMap.PLEDGE_ENTER_MCTOAG}" />">&nbsp;&nbsp;税金&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAGRATE?0:schemeMap.PLEDGE_ENTER_MCTOAGRATE}" />">
						<br>
						<!--<input type="radio" name="PLEDGE_ENTER_WAY"  value="2" <c:if test="${schemeMap.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_AG" id="PLEDGE_ENTER_AG" style="text-align: right;"  onchange="updatePrice1();" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AG?0:schemeMap.PLEDGE_ENTER_AG }" />">&nbsp;&nbsp;税金&nbsp;
						<input readonly="readonly" type="text" name="PLEDGE_ENTER_AGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AGRATE?0:schemeMap.PLEDGE_ENTER_AGRATE}" />">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						首期租金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
					<input readonly="readonly" type="text" name="HEAD_HIRE_PERCENT" size="8"
							value="${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT}"  onchange="updateHeadHire();">
						%
						<input readonly="readonly" type="text" name="HEAD_HIRE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE}" />" onchange="updateHeadHirePercent();" style="text-align: right">

					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;&nbsp;&nbsp;
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
								<input readonly="readonly" type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
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
							<input readonly="readonly" type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
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
						<input readonly="readonly" type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
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
							<input readonly="readonly" type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
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
						<!-- 利率上浮比例 -->
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="FLOAT_RATE" size="8"
							value="${schemeMap.FLOAT_RATE }" onchange="updateYearInterest();" style="display: none;">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						合同利率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="YEAR_INTEREST" size="8"
							value="${schemeMap.YEAR_INTEREST }" onchange="updateFloatRate();">
						%
						<input type="radio" name="YEAR_INTEREST_TYPE" value="1" <c:if test="${empty schemeMap or empty schemeMap.YEAR_INTEREST_TYPE or schemeMap.YEAR_INTEREST_TYPE eq 1}">checked="checked"</c:if> >浮动
						<input type="radio" name="YEAR_INTEREST_TYPE" value="2" <c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 2}">checked="checked"</c:if> >固定
					</td>
					
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b>客户TR</b></font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"><!-- Modify by Michael 2012 1/9 进入修改页面时重新计算TR -->
					<b>&nbsp;<!-- <fmt:formatNumber value="${schemeMap.TR_RATE }" pattern="##0.000"></fmt:formatNumber> -->
						<fmt:formatNumber value="${paylist.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;&nbsp;</b>%
						<input type="hidden" name="TR_RATE" value="${empty paylist.TR_RATE ? 0 : paylist.TR_RATE }">
						<input type="hidden" name="TR_IRR_RATE" value="${empty paylist.TR_IRR_RATE ? 0 : paylist.TR_IRR_RATE }">
					<c:set value="0" var="RATE_DIFF"></c:set>
					<c:forEach items="${paylist.paylines }" var="item111" varStatus="status">
						<c:set value="${RATE_DIFF + item111.PV_PRICE}" var="RATE_DIFF"></c:set>
					</c:forEach>
					<input type="text" name="RATE_DIFF" value="<fmt:formatNumber value="${RATE_DIFF }" type="currency" maxFractionDigits="0" />" readonly="readonly">
					<!--  Modify by Mcihael 2012 02/06 增加利差  -->
					<input type="hidden" name="RATE_DIFF_OLD" value="${empty schemeMap.RATE_DIFF ? 0 : schemeMap.RATE_DIFF }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b>实际TR</b></font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"><!-- Modify by Michael 2012 1/9 进入修改页面时重新计算TR -->
						<b>&nbsp;&nbsp;<!--  <fmt:formatNumber value="${schemeMap.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber> --><fmt:formatNumber value="${paylist.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
					</td>
					
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						概算成本（RZE）
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="LEASE_RZE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_RZE }" />" onchange="setFormatCurrency(this);" style="text-align: right;" readonly="readonly">
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
						支付方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<select name="PAY_WAY_OLD" onchange="updateLeaseRZE();" disabled>
							<c:forEach items="${payWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.PAY_WAY}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
					<input type="hidden" name="PAY_WAY" value="${schemeMap.PAY_WAY }"/>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						预估起租日
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="START_DATE" id="START_DATE" readonly="readonly" 
							value="<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd"/>" >
						 
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						介绍人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="SPONSOR" 
							value="${schemeMap.SPONSOR }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						发票人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="INVOICE_PERSON"
							value="${schemeMap.INVOICE_PERSON }">
					</td>
				</tr>
				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						差旅费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
					<c:choose><c:when test="${schemeMap.BUSINESS_TRIP_PRICE eq null}"><input readonly="readonly"  type="text" name="BUSINESS_TRIP_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="0" />" onchange="setFormatCurrency(this);" style="text-align: right;">
					</c:when> 
					<c:otherwise><input readonly="readonly"  type="text" name="BUSINESS_TRIP_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.BUSINESS_TRIP_PRICE }" />" onchange="setFormatCurrency(this);" style="text-align: right;">
					</c:otherwise></c:choose>					
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						申请拨款金额&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="BEGMONEY" id="BEGMONEY" onChange="updatePrice2();updateAppropiate0();updateAppropiate1();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC-schemeMap.PLEDGE_ENTER_MCTOAG-schemeMap.PLEDGE_ENTER_AG }" />"  style="text-align: right;">&nbsp;
					</td>
				</tr>
				<tr>
					<td  rowspan="2" class="ui-widget-content jqgrow ui-row-ltr">
						拨款方式（交机/设定情形）
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
					
						<input disabled  type="checkbox" name="APPROPRIATEFUNS"
							value="0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">checked="true"</c:if></c:forEach> style="text-align: right;">交机/设定前&nbsp;
							交机/设定前比例:<input readonly="readonly"  type="text" name="PAYPERCENT0" id="PAYPERCENT0"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="${item.PAYPERCENT}"</c:if></c:forEach>/>%&nbsp;
							交机/设定前拨款金额:<input readonly="readonly"  type="text" name="APPROPIATEMON0" id="APPROPIATEMON0"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="<fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/>"</c:if></c:forEach>  style="text-align: right;"/>
						    交机/设定前拨款给:<input readonly="readonly" type="text" name="APPRORIATENAME0" id="APPROPIATENAME0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="${item.APPRORIATENAME}"</c:if></c:forEach>  style="text-align: right;"/>
						
					</td>
				</tr>
				<tr>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">					
							<input disabled type="checkbox" name="APPROPRIATEFUNS"
							value="1"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">checked="true"</c:if></c:forEach>   style="text-align: right;">交机/设定后&nbsp;
							交机/设定后比例:<input readonly="readonly" type="text" name="PAYPERCENT1" id="PAYPERCENT1" onchange="updateAppropiate1();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="${item.PAYPERCENT}"</c:if></c:forEach>/>%&nbsp;
							交机/设定后拨款金额:<input readonly="readonly" type="text" name="APPROPIATEMON1" id="APPROPIATEMON1" onchange="updateAppropiate01();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="<fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/>"</c:if></c:forEach>  style="text-align: right;"/>
						    交机/设定后拨款给:<input readonly="readonly" type="text" name="APPRORIATENAME1" id="APPROPIATENAME1" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="${item.APPRORIATENAME}"</c:if></c:forEach>  style="text-align: right;"/>					
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						<select name="SUPL_TRUE_OLD" disabled>
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.SUPL_TRUE}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
				<tr>
				<input type="hidden" name="SUPL_TRUE" 	value="${schemeMap.SUPL_TRUE }">
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁物件设置场所
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						<input readonly="readonly" type="text" name="EQUPMENT_ADDRESS" size="115" id="EQUPMENT_ADDRESS"
							value="${schemeMap.EQUPMENT_ADDRESS }">&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						租赁期满处理方式
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<select name="DEAL_WAY_OLD" disabled>
							<c:forEach items="${dealWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.DEAL_WAY}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> &nbsp;
					</td>
					<input type="hidden" name="DEAL_WAY" 	value="${schemeMap.DEAL_WAY }">
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>								
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险公司
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						<select name="INSURANCE_COMPANY_ID_OLD" disabled>
							<c:forEach items="${insureCompanyList}" var="item">
								<c:choose>
									<c:when
										test="${item.INCP_ID eq schemeMap.INSURANCE_COMPANY_ID}">
										<option value="${item.COMPANY_ID }" selected="selected">
											${item.INCP_NAME }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.INCP_ID }">
											${item.INCP_NAME }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> &nbsp;
					</td>
					<input type="hidden" name="INSURANCE_COMPANY_ID" 	value="${schemeMap.INSURANCE_COMPANY_ID }">
					<input type="hidden" name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY" value="0">
					<input type="hidden" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="0.00">
					<input type="hidden" name="BUY_INSURANCE_TIME" id="BUY_INSURANCE_TIME" value="0">

				</tr>
			<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税费测算方案<font color="red">&nbsp;*</font>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
				<select name="TAX_PLAN_CODE" id="TAX_PLAN_CODE">
						<c:forEach items="${taxPlanList}" var="item">
							<option value="${item.CODE }"
								<c:if test="${ schemeMap.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
							</option>
						</c:forEach>
				</select>
				<input type="hidden" name="PLEDGE_LAST_PRICE_TAX" id="PLEDGE_LAST_PRICE_TAX" value="${empty paylist.PLEDGE_LAST_PRICE_TAX?0: paylist.PLEDGE_LAST_PRICE_TAX}">
				<input type="hidden" name="TAX_PLAN_CODE" id="TAX_PLAN_CODE" value="${schemeMap.TAX_PLAN_CODE }">
				<input type="hidden" name="TOTAL_VALUEADDED_TAX" id="TOTAL_VALUEADDED_TAX" value="${empty paylist.TOTAL_VALUEADDED_TAX?0: paylist.TOTAL_VALUEADDED_TAX}">
			</td>
		</tr>				
			<tr>
			<td colspan="4">
				<table id="irrMonthPriceTabTab1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
						</td>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						&nbsp;&nbsp;
						</td>
					</tr>
					<c:forEach var="item" items="${irrMonthPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								<input readonly="readonly" type="text"  name="PAY_IRR_MONTH_PRICE_TAB1" class="input_right"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								对应期次
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_MONTH_PRICE_START_TAB1" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END_TAB1" onchange="changeIrrMonthPriceEndTab1(this);">
									<c:forEach begin="1" end="${schemeMap.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
							
								<span name="delSpan"
										<c:if test="${status.count ne fn:length(irrMonthPaylines)}">style="display: none;"</c:if>
									></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
			</table>
			<BR />
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
				<tr>
					<td align="left" colspan="6"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保险费</strong>
					</td>
				</tr>
				<tr>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险项目
					</th>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险期间
					</th>
					<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险费率
					</th>
					<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险费用
					</th>
					<th width="27%" class="ui-state-default ui-th-ltr zc_grid_head">
						备注
					</th>
					<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<c:set value="0" var="insureTotal"></c:set>
				<c:forEach items="${insuresList}" var="item" varStatus="status">
					<tr>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="INSURE_ITEM${status.count }" name="INSURE_ITEM">
								<c:forEach items="${insureTypeList}" var="insureType">
									<c:choose>
										<c:when test="${insureType.INTP_ID eq item.INSURE_ITEM}">
											<option value="${insureType.INTP_ID }" selected="selected">
												${insureType.INTP_NAME }
											</option>
										</c:when>
										<c:otherwise>
											<option value="${insureType.INTP_ID }">
												${insureType.INTP_NAME }
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="START_DATE${status.count }" name="START_DATE_"
								size="11" value="${item.START_DATE }" />
							到
							<input id="END_DATE${status.count }" name="END_DATE" size="11"
								value="${item.END_DATE }" />
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_RATE${status.count }" name="INSURE_RATE"
								size="4" value="${item.INSURE_RATE }">
							%
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_PRICE${status.count }" name="INSURE_PRICE" onchange="changeInsurePrice();"
								size="15"  value="<fmt:formatNumber value="${item.INSURE_PRICE }" pattern="#,##0.00"/>" style="text-align: right">
							<c:set var="insureTotal" value="${insureTotal+item.INSURE_PRICE }"></c:set>	
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_MEMO${status.count }" name="INSURE_MEMO"
								size="25" value="${item.MEMO }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="left" colspan="4" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="insureTotalBig"></span>
					<script type="text/javascript">document.getElementById('insureTotalBig').innerHTML=atoc(${insureTotal});</script>
					</td>
					<td align="left" colspan="2" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）<input type="text" id="TOTAL_INSURE" readonly="readonly" value="<fmt:formatNumber value="${insureTotal}" pattern="#,##0.00"/>" style="text-align: right">
					</td>
				</tr>

			</table>

			<BR />
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
				<tr>
					<td align="left" colspan="3"   class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>其他费用</strong>
					</td>
					<td align="left" colspan="2"   class="ui-state-default ui-th-ltr zc_grid_head">
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						
					</td>
				</tr>
				<tr>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head">
						费用名称
					</th>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head">
						费用金额
					</th>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head">
						产生费用时间
					</th>
					<th width="35%"  class="ui-state-default ui-th-ltr zc_grid_head">
						备注
					</th>
					<th width="5%"  class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<c:set var="totalOtherPrice" value="0" />
				<c:forEach items="${otherPriceList}" var="otherPrice"
					varStatus="status">
					<tr>
						<td align="center"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input readonly="readonly" id="OTHER_NAME${status.count }" name="OTHER_NAME"
								value="${otherPrice.OTHER_NAME }" />
						</td>
						<td align="center"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input readonly="readonly" id="OTHER_PRICE${status.count }" name="OTHER_PRICE"
								value="<fmt:formatNumber value="${otherPrice.OTHER_PRICE }" pattern="#,##0.00"/>" onchange="changeOtherPrice();" style="text-align: right">
							<c:set var="totalOtherPrice" value="${otherPrice.OTHER_PRICE+totalOtherPrice }" />
						</td>
						<td align="center"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input readonly="readonly" id="OTHER_DATE${status.count }" name="OTHER_DATE"  readonly='readonly'
								value="<fmt:formatDate pattern="yyyy-MM-dd" value="${otherPrice.OTHER_DATE }"/>">
						</td>
						<td align="center"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input readonly="readonly" id="OTHER_MEMO${status.count }" name="OTHER_MEMO"
								size="30" value="${otherPrice.MEMO }">
						</td>
						<td align="center"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="left" colspan="3"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="totalOtherPriceBig"></span>
						<script type="text/javascript">
							document.getElementById("totalOtherPriceBig").innerHTML=atoc(${totalOtherPrice});
						</script>
					</td>
					<td align="left" colspan="2"   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥） <input readonly="readonly" id="totalOtherPrice"
								value="<fmt:formatNumber value="${totalOtherPrice}" pattern="#,##0.00"/>" style="text-align: right">
					</td>
				</tr>

			</table>
			<br />
			<table align="center" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						建议承做理由
					</td>
				</tr>
				<c:forEach items="${contentList}" var="item" varStatus="status">
				<c:if test="${item.STATE eq 1}">
				<tr>
					<td style="font-size: 14px;">
						内容：<textarea rows="5" cols="100" id="ADVISE_CONTENT" name="ADVISE_CONTENT" readonly="readonly">${item.PROJECT_CONTENT }</textarea>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<br>
			<table align="center" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						其他租赁条件说明
					</td>
				</tr>
				<c:forEach items="${contentList}" var="item" varStatus="status">
				<c:if test="${item.STATE eq 50}">
				<tr>
					<td style="font-size: 14px;">
						内容：<textarea rows="5" cols="100" id="EXPLAIN_CONTENT" name="EXPLAIN_CONTENT" readonly="readonly">${item.PROJECT_CONTENT }</textarea>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<input name="examineFlag" value="${examineFlag }" type="hidden"/>
				<input name="commit_flag" value="${commit_flag }" type="hidden"/>
				<tr>
					<td colspan="5" align="center">
						<input type="button" name="sub" value="下一页"  class="ui-state-default ui-corner-all"
							onclick="saveReScheme();">
					</td>
				</tr>
			</table>
			</div>
</div>
</div>
		</form>
	</body>
</html>
