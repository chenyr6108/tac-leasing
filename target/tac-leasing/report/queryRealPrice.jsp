<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>长期应收款余额变动表</title>
		<script type="text/javascript">
			function expToExcel(){
			  $("#__action").val("report.expRealPriceToExcel");
			  $("#form1").submit();
			  $("#__action").val("report.queryRealPriceReport");
			}	
			
			  $(function (){
					$("#startDate").datepicker($.datepicker.regional['zh-CN']);
				});
			  
				function updateDateMonth(){
					var date = $("#startDate").val() ;
					$("#startDate").val(date.toString().substring(0,7)) ;
				}	
					
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="report.queryRealPriceReport">
			<input type="hidden" name="realPriceType" id="realPriceType"
				value="${realPriceType}">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;长期应收款余额变动表(${realPriceType == 'caiwu' ? '财务' : '税务'})</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width:1200px;">
	           <div class="zc_grid_body jqgrowleft">
				  <div style="margin: 6 0 6 0px;">
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
	 							<tr>
					          		<td>查询日期</td>
					          		<td>
					          		<input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:150px; height:18px;">
									</td>	          
									<td>
									公司别：
									<select name="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
									<td><!-- 
									<input type="text" name="endDate" id="endDate"
										value="${endDate}"
										style="width: 150px" />
										 -->
									</td>
	     						 </tr>
						          <tr>
							          <td>查询内容：</td>
							          <td colspan="5"><input type="text" id="content" name="content" value="${content }" style="width:395px; height:20px;">
							          </td>
						          </tr>
					          </table>
					          
					          </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
					      </tr>
					    </table>
	          		</div>
				
				
				
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr>
				    <td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><td><page:pagingToolbarTop pagingInfo="${dw }"/></td></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th rowspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>期初余额</strong>
					</th>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>本期应收增加</strong>
					</th>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>本期应收减少</strong>
					</th>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>期末余额</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>期末净值</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金类型</strong>
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>长期应收款</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>未实现融资利息</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金余额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>长期应收款</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>未实现融资利息</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>长期应收款</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>未实现融资收益利息</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>长期应收款</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>未实现融资利息</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金</strong>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SQC }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SQW }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SQB }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YZC }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YZW }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YZB }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YJC }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YJW }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YJB }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SYC }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SYW }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SYB }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.QIMOJINGZHI }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><c:if test="${not empty item.PLEDGE_AVE_PRICE && item.PLEDGE_AVE_PRICE != 0}">平均冲抵</c:if>&nbsp;<c:if test="${not empty item.PLEDGE_BACK_PRICE && item.PLEDGE_BACK_PRICE != 0}">期末退回</c:if>&nbsp;<c:if test="${not empty item.PLEDGE_LAST_PRICE && item.PLEDGE_LAST_PRICE != 0}">期末冲抵</c:if>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>		
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>