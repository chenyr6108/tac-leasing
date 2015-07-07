<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
  	<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
  	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
  	<script type="text/javascript" src="${ctx }/payment/js/payment.js"></script>
    <title>付款审批单</title>
    <script type="text/javascript">
    function notPositive(field, name) {
        var value = $.trim(field.value);
        value = value.replace(/[￥,]/g, '');
        if (!/^\d+(\.\d+)?$/.test(value)) {
            alert(name + '只能输入数字！');
            field.focus();
            return true;
        } else {
            value = '' + parseFloat(value);
            field.value = value
            return false;
        }
    }
    function subPayment(){
    	 var form = document.form1;
    	 if (blank(form.APPLICATION_DATE, '申请人签字时间')) {
   	        return false;
   	     }
    	 if (blank(form.REVIEWERS_DATE, '审核人签字时间')) {
   	        return false;
   	     }
    	 if (blank(form.APPROVE_DATE, '批准人签字时间')) {
   	        return false;
   	     }
    	 if (blank(form.APPLICATION_SIGN, '申请人签字')) {
   	        return false;
   	     }
    	 if (blank(form.REVIEWERS_SIGN, '审核人签字')) {
   	        return false;
   	     }
    	 if (blank(form.APPROVE_SIGN, '批准人签字')) {
   	        return false;
   	     }
    	 if (blank(form.PAY_REMARK, '付款事由')) {
   	        return false;
   	     }
    	 if (blank(form.PAY_DATE, '付款日期')) {
   	        return false;
   	     }
    	 if (notPositive(form.APPLICATION_PAYPRICE, '申请付款额')) {
    	        return false;
    	 }
     	 if (notPositive(form.VERIFY_PAYPRICE, '核准付款额')) {
    	        return false;
    	}
    	 return true;
	}  
		function radio(obj){		
			if (obj.value == 1){
				// 首款
				var total = $.trim($("input[name='equipTotal']").val());
				var firstRate = $.trim($("#FIRST_PRICE_RATE").val());
				var firstPrice = total * firstRate / 100;
				$("#APPLICATION_PAYPRICE").val(formatCurrency(firstPrice));
				$("#VERIFY_PAYPRICE").val(formatCurrency(firstPrice));
				$("#APP_PAY_RATE").val($("#FIRST_PRICE_RATE").val());
				$("#VER_PAY_RATE").val($("#FIRST_PRICE_RATE").val());
			} else if (obj.value == 2){
				// 尾款
				var total = $.trim($("input[name='equipTotal']").val());
				var lastRate = $.trim($("#LAST_PRICE_RATE").val());
				var lastPrice = total * lastRate / 100;
				$("#APPLICATION_PAYPRICE").val(formatCurrency(lastPrice));
				$("#VERIFY_PAYPRICE").val(formatCurrency(lastPrice));				
				$("#APP_PAY_RATE").val($("#LAST_PRICE_RATE").val());				
				$("#VER_PAY_RATE").val($("#LAST_PRICE_RATE").val());				
			} else if (obj.value == 3){
				// 全款 
				var total = $.trim($("input[name='equipTotal']").val());
				var rate = 100;
				$("#APPLICATION_PAYPRICE").val(formatCurrency(total));
				$("#VERIFY_PAYPRICE").val(formatCurrency(total));				
				$("#APP_PAY_RATE").val(rate);				
				$("#VER_PAY_RATE").val(rate);
			}
		}
    	
    </script> 
    <script type="text/javascript">
		$(function (){
			$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
			$("#datebegin2").datepicker($.datepicker.regional['zh-CN']);
			$("#datebegin3").datepicker($.datepicker.regional['zh-CN']);
			$("#datebegin4").datepicker($.datepicker.regional['zh-CN']);
		});
	</script>  
  </head> 
  <body>
	<form id="form1" name="form1" action="../servlet/defaultDispatcher" method="post" onsubmit="return subPayment()">
  		<input type="hidden" name="__action" value="paymentService.submitPayment">	 
  		<input type="hidden" name="FIRST_PRICE_RATE" id="FIRST_PRICE_RATE" value="${rateMap.FIRST_PRICE_RATE }">	 
  		<input type="hidden" name="LAST_PRICE_RATE" id="LAST_PRICE_RATE" value="${rateMap.LAST_PRICE_RATE }">	
  		 <div style="margin:  1%;">
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px ;">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款审批单</span>
	   	</div>
  		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">	 
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
  			<tr>
  			<input type="hidden" name="PUPL_CODE" value="${code }"/>
  				<td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">设备信息</td>
  			</tr>
	  		<tr class="ui-jqgrid-labels">
	  			<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">产品厂牌</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">单位</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">数量</th>	  			
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">购销合同编号</th>
	  		</tr>
  			<c:set var="total" value="0"> </c:set> 			
  			<c:forEach items="${equipList}" var="equipList">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">		
  					<td style="text-align: center;"><input type="hidden" name="pucd_id" value="${equipList.PUCD_ID }"/><input type="hidden" name="RECT_ID" value="${equipList.RECT_ID }"/>${equipList.THING_KIND }</td>
  					<td style="text-align: center;">${equipList.THING_NAME }</td>
  					<td style="text-align: center;">${equipList.MODEL_SPEC }</td>
  					<td style="text-align: center;">${equipList.BRAND }</td>
  					<td style="text-align: right;"> <fmt:formatNumber value="${equipList.UNIT_PRICE }" type="currency" /></td>				
  					<td style="text-align: center;">${equipList.AMOUNT }</td>
  					<td style="text-align: center;">${equipList.UNIT }</td>
  					<td style="text-align: center;">${equipList.MEMO }&nbsp;&nbsp;</td>
  					<td style="text-align: center;">${equipList.PUCT_CODE }&nbsp;&nbsp;<input type="hidden" name="PUPP_ID" value="${equipList.PUPP_ID }"/></td>
  				</tr>  				
  				<c:set var="total" value="${equipList.UNIT_PRICE*equipList.AMOUNT  + total}"> </c:set>				
  			</c:forEach>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  								
  				<td style="text-align: center;">合计：</td>
  				<td style="text-align: right;"><input type="hidden" name="equipTotal" value="${total }"><fmt:formatNumber type="currency" value="${total }" /></td>  				
  				<td style="text-align: center;">大写：</td>
  				<td style="text-align: right;"><script type="text/javascript">document.write(atoc(${total }));</script></td>
  				<td></td>
  				<td></td>
  				<td></td>
  				<td></td>
  				<td></td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  		<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">付款信息</td></tr>
  			<tr>
  				<td width="10%" style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">付款方式：</td>
  				<td colspan="4" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="PAY_MODE" id="PAY_MODE" value="1" onclick="radio(this)"/>首款&nbsp;&nbsp;&nbsp;&nbsp;
  							 <input type="radio" name="PAY_MODE" id="PAY_MODE"  value="2" onclick="radio(this)"/>尾款&nbsp;&nbsp;&nbsp;&nbsp;
  							 <input type="radio" name="PAY_MODE" id="PAY_MODE"  value="3" onclick="radio(this)"/>全款</td>   
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">收款人：</td>
  				<td colspan="4"><input type="text" name="PAYEE" id="PAYEE" value="${supplierMap.NAME }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">全称：</td>
  				<td colspan="4"><input type="text" name="PAYEE_FULLNAME" id="PAYEE_FULLNAME" value="${supplierMap.NAME }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">开户行：</td>
  				<td><input type="text" name="BANK" id="BANK" value="${supplierMap.OPEN_ACCOUNT_BANK }"/></td> 				
  				<td style="text-align: center;" width="10%">申请付款额：</td>
  				<td><input type="text" class="input_right" readonly="readonly" name="APP_PAY_RATE" id="APP_PAY_RATE" value="" size="4"/>%<input type="text" class="input_right" readonly="readonly" name="APPLICATION_PAYPRICE" id="APPLICATION_PAYPRICE" value="" /></td> 				
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">账号：</td>
  				<td><input type="text" name="ACCOUNT" id="ACCOUNT" value="${supplierMap.BANK_ACCOUNT }"/></td>
  				<td style="text-align: center;">核准付款额：</td>
  				<td><input type="text" class="input_right" readonly="readonly" name="VER_PAY_RATE" id="VER_PAY_RATE" value="" size="4"/>%<input type="text" class="input_right" readonly="readonly" name="VERIFY_PAYPRICE" id="VERIFY_PAYPRICE" value=""/></td>
  			</tr>
  		</table> 		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="10%" style="text-align: center;">付款事由：</td>
  				<td><textarea cols="110" name="PAY_REMARK" id="PAY_REMARK"></textarea></td>
  			</tr>
  			<tr>
  				<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">付款日期：</td>
  				<td class="ui-widget-content jqgrow ui-row-ltr">		
  					<input type="text" readonly="readonly" id="datebegin" name="PAY_DATE">
  				</td>
  			</tr> 			
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  		<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">签字信息</td></tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr"> 
  				<td style="text-align: center;">批准人签字</td> 
  				<td><input type="text" name="APPROVE_SIGN" id="APPROVE_SIGN"/></td> 								
  				<td style="text-align: center;">审核人签字</td>
  				<td><input type="text" name="REVIEWERS_SIGN" id="REVIEWERS_SIGN"/></td>  				  				
  				<td style="text-align: center;">申请人签字</td>	
  				<td><input type="text" name="APPLICATION_SIGN" id="APPLICATION_SIGN" value="${s_employeeName }"/></td>		
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr" align="center"> 
  				<td style="text-align: center;">批准人签字时间</td>  
  				<td><input type="text" value="" id="datebegin2" name="APPROVE_DATE"></td>								
  				<td style="text-align: center;">审核人签字时间</td>  
  				<td><input type="text" value="" id="datebegin3" name="REVIEWERS_DATE"></td>				  				
  				<td style="text-align: center;">申请人签字时间</td>	
  				<td><input type="text" value="" id="datebegin4" name="APPLICATION_DATE"></td>		
  			</tr>
  		</table>
		<center>
			<input type="submit" class="ui-state-default ui-corner-all" name="sub" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  	    <input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
		</center>	
		</div>
		</div>
		</div>
		</div>
  	</form>
  </body>
</html>
