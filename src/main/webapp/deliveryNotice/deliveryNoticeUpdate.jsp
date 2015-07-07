<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>修改发货通知单</title>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<script type="text/javascript"   src="${ctx }/deliveryNotice/js/deliveryNotice.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css"    href="${ctx }/common/css/tab.css" />
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		function notPositive(field, name){
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
        }}
        function testUpdate(){
         var form= document.updateform;
  		  if (notPositive(form.SHOULD_PRICE, '承租方应付金额')) {
    	        return false;
    	 }
    	 if (notPositive(form.REAL_PRICE, '承租方实付金额')) {
    	        return false;
    	 }}
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
	<body >
		<form id="updateform" name="updateform" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="__action" value="deliveryNoticeService.updateDeliveryNotice">
			<input type="hidden" name="RECT_ID" value="${RECT_ID }" />
			<input type="hidden" name="DELV_ID" id="DELV_ID" value="${noticeMap.DELV_ID }">
			<div style="margin:  1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;发货通知单修改</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td> 发货通知单编号 :&nbsp;&nbsp;&nbsp;&nbsp; ${noticeMap.DELV_CODE }  </td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">设备信息</td></tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">购销合同编号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">制造商</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">产品名称</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">规格型号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">生产商</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">单价</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">数量</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">合计</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
				</tr>
				<tr>
				</tr>
				<c:set var ='totals' value='0'></c:set>
				<c:forEach items="${equipList}" var="equipList">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${equipList.PUCT_CODE}&nbsp;</td>
						<td style="text-align: center;">${equipList.THING_KIND }&nbsp;</td>
						<td style="text-align: center;">${equipList.THING_NAME }&nbsp;</td>
						<td style="text-align: center;">${equipList.MODEL_SPEC }&nbsp;</td>
						<td style="text-align: center;">${equipList.BRAND}&nbsp;</td>
						<td style="text-align:right"> <fmt:formatNumber value='${equipList.UNIT_PRICE }' type='currency' ></fmt:formatNumber> &nbsp;</td>
						<td style="text-align: center;">${equipList.AMOUNT }&nbsp;</td>
						<td style="text-align:right"><input type="hidden" name="equip_total" value="${equipList.TOTAL }" /><fmt:formatNumber value="${equipList.TOTAL }" type="currency"></fmt:formatNumber> &nbsp;</td>
						<td style="text-align: center;">${equipList.MEMO }&nbsp;</td>
						<input type="hidden" name="EQMT_ID" value="${equipList.EQMT_ID }" />
						<input type="hidden" name="AMOUNT" value="${equipList.AMOUNT }" />
					</tr>
					<c:set var='totals' value='${equipList.TOTAL  + totals }'></c:set>
				</c:forEach>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr">总计小写 </td>
					<td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" id="total" name="total" value="${totals}" />
						<fmt:formatNumber value="${totals}" type="currency"></fmt:formatNumber> &nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">总计大写</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right"><script type="text/javascript">document.write(atoc(${totals}))</script>&nbsp;</td>
					<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">付款信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="10%">承租方应付金额</td>
					<td><input style="text-align:right" type="text" id="SHOULD_PRICE" name="SHOULD_PRICE" size="20" value="<fmt:formatNumber value="${totals }" type="currency"></fmt:formatNumber>"  ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租方实付金额</td>
					<td><input style="text-align:right" type="text" name="REAL_PRICE" id="REAL_PRICE" size="20" value="<fmt:formatNumber value="${totals }" type="currency"></fmt:formatNumber>"   ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>付款说明</td>
					<td colspan="7"><textarea rows="2"  cols='140'  name="PAY_REMARK"  id="PAY_REMARK" />${noticeMap.PAY_REMARK}</textarea></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">发货信息</td></tr>
				<tr ><td class="ui-widget-content jqgrow ui-row-ltr">发货时间</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DELIVERY_DATE" id="datebegin"  value="<fmt:formatDate value="${noticeMap.DELIVERY_DATE}" pattern="yyyy-MM-dd" />" />
					</td><td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td></tr>
				<tr><td class="ui-widget-content jqgrow ui-row-ltr">收货单位</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="RECEIVING_UNIT"  id="RECEIVING_UNIT" size="20" value="${noticeMap.RECEIVING_UNIT}" >
					</td><td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
				</tr>
				<tr><td class="ui-widget-content jqgrow ui-row-ltr">收货地点</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="RECEIVING_ADDR" id="RECEIVING_ADDR" size="20" value="${noticeMap.RECEIVING_ADDR}"  >
					</td><td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">&nbsp;</td></tr>
				<tr><td class="ui-widget-content jqgrow ui-row-ltr">开票单位</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BALLOT_UNIT" id="BALLOT_UNIT" size="20" value="${noticeMap.BALLOT_UNIT}"  >
					</td><td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">&nbsp;</td></tr>
				<tr><td class="ui-widget-content jqgrow ui-row-ltr">发货联系人</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DELIVERY_LINKMAN" id="DELIVERY_LINKMAN" size="20" value="${noticeMap.DELIVERY_LINKMAN}"  /></td>
					<td class="ui-widget-content jqgrow ui-row-ltr">联系电话</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DELIVERY_LINKPHONE" id="DELIVERY_LINKPHONE" size="20" value="${noticeMap.DELIVERY_LINKPHONE}"   /></td>
				</tr>
				<tr><td class="ui-widget-content jqgrow ui-row-ltr">收货联系人</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="RECEIVING_LINKMAN"  id="RECEIVING_LINKMAN" size="20"  value="${noticeMap.RECEIVING_LINKMAN} " /></td>
					<td class="ui-widget-content jqgrow ui-row-ltr">联系电话 </td>
					<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="RECEIVING_LINKPHONE"  id="RECEIVING_LINKPHONE" size="20"  value="${noticeMap.RECEIVING_LINKPHONE}" /> </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr"><td>融资租赁公司联系人 </td>
					<td><input type="text" name="FINANCELEASE_LINKMAN" id="FINANCELEASE_LINKMAN" size="20"  value="${noticeMap.FINANCELEASE_LINKMAN}"  /></td>
					<td>联系电话</td>
					<td><input type="text" name="FINANCELEASE_LINKPHONE"  id="FINANCELEASE_LINKPHONE" size="20"  value="${noticeMap.FINANCELEASE_LINKPHONE}"  /> </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>备注</td>
					<td colspan="7"><textarea rows="2"  cols='140' name="REMARK" id="REMARK" value="${noticeMap.REMARK}" ></textarea></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr><td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">签字信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>融资公司签字</td>
					<td><input type='text' name="FINANCELEASE_SIGN" id="FINANCELEASE_SIGN" value="${noticeMap.FINANCELEASE_SIGN}"/></td>
					<td>承租方签字</td>
					<td><input type='text' name="RECEIVING_SIGN" id="RECEIVING_SIGN"  value="${noticeMap.RECEIVING_SIGN}" /></td>
					<td>厂商签字</td>
					<td><input type='text' name="DELIVERY_SIGN" id="DELIVERY_SIGN" value="${noticeMap.DELIVERY_SIGN}" /></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>签字时间</td>
					<td><input type="text" name="FINANCELEASE_SIGNDATE" id="datebegin2" value="<fmt:formatDate value="${noticeMap.FINANCELEASE_SIGNDATE}" pattern="yyyy-MM-dd" />" /></td>
					<td>签字时间</td>
					<td><input type="text" name="RECEIVING_SIGNDATE" id="datebegin3" value="<fmt:formatDate value="${noticeMap.RECEIVING_SIGNDATE}" pattern="yyyy-MM-dd" />" /></td>
					<td>签字时间</td>
					<td><input type="text" name="DELIVERY_SIGNDATE"  id="datebegin4" value="<fmt:formatDate value="${noticeMap.DELIVERY_SIGNDATE}" pattern="yyyy-MM-dd" />" /></td></tr>
			</table>
			<center>
			<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="updateNotice();" value="修 改" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" /></center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
