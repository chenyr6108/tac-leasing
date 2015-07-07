<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<title>尽职调查报告</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css">
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/money.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(function (){
			if($("#TAX_PLAN_CODE").val()==4||$("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
				$("#lab1").html("用于一次抵冲租金");
				$("#tax1").hide();
				$("#tax2").hide();
				$("#tax3").hide();
			} else {
				$("#lab1").html("用于平均抵冲金额");
				$("#tax1").show();
				$("#tax2").show();
				$("#tax3").show();
			}
			
			if($("#TAX_PLAN_CODE").val()==5) {
				$(".pay_panel").show();
			} else {
				$(".pay_panel").hide();
			}
			
			
		});
		</script>
	</head>

	<body>
		<form action="../servlet/defaultDispatcher" name="schemeForm" id="form1"
			method="post">
			<input type="hidden" name="__action"
				value="creditReport.createScheme">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<div style="vertical-align: bottom;">&nbsp;
				<b><font color="red" style="font-size: 14px;vertical-align: bottom;">专案：</font></b>
				<select disabled="disabled" style="vertical-align: bottom;">
					<option value="">无</option>
					<c:forEach items="${creditSpecialList }" var="item">
						<option value="${item.creditCode }" <c:if test="${creditMap.CREDIT_SPECIAL_CODE eq item.creditCode }">selected="selected"</c:if>>${item.creditName }</option>
					</c:forEach>
				</select>
				&nbsp;<button type="button" onclick="showRiskLevel('${creditMap.ID }')" class="panel_button">测算审查权限级别</button>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<div class="zc_grid_body jqgrowleft">
			<div>
			<table id="equipmentTab"  cellspacing="0" cellpadding="5" border="0"
							class="ui-jqgrid-htable zc_grid_title" >
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">租赁方式</td>
					<td colspan="11" class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
						<c:forEach items="${contractType}" var="contractType">
							<c:if test="${contractType.CODE eq creditMap.CONTRACT_TYPE}">${contractType.FLAG }</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
						是否集团内：
					</td>
					<td  colspan="11" class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
						<c:if test="${creditMap.GROUP_INSIDE eq 1}">集团内</c:if>
						<c:if test="${empty creditMap.GROUP_INSIDE or creditMap.GROUP_INSIDE eq 2}">集团外</c:if>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td colspan="8" class="ui-jqgrid-labels" height="26" style="font-size: 14px;">
						客户购买意向
					</td>
					<td colspan="3" class="ui-jqgrid-labels" > 
						&nbsp; 
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">供应商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">厂牌</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">制造商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">产品名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">规格型号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">留购价(元)</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">含税单价(元)</strong>
					</th>
					<c:if test="${creditMap.CONTRACT_TYPE ne '7' }">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">单价(元)</strong>
					</th>
					</c:if>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 数量</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 单位</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 合计</strong>
					</th>
					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">锁码方式</strong>
					</th> 
				</tr>
				<c:forEach items="${equipmentsList}" var="item" varStatus="status">
					<tr>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.BRAND }(${item.SUPP_LEVEL }) &nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.THING_KIND }  &nbsp; 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.MANUFACTURER }  &nbsp; 
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.THING_NAME } &nbsp;
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.MODEL_SPEC }  &nbsp;
						</td>
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.SHUI_PRICE }" /> &nbsp;
						</td>
						<c:if test="${creditMap.CONTRACT_TYPE ne '7' }">
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" /> &nbsp;
						</td>
						</c:if>
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
							${item.AMOUNT } &nbsp;
						</td>
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr"> 
							${item.UNIT} &nbsp;
						</td>
						<td style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" /> &nbsp;
						</td>
						
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							<c:forEach items="${lockList}" var="items">
								<c:if test="${item.LOCK_CODE eq items.CODE}">${items.FLAG }</c:if>
							</c:forEach>&nbsp;
						</td> 
					</tr>
					<tr>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
						配件说明:
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; " colspan="10">
						${item.MOUNTINGS} &nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="leaseTopricBig" style="font-size:14px"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${schemeMap.LEASE_TOPRIC });</script>
					</td>
					<td colspan="4" style="text-align: center;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC }" /> &nbsp;
					</td>
				</tr>
				<c:choose><c:when test="${supperGrantMap eq null }">			
				<tr>
						<td colspan="12" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						当前供应商：${supperGrantMap.SUPNAME }没有授信
						</td>
				</tr>			
				</c:when><c:otherwise>
						<tr>
						<td colspan="12" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						当前供应商：${supperGrantMap.SUPNAME }的授信额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.GRANT_PRICE?0: supperGrantMap.GRANT_PRICE}" type="currency"/>授信余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.LAST_PRICE?0:supperGrantMap.LAST_PRICE }" type="currency"/>&nbsp;&nbsp;&nbsp;交机前拨款额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.advance_grant?0:supperGrantMap.advance_grant }" type="currency"/>&nbsp;&nbsp;交机前拨款余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.advance_machine?0:supperGrantMap.advance_machine }" type="currency"/>
						</td>
						<%-- <td colspan="3" style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						￥<fmt:formatNumber pattern='#,##0.00' value="${supperGrantMap.GRANT_PRICE }" type="currency"/>
						</td>

						<td colspan="2" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						授信余额为：
						</td>
						<td colspan="4" style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						￥<fmt:formatNumber pattern='#,##0.00' value="${supperGrantMap.LAST_PRICE }" type="currency"/>
						</td> --%>
						</tr>
						
				 </c:otherwise></c:choose>
				<c:choose><c:when test="${custGrantMap eq null }">
				<tr>
					<td colspan="12" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
					当前客户没有授信
					</td>
				</tr>
				</c:when><c:otherwise>
					<c:choose><c:when test="${custGrantMap.GRANT_PRICE eq null }">
					<tr>
						<td colspan="12" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						当前客户：${custGrantMap.CUST_NAME }没有授信
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="3" style="text-align: left;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">	
						当前客户：${custGrantMap.CUST_NAME }的授信额度为：
						</td>
						<td colspan="3" style="text-align: right;font-size:14px" class="ui-widget-content jqgrow ui-row-ltr">
						￥<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.GRANT_PRICE}" type="currency"/>
						</td>

						<td colspan="2" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">	
						授信余额为：
						</td>
						<td colspan="4" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
						￥<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.LAST_PRICE }" type="currency"/>
						</td>
						</tr>
						</c:otherwise></c:choose>
					</c:otherwise></c:choose>
			</table>
			<div id="isImportEqipDiv"  <c:if test="${creditMap.CONTRACT_TYPE != 7 and creditMap.CONTRACT_TYPE != 9}">style="display:none"</c:if>><br><br><br>
				<input type="checkbox"  disabled="disabled" <c:if test="${schemeMap.IS_IMPORT_EQIP == 1}">checked</c:if>>&nbsp;&nbsp;&nbsp;<label for="isImportEqip">进口设备，成本不确定</label>
			</div>
			<c:if test="${creditMap.CONTRACT_TYPE eq '2'}">
			<br><br><br><span style="font-size: 14px;">是否为三个月新机：是<input style="font-size: 14px;" type="radio" name="IS_NEW_PRODUCTION"  value="Y" disabled="disabled" <c:if test="${creditMap.IS_NEW_PRODUCTION eq 'Y' }">checked="checked"</c:if>>否<input style="font-size: 14px;" type="radio" name="IS_NEW_PRODUCTION"  disabled="disabled" <c:if test="${creditMap.IS_NEW_PRODUCTION eq 'N' or creditMap.IS_NEW_PRODUCTION==null }">checked="checked"</c:if> value="N"></span>
			</c:if>
			<br /><br /><br />
			<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
				<tr>
					<td  colspan="4" height="26" style="text-align: left;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head" >
						租赁方案
					</td>
				</tr>
				<tr>
					<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁期数
					</td>
					<td width="35%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.LEASE_TERM }  &nbsp;
					</td>
					<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁周期
					</td>
					<td width="35%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
						  &nbsp;<c:if test="${schemeMap.LEASE_COURSE eq 1}">
							月份
						</c:if>
						<c:if test="${schemeMap.LEASE_COURSE eq 2}">
							双月
						</c:if>
						<c:if test="${schemeMap.LEASE_COURSE eq 3}">
							季度
						</c:if>
						<c:if test="${schemeMap.LEASE_COURSE eq 6}">
							半年
						</c:if>
						<c:if test="${schemeMap.LEASE_COURSE eq 12}">
							年度
						</c:if> 
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						 比例：&nbsp;${schemeMap.PLEDGE_PRICE_RATE }%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						金额：<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.PLEDGE_PRICE }" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						实际使用保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.PLEDGE_REALPRIC }" />
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<span id="lab1" style="font-size: 14px;">用于平均抵冲金额</span>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_AVE_PRICE ?0:schemeMap.PLEDGE_AVE_PRICE }" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_BACK_PRICE ?0 :schemeMap.PLEDGE_BACK_PRICE }" />
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于最后抵冲期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${empty schemeMap.PLEDGE_LAST_PERIOD?0:schemeMap.PLEDGE_LAST_PERIOD }
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						延迟拨款期数<!-- 收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${empty schemeMap.DEFER_PERIOD?0:schemeMap.DEFER_PERIOD }
						<!--	第${empty schemeMap.PLEDGE_PERIOD?0:schemeMap.PLEDGE_PERIOD }期 -->
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty schemeMap.PLEDGE_ENTER_WAY or schemeMap.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> disabled="disabled">-->入我司&nbsp;&nbsp;&nbsp;
						<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMPRICE?0:schemeMap.PLEDGE_ENTER_CMPRICE}"/>&nbsp;&nbsp;<span id="tax1">税金&nbsp;
						${empty schemeMap.PLEDGE_ENTER_CMRATE?0:schemeMap.PLEDGE_ENTER_CMRATE}&nbsp;&nbsp;</span>我司入供应商&nbsp;
						${empty schemeMap.PLEDGE_ENTER_MCTOAG?0:schemeMap.PLEDGE_ENTER_MCTOAG}&nbsp;&nbsp;<span id="tax2">税金&nbsp;
						${empty schemeMap.PLEDGE_ENTER_MCTOAGRATE?0:schemeMap.PLEDGE_ENTER_MCTOAGRATE}</span>
						<br>
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="2" <c:if test="${schemeMap.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if> disabled="disabled">-->入供应商&nbsp;
						${empty schemeMap.PLEDGE_ENTER_AG?0:schemeMap.PLEDGE_ENTER_AG }&nbsp;&nbsp;<span id="tax3">税金&nbsp;
						${empty schemeMap.PLEDGE_ENTER_AGRATE?0:schemeMap.PLEDGE_ENTER_AGRATE}</span>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						首期租金
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
						 比例： &nbsp;<fmt:formatNumber type='number' value='${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT}' maxFractionDigits='3'/>%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						金额：&nbsp;<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE}" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;&nbsp;&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr class="pay_panel">
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						业务员佣金
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.SALES_PAY }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						银行手续费
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.OUT_PAY }&nbsp;
					</td>
				</tr>
				<tr class="pay_panel">
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						手续费收入
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<c:if test="${schemeMap.INCOME_PAY_TYPE eq 1 }">无手续费</c:if>
						<c:if test="${schemeMap.INCOME_PAY_TYPE eq 2 }">非月结</c:if>
						<c:if test="${schemeMap.INCOME_PAY_TYPE eq 3 }">月结</c:if>
						${empty schemeMap.INCOME_PAY?0:schemeMap.INCOME_PAY }&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						手续费收入税额
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${empty schemeMap.INCOME_PAY?0:schemeMap.INCOME_PAY*0.055 }&nbsp;
					</td>
				</tr>
				
				
