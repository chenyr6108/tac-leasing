<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>每日来款租金分解明细表</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
		function doSearchs()
		{
			document.form1.submit();
		}
		
	 	function showEditPayMoneyReviewRecord(code,id)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOne&lease_code='+code+'&RECT_ID='+id;
	 	}
	 	
	 	function excelFun()
	 	{
	 		$("#__action").val("decompose.finaComeViewExcel") ;
	 		$("#form1").submit() ;
	 		$("#__action").val("decompose.finaComeViewDef") ;
	 	}
	  
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="decompose.finaComeViewDef" />
			<input type="hidden" name="typeState" id="typeState" value="1" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;每日来款租金分解明细表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr> 
				         <td>日期：</td>
				          <td>
				          <input type="text" name="dateState" style=" width: 150px; height: 18px;" readonly="readonly"
										id="datebegin" value="${dateState }"></td>
				         
					 <td>
					银行：
					</td>
					<td>
						<select name="bank" id="bank" style="width: 200px;  height: 18px;">
						<option value=""></option>
							<c:forEach items="${finaComeAllBank }" var="item" varStatus="status">
								<option value="${item.OPPOSING_BANKNAME }" <c:if test="${item.OPPOSING_BANKNAME eq bank }">selected="selected"</c:if> >${item.OPPOSING_BANKNAME }</option>
							</c:forEach>
						</select>
					</td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearchs();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
							 <tr class="ui-state-default ui-th-ltr zc_grid_head"><td colspan="9"><input type="button" name="pdfbutton" onclick="excelFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出来款租金分解明细表"></td></tr>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
										${bank }当日来款额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7" style="text-align: right;">
										<fmt:formatNumber type="currency" value="${finaComeByDay.INCOME_MONEYDAY eq null ? 0 :finaComeByDay.INCOME_MONEYDAY }" />&nbsp;
									</th>
								</tr>
								<!--  Modify by Michael  2012-02-23 用total 未分解额  
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
										前日待分解额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7" style="text-align: right;">
										<fmt:formatNumber type="currency" value="${finaComeByOldDay.INCOME_MONEYOLDDAY eq null ? 0 :finaComeByOldDay.INCOME_MONEYOLDDAY }" />&nbsp;
									</th>
								</tr>
								-->
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
										Total累计未分解额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7" style="text-align: right;">
									<fmt:formatNumber type="currency" value="${findAllNotDecompose.NOTDECOMP eq null ? 0 :findAllNotDecompose.NOTDECOMP }" />&nbsp;
									</th>
								</tr>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="2">
										操作日期&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="2">
										来款日期&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="2">
										承租人&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="2">
										合同号&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="7">
										分解金额&nbsp;
									</th>
								</tr>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										保证金&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										租金&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										税金&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										待分解&nbsp;
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										罚息&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										留购价&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										小计&nbsp;
									</th>
								</tr>
							</thead>
							<tbody>
				 		<!-- Add By Michael 2012 1/4 -->
     				 			 <c:set var="Total1" value="0"></c:set>
				 			  <c:set var="Total2" value="0"></c:set>
				 			   <c:set var="Total3" value="0"></c:set>
				 			    <c:set var="Total4" value="0"></c:set>
			 			      <c:set var="Total5" value="0"></c:set>
			 			      <c:set var="Total6" value="0"></c:set>
			 			      <c:set var="Total7" value="0"></c:set>							
							 	<c:forEach items="${finaComeAllRent }" var="items" varStatus="status">
							 		<tr  class="ui-widget-content jqgrow ui-row-ltr">							 			
							 			 <c:set var="OPPOSING_DATE" value="0"></c:set>
							 			  <c:set var="CUST_NAME" value="0"></c:set>
							 			   <c:set var="LEASE_CODE" value="0"></c:set>
							 			 <c:set var="zhi1" value="0"></c:set>
							 			  <c:set var="zhi2" value="0"></c:set>
							 			   <c:set var="zhi3" value="0"></c:set>
							 			    <c:set var="zhi4" value="0"></c:set>
							 			      <c:set var="zhi5" value="0"></c:set>
							 			      <c:set var="zhi6" value="0"></c:set>
							 			      <c:set var="zhi7" value="0"></c:set>
										<c:forEach items="${finaComeAllMoney }" var="item" varStatus="status"> 	
										<c:if test="${items.FIIN_ID eq item.FIIN_ID}">
										<c:set var="OPPOSING_DATE" value="${item.OPPOSING_DATE }"></c:set>
							 			  <c:set var="CUST_NAME" value="${item.CUST_NAME }"></c:set>
							 			   <c:set var="LEASE_CODE" value="${item.LEASE_CODE }"></c:set>
							 			   <c:set var="CREATE_DATE" value="${item.CREATE_DATE }"></c:set>
											</c:if>
											<c:if test="${ (item.FICB_ITEM eq '保证金' or item.FICB_ITEM eq '保证金B' or item.FICB_ITEM eq '保证金C') and items.FIIN_ID eq item.FIIN_ID}">
												<c:set var="zhi2" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set> <c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>
												<c:set var="Total2" value="${item.REAL_PRICE+Total2 }"></c:set>
												<c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
											<c:if test="${ item.FICB_ITEM eq '税金' and items.FIIN_ID eq item.FIIN_ID}">
												<c:set var="zhi3" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set><c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>
												<c:set var="Total3" value="${item.REAL_PRICE+Total3 }"></c:set>
												<c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
											<c:if test="${ item.FICB_ITEM eq '待分解来款' and items.FIIN_ID eq item.FIIN_ID}">
												 <c:set var="zhi4" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set><c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>  
												<!--  <c:forEach items="${recpAndIncomeMoney }" var="itemrecp">
													<c:if test="${itemrecp.RECP==items.RECP_ID}"><c:set var="zhi4" value="${itemrecp.RECPMONEY eq null ? 0 :itemrecp.RECPMONEY }"></c:set><c:set var="zhi1" value="${itemrecp.RECPMONEY+zhi1 }"></c:set></c:if>
												</c:forEach>
												 -->
												 <c:set var="Total4" value="${item.REAL_PRICE+Total4 }"></c:set>
												 <c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
											<c:if test="${item.FICB_ITEM eq '租金' and items.FIIN_ID eq item.FIIN_ID}">
												<c:set var="zhi5" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set><c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>
												<c:set var="Total5" value="${item.REAL_PRICE+Total5 }"></c:set>
												<c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
											<c:if test="${item.FICB_ITEM eq '租金罚息' and items.FIIN_ID eq item.FIIN_ID}">
												<c:set var="zhi6" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set><c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>
											<c:set var="Total6" value="${item.REAL_PRICE+Total6 }"></c:set>
											<c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
											<c:if test="${item.FICB_ITEM eq '设备留购价' and items.FIIN_ID eq item.FIIN_ID}">
												<c:set var="zhi7" value="${item.REAL_PRICE eq null ? 0 :item.REAL_PRICE }"></c:set><c:set var="zhi1" value="${item.REAL_PRICE+zhi1 }"></c:set>
												<c:set var="Total7" value="${item.REAL_PRICE+Total7 }"></c:set>
												<c:set var="Total1" value="${item.REAL_PRICE+Total1 }"></c:set>
											</c:if>
										</c:forEach>
										<td style="text-align: center;">${CREATE_DATE }&nbsp;</td>
										<td style="text-align: center;">${OPPOSING_DATE }&nbsp;</td>
							 			<td style="text-align: center;">${CUST_NAME }&nbsp;</td>
							 			<td style="text-align: center;">${LEASE_CODE }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi2 eq null ? 0 :zhi2 }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi5 eq null ? 0 :zhi5 }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi3 eq null ? 0 :zhi3 }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi4 eq null ? 0 :zhi4 }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi6 eq null ? 0 :zhi6 }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi7 eq null ? 0 :zhi7 }" />&nbsp;</td>										
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${zhi1 eq null ? 0 :zhi1 }" />&nbsp;</td>
									</tr>
								</c:forEach>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="4" style="text-align: right;">小计&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total2 eq null ? 0 :Total2 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total5 eq null ? 0 :Total5 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total3 eq null ? 0 :Total3 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total4 eq null ? 0 :Total4 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total6 eq null ? 0 :Total6 }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total7 eq null ? 0 :Total7 }" />&nbsp;</td>										
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${Total1 eq null ? 0 :Total1 }" />&nbsp;</td>
								</tr>
								<c:set var="TotalIncomeMoney" value="0"></c:set>	
									<c:forEach items="${finaIncome}" var="ite">
										<tr  class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><fmt:formatDate value="${ite.OPPOSING_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
											<td style="text-align: center;"><fmt:formatDate value="${ite.OPPOSING_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
								 			<td style="text-align: center;">${ite.OPPOSING_UNIT }&nbsp;</td>
								 			<td style="text-align: center;">&nbsp;</td>
											<td style="text-align: right;">&nbsp;</td>
											<td style="text-align: right;">&nbsp;</td>
											<td style="text-align: right;">&nbsp;</td>
											<td style="text-align: right;"><fmt:formatNumber type="currency" value="${ite.INCOME_MONEY }" />&nbsp;</td>
											<td style="text-align: right;">&nbsp;</td>	
											<td style="text-align: right;">&nbsp;</td>
											<td style="text-align: right;"><fmt:formatNumber type="currency" value="${ite.INCOME_MONEY }" />&nbsp;</td>																					
										</tr>
										<c:set var="TotalIncomeMoney" value="${ite.INCOME_MONEY+TotalIncomeMoney }"></c:set>
									</c:forEach>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;" colspan="4" >小计&nbsp;</td>
									<td style="text-align: right;">&nbsp;</td>
									<td style="text-align: right;">&nbsp;</td>
									<td style="text-align: right;">&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${TotalIncomeMoney }" />&nbsp;</td>
									<td style="text-align: right;">&nbsp;</td>
									<td style="text-align: right;">&nbsp;</td>										
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${TotalIncomeMoney }" />&nbsp;</td>
								</tr>									
							</tbody>
						</table>
				</div>
				</div>
				</div>			
		</form>
	</body>
</html>