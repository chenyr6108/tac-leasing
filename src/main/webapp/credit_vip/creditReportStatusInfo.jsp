<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit_vip/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit_vip/js/creditLog.js"></script>
	<script type="text/javascript">
		
		$(function (){
			$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
			$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			if($("#isSalesDesk").val()=='Y') {
				$("#__action").val("creditReport.caseQuery");
			}
		});
		
		function doQuery() {
			$("#form1").submit();
		}
	</script>
	<style type="text/css">
	</style>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" id="isSalesDesk" name="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="__action" id="__action" value="creditReportVip.showCreditStatusInfo">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;案件状况<c:if test="${isSalesDesk ne 'Y' }">(绿色通道)</c:if></span>
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
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${start_date }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					案件动态：
					</td>
					<td>
						<cs:creditStatusCombox name="credit_status" style="width: 80px; height: 18px;" displayValue="${credit_status }"/>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%">
				        <c:if test="${isSalesDesk ne 'Y' }">
				        	<a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a>
				        </c:if>
				        <c:if test="${isSalesDesk eq 'Y' }">
				        	<a href="#" name="search" id="search" onclick="doQuery();"  class="blue_button">搜 索</a>
				        </c:if>
				        </td>
				      </tr>
				    </table>
	          		</div>
	         <c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray"  disabled="disabled">
		          		</div>
		          		<br>
	          		</c:if>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号 </strong>
					</th>
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="create_date" pagingInfo="${pagingInfo }"><strong>进件日期 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="areaName" pagingInfo="${pagingInfo }"><strong>地区</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="creditRuncode" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="suplName" pagingInfo="${pagingInfo }"><strong>供应商</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="custName" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="thingName" pagingInfo="${pagingInfo }"><strong>标的物</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="leaseRze" pagingInfo="${pagingInfo }"><strong>融资额 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="businessStatus" pagingInfo="${pagingInfo }"><strong>案件动态</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="processer" pagingInfo="${pagingInfo }"><strong>服务课人员 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="sensorUser" pagingInfo="${pagingInfo }"><strong>协办业务 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="memo" pagingInfo="${pagingInfo }"><strong>备注 </strong></page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.create_date }" pattern="yyyy-MM-dd"/>&nbsp;</td>
						<td style="text-align: center;">${item.areaName }&nbsp;</td>
						<td style="text-align: center;"><a onclick="javaScript:location.href='../servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.creditId}'" href="javaScript:void(0)">${item.creditRuncode }</a>&nbsp;</td>
						<td style="text-align: center;">${item.suplName }&nbsp;</td>
						<td style="text-align: center;">${item.custName }&nbsp;</td>
						<td style="text-align: center;">${item.thingName }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.leaseRze }" />&nbsp;</td>
						<td style="text-align: center;"><cs:creditStatusFormatTag value="${item.businessStatus }"/>&nbsp;</td>
						<td style="text-align: center;">${item.processer }&nbsp;</td>
						<td style="text-align: center;">${item.sensorUser }&nbsp;</td>
						<td style="text-align: center;">${item.memo }&nbsp;</td>
					</tr>
				</c:forEach>
				<tr class="ui-jqgrid-labels">
					<td colspan="6">&nbsp;</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;" >融资总额：</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;"><fmt:formatNumber type="currency" value="${totalMoney }" />&nbsp;</td>
					<td colspan="4">&nbsp;</td>
				</tr>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>