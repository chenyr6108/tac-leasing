<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>付款单查看</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
  	<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
  	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
  </head>
  
  <body>
  <div style="margin: 1%;">
  	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款单查看</span>
   	</div>
   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  		  	<tr>
  				<td class="ui-widget-content jqgrow ui-row-ltr" colspan="9">付款单号 ${paymentLogMap.PUPL_CODE }</td>
  			</tr>
  			<tr>
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
  			<tr> 				
  			</tr>		
  			<c:set var="total" value="0"> </c:set> 			
  			<c:forEach items="${equipList}" var="equipList">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">					
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
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td  width="10%" style="text-align: center;">付款方式：</td>
  				<td colspan="4"><c:if test="${paymentLogMap.PAY_MODE eq 1 }">首款</c:if><c:if test="${paymentLogMap.PAY_MODE eq 2 }">尾款</c:if><c:if test="${paymentLogMap.PAY_MODE eq 3 }">全款</c:if></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">收款人：</td>
  				<td colspan="4">${paymentLogMap.PAYEE }</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">全称： </td>
  				<td colspan="4">${paymentLogMap.PAYEE_FULLNAME }</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">开户行：</td> 				
  				<td><c:if test="${paymentLogMap.BANK_NAME eq ''||paymentLogMap.BANK_NAME eq null }">无</c:if> ${paymentLogMap.BANK_NAME }</td> 				
  				<td style="text-align: center;" width="10%">申请付款额：</td>
  				<td>${paymentLogMap.APP_PAY_RATE }%（<fmt:formatNumber value="${paymentLogMap.APPLICATION_PAYPRICE }" type="currency" />）</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;">账号：</td>
  				<td><c:if test="${paymentLogMap.BANK_ACCOUNT  eq ''||paymentLogMap.BANK_ACCOUNT eq null }">无</c:if>${paymentLogMap.BANK_ACCOUNT }</td>
  				<td style="text-align: center;">核准付款额：</td>
  				<td>${paymentLogMap.VER_PAY_RATE }%（<fmt:formatNumber value="${paymentLogMap.VERIFY_PAYPRICE }" type="currency" />）</td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;" width="10%">付款事由：</td>
  				<td>${paymentLogMap.PAY_REMARK}</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;" width="10%" >付款日期：</td>			
  				<td><fmt:formatDate value="${paymentLogMap.PAY_DATE}" pattern="yyyy-MM-dd"/></td>			
  			</tr> 			
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
  			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">签字信息</td></tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr"> 
  				<td style="text-align: center;" width="10%">批准人签字</td> 
  				<td>${paymentLogMap.APPROVE_SIGN }</td> 								
  				<td style="text-align: center;" width="10%">审核人签字</td>
  				<td>${paymentLogMap.REVIEWERS_SIGN }</td>  				  				
  				<td style="text-align: center;" width="10%">申请人签字</td>	
  				<td>${paymentLogMap.APPLICATION_SIGN }</td>		
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr" align="center"> 
  				<td style="text-align: center;">批准人签字时间</td>  
  				<td><fmt:formatDate value="${paymentLogMap.APPROVE_DATE}" pattern="yyyy-MM-dd"/></td>								
  				<td style="text-align: center;">审核人签字时间</td>  
  				<td><fmt:formatDate value="${paymentLogMap.REVIEWERS_DATE}" pattern="yyyy-MM-dd"/></td>				  				
  				<td style="text-align: center;">申请人签字时间</td>	
  				<td><fmt:formatDate value="${paymentLogMap.APPLICATION_DATE}" pattern="yyyy-MM-dd"/></td>		
  			</tr>
  		</table>
  		<br>
  		<center>
	  		<c:if test="${FLAG==0}"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:window.location.href='../servlet/defaultDispatcher?__action=rentContract.queryRentContract'"/></c:if> 
	  		<c:if test="${FLAG==1}"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1)"/></c:if> 		
  		</center>
  		</div>
  		</div>
  		</div>
  		</div>
  </body>
</html>
