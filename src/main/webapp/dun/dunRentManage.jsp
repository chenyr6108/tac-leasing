<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/dun/js/dunRent.js"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/jquery.autocomplete.css" />
		<title>客户状况</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" id="__action" name="__action"
				value="dunRent.manage" />   
			<div>
			<div
				class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="height: 30px">
				<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;客户状况</span>
			</div>
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td><input type="text" name="start_date" style="width:80px; height:18px;" readonly="readonly"
										id="datebegin" value="${start_date }">
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="end_date" id="dateend" style="width:80px; height:18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					付讫状态：
					</td>
					<td>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:if test="${pay_type eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${pay_type eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${pay_type eq -1}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<select name="pay_type" style="border: #03515d solid 1px;">
						<option value="-1"${ type2}>
							全部
						</option>
						<option value="0"${ type0}>
							已付讫
						</option>
						<option value="1"${ type1}>
							未付讫
						</option> 
					</select>	    
					</td>
					 <td>经办人：</td> 	
				          <td><input type="text"  name="NAME" id="NAME" style="width:100px; height:18px;" value="${NAME }"></td>
				          
				          <td>
							公司别：
							<select name="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
							</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" style=" width:360px;height:18px; font-size: 12px;">
				          </td>
				           <td>办事处：</td> 	
				          <td colspan="2"><select id="COMPANY" name="COMPANY" >
				         	 <option value="">全部</option>
				          <c:forEach items="${companyList }" var="item" >
				          	<option value="${item.DECP_ID}" <c:if test="${item.DECP_ID == COMPANY}">selected='selected'</c:if>>${item.DECP_NAME_CN }</option>
				          </c:forEach>
				          </select>
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<div class="zc_grid_body ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#dunRentTab">
						
						<thead>
							<tr>
								<td align="right" colspan="11" style="text-align:center;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
									<%@ include file="/common/pageControlTop.jsp"%>
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									状态
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									承租人
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									办事处
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									经办人
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									合同个数
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付表个数
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									应付总金额
								</th> 
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									实付总金额
								</th> 
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									差额
								</th> 
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									罚息
								</th> 
								<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
									还款明细
								</th> --> 
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;cursor: pointer;"
									onclick="$dunRent.showDunList('${item.CUST_CODE }','${item.CUST_ID }')">&nbsp;<c:choose><c:when test="${item.DUN eq 0 }"><img src="${ctx }/images/u614.gif"></c:when><c:when test="${item.DUN eq 2 }"><img src="${ctx }/images/u617.gif"></c:when><c:otherwise><img src="${ctx }/images/u608.gif"></c:otherwise></c:choose></td>
								<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
								<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
								<td style="text-align: center;">${item.NAME }&nbsp;</td>
								<td style="text-align: center;">${item.CNT_RECT }&nbsp;</td>
								<td style="text-align: center;">${item.CNT_RECP }&nbsp;</td>
								<td style="text-align: right;">&nbsp;<fmt:formatNumber type="currency"
										value="${item.MONTH_PRICE }"></fmt:formatNumber></td>
								<td style="text-align: right;">&nbsp;<fmt:formatNumber type="currency"
										value="${item.REDUCE_PRICE }"></fmt:formatNumber></td>
								<td style="text-align: right;">&nbsp;<fmt:formatNumber type="currency"
										value="${item.MONTH_PRICE-item.REDUCE_PRICE }"></fmt:formatNumber><input type="hidden" name="leave_price" value="${item.MONTH_PRICE-item.REDUCE_PRICE }" /></td>
								<td style="text-align: right;">&nbsp;<fmt:formatNumber type="currency" value="${item.DUN_FINE }"></fmt:formatNumber></td>
							<%-- 	<td style="text-align: center"><a href="../servlet/defaultDispatcher?__action=statement.queryCustStatementInfo&cust_code=${item.CUST_CODE }&cust_name=${item.CUST_NAME }">还款明细</a></td>
							 --%>
							<%-- <td style="text-align: center">&nbsp;<a href="../servlet/defaultDispatcher?__action=statement.queryCustomerBillForSalesForNew&CUST_ID=${item.CUST_ID}&cust_name=${item.CUST_NAME }">还款明细</a></td> --%>
							
							</tr>
							<tr>
								<td align="center" colspan="10">
									<div id="showDunListTable${item.CUST_CODE }" align="center"
										style="display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td align="right" colspan="11" style="text-align:center;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<%@ include file="/common/pageControl.jsp"%>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;height: 26px" colspan="10">
								<img src="${ctx }/images/u608.gif">
								正常
								<img src="${ctx }/images/u614.gif">
								逾期
							<!-- 	<img src="${ctx }/images/u617.gif">
								转法务 -->&nbsp;
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</form> 
		
		<div id="derateFineDialog" style="display: none;" title="罚息减免">
		<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
			<div class="zc_grid_body ">
		<form action="../servlet/defaultDispatcher" name="derateForm" id="derateForm"
			method="post">
			<input type="hidden" id="__action" name="__action"
				value="dunTask.saveDerate_Zujin" />  
			<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">减免日期</td>
					<td style="width: 35%;height: 26px;" colspan="3"><input name="reduce_date" id="reduce_date"  style="border: #03515d solid 1px;" readonly="readonly" onchange="$dunTask.derateFine2();"/>&nbsp;</td>
				</tr>		
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">租赁合同号</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineLeaseCode"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">支付表号<input type="hidden" id="reduce_paylistId" name="reduce_paylistId" value="" /></td>
					<td style="width: 35%;height: 26px;"><span id="derateFinePaylistCode"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">应付款日期</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineShouldPayDate"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">应付款金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineShouldPayPirce"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">逾期天数</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunDay"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">逾期金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunPrice"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">罚息金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunFine"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">免除罚息</td>
					<td style="width: 35%;height: 26px;"><input type="text" name="dunFine_rate" size="4" value="比例" onfocus="javascript:this.value=''" onblur="$dunRent.updateDunFine_rate(this.value);"/>%<input type="text" name="dunFine" size="8" value="金额" onfocus="javascript:this.value=''" onblur="$dunRent.updateDunFine(this.value);"/></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
					<td style="width: 15%;height: 26px;">罚息金额 </td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunFineRate"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">免除罚息</td>
					<td style="width: 35%;height: 26px;"><input type="text" name="dunFineRate_rate" size="4" value="0" onfocus="javascript:this.value=''" onblur="$dunRent.updateDunFineRate_rate(this.value);"/>%<input type="text" name="dunFineRate"  size="8" value="0" onfocus="javascript:this.value=''" onblur="$dunRent.updateDunFineRate(this.value);"/></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">申请人</td>
					<td style="width: 35%;height: 26px;">${s_employeeName }</td>
					<td style="width: 15%;height: 26px;">申请时间</td>
					<td style="width: 35%;height: 26px;"><SPAN id="apply_date"><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></SPAN></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">备注</td>
					<td style="width: 85%;height: 26px;" colspan="3"><textarea name="reduce_mome" style="width: 480px;height: 50px;font-size: 12px;"></textarea></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">审批人</td>
					<td style="width: 35%;height: 26px;">&nbsp;</td>
					<td style="width: 15%;height: 26px;">审批时间</td>
					<td style="width: 35%;height: 26px;">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">审批结果</td>
					<td style="width: 85%;height: 26px;" colspan="3">&nbsp;</td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">备注</td>
					<td style="width: 85%;height: 26px;" colspan="3">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr"> 
					<td style="height: 26px;text-align: center" colspan="4"><input type="button" class="ui-state-default ui-corner-all" value="提 交" onclick="$dunRent.saveDerate();"/>  <input type="reset" class="ui-state-default ui-corner-all" value="重 置"/></td>
				</tr>
			</table>	
			</form>	
			</div>		
		</div>
		</div>
		
		
		
	</body>
</html>