<!-- Add by Michael 2012 01/14 费用参数化 -->				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">管理费收入(影响TR计算)</b></font>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">非管理费收入(不影响TR计算)</b></font>
			</td>
		</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
										<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
										<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
									<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
									<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
							<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
			<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
								<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
								<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />&nbsp;&nbsp;&nbsp;&nbsp;来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" disabled><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->					
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!-- 利率上浮比例 -->
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<%-- <fmt:formatNumber type="number" value="${schemeMap.FLOAT_RATE }" maxFractionDigits="3"/>% &nbsp; --%>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						合同利率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatNumber type='number' value='${schemeMap.YEAR_INTEREST }' maxFractionDigits='3'/>% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="YEAR_INTEREST_TYPE" value="1" disabled="disabled" <c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 1}">checked="checked"</c:if>>浮动
					<input type="radio" name="YEAR_INTEREST_TYPE" value="2" disabled="disabled" <c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 2}">checked="checked"</c:if>>固定
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b style="font-size: 14px;">客户TR</b></font>
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<b style="font-size: 14px;">&nbsp;&nbsp;<fmt:formatNumber value="${schemeMap.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b style="font-size: 14px;">实际TR</b></font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<b style="font-size: 14px;">&nbsp;&nbsp;<fmt:formatNumber value="${schemeMap.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						税率
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.SALES_TAX_RATE }% &nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保险费率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.INSURE_BASE_RATE }% &nbsp;
					</td>
				</tr>
				<tr style="display: none;">
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						印花税租赁总价比率
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.STAMP_TAX_TOPRIC }% &nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						印花税租金总计比率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.STAMP_TAX_MONTHPRIC }% &nbsp;&nbsp;&nbsp;&nbsp;
						印花税保险比率&nbsp;&nbsp;${schemeMap.STAMP_TAX_INSUREPRIC }% &nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						日罚息率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.FINE_RATE }% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <c:if test="${schemeMap.FINE_TYPE eq 1}">
									<input type="radio" disabled="disabled" name="FINE_TYPE" value="1"
										checked="checked">
												单利
												<input type="radio" disabled="disabled" name="FINE_TYPE" value="2">
												复利
						 </c:if>
						 <c:if test="${schemeMap.FINE_TYPE eq 2}">
									<input type="radio" disabled="disabled" name="FINE_TYPE" value="1">
												单利
												<input type="radio" disabled="disabled" name="FINE_TYPE" value="2"
										checked="checked">
												复利
						 </c:if> 
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						概算成本（RZE）
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_RZE }" /> &nbsp; 
						
						<font color="red"><b>
						承作成數:
						<c:if test="${schemeMap.LEASE_TOPRIC>0 }">
						<fmt:formatNumber maxFractionDigits="2"  type ="percent" value="${schemeMap.LEASE_RZE /schemeMap.LEASE_TOPRIC }" />
					    </c:if>
						</b></font>
					</td>
				</tr>				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						支付方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
							 &nbsp;<c:forEach items="${payWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.PAY_WAY}">
										${item.FLAG }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!-- 预估起租日 -->预计交机日
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd"/> &nbsp;	 	
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						申请拨款金额&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						 <fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC-schemeMap.PLEDGE_ENTER_MCTOAG-schemeMap.PLEDGE_ENTER_AG }" />&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">预计拨款日</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.ESTIMATES_PAY_DATE }&nbsp;
					</td>
				</tr>

				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						介绍人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.SPONSOR }
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						发票人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.INVOICE_PERSON }
					</td>
				</tr>
				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						差旅费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
						 &nbsp;<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.BUSINESS_TRIP_PRICE }" />
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁物件设置场所
					</td>
					<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						${schemeMap.EQUPMENT_ADDRESS },&nbsp;经纬度：X-${schemeMap.EQUPMENT_X },Y-${schemeMap.EQUPMENT_Y }
					</td>
				</tr>
				<tr>
					<td  rowspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						拨款方式（<c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2' or creditMap.CONTRACT_TYPE eq '5'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>情形）
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
					
						<input type="checkbox" name="APPROPRIATEFUNS" disabled="disabled"
							value="0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">checked="true"</c:if></c:forEach> style="text-align: right;"><c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>前&nbsp;
							<c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>前比例:<c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">${item.PAYPERCENT}</c:if></c:forEach>%&nbsp;
							<c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>前拨款金额: <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}"><fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/></c:if></c:forEach> 
						    <c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>前拨款给:<c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">${item.APPRORIATENAME}</c:if></c:forEach> 
						
					</td>
					
				</tr>
				<tr>
					
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">					
							<input type="checkbox" name="APPROPRIATEFUNS" disabled="disabled"
							value="1"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">checked="true"</c:if></c:forEach>   style="text-align: right;"><c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>后&nbsp;
							<c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>后比例:<c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">${item.PAYPERCENT}</c:if></c:forEach>%&nbsp;
							<c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>后拨款金额:<c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}"><fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/></c:if></c:forEach>
						    <c:if test="${creditMap.CONTRACT_TYPE eq '0' or creditMap.CONTRACT_TYPE eq '1' or creditMap.CONTRACT_TYPE eq '2'}">交机</c:if><c:if test="${creditMap.CONTRACT_TYPE eq '3' or creditMap.CONTRACT_TYPE eq '4'}">设定</c:if>后拨款给:<c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">${item.APPRORIATENAME}</c:if></c:forEach>				
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						拨款方式（勾选）
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="radio" id="OnlinetBank" name="appropriation_way" <c:if test="${schemeMap.APPROPRIATION_WAY eq 2 or schemeMap.APPROPRIATION_WAY ne 1 || creditMap.CONTRACT_TYPE eq 10 || creditMap.CONTRACT_TYPE eq 12 || creditMap.CONTRACT_TYPE eq 13}">checked="checked"</c:if>  value="2" disabled="disabled"><label for="OnlinetBank">网银</label>
						<input type="radio" id="cheque" name="appropriation_way" <c:if test="${ schemeMap.APPROPRIATION_WAY eq 1 || creditMap.CONTRACT_TYPE eq 8 || creditMap.CONTRACT_TYPE eq 14 }">checked="checked"</c:if>  value="1" disabled="disabled"><label  for="cheque">支票</label>
						<span id="chequespan">
						<c:if test="${schemeMap.DEFER_PERIOD >0}">(延迟拨款期数:${schemeMap.DEFER_PERIOD})</c:if>
						</span>
						<br>
					</td>
					
				</tr>
				<tr <c:if test="${schemeMap.APPROPRIATION_WAY ne 1 }">style="display:none"</c:if>>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						背书人
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						第一背书人：<input type="text" id="endorser_1" name="endorser_1"  value="${schemeMap.ENDORSER_1 }" disabled="disabled"/>;第二背书人：<input type="text" id="endorser_2" name="endorser_2"  value="${schemeMap.ENDORSER_2 }" disabled="disabled"/>
					</td>	
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.SUPL_TRUE}">										
											${item.FLAG }&nbsp;
									</c:when>
									<c:otherwise>
											&nbsp;
									</c:otherwise>
								</c:choose>
							</c:forEach>
						
					</td>
				<tr>
				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁期满处理方式
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
							 &nbsp;<c:forEach items="${dealWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.DEAL_WAY}">
										${item.FLAG }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
					<td colspan="2"  style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					&nbsp;
					</td>
				</tr>
				<tr style="display: none;">
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保险公司
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
							 &nbsp;<c:forEach items="${insureCompanyList}" var="item">
								<c:choose>
									<c:when
										test="${item.INCP_ID eq schemeMap.INSURANCE_COMPANY_ID}">
										${item.INCP_NAME }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
				</tr>
				<tr>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						税费测算方案<font color="red">&nbsp;*</font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
						<select name="TAX_PLAN_CODE" id="TAX_PLAN_CODE" disabled>
								<c:forEach items="${taxPlanList}" var="item">
									<option value="${item.CODE }"
										<c:if test="${ schemeMap.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
									</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
			</table>
			<table id="irrMonthPriceTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td style="text-align: left;height: 24px" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
						<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁方案测算方式一</b>
					</td>
					<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						
					</td>
				</tr>
				<c:forEach var="item" items="${irrMonthPaylines}" varStatus="status">
					<tr>
						<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							应付租金
						</td>
						<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />
						</td>
						<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							对应期次
						</td>
						<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							第${item.IRR_MONTH_PRICE_START}期到第${item.IRR_MONTH_PRICE_END}期
									
						</td>
						<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						</td>
					</tr>
				</c:forEach>
			</table>
			<br><br><br>
			<table id="insureTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<td style="text-align: left;font-size:14px;" height="26" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4" >
						保险费
					</td>
					<td style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="1" > 
						&nbsp; 
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td width="20%"     class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
						保险项目
					</td>
					<td width="20%"     class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
						保险期间
					</td>
					<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
						保险费率
					</td>
					<td width="18%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
						保险费用
					</td>
					<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
						备注
					</td> 
				</tr>
				<c:set value="0" var="insureTotal"></c:set>
				<c:forEach items="${insuresList}" var="item" varStatus="status">
					<tr>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
							 &nbsp; <c:forEach items="${insureTypeList}" var="insureType">
									<c:choose>
										<c:when test="${insureType.INTP_ID eq item.INSURE_ITEM}">
											 ${insureType.INTP_NAME } 
										</c:when> 
									</c:choose>	
								</c:forEach> 
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
							${item.START_DATE }
							到
							${item.END_DATE }  &nbsp;
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
							${item.INSURE_RATE }% &nbsp;
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px">
							<fmt:formatNumber value="${item.INSURE_PRICE }" pattern="#,##0.00"/>
							<c:set var="insureTotal" value="${insureTotal+item.INSURE_PRICE }"></c:set>	
						 &nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							${item.MEMO }&nbsp; &nbsp;
						</td> 
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="4">
						合计（大写）：<span id="insureTotalBig" style="font-size: 14px;"></span>
					<script type="text/javascript">document.getElementById('insureTotalBig').innerHTML=atoc(${insureTotal});</script>
					</td>
					<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）<fmt:formatNumber value="${insureTotal}" pattern="#,##0.00"/> &nbsp;
					</td>
				</tr>

			</table>

			<br><br><br>
			<table  id="otherPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<td height="26" style="text-align: left;font-size: 14px;"class="ui-state-default ui-th-ltr zc_grid_head" colspan="3" >
						其他费用
					</td>
					<td style="text-align: left" class="ui-state-default ui-th-ltr zc_grid_head"> 
						&nbsp; 
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td width="20%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						费用名称
					</td>
					<td width="20%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						费用金额
					</td>
					<td width="20%"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						产生费用时间
					</td>
					<td width="35%"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						备注
					</td> 
				</tr>
				<c:set var="totalOtherPrice" value="0" />
				<c:forEach items="${otherPriceList}" var="otherPrice"
					varStatus="status">
					<tr>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							${otherPrice.OTHER_NAME } &nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							 &nbsp;<fmt:formatNumber value="${otherPrice.OTHER_PRICE }" pattern="#,##0.00"/>
							<c:set var="totalOtherPrice" value="${otherPrice.OTHER_PRICE+totalOtherPrice }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px; ">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${otherPrice.OTHER_DATE }"/>
						</td>
						<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							${otherPrice.MEMO }&nbsp;
						</td> 
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">
						合计（大写）：<span id="totalOtherPriceBig" style="font-size:14px;"></span>
						<script type="text/javascript">
							document.getElementById("totalOtherPriceBig").innerHTML=atoc(${totalOtherPrice});
						</script>
					</td>
					<td style="text-align: left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥） <fmt:formatNumber value="${totalOtherPrice}" pattern="#,##0.00"/>
					</td>
				</tr>

			</table>
			<br><br><br>
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
						内容：<br><pre>${item.PROJECT_CONTENT }</pre>
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
						内容：<br><pre>${item.PROJECT_CONTENT }</pre>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="font-size: 14px;">

				<tr class="ui-jqgrid-labels">
					<td colspan="5" align ="center" >
					
						<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditCustomerCorp.selectCreditCustomerCorpForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}'"> 
					
					</td>
				</tr>
			</table>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>