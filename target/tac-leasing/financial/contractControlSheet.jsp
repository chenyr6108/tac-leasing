<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>合同控管表</title>
<script type="text/javascript">
	$(function() {
		$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
		$("#toDate").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function showDetail(creditId,order) {
		 $("#pactAffix"+creditId).toggle(function() {
	            $(this).load("../servlet/defaultDispatcher?__action=contractControlSheetCommand.queryContractControlSheetDetail&creditId="+creditId+"&payOrder="+order);
         });
	}
	
	//导出Excel
	function exportDetail() {
		window.parent.callBirt("birtReport/financial/contractControlSheet.rptdesign","xls",{"fromDate":$("#fromDate").val(),"toDate":$("#toDate").val(),"payOrder":$("#payOrder").val(),"content":encodeURI($("#content").val()),"contractType":$("#contractType").val(),"companyCode":$("#companyCode").val()});
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" value="contractControlSheetCommand.queryContractControlSheet">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同控管表</span>
	    </div>
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
            <div class="zc_grid_body jqgrowleft">
            	<div>
            		<table width="90%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="70%" class="ss_t">
				          <table style="margin-left:10px;">
					          <tr>
						         <td>拨款日开始：</td>
						         <td>
						          	 <input name="fromDate" id="fromDate" value="${fromDate }" style="width: 80px;" readonly="readonly">
					          	 </td>
					          	 <td>&nbsp;&nbsp;拨款日结束：</td>
						         <td>
						          	 <input name="toDate" id="toDate" value="${toDate }" style="width: 80px;" readonly="readonly">
					          	 </td>
					          	 <td>&nbsp;&nbsp;是否首拨款 ：</td>
					          	 <td>
					          	 	<select name="payOrder" id="payOrder">
					          	 		<option value="">全部</option>
					          	 		<option <c:if test='${payOrder eq "1"}'>selected="selected"</c:if> value="1">首拨</option>
					          	 		<option <c:if test='${payOrder ne "1" and payOrder!=""}'>selected="selected"</c:if> value="2">非首拨</option>
					          	 	</select>
					          	 </td>
					          	 <td>&nbsp;&nbsp;租赁类型：</td>
					          	 <td>
					          	 	<select name="contractType" id="contractType">
					          	 		<option value="">全部</option>
					          	 		<c:forEach items="${contractList }" var="item">
					          	 			<option value="${item.CODE }" <c:if test="${contractType == item.CODE }">selected="selected"</c:if>>${item.FLAG }</option>
					          	 		</c:forEach>
					          	 	</select>
					          	 </td>
					          	 <td>
								公司别：
								<select name="companyCode" id="companyCode">
									<option value="">全部</option>
									<c:forEach items="${companys}" var="item">
										<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
									</c:forEach>
								</select>			          
								</td>
					          	 <td>&nbsp;&nbsp;查询内容：</td>
					          	 <td>
					          	 	<input name="content" id="content" value="${content }">
					          	 </td>
					          </tr>
				          </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
            	</div>
            	<div class="ui-state-default ui-jqgrid-hdiv" style="background-color: white;">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="background-color: white;">
						<tr>
							<td><input value="导出Excel" type="button" class="ui-state-default ui-corner-all" onclick="exportDetail()"></td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 1760px;">
						<tr>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								序号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								案件号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								合同号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								客户名称
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								供应商名称
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" colspan="4" >
								保证金
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" colspan="6" >
								设备
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" colspan="6" >
								租金明细
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo }">业务员</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${pagingInfo }">办事处</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;" rowspan="2">
								<page:pagingSort orderBy="PAY_ORDER" pagingInfo="${pagingInfo }">是否<br>首拨款</page:pagingSort>
							</th>
						</tr>
						<tr>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PLEDGE_PRICE" pagingInfo="${pagingInfo }">保证金金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PLEDGE_ENTER_AG" pagingInfo="${pagingInfo }">保证金入供应商金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PLEDGE_ENTER_CMPRICE" pagingInfo="${pagingInfo }">保证金入我司金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="AVG_PRICE" pagingInfo="${pagingInfo }">保证金冲抵金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="LEASE_TOPRIC" pagingInfo="${pagingInfo }">设备总价款</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PAY_DATE" pagingInfo="${pagingInfo }">拨款日</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="BANK_PAY_DATE" pagingInfo="${pagingInfo }">银行放款日</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PAY_MONEY" pagingInfo="${pagingInfo }">拨款金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="START_DATE" pagingInfo="${pagingInfo }">设备起租日</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="LEASE_TERM" pagingInfo="${pagingInfo }">设备租赁周期</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PAY_WAY" pagingInfo="${pagingInfo }">支付方式</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">预期租金</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">未税利息</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">利息税金</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">未税本金</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">本金税金</th>
						</tr>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${index.count }</td>
							<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
							<td style="text-align: center;"><c:if test="${item.PAY_ORDER ne '1' }"><a href="#" onclick="showDetail('${item.ID}',${item.PAY_ORDER })">${item.LEASE_CODE }</a></c:if><c:if test="${item.PAY_ORDER eq '1' }">${item.LEASE_CODE }</c:if></td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;">${item.BACKCOMP }</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_ENTER_AG }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PLEDGE_ENTER_CMPRICE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.AVG_PRICE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">${item.PAY_DATE }</td>
							<td style="text-align: center;"><fmt:formatDate value="${item.BANK_PAY_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">${item.START_DATE }</td>
							<td style="text-align: right;">${item.LEASE_TERM }&nbsp;</td>
							<td style="text-align: center;">${item.PAY_WAY }</td>
							<td style="text-align: center;"><fmt:formatNumber value="${item.EXPECTEDRENT}" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">
							 <c:if test="${item.TAX_PLAN_CODE eq '2' }">
							 		<fmt:formatNumber value="${item.NOTAXINTEREST}" pattern="#,##0.00"/>&nbsp;
							 </c:if>
							 <c:if test="${item.TAX_PLAN_CODE eq '3'  or item.TAX_PLAN_CODE eq '4' or item.TAX_PLAN_CODE eq '5'}">
							 		<fmt:formatNumber value="${item.NOTAXINTEREST117}" pattern="#,##0.00"/>&nbsp;
							 </c:if>
								
							</td>
							<td style="text-align: center;"><fmt:formatNumber value="${item.INTERESTTAX}" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber value="${item.NOTAXOWN}" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber value="${item.TAXES}" pattern="#,##0.00"/>&nbsp;</td>
							
							<td style="text-align: center;">${item.NAME }</td>
							<td style="text-align: center;">${item.DECP_NAME_CN }</td>
							<td style="text-align: center;"><c:if test="${item.PAY_ORDER eq '1' }">首拨款</c:if><c:if test="${item.PAY_ORDER ne '1' }">非首拨款</c:if></td>
						</tr>
						<tr>
							<td style="text-align:right;" colspan="14" align="right">
								<div id="pactAffix${item.ID }" align="center" style="margin-left:1%;margin-right:1%;margin-top:10px;margin-bottom:20px;display:none;width:1700px;">
									<img src="${ctx }/images/loading.gif">
								</div>
							</td>
						</tr>
					</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td colspan="12" style="text-align: right;"><b>合计</b>&nbsp;</td>
						<td style="text-align: right;"><b><fmt:formatNumber value="${totalPayMoney }" pattern="#,##0.00"/></b>&nbsp;</td>
						<td colspan="11">&nbsp;</td>
					</tr>
					</table>
					<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
            </div>
        </div>
	</form>
</body>
</html>