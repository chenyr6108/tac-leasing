<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
    <title>购销合同</title>
    <script type="text/javascript" src="${ctx }/common/js/money.js"></script>
    
  </head>
  
  <body>
  	<form id="form" name="form" action="#" method="post">
  		
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;购销合同</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
  		
  		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;购销合同编号</th>
  				<td width="35%">${pucsContract.PUCT_CODE }&nbsp;</td>
  				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;</th>
  				<td width="35%">&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签订地点</th>
  				<td width="35%">${pucsContract.SIGN_ADDRESS }&nbsp;</td>
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签订时间</th>
  				<td width="35%"><fmt:formatDate pattern="yyyy-MM-dd"  value="${pucsContract.SIGN_DATE }"/></td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="10" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;设备清单及价格</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">产品厂牌</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
	  			<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
	  			<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">留购价</th>
	  			<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
	  			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">数量</th>
	  			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">单位</th>
	  			<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
  			</tr>
  			<c:set var="total" value="0" ></c:set>
  			<c:forEach items="${pucsContractDetail}" var="item" varStatus="status">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">
  					<td style="text-align: center;">${status.count }</td>
					<td style="text-align: center;">${item.THING_KIND }</td>
					<td style="text-align: center;">${item.THING_NAME }</td>
					<td style="text-align: center;">${item.MODEL_SPEC }</td>
					<td style="text-align: center;">${item.BRAND }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.STAYBUY_PRICE }" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.UNIT_PRICE }" /></td>
					<td style="text-align: center;">${item.AMOUNT }</td>
					<td style="text-align: center;">${item.UNIT }</td>
					<td style="text-align: center;">${item.MEMO }&nbsp;</td>
					<c:set var="total" value="${total + item.UNIT_PRICE }" ></c:set>
  				</tr>
  			</c:forEach>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td colspan="2" style="text-align: center;">合计:</td>
  				<td colspan="8"><script type="text/javascript">document.write(atoc(${total}));</script>( <fmt:formatNumber type="currency" value="${total }" />)</td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="2" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货时间、地点及运输费用承担</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货时间</th>
  				<td width="80%"><fmt:formatDate pattern="yyyy-MM-dd"  value="${pucsContract.DELIVERY_DATE }"/>&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货地点</th>
  				<td width="80%">${pucsContract.DELIVERY_ADDRESS }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;运输费用</th>
  				<td width="80%"><c:if test="${pucsContract.DELIVERY_TYPE eq 0}">承租方支付</c:if><c:if test="${pucsContract.DELIVERY_TYPE eq 1}">融资租赁公司支付</c:if></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;卸车、就位费用</th>
  				<td width="80%"><c:if test="${pucsContract.UNLOAD_TYPE eq 0}">承租方支付</c:if><c:if test="${pucsContract.UNLOAD_TYPE eq 1}">融资租赁公司支付</c:if></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;收货单位</th>
  				<td width="80%">${pucsContract.RECEIVING_UNIT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;货物到达地址</th>
  				<td width="80%">${pucsContract.EQUPMENT_ADDRESS }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人</th>
  				<td width="80%">${pucsContract.LINKMAN }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人手机</th>
  				<td width="80%">${pucsContract.LINKMAN_MOBILE }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人电话</th>
  				<td width="80%">${pucsContract.LINKMAN_TEL }&nbsp;</td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table3">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="2" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;付款方式</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买方货款支付方式</th>
  				<td width="80%" style="text-align: left;">合同签订后，买方必须向卖方支付合同总额的&nbsp;${pucsContractPlan.FIRST_PRICE_RATE }&nbsp;%款项，即&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE}" />&nbsp;作为买方保证依约履行合同的定金。
  				本合同签订三日内支付&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE_3DAYS}" />&nbsp;，卖方交货前十五日支付支付&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE_15DAYS}" />&nbsp;<BR />卖方交货前，买方需向卖方支付合同总额的&nbsp;${pucsContractPlan.LAST_PRICE_RATE}&nbsp;%款项，即&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.LAST_PRICE}" />&nbsp;作为提货款。
  				款到卖方账户后三天内，卖方须向承租方发出合同设备</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方支付方式</th>
  				<td width="80%" style="text-align: left;">本合同签订后，承租方需向出租方（买方）支付设备总价&nbsp;${pucsContractPlan.CUST_PRICE_RATE }&nbsp;%款项，即&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE}" />&nbsp;作为履行《融资租赁合同》的保证。
  				本合同签订三日内支付&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE_3DAYS}" />&nbsp;，卖方交货前十五日支付&nbsp;<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE_15DAYS}" />&nbsp;</td>
  			</tr>
  			
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="5" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买卖双方及承租人信息</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="5" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;出卖人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%">${pucsContract.SELLER_UNIT_NAME }&nbsp;</td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%">${pucsContract.SELLER_UNIT_ADDR }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%">${pucsContract.SELLER_LEGAL_REPR }&nbsp;</td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%">${pucsContract.SELLER_AGENT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%">${pucsContract.SELLER_PHONE }&nbsp;</td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%">${pucsContract.SELLER_FAX }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%">${pucsContract.SELLER_BANK_ACCO }&nbsp;</td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%">${pucsContract.SELLER_ACCOUNT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%">${pucsContract.SELLER_CODE }&nbsp;</td>
  				<td width="15%">&nbsp;</td>
  				<td width="30%">&nbsp;</td>
  			</tr>
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买受人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%">${pucsContract.BUYER_UNIT_NAME }&nbsp;</td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%">${pucsContract.BUYER_UNIT_ADDR }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%">${pucsContract.BUYER_LEGAL_REPR }&nbsp;</td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%">${pucsContract.BUYER_AGENT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%">${pucsContract.BUYER_PHONE }&nbsp;</td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%">${pucsContract.BUYER_FAX }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%">${pucsContract.BUYER_BANK_ACCO }&nbsp;</td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%">${pucsContract.BUYER_ACCOUNT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%">${pucsContract.BUYER_UNIT_TAX }&nbsp;</td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%">${pucsContract.BUYER_CODE }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%">${pucsContract.BUYER_IDCARD }&nbsp;</td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%">${pucsContract.BUYER_HOME_ADDR }&nbsp;</td>
  			</tr>
  			
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%">${pucsContract.CUST_UNIT_NAME }&nbsp;</td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%">${pucsContract.CUST_UNIT_ADDR }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%">${pucsContract.CUST_LEGAL_REPR }&nbsp;</td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%">${pucsContract.CUST_AGENT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%">${pucsContract.CUST_PHONE }&nbsp;</td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%">${pucsContract.CUST_FAX }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%">${pucsContract.CUST_BANK_ACCO }&nbsp;</td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%">${pucsContract.CUST_ACCOUNT }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%">${pucsContract.CUST_UNIT_TAX }&nbsp;</td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%">${pucsContract.CUST_CODE }&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%">${pucsContract.CUST_IDCARD }&nbsp;</td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%">${pucsContract.CUST_HOME_ADDR }&nbsp;</td>
  			</tr>
  		</table>
  		<c:if test="${FLAG eq 1}">
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;height: 26px;"><input type="button" name="backBut" onclick="javascript:history.go(-1)" value=返&nbsp;&nbsp;回 class="ui-state-default ui-corner-all"><!-- <input type="button" onclick="javascript:window.location.href='../servlet/defaultDispatcher?__action=rentContract.queryRentContract';" class="ui-state-default ui-corner-all" value="返回" />--></td> 
  				
  			</tr>
  		</table>
  		</c:if>
  		 <c:if test="${FLAG eq null or FLAG eq '' or FLAG eq 0}">
  		  		  <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  					<tr class="ui-widget-content jqgrow ui-row-ltr">
  						<td style="text-align: center;height: 26px;"><input type="button" name="gobackBut" onclick="javascript:window.location.href='../servlet/defaultDispatcher?__action=rentContract.queryRentContract'" value=返回浏览页  class="ui-state-default ui-corner-all"></td>
  					</tr> 			
  		</table>
  		</c:if>
  		</div>
  		</div>
  		</div>
  	</form>
  </body>
</html>
