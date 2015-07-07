<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
  	<script type="text/javascript" src="${ctx }/deliveryNotice/js/deliveryNotice.js"></script>
    <title>选择发货通知单中的设备</title>
  </head>
  
  <body>
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;选择设备</span>
	   	</div>
  		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">
  	<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
  		<input type="hidden" name="__action" value="deliveryNoticeService.getDeliveryNoticeCreatePre"/>
  		<input type="hidden" name="RECT_ID" value="${rentContract.RECT_ID}"/>
  		<input type="hidden" name="rentContract.LEASE_CODE" value="${rentContract.LEASE_CODE}"/>
  		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  			<tr>
  				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">合同号：</td>
  				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">${rentContract.LEASE_CODE}&nbsp;</td>
  				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">承租人：</td>
  				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">${ rentContract.CUST_NAME}</td>
  			</tr>
  			<tr class="ui-jqgrid-labels">
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">
	  				<input type="checkbox" name="all" id="all" onclick="checkAndCancelAll('all','eqmt_id');" />
	  			</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">购销合同编号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">产品厂牌</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">数量</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
  			</tr>
  			<c:forEach items="${equipList}" var="equipList" varStatus="status">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">
  					<td style="text-align: center;"><input type="checkbox" name="eqmt_id" value="${equipList.EQMT_ID },${equipList.PUCT_ID}" id="${equipList.EQMT_ID }" /></td>
  					<td style="text-align: center;">${equipList.PUCT_CODE }&nbsp;</td>
  					<td style="text-align: center;">${equipList.THING_KIND }&nbsp;</td>
  					<td style="text-align: center;">${equipList.THING_NAME }&nbsp;</td>
  					<td style="text-align: center;">${equipList.MODEL_SPEC }&nbsp;</td>
  					<td style="text-align: center;">${equipList.BRAND }&nbsp;</td>
  					<td style="text-align: right;"><fmt:formatNumber value="${equipList.UNIT_PRICE }" type="currency"></fmt:formatNumber>&nbsp;</td>
  					<td style="text-align: center;">${equipList.AMOUNT }</td>
  					<td style="text-align: center;">${equipList.MEMO }&nbsp;&nbsp;</td>
  				</tr>
  			</c:forEach>
  		</table>
  	</form>
  	<center>
  	<input type="button" value="确  定" class="ui-state-default ui-corner-all" name="search" onclick="subForm('eqmt_id')"; />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input type='button' value='返  回' class="ui-state-default ui-corner-all" name="search" onclick='javascript:history.back(-1)'   />
 </center> </div>
			</div>
			</div></body>
</html>
