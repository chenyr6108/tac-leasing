<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("interest.expInterestDetail");
		  $("#form1").submit();
		  $("#__action").val("interest.interestDetail");
		}			

		$(function (){
			$("#start_date").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function updateDateMonth(){
			var date = $("#start_date").val() ;
			$("#start_date").val(date.toString().substring(0,7)) ;
		}		
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="interest.interestDetail">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;利息收入明细</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           		<div style="margin: 6 0 6 0px;">
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
					           <tr><!-- Modify by Michael 2012 1/13 用新方式计算利息 -->
					          		<td>日期：</td>
					          		<td>
				          			<input type="text" value="<fmt:formatDate value="${start_date}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="start_date" id="start_date" readonly="readonly" style="width:150px; height:18px;">
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
					          		<td>&nbsp;</td>	          
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
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>期间</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>财务确认利息收入</strong>
					</th>
					<th colspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>税务确认收入</strong>
					</th>
					<th rowspan="1" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>差异额</strong>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="item" varStatus="s">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${s.count}&nbsp;</td>					
						<td style="text-align: center;">${item.TIME }&nbsp;</td>	
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>	
						<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>	
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						 <td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.CAI }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SHUI }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.SHUI - item.CAI }" type="currency" />&nbsp;</td>
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