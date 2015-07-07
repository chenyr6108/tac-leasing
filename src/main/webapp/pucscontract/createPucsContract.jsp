<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
  		<input type="hidden" name="__action" value="pucsContract.createPucsContract">
  		<input type="hidden" name="RECT_ID" value="${RECT_ID }" />
  		<input type="hidden" name="SUPL_ID" value="${SUPL_ID }" />
  		
  		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;购销合同</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
  		
  		
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;购销合同编号</th>
  				<td width="35%"><input size="50" type="text" name="PUCT_CODE" id="PUCT_CODE" value="${pucsContractcode}"/></td>
  				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;</th>
  				<td width="35%">&nbsp;</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签订地点</th>
  				<td width="35%"><input size="50" type="text" name="SIGN_ADDRESS" id="SIGN_ADDRESS" /></td>
  				<th width="15%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;签订时间</th>
  				<td width="35%"><input type="text" name="SIGN_DATE" id="SIGN_DATE" autocomplete="off"/></td>
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
  			<c:forEach items="${equipList}" var="item" varStatus="status">
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
  				<td width="80%"><input type="text" name="DELIVERY_DATE" id="DELIVERY_DATE" autocomplete="off" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;交货地点</th>
  				<td width="80%"><input type="text" name="DELIVERY_ADDRESS"  size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;运输费用</th>
  				<td width="80%"><input type="radio" name="DELIVERY_TYPE" value="0" checked="checked" />&nbsp;承租方支付&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="DELIVERY_TYPE"  value="1"  />&nbsp;融资租赁公司支付</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;卸车、就位费用</th>
  				<td width="80%"><input type="radio" name="UNLOAD_TYPE" value="0" checked="checked" />&nbsp;承租方支付&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="UNLOAD_TYPE"  value="1"  />&nbsp;融资租赁公司支付</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;收货单位</th>
  				<td width="80%"><input type="text" name="RECEIVING_UNIT" value="${custMap.CUST_NAME }"  size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;货物到达地址</th>
  				<td width="80%"><input type="text" name="EQUPMENT_ADDRESS"  size="50"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人</th>
  				<td width="80%"><input type="text" name="LINKMAN" value="${custMap.LINK_NAME }"  size="20"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人手机</th>
  				<td width="80%"><input type="text" name="LINKMAN_MOBILE" value="${custMap.LINK_MOBILE }"  size="20"/><font color="red">(例如：13288888888 15288888888 18988888888)</font></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;联系人电话</th>
  				<td width="80%"><input type="text" name="LINKMAN_TEL" value="${custMap.LINK_PHONE }"  size="20"/><font color="red">(例如：(010)-88888888)</font></td>
  			</tr>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table3">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="2" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;付款方式</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买方货款支付方式</th>
  				<td width="80%" style="text-align: left;">合同签订后，买方必须向卖方支付合同总额的<input type="text" id="FIRST_PRICE_RATE" name="FIRST_PRICE_RATE" onchange="changeField('FIRST_PRICE_RATE',this)" value="30" style="text-align: center;"  size="5" />%款项，即<input type="text" id="FIRST_PRICE" name="FIRST_PRICE" onchange="changeField('FIRST_PRICE',this)" value="<fmt:formatNumber type="currency" value="${total * 0.3}" />" style="text-align: right;" size="20" />作为买方保证依约履行合同的定金。
  				本合同签订三日内支付<input type="text" onblur="isNumber(this)" name="FIRST_PRICE_3DAYS" style="text-align: right;" size="20" />，卖方交货前十五日支付支付<input type="text" name="FIRST_PRICE_15DAYS" onblur="isNumber(this)"  style="text-align: right;" size="20" /><BR />卖方交货前，买方需向卖方支付合同总额的<input type="text" id="LAST_PRICE_RATE" name="LAST_PRICE_RATE" onchange="changeField('LAST_PRICE_RATE',this)" value="70" style="text-align: center;"  size="5" />%款项，即<input type="text" id="LAST_PRICE" name="LAST_PRICE" onchange="changeField('LAST_PRICE',this)" value="<fmt:formatNumber type="currency" value="${total * 0.7}" />" style="text-align: right;" size="20"  />作为提货款。
  				款到卖方账户后三天内，卖方须向承租方发出合同设备</td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="20%" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方支付方式</th>
  				<td width="80%" style="text-align: left;">本合同签订后，承租方需向出租方（买方）支付设备总价<input type="text" name="CUST_PRICE_RATE"  value="30" style="text-align: center;"  size="5" onblur="isNumber(this)"/>%款项，即<input type="text" name="CUST_PRICE" value="<fmt:formatNumber type="currency" value="${total * 0.3}" />" onblur="isNumber(this)" style="text-align: right;" size="20"/>作为履行《融资租赁合同》的保证。
  				本合同签订三日内支付<input type="text" name="CUST_PRICE_3DAYS" onblur="isNumber(this)"  style="text-align: right;"/>，卖方交货前十五日支付<input type="text" name="CUST_PRICE_15DAYS" onblur="isNumber(this)"  style="text-align: right;"/></td>
  			</tr>
  			
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th colspan="5" style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买卖双方及承租人信息</th>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="5" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;出卖人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="SELLER_UNIT_NAME" readonly="readonly" value="${supplier.SUPPLIER_NAME }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="SELLER_UNIT_ADDR" value="${supplier.LICENCE_ADDRESS }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="SELLER_LEGAL_REPR" value="${supplier.COMPANY_CORPORATION }" /></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="SELLER_AGENT" value="${supplier.LINKMAN_NAME }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="SELLER_PHONE" value="${supplier.LINKMAN_TELPHONE }" /></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="SELLER_FAX" value="${supplier.LINKMAN_TELPHONE }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="SELLER_BANK_ACCO" value="${supplier.OPEN_ACCOUNT_BANK }" /></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="SELLER_ACCOUNT" value="${supplier.BANK_ACCOUNT }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="SELLER_CODE" value="${supplier.LINKMAN_ZIP }" /></td>
  				<td width="15%">&nbsp;</td>
  				<td width="30%">&nbsp;</td>
  			</tr>
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;买受人</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_NAME" value="${companyMap.DECP_NAME_CN }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_ADDR" value="${companyMap.REGISTERED_OFFICE_ADDRESS }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="BUYER_LEGAL_REPR" value="${companyMap.LEGAL_PERSON }"/></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="BUYER_AGENT" value="${companyMap.LEGAL_PERSON }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="BUYER_PHONE" value="${companyMap.TELEPHONE }"/></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="BUYER_FAX" value="${companyMap.FAX }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="BUYER_BANK_ACCO" value="${companyMap.OPEN_ACCOUNT_BANK }"/></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="BUYER_ACCOUNT" value="${companyMap.BANK_ACCOUNT }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%"><input type="text" name="BUYER_UNIT_TAX" value="${companyMap.BUSINESS_LICENCE_CODE }"/></td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="BUYER_CODE" value="${companyMap.POSTCODE }"/></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%"><input type="text" name="BUYER_IDCARD" value="${companyMap.LEGAL_ID_CARD }"/></td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%"><input type="text" name="BUYER_HOME_ADDR" value="${companyMap.LEGAL_HOME_ADDRESS }"/></td>
  			</tr>
  			
  			
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<th width="10%" rowspan="6" style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;&nbsp;承租方</th>
  				<td width="15%">&nbsp;单位名称</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_NAME" readonly="readonly" value="${custMap.CUST_NAME }" /></td>
  				<td width="15%">&nbsp;单位地址</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_ADDR" value="${custMap.CUST_ADDRESS }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;法定代表人</td>
  				<td width="30%"><input type="text" name="CUST_LEGAL_REPR" value="${custMap.CORP_HEAD_SIGNATURE }" /></td>
  				<td width="15%">&nbsp;委托代理人</td>
  				<td width="30%"><input type="text" name="CUST_AGENT" value="${custMap.CUST_LINKMAN }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;电话</td>
  				<td width="30%"><input type="text" name="CUST_PHONE" value="${custMap.CUST_PHONE }" /></td>
  				<td width="15%">&nbsp;传真</td>
  				<td width="30%"><input type="text" name="CUST_FAX" value="${custMap.CUST_FAX }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;开户银行</td>
  				<td width="30%"><input type="text" name="CUST_BANK_ACCO" value="${custMap.OPEN_BANK }" /></td>
  				<td width="15%">&nbsp;帐号</td>
  				<td width="30%"><input type="text" name="CUST_ACCOUNT" value="${custMap.BANK_ACCOUNTS }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;单位税号</td>
  				<td width="30%"><input type="text" name="CUST_UNIT_TAX" value="${custMap.CORP_ORAGNIZATION_CODE }" /></td>
  				<td width="15%">&nbsp;邮政编码</td>
  				<td width="30%"><input type="text" name="CUST_CODE" value="${custMap.CUST_ZIP }" /></td>
  			</tr>
  			<tr class="ui-widget-content jqgrow ui-row-ltr">
  				<td width="15%">&nbsp;身份证号码</td>
  				<td width="30%"><input type="text" name="CUST_IDCARD" value="${custMap.NATU_IDCARD }" /></td>
  				<td width="15%">&nbsp;家庭住址</td>
  				<td width="30%"><input type="text" name="CUST_HOME_ADDR" value="${custMap.CUST_ADDRESS }" /></td>
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
