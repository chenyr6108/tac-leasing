<%@ page language="java"  pageEncoding="UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
    <title>购销合同</title>
    <script type="text/javascript" src="${ctx }/common/js/money.js"></script>
	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
	<script type="text/javascript" src="${ctx }/pucscontract/js/pucscontract.js"></script>
	<script type="text/javascript" src="${ctx }/pucscontract/js/link.js"></script>
    <script type="text/javascript">
    $(function (){
		$("#SIGN_DATE").datepicker($.datepicker.regional["zh-CN"]);
		$("#DELIVERY_DATE").datepicker($.datepicker.regional["zh-CN"]);
	});
    </script>

  </head>
  
  <body>
  	<form id="pucsContractForm" name="pucsContractForm" action="../servlet/defaultDispatcher" method="post" onsubmit="return submitForm();">
  		<input type="hidden" name="__action" value="pucsContract.updatePucsContract">
  		<input type="hidden" name="PUCT_ID" value="${PUCT_ID }" />
  		
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;购销合同</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
  		
  		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;购销合同编号</th>
  				<td width="35%"><input size="50" type="text" name="PUCT_CODE" id="PUCT_CODE" value="${pucsContract.PUCT_CODE }" /></td>
  				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;</th>
  				<td width="35%">&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签定地点</th>
  				<td width="35%"><input size="50" type="text" name="SIGN_ADDRESS" id="SIGN_ADDRESS" value="${pucsContract.SIGN_ADDRESS }" /></td>
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签定时间</th>
  				<td width="35%"><input type="text" name="SIGN_DATE" id="SIGN_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${pucsContract.SIGN_DATE }"/>"/></td>
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
  					<td style="text-align: center;">${status.count }<input type="hidden" name="EQMT_ID" value="${item.EQMT_ID }" /></td>
					<td style="text-align: center;">${item.THING_KIND }</td>
					<td style="text-align: center;">${item.THING_NAME }</td>
					<td style="text-align: center;">${item.MODEL_SPEC }</td>
					<td style="text-align: center;">${item.BRAND }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.STAYBUY_PRICE }" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.UNIT_PRICE }" /></td>
					<td style="text-align: center;">${item.AMOUNT }</td>
					<td style="text-align: center;">${item.UNIT }</td>
					<td style="text-align: center;">${item.MEMO }&nbsp;&nbsp;</td>
					<c:set var="total" value="${total + item.UNIT_PRICE }" ></c:set>
  				</tr>
  			</c:forEach>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td colspan="2" style="text-align: center;">合计:</td>
  				<td colspan="8"><input type="hidden" id="TOTAL" name="TOTAL" value="${total }" /><script type="text/javascript">document.write(atoc(${total}));</script>( <fmt:formatNumber type="currency" value="${total }" />)</td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="2" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货时间、地点及运输费用承担</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货时间</th>
  				<td width="80%"><input type="text" name="DELIVERY_DATE" id="DELIVERY_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${pucsContract.DELIVERY_DATE }"/>"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货地点</th>
  				<td width="80%"><input type="text" name="DELIVERY_ADDRESS" value="${pucsContract.DELIVERY_ADDRESS }"  size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;运输费用</th>
  				<td width="80%"><input type="radio" name="DELIVERY_TYPE" value="0" <c:if test="${pucsContract.DELIVERY_TYPE eq 0 }">checked="checked"</c:if> />&nbsp;承租方支付&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="DELIVERY_TYPE" <c:if test="${pucsContract.DELIVERY_TYPE eq 1 }">checked="checked"</c:if> value="1"  />&nbsp;融资租赁公司支付</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;卸车、就位费用</th>
  				<td width="80%"><input type="radio" name="UNLOAD_TYPE" value="0" <c:if test="${pucsContract.UNLOAD_TYPE eq 0 }">checked="checked"</c:if> />&nbsp;承租方支付&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="UNLOAD_TYPE" <c:if test="${pucsContract.UNLOAD_TYPE eq 1 }">checked="checked"</c:if>  value="1"  />&nbsp;融资租赁公司支付</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;收货单位</th>
  				<td width="80%"><input type="text" name="RECEIVING_UNIT" value="${pucsContract.RECEIVING_UNIT }"  size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;货物到达地址</th>
  				<td width="80%"><input type="text" name="EQUPMENT_ADDRESS" value="${pucsContract.EQUPMENT_ADDRESS }" size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人</th>
  				<td width="80%"><input type="text" name="LINKMAN" value="${pucsContract.LINKMAN }"  size="20"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人手机</th>
  				<td width="80%"><input type="text" name="LINKMAN_MOBILE" value="${pucsContract.LINKMAN_MOBILE }"  size="20"/><font color="red">(例如:13288888888 15288888888 18988888888)</font></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人电话</th>
  				<td width="80%"><input type="text" name="LINKMAN_TEL" value="${pucsContract.LINKMAN_TEL }"  size="20"/><font color="red">(例如:(010)-88888888)</font></td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table3">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="2" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;付款方式</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买方货款支付方式</th>
  				<td width="80%" style="text-align: left;">合同签订后，买方必须向卖方支付合同总额的<input type="text" id="FIRST_PRICE_RATE" name="FIRST_PRICE_RATE" onchange="changeField('FIRST_PRICE_RATE',this)" value="${pucsContractPlan.FIRST_PRICE_RATE }" style="text-align: center;"  size="5" />%款项，即<input type="text" id="FIRST_PRICE" name="FIRST_PRICE" onchange="changeField('FIRST_PRICE',this)" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE}" />" style="text-align: right;" size="20" />作为买方保证依约履行合同的定金。
  				本合同签订三日内支付<input type="text" onblur="isNumber(this)" name="FIRST_PRICE_3DAYS" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE_3DAYS}" />" style="text-align: right;" size="20" />，卖方交货前十五日支付支付<input type="text" name="FIRST_PRICE_15DAYS" onblur="isNumber(this)" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.FIRST_PRICE_15DAYS}" />" style="text-align: right;" size="20" /><BR />卖方交货前，买方需向卖方支付合同总额的<input type="text" id="LAST_PRICE_RATE" name="LAST_PRICE_RATE" onchange="changeField('LAST_PRICE_RATE',this)" value="${pucsContractPlan.LAST_PRICE_RATE}" style="text-align: center;"  size="5" />%款项，即<input type="text" id="LAST_PRICE" name="LAST_PRICE" onchange="changeField('LAST_PRICE',this)" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.LAST_PRICE}" />" style="text-align: right;" size="20"  />作为提货款。
  				款到卖方账户后三天内，卖方须向承租方发出合同设备</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方支付方式</th>
  				<td width="80%" style="text-align: left;">本合同签订后，承租方需向出租方（买方）支付设备总价<input type="text" name="CUST_PRICE_RATE"  value="${pucsContractPlan.CUST_PRICE_RATE }" style="text-align: center;"  size="5" onblur="isNumber(this)"/>%款项，即<input type="text" name="CUST_PRICE" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE}" />" onblur="isNumber(this)" style="text-align: right;" size="20"/>作为履行《融资租赁合同》的保证。
  				本合同签订三日内支付<input type="text" name="CUST_PRICE_3DAYS" onblur="isNumber(this)" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE_3DAYS}" />" style="text-align: right;"/>，卖方交货前十五日支付<input type="text" name="CUST_PRICE_15DAYS" onblur="isNumber(this)" value="<fmt:formatNumber type="currency" value="${pucsContractPlan.CUST_PRICE_15DAYS}" />"  style="text-align: right;"/></td>
  			</tr>
  			
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="5" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买卖双方及承租人信息</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="5" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;出卖人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="SELLER_UNIT_NAME" readonly="readonly" value="${pucsContract.SELLER_UNIT_NAME }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="SELLER_UNIT_ADDR" value="${pucsContract.SELLER_UNIT_ADDR }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="SELLER_LEGAL_REPR" value="${pucsContract.SELLER_LEGAL_REPR }" /></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="SELLER_AGENT" value="${pucsContract.SELLER_AGENT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="SELLER_PHONE" value="${pucsContract.SELLER_PHONE }" /></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="SELLER_FAX" value="${pucsContract.SELLER_FAX }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="SELLER_BANK_ACCO" value="${pucsContract.SELLER_BANK_ACCO }" /></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="SELLER_ACCOUNT" value="${pucsContract.SELLER_ACCOUNT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="SELLER_CODE" value="${pucsContract.SELLER_CODE }" /></td>
  				<td width="15%">&nbsp;</td>
  				<td width="30%">&nbsp;</td>
  			</tr>
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买受人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_NAME" value="${pucsContract.BUYER_UNIT_NAME }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_ADDR" value="${pucsContract.BUYER_UNIT_ADDR }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="BUYER_LEGAL_REPR" value="${pucsContract.BUYER_LEGAL_REPR }" /></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="BUYER_AGENT" value="${pucsContract.BUYER_AGENT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="BUYER_PHONE" value="${pucsContract.BUYER_PHONE }" /></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="BUYER_FAX" value="${pucsContract.BUYER_FAX }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="BUYER_BANK_ACCO" value="${pucsContract.BUYER_BANK_ACCO }"/></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="BUYER_ACCOUNT" value="${pucsContract.BUYER_ACCOUNT }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_TAX" value="${pucsContract.BUYER_UNIT_TAX }"/></td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="BUYER_CODE" value="${pucsContract.BUYER_CODE }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%"><input type="text" name="BUYER_IDCARD" value="${pucsContract.BUYER_IDCARD }"/></td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%"><input type="text" name="BUYER_HOME_ADDR" value="${pucsContract.BUYER_HOME_ADDR }" /></td>
  			</tr>
  			
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_NAME" readonly="readonly" value="${pucsContract.CUST_UNIT_NAME }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_ADDR" value="${pucsContract.CUST_UNIT_ADDR }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="CUST_LEGAL_REPR" value="${pucsContract.CUST_LEGAL_REPR }" /></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="CUST_AGENT" value="${pucsContract.CUST_AGENT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="CUST_PHONE" value="${pucsContract.CUST_PHONE }" /></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="CUST_FAX" value="${pucsContract.CUST_FAX }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="CUST_BANK_ACCO" value="${pucsContract.CUST_BANK_ACCO }" /></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="CUST_ACCOUNT" value="${pucsContract.CUST_ACCOUNT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_TAX" value="${pucsContract.CUST_UNIT_TAX }" /></td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="CUST_CODE" value="${pucsContract.CUST_CODE }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%"><input type="text" name="CUST_IDCARD" value="${pucsContract.CUST_IDCARD }" /></td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%"><input type="text" name="CUST_HOME_ADDR" value="${pucsContract.CUST_HOME_ADDR }" /></td>
  			</tr>
  		</table>
  		
  		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td style="text-align: center;height: 26px;"><input type="submit" name="sub" class="ui-state-default ui-corner-all" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="javascript:history.go(-1);" class="ui-state-default ui-corner-all" value="返回" /></td>
  			</tr>
  		</table>
  		</div>
  		</div>
  		</div>
  	</form>
  </body>
</html>
