<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
  <head>   
  	<script type="text/javascript" src="${ctx }/pucscontract/js/selectEquipment.js"></script>
    <title>选择设备</title>
  </head>
  
  <body>
  	<form id="form1" name="form1" action="../servlet/defaultDispatcher" method="post">
  		<input type="hidden" name="__action" value="pucsContract.initCreatePucsContract">
  		<input type="hidden" name="SUPL_ID" value="" />
  		<input type="hidden" name="RECT_ID" value="${rentContract.RECT_ID}">
  		<input type="hidden" name="pucsContractcode" value="${rentContract.LEASE_CODE}">
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;选择设备</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="3" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;融资租赁合同号</th>
  				<td colspan="2">${rentContract.LEASE_CODE}</td>
  				<th colspan="1" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租人</th>
  				<td colspan="5">${ rentContract.CUST_NAME}</td>
  			</tr>
  			<tr class="ui-jqgrid-labels">
	  			<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head"><input type="checkbox" name="all" id="all" onclick="$selectEquipment.allOrNot(this);"/></th>
	  			<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">制造商</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
	  			<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">含税单价</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
	  			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">数量</th>
	  			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">单位</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
  			</tr>
  			<c:forEach items="${equipList}" var="item" varStatus="status">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;"><input type="checkbox" name="RECD_ID" value="${item.RECD_ID }" id="${item.SUPPLIER_ID }" /></td>
				<td style="text-align: center;">${status.count }</td>
				<td style="text-align: center;">${item.THING_KIND }</td>
				<td style="text-align: center;">${item.THING_NAME }</td>
				<td style="text-align: center;">${item.MODEL_SPEC }</td>
				<td style="text-align: center;">${item.BRAND }</td>
				<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.SHUI_PRICE }" /></td>
				<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.UNIT_PRICE }" /></td>
				<td style="text-align: center;">${item.AMOUNT }</td>
				<td style="text-align: center;">${item.UNIT }</td>
				<td style="text-align: center;">${item.MEMO }&nbsp;&nbsp;</td>
			</tr>
  			</c:forEach>
  			<tr style="height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
  				<td colspan="11" style="text-align: center;"><input type="button" value="提交" class="ui-state-default ui-corner-all" onclick="$selectEquipment.submitVilidate();" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="backBut" onclick="javascript:history.go(-1)" value=返&nbsp;&nbsp;回 class="ui-state-default ui-corner-all"><!-- <input class="ui-state-default ui-corner-all" type="button" onclick="javascript:history.go(-1);" value="返回" /> --></td>
  			</tr>
  		</table>
  		</div>
		</div>
		</div>
  	</form>
  </body>
</html>
