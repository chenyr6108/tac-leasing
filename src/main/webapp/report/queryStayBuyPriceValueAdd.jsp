<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("insuranceReport.stayBuyPriceTaxToExcelForValueAdd");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.stayBuyPriceTaxReporForValueAdd");
		}	
		
		function expLinkerInfoToExcel(){
		  $("#__action").val("insuranceReport.stayBuyPriceTaxLinkInfoToExcelForValueAdd");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.stayBuyPriceTaxReporForValueAdd");
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
				value="insuranceReport.stayBuyPriceTaxReporForValueAdd">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;留购款增值税</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
					<table width="85%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="200" class="ss_t">&nbsp;&nbsp;
				          查询日期：<input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:150px; height:18px;">
					</td>

						<td colspan="5" class="ss_t">						公司别：
						<select name="companyCode">
							<option value="">全部</option>
							<c:forEach items="${companys}" var="item">
								<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
							</c:forEach>
						</select>	
						</td>
						<td class="ss_t">查询内容：
							 <input type="text" id="content" name="content" value="${content }" style="width:395px; height:20px;">
						</td>
				        <td width="55" class="ss_th">			        
				        </td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();" style="cursor:pointer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="ui-state-default ui-corner-all"  value="导出客户邮寄信息(EXCEL)"  onclick="expLinkerInfoToExcel();" style="cursor:pointer"></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>分解项目</strong>
					</th>					
					<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>增值税</strong>
					</th>
					<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>城建税</strong>
					</th>
					<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>教育费附加</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>小计</strong>
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>计税依据</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>计税依据</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>计税依据</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税额</strong>
					</th>					
				</tr>
				<c:forEach items="${dw.resultList}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${item.FICB_ITEM }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.REAL_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YYSHUIE }" type="currency" pattern="#.00#"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YYSHUIE }" type="currency" pattern="#.00#"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.CJSHUIE }" type="currency" pattern="#.00#"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.YYSHUIE }" type="currency" pattern="#.00#"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.JYSHUIE }" type="currency" pattern="#.00#"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.XIAOJI }" type="currency" pattern="#.00#"/>&nbsp;</td>
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