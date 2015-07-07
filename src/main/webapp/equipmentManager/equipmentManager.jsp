<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>设备管理</title>
		<script src="${ctx }/equipmentManager/js/equipmentManager.js" type="text/javascript"></script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="equipmentManager.getEquipmentManager" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;设备管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
					<div>
						<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr >
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同状态
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							承租人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同号
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							支付表号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							制造商
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							产品名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							产品型号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							供应商
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							单价
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count }</td>
							<td style="text-align: center;"><c:if test="${item.RECT_STATUS eq 0}">正常</c:if><c:if test="${item.BUSINESS_ISOPEN eq 1}">预期</c:if><c:if test="${item.BUSINESS_ISOPEN eq 2}">转法务</c:if>&nbsp;</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
							<td style="text-align: center;">${item.RECP_CODE }&nbsp;</td>  
							<td style="text-align: center;">${item.THING_KIND }&nbsp;</td>
							<td style="text-align: center;">${item.THING_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.MODEL_SPEC }&nbsp;</td>
							<td style="text-align: center;">${item.BRAND }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }"/>&nbsp;</td>
							<td style="text-align: center;">&nbsp;</td>
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