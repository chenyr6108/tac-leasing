<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>项目意向书查看</title>
	<script src="${ctx}/common/js/idCard.js" type="text/javascript"></script> 
	<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
	<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
			<script type="text/javascript">
			acceptProject = function (){
			$("input[name='__action']").val("projectManage.acceptProject");
			$("#projectForm").submit();
			}
			receptProject = function () {
			$("input[name='__action']").val("projectManage.receptProject");	
			$("#projectForm").submit();
			}
			commitProject = function () {
			$("input[name='__action']").val("projectManage.commitProject");	
			$("#projectForm").submit();
			}
		</script>
	</head>
	<body>
	<div style="margin:  1%;">
				
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;项目意向书查看</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
       <form action="${ctx }/servlet/defaultDispatcher" name="projectForm" id="projectForm" method="post">
       <input type="hidden" name="__action" value="">
       <input type="hidden" name="cust_type" value="${projectMap.CUST_TYPE }">
       <input type="hidden" name="cust_name" value="${projectMap.CUST_NAME }">
       <input type="hidden" name="cust_idcard" value="${projectMap.NATU_IDCARD }">
       <input type="hidden" name="corp_oragnization_code" value="${projectMap.CORP_ORAGNIZATION_CODE }">
       <input type="hidden" name="province_id" value="${projectMap.PROVINCE_ID }">
       <input type="hidden" name="city_id" value="${projectMap.CITY_ID }">
       <input type="hidden" name="clerk_id" value="${projectMap.CLERK_ID }">
       <input type="hidden" name="customer_come" value="${projectMap.CCCODE }">
       <input type="hidden" name="decp_id" value="${projectMap.DECP_ID }">
       <input type="hidden" name="contract_type" value="${projectMap.CONTRACT_TYPE }">       
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        	<tr>
				<td>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td>承租人姓名：${projectMap.CUST_NAME }<input type="hidden" name="prjt_id" value="${projectMap.PRJT_ID }"></td>
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
					<c:if test="${projectMap.CUST_TYPE eq 0 }"><%@ include file="createNatuShow.jsp"%></c:if><c:if test="${projectMap.CUST_TYPE eq 1}"><%@ include file="createCorpShow.jsp"%></c:if>
				</td>
			</tr>
			<tr>
				<td>
					<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >   				
						<tr>
							<td colspan="11" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
								<strong>客户购买意向</strong>
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
						</tr>
				<c:forEach items="${equipmentsList}" var="item" varStatus="status">
					<tr>
						<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.THING_KIND }  &nbsp; 
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.THING_NAME } &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.MODEL_SPEC }  &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.BRAND } &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" /> &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.AMOUNT } &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"> 
							${item.UNIT} &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" /> &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<c:forEach items="${lockList}" var="items">
								<c:if test="${item.LOCK_CODE eq items.CODE}">${items.FLAG }</c:if>
							</c:forEach>&nbsp;
						</td> 
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="leaseTopricBig"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${schemeMap.LEASE_TOPRIC });</script>
					</td>
					<td colspan="3" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC }" /> &nbsp;
					</td>
				</tr>
					</table>
				</td>
			</tr>
			<tr>
			<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
				<tr>
					<td  colspan="4"  style="text-align: left" class="ui-state-default ui-th-ltr zc_grid_head" >
						租赁方案
					</td>
				</tr>
				<tr>
					<td width="15%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						租赁期数
					</td>
					<td width="35%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.LEASE_PERIOD }  &nbsp;
					</td>
					<td width="15%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						租赁周期
					</td>
					<td width="35%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr"> 
						  &nbsp;<c:if test="${schemeMap.LEASE_TERM eq 1}">
							月份
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 3}">
							季度
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 6}">
							半年
						</c:if>
						<c:if test="${schemeMap.LEASE_TERM eq 12}">
							年度
						</c:if> 
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						 &nbsp;${schemeMap.PLEDGE_PRICE_RATE }%
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.PLEDGE_PRICE }" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保证金处理方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<c:if test="${schemeMap.PLEDGE_WAY eq 1 }">用于平均抵冲金额</c:if> 
						<c:if test="${schemeMap.PLEDGE_WAY eq 0 }">用于期末退还金额</c:if> 
						<c:if test="${schemeMap.PLEDGE_WAY eq 2 }">用于最后抵冲金额/期数</c:if> 
						<input type="hidden" value="${empty schemeMap.PLEDGE_PERIOD ? 0 : schemeMap.PLEDGE_PERIOD}" name="PLEDGE_PERIOD">
					
					</td>
				</tr>
