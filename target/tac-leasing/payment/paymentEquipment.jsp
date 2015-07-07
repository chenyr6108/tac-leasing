<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>选择设备</title>  
    		<script type="text/javascript">
			$paymentEquipment = {
				allOrNot : function (obj) {
								$("input[name='pucd_id']").attr("checked",obj.checked);
							},
				submitVilidate : function () {
						var boxs = $("input[name='pucd_id']:checked")
		
						
						if (boxs.length == 0 ){
							alert("请选择设备！");
							return ;
						} else {
							var flag1 = $("#first_price_rate"+boxs[0].value).val();
							var flag2 = $("#last_price_rate"+boxs[0].value).val();	
							var flag = $("#SUPPLIER_ID"+boxs[0].value).val();													   			
							for (var i=0;i<boxs.length;i++) {
								first_price_rate = $("#first_price_rate"+boxs[i].value).val();
								last_price_rate = $("#last_price_rate"+boxs[i].value).val();
								supplier = $("#SUPPLIER_ID"+boxs[i].value).val();
								if (flag1!= first_price_rate && flag2!= last_price_rate ){
									alert("请选择相同付款计划的设备！");
									return ;
								}
								if (flag!= supplier ){
									alert("请选择相同生产商的设备！");
									return ;
								}								
							}													
						}
						$("#form").submit();			
					}			
			};
		</script>   
  </head>
  <body>
      	<form id="form" name="form" action="../servlet/defaultDispatcher?__action=paymentService.getPaymentJsp" method="post">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;选择设备</span>
	   	</div>
  		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td colspan="2">合同号：</td>
  				<td colspan="3">${rentContract.LEASE_CODE}</td>
  				<td colspan="2">承租人：</td>
  				<td colspan="3">${rentContract.CUST_NAME}</td>
  			</tr>
  			<tr class="ui-jqgrid-labels">
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">
	  				<input type="checkbox" name="boxs" value="0" onchange="$paymentEquipment.allOrNot(this);" />
	  			</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">产品厂牌</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">单位</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">数量</th>	  			
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">购销合同编号</th>
  			</tr>
  			<c:forEach items="${equipList}" var="equipList" varStatus="status">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">
  					<input type="hidden" name="puct_id" value="${equipList.PUCT_ID }"/>	
  					<input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID${equipList.PUCD_ID }" value="${equipList.SUPPLIER_ID }"/>	
  					<input type="hidden" name="first_price_rate" id="first_price_rate${equipList.PUCD_ID }" value="${equipList.FIRST_PRICE_RATE }"/>
  					<input type="hidden" name="last_price_rate" id="last_price_rate${equipList.PUCD_ID }" value="${equipList.LAST_PRICE_RATE }"/>
  					<td style="text-align: center;"><c:if test="${ not empty equipList.PUCT_ID}"><input type="checkbox" name="pucd_id" value="${equipList.PUCD_ID }" /></c:if></td>					
  					<td style="text-align: center;">${equipList.THING_KIND }</td>
  					<td style="text-align: center;">${equipList.THING_NAME }</td>
  					<td style="text-align: center;">${equipList.MODEL_SPEC }</td>
  					<td style="text-align: center;">${equipList.BRAND }</td>
  					<td style="text-align: right;"><fmt:formatNumber value="${equipList.UNIT_PRICE }" type="currency" /></td>				
  					<td style="text-align: center;">${equipList.AMOUNT }</td>
  					<td style="text-align: center;">${equipList.UNIT }</td>
  					<td style="text-align: center;">${equipList.MEMO }&nbsp;&nbsp;</td>
  					<td style="text-align: center;">${equipList.PUCT_CODE }&nbsp;&nbsp;</td>  								
  				</tr>
  			</c:forEach>
  		</table>
  		<center>
  			<input type="button" class="ui-state-default ui-corner-all" name="search" value="确定" onclick="$paymentEquipment.submitVilidate();"; />
  			<input type="button" class="ui-state-default ui-corner-all" name="search" value="返回" onclick="javascript:history.go(-1)"/>
  		</center>
  		</div>
  		</div>
  		</div>
  	</form>
  </body>
</html>
