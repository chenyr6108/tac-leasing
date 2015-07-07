<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<script>
		$(function (){
			$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function query() {
			$("#form1").submit();
		}
	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="caseReportService.query">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;各区案况表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           		<div>
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
						          <tr>
							          <td colspan="6">时间：<input type="text" id="datebegin" name="DATE" value="${DATE }" style="width:150px; height:20px;" readonly="readonly">
					          </table>
					          
					          </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" name="search" id="search" onclick="query();"  class="blue_button">搜 索</a></td>
					      </tr>
					    </table>
					    <font color="#FF0000">*</font>${DATE }&nbsp;20:00:00之数据
	          		</div>
	          		<table cellspacing="0" cellpadding="0" border="0" style="width:100%">
		 <tr>
		 	<td>			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>资料中(单位:K)</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'INFO' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_SIX_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>					
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FIVE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FOUR_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_THREE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_TWO_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_ONE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_CURRENT_MONTH }" pattern="#,##0"/>&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总计:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>	
			</table>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>资料中件数</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'INFO' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;">${item.COUNT_SIX_MONTH_AGO }&nbsp;</td>					
								<td style="text-align: right;">${item.COUNT_FIVE_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_FOUR_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_THREE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_TWO_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_ONE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_CURRENT_MONTH }&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总件数:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										${item.INFO_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
	</tr>
</table>
			<br>
<table cellspacing="0" cellpadding="0" border="0" style="width:100%">
		 <tr>
		 	<td>			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>已访厂(单位:K)</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'HAS_ACCESS' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_SIX_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>					
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FIVE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FOUR_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_THREE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_TWO_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_ONE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_CURRENT_MONTH }" pattern="#,##0"/>&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总计:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>已访厂件数</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'HAS_ACCESS' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;">${item.COUNT_SIX_MONTH_AGO }&nbsp;</td>					
								<td style="text-align: right;">${item.COUNT_FIVE_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_FOUR_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_THREE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_TWO_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_ONE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_CURRENT_MONTH }&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总件数:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										${item.HAS_ACCESS_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
	</tr>
</table>
			<br>
			<table cellspacing="0" cellpadding="0" border="0" style="width:100%">
		 <tr>
		 	<td>			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>审查中(单位:K)</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'AUDIT' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_SIX_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>					
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FIVE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FOUR_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_THREE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_TWO_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_ONE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_CURRENT_MONTH }" pattern="#,##0"/>&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总计:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>审查中件数</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'AUDIT' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;">${item.COUNT_SIX_MONTH_AGO }&nbsp;</td>					
								<td style="text-align: right;">${item.COUNT_FIVE_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_FOUR_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_THREE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_TWO_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_ONE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_CURRENT_MONTH }&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总件数:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										${item.AUDIT_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
	</tr>
</table>
			<br>
			<table cellspacing="0" cellpadding="0" border="0" style="width:100%">
		 <tr>
		 	<td>			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>已核准(单位:K)</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'APPROVE' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_SIX_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>					
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FIVE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_FOUR_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>	
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_THREE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_TWO_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_ONE_MONTH_AGO }" pattern="#,##0"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT_CURRENT_MONTH }" pattern="#,##0"/>&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总计:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										<fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:98%">
			    <tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
						<strong>已核准件数</strong>
					</th>	
			    </tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_SIX_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FIVE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_FOUR_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_THREE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_TWO_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_ONE_MONTH_AGO }</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${DATE_CURRENT_MONTH }</strong>
					</th>
				</tr>
				<c:forEach items="${DATA_RESULT}" var="item" varStatus="status">
						<c:if test="${item.TYPE eq 'APPROVE' and item.COMPANY_ID !=1}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.COMPANY_NAME }&nbsp;</td>   
								<td style="text-align: right;">${item.COUNT_SIX_MONTH_AGO }&nbsp;</td>					
								<td style="text-align: right;">${item.COUNT_FIVE_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_FOUR_MONTH_AGO }&nbsp;</td>	
								<td style="text-align: right;">${item.COUNT_THREE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_TWO_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_ONE_MONTH_AGO }&nbsp;</td>
								<td style="text-align: right;">${item.COUNT_CURRENT_MONTH }&nbsp;</td>
							</tr>
						</c:if>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
			    	<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>总件数:</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_SIX_MONTH_AGO and 'LAST_DAY_OF_6' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FIVE_MONTH_AGO and 'LAST_DAY_OF_5' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_FOUR_MONTH_AGO and 'LAST_DAY_OF_4' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_THREE_MONTH_AGO and 'LAST_DAY_OF_3' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_TWO_MONTH_AGO and 'LAST_DAY_OF_2' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_ONE_MONTH_AGO and 'LAST_DAY_OF_1' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
						<strong>
							<c:forEach items="${DATA_TOTAL_RESULT}" var="item" varStatus="status">
									<c:if test="${item.DATE eq DATE_CURRENT_MONTH and 'LAST_DAY_OF_0' eq item.MONTH}">
										${item.APPROVE_COUNT }
									</c:if>
							</c:forEach>
						</strong>
					</th>	
			    </tr>
			</table>
		</td>
	</tr>
</table>
				</div>
			</div>		
		</form>
		<br>
	<font color="red">*</font>各区案况表不含企金委贷
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-5</p>
	</body>
</html>