<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						管理费
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						 &nbsp;${schemeMap.MANAGEMENT_FEE_RATE }%
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.MANAGEMENT_FEE }" />
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						首期租金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						 &nbsp;${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT}%
						<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE}" />
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<!-- 利率上浮比例 -->
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<%-- ${schemeMap.FLOAT_RATE }% &nbsp; --%>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						合同利率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.YEAR_INTEREST }% &nbsp;
						 
								<c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 1}">
									<input type="radio" disabled="disabled" name="YEAR_INTEREST_TYPE" value="1">浮动
									<input type="radio" name="YEAR_INTEREST_TYPE" value="2" checked="checked" disabled="disabled">固定
								</c:if>
								<c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 2}">
									<input type="radio" disabled="disabled" name="YEAR_INTEREST_TYPE" value="1" checked="checked">浮动
									<input type="radio" disabled="disabled" name="YEAR_INTEREST_TYPE" value="2">固定
											
								</c:if>
						 
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						营业税率
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.SALES_TAX_RATE }% &nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险费率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.INSURE_BASE_RATE }% &nbsp;
					</td>
				</tr>
				<tr style="display: none;">
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						印花税租赁总价比率
					</td >
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.STAMP_TAX_TOPRIC }% &nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						印花税租金总计比率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.STAMP_TAX_MONTHPRIC }% &nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						日罚息率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.FINE_RATE }% &nbsp;
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
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						概算成本（RZE）
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_RZE }" /> &nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						支付方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"> 
							 &nbsp;<c:forEach items="${payWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.PAY_WAY}">
										${item.FLAG }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						起租日期
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd"/> &nbsp;	 	
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						差旅费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						 &nbsp;<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.BUSINESS_TRIP_PRICE }" />
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
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.EQUPMENT_ADDRESS } &nbsp;
					</td>
					<td colspan="2"  style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
					&nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						租赁期满处理方式
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr"> 
							 &nbsp;<c:forEach items="${dealWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.DEAL_WAY}">
										${item.FLAG }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
					<td colspan="2"  style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
					&nbsp;
					</td>
				</tr>
				<tr>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						保险公司
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr"> 
							 &nbsp;<c:forEach items="${insureCompanyList}" var="item">
								<c:choose>
									<c:when
										test="${item.INCP_ID eq schemeMap.INSURANCE_COMPANY_ID}">
										${item.INCP_NAME }
									</c:when> 
								</c:choose>
							</c:forEach> 
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						购买方式
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr"> 
							  &nbsp;<c:forEach items="${insureBuyWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.BUY_INSURANCE_WAY}">
										${item.FLAG }
									</c:when>
									 
								</c:choose>
							</c:forEach> 
					</td>
				</tr>
				<tr>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						保险返利百分比
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						${schemeMap.INSURE_REBATE_RATE }%
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						购买时间
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						  &nbsp;
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 1}">
									<input type="radio" disabled="disabled" name="BUY_INSURANCE_TIME" value="1"
										checked="checked">
												全年购买
												<input type="radio" disabled="disabled" name="BUY_INSURANCE_TIME" value="2">
												分年购买
											</c:if>
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 2}">
									<input type="radio" disabled="disabled" name="BUY_INSURANCE_TIME" value="1">
												全年购买
												<input type="radio" disabled="disabled" name="BUY_INSURANCE_TIME" value="2"
										checked="checked">
												分年购买
											</c:if>							 
					</td>
				</tr>
			</table>
					</td>
				</tr>
				<tr>
			<table id="insureTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<td style="text-align: left" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4" >
						保险费
					</td>
					<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" colspan="1" > 
						&nbsp; 
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td width="20%"    style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						保险项目
					</td>
					<td width="20%"    style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						保险期间
					</td>
					<td width="10%"    style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						保险费率
					</td>
					<td width="18%"    style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						保险费用
					</td>
					<td width="27%"    style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						备注
					</td> 
				</tr>
				<c:set value="0" var="insureTotal"></c:set>
				<c:forEach items="${insuresList}" var="item" varStatus="status">
					<tr>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							 &nbsp; <c:forEach items="${insureTypeList}" var="insureType">
									<c:choose>
										<c:when test="${insureType.INIC_ID eq item.INSURE_ITEM}">
											 ${insureType.INTP_NAME } 
										</c:when> 
									</c:choose>	
								</c:forEach> 
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.START_DATE }
							到
							${item.END_DATE }  &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.INSURE_RATE }% &nbsp;
						</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber value="${item.INSURE_PRICE }" pattern="#,##0.00"/>
							<c:set var="insureTotal" value="${insureTotal+item.INSURE_PRICE }"></c:set>	
						 &nbsp;</td>
						<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							${item.MEMO }&nbsp; &nbsp;
						</td> 
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr" colspan="4">
						合计（大写）：<span id="insureTotalBig"></span>
					<script type="text/javascript">document.getElementById('insureTotalBig').innerHTML=atoc(${insureTotal});</script>
					</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）<fmt:formatNumber value="${insureTotal}" pattern="#,##0.00"/> &nbsp;
					</td>
				</tr>
			</table>
				</tr>
				<tr>
					<td colspan="4">
				<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr align="center">
					<td>
					<c:if test="${flag eq 2}"><input type="button" class="ui-state-default ui-corner-all" value="受理" onclick="acceptProject()" /><input type="button" class="ui-state-default ui-corner-all" value="驳回" onclick="receptProject()" /></c:if><c:if test="${flag eq 1}"><input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="commitProject()" /></c:if>
					<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
					</td>
					</tr>
			</table>
					</td>
				</tr>
			</table>
			</form>
		</div> 
		</div>
		</div>		
		
		</div>
	</body>
</html>
