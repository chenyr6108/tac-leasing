<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>销账日报表</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		
		<script type="text/javascript">
			$(function(){
				$("#query_date").datepicker($.datepicker.regional['zh-CN']);
			})

		 	function expToExcel()
		 	{
		 		$("#__action").val("showDailyDecomposeExcel.dailyFinaDecomposeReportDetailToExcel") ;
		 		$("#form1").submit() ;
		 		$("#__action").val("decompose.dailyFinaDecomposeReportDetail") ;
		 	}
			
			function getHitoryDailyDecomposeExcel(e){
				$(e).attr("disabled", "disabled");
				var query_date = "";
				query_date= document.getElementById("query_date").value;
				if(query_date == ""){
					alert("请选择查询日期");
					return;
				}
		
				window.parent.callBirt("birtReport/financeReport/historyDailyDecomposeReport.rptdesign", "xls", {"query_date" : query_date});

				$(e).attr("disabled", false);
			}
		</script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" id="__action"
				value="decompose.dailyFinaDecomposeReportDetail">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;销账日报表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr>
				<td>&nbsp;&nbsp;</td>
				<td>查询日期 ：<input type="text" name="query_date" id="query_date" style=" width: 80px; height: 18px;" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getHitoryDailyDecomposeExcel(this);"  value="导出历史资料"/></td>
				<td>&nbsp;&nbsp;</td>
				</tr>
			</table>
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tbody>
		 			   <c:set var="Total1" value="0"></c:set>
		 			   <c:set var="Total2" value="0"></c:set>
		 			   <c:set var="Total3" value="0"></c:set>
		 			   <c:set var="Total4" value="0"></c:set>
	
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7">现金销账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();">
							</th>
						</tr>	
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								来款日期&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								承租人&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								客户编号&nbsp;
							</th>									
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								合同号&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								分解项目&nbsp;
							</th>									
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								分解金额&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								来款银行&nbsp;
							</th>									
						</tr>									 			      							
							<c:forEach items="${finaTodayFinaIncome }" var="items" varStatus="status">
							<c:set var="Total1" value="${items.REAL_PRICE+Total1 }"></c:set>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${items.OPPOSING_DATE }&nbsp;</td>
								<td style="text-align: center;">${items.CUST_NAME }&nbsp;</td>
					 			<td style="text-align: center;">${items.CUST_CODE }&nbsp;</td>
					 			<td style="text-align: center;">${items.LEASE_CODE }&nbsp;</td>
								<td style="text-align: center;">${items.FICB_ITEM }&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${items.REAL_PRICE}" />&nbsp;</td>
								<td style="text-align: center;">${items.BANK_NAME }&nbsp;</td>
								</tr>
								</c:forEach>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: right;"colspan="5">总计&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total1 }" />&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
								</tr>
								
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7">暂收款销账&nbsp;
								</th>
							</tr>
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								来款日期&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								承租人&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								客户编号&nbsp;
							</th>									
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								合同号&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" >
								分解项目&nbsp;
							</th>									
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								分解金额&nbsp;
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								来款银行&nbsp;
							</th>									
						</tr>															 			      							
							<c:forEach items="${finaLastDecompose }" var="item1" varStatus="status">
							<c:set var="Total2" value="${item1.REAL_PRICE+Total2 }"></c:set>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item1.OPPOSING_DATE }&nbsp;</td>
								<td style="text-align: center;">${item1.CUST_NAME }&nbsp;</td>
					 			<td style="text-align: center;">${item1.CUST_CODE }&nbsp;</td>
					 			<td style="text-align: center;">${item1.LEASE_CODE }&nbsp;</td>
								<td style="text-align: center;">${item1.FICB_ITEM }&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item1.REAL_PRICE}" />&nbsp;</td>
								<td style="text-align: center;">${item1.BANK_NAME }&nbsp;</td>
								</tr>
								</c:forEach>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: right;"colspan="5">总计&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total2 }" />&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
								</tr>

							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7">暂收款-余额变动表&nbsp;
								</th>
							</tr>			 			      							
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									来款日期&nbsp;
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									来款单位&nbsp;
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									期初余额&nbsp;
								</th>									
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									本期新增&nbsp;
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									本期减少&nbsp;
								</th>									
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									期末余额&nbsp;
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									来款银行&nbsp;
								</th>									
							</tr>
								<c:set var="Total5" value="0"></c:set>
								<c:set var="Total6" value="0"></c:set>
								<c:set var="Total7" value="0"></c:set>
							<c:forEach items="${finaLastDynamicDecompose }" var="item2" varStatus="status">
								<c:set var="Total3" value="0"></c:set>
								<c:set var="Total3" value="${item2.INCOME_MONEY+item2.CURRENT_NEW-item2.CURRENT_REDUCE }"></c:set>
								<c:set var="Total5" value="${item2.INCOME_MONEY+Total5 }"></c:set>
								<c:set var="Total6" value="${item2.CURRENT_NEW+Total6 }"></c:set>
								<c:set var="Total7" value="${item2.CURRENT_REDUCE+Total7 }"></c:set>
								<c:set var="Total4" value="${Total4+Total3 }"></c:set>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item2.OPPOSING_DATE }&nbsp;</td>
								<td style="text-align: center;">${item2.OPPOSING_UNIT }&nbsp;</td>
					 			<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item2.INCOME_MONEY }" />&nbsp;</td>
					 			<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item2.CURRENT_NEW }" />&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item2.CURRENT_REDUCE }" />&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total3}" />&nbsp;</td>
								<td style="text-align: center;">${item2.BANK_NAME }&nbsp;</td>
								</tr>
								</c:forEach>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: right;"colspan="2">总计&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total5 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total6 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total7 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total4 }" />&nbsp;</td>
									<td style="text-align: center;">&nbsp;</td>
								</tr>																								
							</tbody>
						</table>
				</div>
				</div>
				</div>			
		</form>
	</body>
</html>