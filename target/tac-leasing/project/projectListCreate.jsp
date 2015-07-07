<%@ page language="java" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>项目意向书</title>
	<script src="${ctx}/common/js/idCard.js" type="text/javascript"></script> 
	<script type="text/javascript" src="${ctx }/project/js/selectEquipment.js"></script>
	<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
	<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
	<script type="text/javascript" src="${ctx }/project/js/selectInsureItem.js"></script>
	<script type="text/javascript" src="${ctx }/project/js/project.js"></script>
	<script type="text/javascript" src="${ctx }/project/js/projectControl.js"></script>
	<script type="text/javascript"> 
var baseRate = ${baseRateJson} 
$(function (){
	$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
	$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
	$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
});
function dateClick(){
	$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
	$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
	$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
}
</script>
	</head>
	<body onload="loadEquipmentTypes();">
	<div style="margin:  1%;">
			<form action="../servlet/defaultDispatcher" name="schemeForm" id="form1" method="post">
			<input type="hidden" name="__action" value="projectManage.createProject">
			
		
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;项目意向书</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
				<td>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td>承租人姓名：${projectMap.CUST_NAME }<input type="hidden" name="prjt_id" value="${projectMap.PRJT_ID }"><input type="hidden" name="cust_type" value="${projectMap.CUST_TYPE }"></td>
							<td>客户类型：<c:if test="${projectMap.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${projectMap.CUST_TYPE eq 1}">法人</c:if></td>
							<td>办事处主管：${projectMap.NAME }</td>
							<td>公司代号：${projectMap.DECP_NAME_CN }</td>
						    <td>客户来源：${projectMap.CUSTOMER_COME }</td>						    
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${projectMap.CUST_TYPE eq 0 }"><%@ include file="createNatu.jsp"%></c:if><c:if test="${projectMap.CUST_TYPE eq 1}"><%@ include file="createCorp.jsp"%></c:if>
				</td>
			</tr>
			<tr>
				<td>
					<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >   				
						<tr>
							<td colspan="8" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
								<strong>客户购买意向</strong>
							</td>
							<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
								相关操作：
								<img src="${ctx }/images/u100.gif">
								&nbsp;
								<a href="javascript:void(0)" style="cursor: pointer;"
									onclick="addEquipmentRow();">添加</a>
							</td>
						</tr>
						<tr>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
								<strong>产品厂牌</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
								<strong>产品名称</strong>
							</th>
							<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
								<strong>规格型号</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
								<strong>供应商</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
								<strong>留购价(元)</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
								<strong>单价(元)</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
								<strong>数量</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="6%">
								<strong>单位</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="12%">
								<strong>合计</strong>
							</th>
							<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
								<strong>锁码方式</strong>
							</th>
							<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="6%">
								操作
							</th>
						</tr>
						<c:forEach items="${equipmentsList}" var="item" varStatus="status">
							<tr>
								<td align="center"  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<select id="TYPE${ status.count }" name="TYPE"
										onchange="loadEquipmentKinds(KIND${ status.count },this.value);$('#TYPE_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
										<option value="${ status.count }">
											${item.THING_KIND }
										</option>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<select id="KIND${ status.count }" name="KIND"
										onchange="loadEquipmentProducts(PRODUCT${ status.count },this.value);$('#KIND_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
										<option value="${ status.count }">
											${item.THING_NAME }
										</option>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<select id="PRODUCT${ status.count }" name="PRODUCT"
										onchange="loadEquipmentSuppliers(SUPPIER${ status.count },this.value);$('#PRODUCT_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
										<option value="${ status.count }">
											${item.MODEL_SPEC }
										</option>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<select id="SUPPIER${ status.count }" name="SUPPIER"
										onchange="$('#SUPPIER_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
										<option value="${ item.SUEQ_ID }">
											${item.BRAND }
										</option>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" id="STAYBUY_PRICE${ status.count }"
										name="STAYBUY_PRICE" size=8 value="<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" />" onchange="positive(this, '租赁物留购价');setFormatCurrency(this);" style="text-align: right">
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" id="UNIT_PRICE${ status.count }"
										name="UNIT_PRICE" size=12 value="<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" />"  onchange="updateTotal('${ status.count }');" style="text-align: right">
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" id="AMOUNT${ status.count }" name="AMOUNT"
										size=3 value="${item.AMOUNT }" onchange="updateTotal('${ status.count }');">
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<c:set var="tai" value=""></c:set>
									<c:set var="liang" value=""></c:set>
									<c:set var="tao" value=""></c:set>
									<c:set var="jian" value=""></c:set>
									<c:if test="${item.UNIT eq '台'}">
										<c:set var="tai" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${item.UNIT eq '辆'}">
										<c:set var="liang" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${item.UNIT eq '套'}">
										<c:set var="tao" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${item.UNIT eq '件'}">
										<c:set var="jian" value="selected='selected'"></c:set>
									</c:if>
									<select name="UNIT" id="UNIT${ status.count }">
										<option value="台"${tai }>
											-台-
										</option>
										<option value="辆"${liang }>
											-辆-
										</option>
										<option value="套"${tao }>
											-套-
										</option>
										<option value="件"${jian }>
											-件-
										</option>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" id="TOTAL${ status.count }" name="TOTAL" style="text-align: right;" readonly="readonly"
										size=17 value="<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" />">
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<select name="LOCK_CODE">
									<c:forEach items="${lockList}" var="items">
										<c:choose>
											<c:when test="${items.CODE eq item.LOCK_CODE}">
												<option value="${items.CODE }" selected="selected">${items.FLAG }</option>
											</c:when>
											<c:otherwise>
												<option value="${items.CODE }">${items.FLAG }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</select>
								</td>
								<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									<img src="${ctx }/images/u103.gif"><a href="#" onclick="deleteRow.call(this)">删除</a>
									<input type="hidden" name="TYPE_NAME"
										ID="TYPE_NAME${ status.count }" value="${item.THING_KIND }">
									<input type="hidden" name="KIND_NAME"
										ID="KIND_NAME${ status.count }" value="${item.THING_NAME }">
									<input type="hidden" name="PRODUCT_NAME"
										ID="PRODUCT_NAME${ status.count }" value="${item.MODEL_SPEC }">
									<input type="hidden" name="SUPPIER_NAME"
										ID="SUPPIER_NAME${ status.count }" value="${item.BRAND }">
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="8" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
								合计（大写）：<span id="leaseTopricBig"></span>
								<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${schemeMap.LEASE_TOPRIC });</script>
							</td>
							<td colspan="3" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
								（小写：￥）
								<input name="LEASE_TOPRIC" readonly="readonly" value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC }" />" id="LEASE_TOPRIC" style="text-align: right;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
			<td>
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="left" colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
						<strong>租赁方案</strong>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁期数
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="LEASE_PERIOD" onchange="updateYearInterest();updateManagementFee();"
							value="${schemeMap.LEASE_PERIOD }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁周期
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<c:set value="" var="course1"></c:set>
						<c:set value="" var="course3"></c:set>
						<c:set value="" var="course6"></c:set>
						<c:set value="" var="course12"></c:set>
						<c:if test="${schemeMap.LEASE_TERM eq 1}">
							<c:set value="selected='selected'" var="course1"></c:set>
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 3}">
							<c:set value="selected='selected'" var="course3"></c:set>
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 6}">
							<c:set value="selected='selected'" var="course6"></c:set>
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 12}">
							<c:set value="selected='selected'" var="course12"></c:set>
						</c:if>
						<select name='LEASE_TERM' onchange="updateYearInterest();updateManagementFee();">
							<option value="1"${course1 }>
								-月份-
							</option>
							<option value="3"${course3 }>
								-季度-
							</option>
							<option value="6"${course6 }>
								-半年-
							</option>
							<option value="12"${course12 }>
								-年度-
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PLEDGE_PRICE_RATE" size="4"
							value="${schemeMap.PLEDGE_PRICE_RATE }"  onchange="updatePledgePrice();">
						%
						<input type="text" name="PLEDGE_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.PLEDGE_PRICE }" />" onchange="updatePledgePriceRate();" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保证金处理方式
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<select name="PLEDGE_WAY">
							<option value="1" <c:if test="${schemeMap.PLEDGE_WAY eq 1 }">selected="selected"</c:if>>用于平均抵冲金额</option>
							<option value="0" <c:if test="${schemeMap.PLEDGE_WAY eq 0 }">selected="selected"</c:if>>用于期末退还金额</option>
							<option value="2" <c:if test="${schemeMap.PLEDGE_WAY eq 2 }">selected="selected"</c:if>>用于最后抵冲金额/期数</option>
						</select>
						<input type="hidden" value="${empty schemeMap.PLEDGE_PERIOD ? 0 : schemeMap.PLEDGE_PERIOD}" name="PLEDGE_PERIOD">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						管理费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="MANAGEMENT_FEE_RATE" size="4"
							value="${schemeMap.MANAGEMENT_FEE_RATE }" onchange="updateManagementFee();">
						%
						<input type="text" name="MANAGEMENT_FEE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.MANAGEMENT_FEE }" />"  onchange="updateManagementFeeRate();" style="text-align: right;">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						首期租金
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="HEAD_HIRE_PERCENT" size="4"
							value="${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT}"  onchange="updateHeadHire();">
						%
						<input type="text" name="HEAD_HIRE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE}" />" onchange="updateHeadHirePercent();" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<!-- 利率上浮比例 -->
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="FLOAT_RATE" size="4" style="display: none;"
							value="${schemeMap.FLOAT_RATE }" onchange="updateYearInterest();">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						合同利率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="YEAR_INTEREST" size="4"
							value="${schemeMap.YEAR_INTEREST }" onchange="updateFloatRate();">
						%
						<c:choose>
							<c:when test="${empty schemeMap}">
											<input type="radio" name="YEAR_INTEREST_TYPE" value="1"
											checked="checked">
											浮动
											<input type="radio" name="YEAR_INTEREST_TYPE" value="2">
											固定
										</c:when>
							<c:otherwise>
								<c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 1}">
												<input type="radio" name="YEAR_INTEREST_TYPE" value="1">
												浮动
												<input type="radio" name="YEAR_INTEREST_TYPE" value="2"
										checked="checked">
												固定
											</c:if>
								<c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 2}">
												<input type="radio" name="YEAR_INTEREST_TYPE" value="1"
										checked="checked">
												浮动
												<input type="radio" name="YEAR_INTEREST_TYPE" value="2">
												固定
											</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						营业税率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="SALES_TAX_RATE" id="SALES_TAX_RATE" value="${empty schemeMap.SALES_TAX_RATE ? 5.45 : schemeMap.SALES_TAX_RATE}" style="width: 80px;">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险费率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="INSURE_BASE_RATE" id="INSURE_BASE_RATE" value="${empty schemeMap.INSURE_BASE_RATE ? 0.178 : schemeMap.INSURE_BASE_RATE}"
				style="width: 80px;">
			%
					</td>
					
				</tr>
				<tr style="display: none;">
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						印花税租赁总价比率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="STAMP_TAX_TOPRIC" id="STAMP_TAX_TOPRIC" value="${empty schemeMap.STAMP_TAX_TOPRIC ? 0.13 : schemeMap.STAMP_TAX_TOPRIC }" style="width: 80px;">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						印花税租金总计比率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="STAMP_TAX_MONTHPRIC" id="STAMP_TAX_MONTHPRIC" value="${empty schemeMap.STAMP_TAX_MONTHPRIC ? 0.005 : schemeMap.STAMP_TAX_MONTHPRIC }"
				style="width: 80px;">
			%
					</td>
					
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						日罚息率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="FINE_RATE" size="4"
							value="${schemeMap.FINE_RATE }">
						%
						<c:choose>
							<c:when test="${empty schemeMap}">
								<input type="radio" name="FINE_TYPE" value="1" checked="checked">
											单利
											<input type="radio" name="FINE_TYPE" value="2">
											复利
										</c:when>
							<c:otherwise>
								<c:if test="${schemeMap.FINE_TYPE eq 1}">
									<input type="radio" name="FINE_TYPE" value="1"
										checked="checked">
												单利
												<input type="radio" name="FINE_TYPE" value="2">
												复利
											</c:if>
								<c:if test="${schemeMap.FINE_TYPE eq 2}">
									<input type="radio" name="FINE_TYPE" value="1">
												单利
												<input type="radio" name="FINE_TYPE" value="2"
										checked="checked">
												复利
											</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						概算成本（RZE）
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="LEASE_RZE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_RZE }" />" onchange="setFormatCurrency(this);" style="text-align: right;">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						支付方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<select name="PAY_WAY">
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
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						起租日期
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="START_DATE" id="START_DATE" readonly="readonly" 
							value="<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd"/>">
						 	
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						差旅费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="BUSINESS_TRIP_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.BUSINESS_TRIP_PRICE }" />" onchange="setFormatCurrency(this);" style="text-align: right;">
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
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="EQUPMENT_ADDRESS" size="115"
							value="${schemeMap.EQUPMENT_ADDRESS }">&nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁期满处理方式
					</td>
					<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
						<select name="DEAL_WAY">
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
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险公司
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<select name="INSURANCE_COMPANY_ID" id="INSURANCE_COMPANY_ID" onchange="updateCompanyId()">
							<option value="0">--请选择--</option>
							<c:forEach items="${insureCompanyList}" var="item">
								<option value="${item.INCP_ID }" <c:if test="${ schemeMap.INSURANCE_COMPANY_ID eq item.INCP_ID }"> selected="selected"</c:if>>${item.INCP_NAME }</option>
							</c:forEach>
						</select>&nbsp;
						<input type="hidden" name="INSURANCE_COMPANY_ID2" value="${schemeMap.INSURANCE_COMPANY_ID}" id="INSURANCE_COMPANY_ID2">						
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						购买方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<select name="BUY_INSURANCE_WAY">
							<c:forEach items="${insureBuyWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.BUY_INSURANCE_WAY}">
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
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险返利百分比
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="INSURE_REBATE_RATE" size="4"
							value="${schemeMap.INSURE_REBATE_RATE }">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						购买时间：
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${empty schemeMap}">
								<input type="radio" name="BUY_INSURANCE_TIME" value="1"
									checked="checked">
											全年购买
											<input type="radio" name="BUY_INSURANCE_TIME" value="2">
											分年购买
										</c:when>
							<c:otherwise>
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 1}">
									<input type="radio" name="BUY_INSURANCE_TIME" value="1"
										checked="checked">
												全年购买
												<input type="radio" name="BUY_INSURANCE_TIME" value="2">
												分年购买
											</c:if>
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 2}">
									<input type="radio" name="BUY_INSURANCE_TIME" value="1">
												全年购买
												<input type="radio" name="BUY_INSURANCE_TIME" value="2"
										checked="checked">
												分年购买
											</c:if>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<%@ include file="createInsureItem.jsp"%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
				<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="5" align="center">
						<input type="button" name="sub" value="保  存"  class="ui-state-default ui-corner-all"
							onclick="saveProject();">
						<input type="reset" name="res" value="重  置"  class="ui-state-default ui-corner-all">
					</td>
				</tr>
			</table>
					</td>
				</tr>
			</table>
			</td>
			</tr>
		</table>
		</div> 
		</div>
		</div>
		
		</form>
		</div>
	</body>
</html>
