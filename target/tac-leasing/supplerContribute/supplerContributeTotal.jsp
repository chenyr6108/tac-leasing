<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
		function doQuery() {
			$("#form1").submit();
		}	
		
		function expand(iddiv,id){
	        $("#"+iddiv).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=supplerContributeCommand.queryDetailBySuplId&suplId="+id);
	        });
		}
		
		//导出Excel
		function exportTotal() {
			window.parent.callBirt("birtReport/exportSupplerContribute/supplerContributeTotal.rptdesign","xls");
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" id="form1" name="form1" method="post">
	<input type="hidden" name="__action" id="__action" value="supplerContributeCommand.query">
	<input type="hidden" name="DATE" id="DATE" value="${DATE }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;供应商贡献度(截止${DATE })</span>
			</div>
		<div>
			<table width="97%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="60%" class="ss_t">
						<table style="margin-left:10px;">
							<tr>
								<td>供应商名称：</td>
								<td colspan="5"><input value="${SUPL_NAME }" id="SUPL_NAME" name="SUPL_NAME" style="width:200px;"></td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
		</div>
		<br><br><br>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	<table style="width: 100%;"><tr>
		<td>
			<input type="button" value="导出Excel" class="panel_button" onclick="exportTotal()">
		</td>
		<td>
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
		</td>
	</tr></table>
	<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
		<table class="grid_table">
			<tr>
				<th>序号</th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="suplName">供应商名称</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="leaseCount">合同笔数</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="payMoney">净拨款金额</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="equipmentCount">设备数量</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="accrual">利息总额</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="tr">平均实际</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="grantPrice">授信总额</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="line">发票待补次数额度</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="total_qty">缺发票次数</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="left_qty">剩余发票次数</page:pagingSort></th>
				<th><page:pagingSort pagingInfo="${pagingInfo }" orderBy="dunCountBySupl">逾期合同笔数</page:pagingSort></th>
				<th>逾期合同百分比</th>
			</tr>
			<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="count">
				<tr>
					<td style="text-align:center;">${count.count }</td>
					<td style="text-align:center;"><a href="#" onClick="expand('pactAffix${item.suplId}',${item.suplId});">${item.suplName }</a></td>
					<td style="text-align:right;">${item.leaseCount }</td>
					<td style="text-align:right;"><fmt:formatNumber value="${item.payMoney }" type="currency" /></td>
					<td style="text-align:right;">${item.equipmentCount }</td>
					<td style="text-align:right;"><fmt:formatNumber value="${item.accrual }" type="currency" /></td>
					<td style="text-align:right;"><fmt:formatNumber value="${item.tr }" type="currency" pattern="##.000"/></td>
					<td style="text-align:right;"><fmt:formatNumber value="${item.grantPrice }" type="currency" /></td>
					<td style="text-align:center;">${item.line }</td>
					<td style="text-align:center;">${item.total_qty }</td>
					<td style="text-align:center;">
					<c:choose>
						<c:when test="${item.left_qty >=0 }">${item.left_qty}</c:when>
						<c:otherwise>0</c:otherwise>
					</c:choose>
					</td>							
					<td style="text-align:right;">${item.dunCountBySupl }</td>
					<td style="text-align:right;"><fmt:formatNumber value="${item.dunCountBySupl/item.leaseCount*100}" type="currency" pattern="#0.00"/>%</td>						
				</tr>
				<tr>
				<th class="pact" colspan="13">
					<div id="pactAffix${item.suplId }" align="center"
						style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
						<img src="${ctx }/images/loading.gif">
					</div>
				</th>
			</tr>						
			</c:forEach>
		</table>
	</div>
	<page:pagingToolbar pagingInfo="${pagingInfo }"/>
	</div>
	</form>
	<font color="#FF0000">*</font>逾期次数：曾经逾期超过15天(含15天)之期数
</body>
</html>