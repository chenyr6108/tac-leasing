<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>保证金余额表</title>
		<script type="text/javascript">
			function expToExcel(){
				$("#__action").val("report.exportPledgeBalance");
				$("#form1").submit();
				$("#__action").val("report.queryPledgeReport");
			} 
			$(function (){
				$("#startDate").datepicker($.datepicker.regional["zh-CN"]);
				$("#endDate").datepicker($.datepicker.regional["zh-CN"]);
			});
		</script>
	</head>

	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="report.queryPledgeReport">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保证金余额表</span>
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
								 <tr>
					          		<td>起始时间：</td>
					          		<td><input type="text" name="startDate" id="startDate"
										value="${startDate}"
										style="width: 150x" /></td>	          
									<td>
										结束时间：
									</td>
									<td><input type="text" name="endDate" id="endDate"
										value="${endDate}"
										style="width: 150px" />
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
				<tr >
				<td>
					<input class="ui-state-default ui-corner-all" type="button" onclick="expToExcel();" value="导出(EXCEL)">
				</td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>地区</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金期初余额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金本期增加</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金本期减少</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金期末余额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保证金类别</strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.AREA }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.QICHU }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.PLEDGE_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.BENQIJIANSHAO }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.QIMOYUE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><c:if test="${not empty item.PLEDGE_AVE_PRICE && item.PLEDGE_AVE_PRICE != 0}">平均冲抵</c:if>&nbsp;<c:if test="${not empty item.PLEDGE_BACK_PRICE && item.PLEDGE_BACK_PRICE != 0}">期末退回</c:if>&nbsp;<c:if test="${not empty item.PLEDGE_LAST_PRICE && item.PLEDGE_LAST_PRICE != 0}">期末冲抵</c:if></td>					
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>			
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>