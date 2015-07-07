<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>查看发货通知单</title>
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css"    href="${ctx }/common/css/tab.css" />
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
	</head>
	<body >
		<form id="form" name="form" action="../servlet/defaultDispatcher"
			method="post">
			<div style="margin:  1%;">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看发货通知单</span>
	   	</div>	
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<!--  <tr><td>合同编号${CODE}</td></tr> 
				  -->	
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td> 发货通知单编号 :&nbsp;&nbsp;&nbsp;&nbsp; ${noticeMap.DELV_CODE }  </td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">设备信息</td></tr>
				<tr>
					<th class="ui-state-default ui-th-ltr zc_grid_head"> 购销合同编号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">制造商 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">产品名称 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">规格型号 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">生产商 : </th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">单价 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">数量 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">合计 :</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">备注 :</th>
				</tr>
				<c:set var ='totals' value='0'></c:set>
				<c:forEach items="${equipList}" var="equipList">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${equipList.PUCT_CODE} &nbsp;</td>
						<td style="text-align: center;">${equipList.THING_KIND} &nbsp;</td>
						<td style="text-align: center;">${equipList.THING_NAME} &nbsp;</td>
						<td style="text-align: center;">${equipList.MODEL_SPEC} &nbsp;</td>
						<td style="text-align: center;">${equipList.BRAND} &nbsp;</td>
						<td style="text-align:right"><fmt:formatNumber value='${equipList.UNIT_PRICE}' type='currency' ></fmt:formatNumber> &nbsp;</td>
						<td style="text-align: center;">${equipList.AMOUNT} &nbsp;</td>
						<td style="text-align:right"><fmt:formatNumber value="${equipList.TOTAL}" type="currency"></fmt:formatNumber> &nbsp;</td>
						<td style="text-align: center;">${equipList.MEMO} &nbsp;</td>
					</tr><c:set var='totals' value='${equipList.TOTAL  + totals }'></c:set></c:forEach>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">总计小写 :</td>
					<td style="text-align:right"><fmt:formatNumber value="${totals}" type="currency"></fmt:formatNumber> &nbsp;</td>
					<td style="text-align: center;">总计大写 :</td>
					<td style="text-align:right"><script type="text/javascript">document.write(atoc(${totals})) </script></td>
					<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">付款信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="10%" style="text-align: center;">承租方应付金额</td>
					<td><fmt:formatNumber value="${noticeMap.SHOULD_PRICE}" type="currency" ></fmt:formatNumber></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">承租方实付金额</td>
					<td><fmt:formatNumber value="${noticeMap.REAL_PRICE}" type="currency" ></fmt:formatNumber></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">付款说明</td>
					<td >${noticeMap.PAY_REMARK}</td></tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">发货信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="10%" style="text-align: center;">发货时间  : </td>
					<td ><fmt:formatDate value="${noticeMap.DELIVERY_DATE}" pattern="yyyy-MM-dd" /> &nbsp;</td>
					<td style="text-align: center;">收货单位</td>
					<td >${noticeMap.RECEIVING_UNIT} &nbsp;</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">收货地点</td>
					<td >${noticeMap.RECEIVING_ADDR} &nbsp;</td>
					<td style="text-align: center;">开票单位</td>
					<td >${noticeMap.BALLOT_UNIT} &nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">发货联系人</td>
					<td>${noticeMap.DELIVERY_LINKMAN} &nbsp;</td>
					<td style="text-align: center;" width="10%">联系电话  :</td>
					<td>${noticeMap.DELIVERY_LINKPHONE} &nbsp;</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">收货联系人</td>
					<td>${noticeMap.RECEIVING_LINKMAN} &nbsp;</td>
					<td style="text-align: center;">联系电话</td>
					<td>${noticeMap.RECEIVING_LINKPHONE} &nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">融资租赁公司联系人</td>
					<td>${noticeMap.FINANCELEASE_LINKMAN} &nbsp;</td>
					<td style="text-align: center;">联系电话</td>
					<td>${noticeMap.FINANCELEASE_LINKPHONE}  &nbsp;</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">备注</td>
					<td colspan="3">${noticeMap.REMARK}&nbsp;</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">签字信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;" width="10%">融资公司签字</td>
					<td style="text-align: center;">${noticeMap.FINANCELEASE_SIGN}</td>
					<td style="text-align: center;" width="10%">承租方签字</td>
					<td style="text-align: center;">${noticeMap.RECEIVING_SIGN}</td>
					<td style="text-align: center;" width="10%">厂商签字</td>
					<td style="text-align: center;">${noticeMap.DELIVERY_SIGN}</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">签字时间</td>
					<td><fmt:formatDate value="${noticeMap.FINANCELEASE_SIGNDATE}" pattern="yyyy-MM-dd"  /></td>
					<td style="text-align: center;">签字时间</td>
					<td><fmt:formatDate value="${noticeMap.RECEIVING_SIGNDATE}" pattern="yyyy-MM-dd"  /></td>
					<td style="text-align: center;">签字时间</td>
					<td><fmt:formatDate value="${noticeMap.DELIVERY_SIGNDATE}" pattern="yyyy-MM-dd"  /></td>
				</tr>
			</table>
			<center>
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" /> 
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
