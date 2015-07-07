<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
			<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
			<script type="text/javascript" src="${ctx }/credit/js/schemeControl.js"></script>
			<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
			<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
			<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>		
			<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
			<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
			<script type="text/javascript" src="${ctx }/productcredit/js/productcreditManage.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>授信添加</title>
		<script type="text/javascript">
		$(function(){
		    $("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
		    $("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		function updateLastPrice(){
			/*
			var UNION_CREDIT=document.getElementsByName("UNION_CREDIT");
			if(UNION_CREDIT[0].checked){
				var UNION_GRANT_PRICE=$("#UNION_GRANT_PRICE").val();
				if(UNION_GRANT_PRICE==""||UNION_GRANT_PRICE==null){
					UNION_GRANT_PRICE=0;
				}
				var sumgrantprice=parseFloat(UNION_GRANT_PRICE.replace(/[￥,]/g, ''))+parseFloat($("#GRANT_PRICE").val().replace(/[￥,]/g, ''));
				$("#LAST_PRICE").val(sumgrantprice);
			}else{
				$("#LAST_PRICE").val($("#GRANT_PRICE").val());
			}
			*/
			var real_last_price=$("#REAL_LAST_PRICE").val();
			var real_grant_price=$("#REAL_GRANT_PRICE").val();
			if(real_grant_price==null||real_grant_price==""){
			   now_last_price=$("#GRANT_PRICE").val();
			}else{
		    var now_grant_price=$("#GRANT_PRICE").val();
			var now_last_price=parseFloat(now_grant_price.replace(/[￥,]/g, ''))-parseFloat(real_grant_price.replace(/[￥,]/g, ''))+parseFloat(real_last_price.replace(/[￥,]/g, ''));
			}
			$("#LAST_PRICE").val(now_last_price);
		}
		// Add By Michael 2011 12/13 增加总授信金额的检查
		function updateTotalPrice(){
			var real_lien_last_price=$("#REAL_LIEN_LAST_PRICE").val().replace(/[￥,]/g, '');
			var real_repurch_last_price=$("#REAL_REPURCH_LAST_PRICE").val().replace(/[￥,]/g, '');
			var real_advancemachine_last_price=$("#REAL_ADVANCEMACHINE_LAST_PRICE").val().replace(/[￥,]/g, '');
			
			var real_lien_grant_price=$("#REAL_LIEN_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var real_repurch_grant_price=$("#REAL_REPURCH_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var real_advancemachine_grant_price=$("#REAL_ADVANCEMACHINE_GRANT_PRICE").val().replace(/[￥,]/g, '');
			
			var now_lien_grant_price=$("#LIEN_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var now_lien_last_price=$("#LIEN_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var now_repurch_grant_price=$("#REPURCH_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var now_repurch_last_price=$("#REPURCH_GRANT_PRICE").val().replace(/[￥,]/g, '');			

			var now_advancemachine_grant_price=$("#ADVANCEMACHINE_GRANT_PRICE").val().replace(/[￥,]/g, '');
			var now_advancemachine_last_price=$("#ADVANCEMACHINE_GRANT_PRICE").val().replace(/[￥,]/g, '');
			//连保
			if (real_lien_grant_price==null||real_lien_grant_price==""){
				if (now_lien_grant_price==null||now_lien_grant_price==""){
					now_lien_grant_price=0;
					now_lien_last_price=0;
				}
			}else{
				now_lien_last_price=parseFloat(now_lien_grant_price.replace(/[￥,]/g, ''))-parseFloat(real_lien_grant_price.replace(/[￥,]/g, ''))+parseFloat(real_lien_last_price.replace(/[￥,]/g, ''));
			}
			//回购
			if (real_repurch_grant_price==null||real_repurch_grant_price==""){
				if (now_repurch_grant_price==null||now_repurch_grant_price==""){
					now_repurch_grant_price=0;
					now_repurch_last_price=0;
				}
			}else{
				now_repurch_last_price=parseFloat(now_repurch_grant_price.replace(/[￥,]/g, ''))-parseFloat(real_repurch_grant_price.replace(/[￥,]/g, ''))+parseFloat(real_repurch_last_price.replace(/[￥,]/g, ''));
			}
			
			//交机前拨款
			if (real_advancemachine_grant_price==null||real_advancemachine_grant_price==""){
				if (now_advancemachine_grant_price==null||now_advancemachine_grant_price==""){
					now_advancemachine_grant_price=0;
					now_advancemachine_last_price=0;
				}
			}else{
		 		now_advancemachine_last_price=parseFloat(now_advancemachine_grant_price)-parseFloat(real_advancemachine_grant_price)+parseFloat(real_advancemachine_last_price);
			}
			
			var now_last_price=parseFloat(now_lien_last_price)+parseFloat(now_repurch_last_price);
			var now_grant_price=parseFloat(now_lien_grant_price)+parseFloat(now_repurch_grant_price);

			$("#ADVANCEMACHINE_GRANT_PRICE").val(now_advancemachine_grant_price);
			$("#ADVANCEMACHINE_LAST_PRICE").val(now_advancemachine_grant_price);
			$("#LIEN_GRANT_PRICE").val(now_lien_grant_price);
			$("#REPURCH_GRANT_PRICE").val(now_repurch_grant_price);
			$("#LIEN_LAST_PRICE").val(now_lien_grant_price);
			$("#REPURCH_LAST_PRICE").val(now_repurch_grant_price);
			
			$("#LAST_PRICE").val(now_last_price);
			$("#GRANT_PRICE").val(now_grant_price);			
		}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
			<input type="hidden" name="__action" id="__action" value="productCredit.creatProductCreditPlan">
			<input type="hidden" name="REAL_LAST_PRICE" id="REAL_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>">
			<input type="hidden" name="REAL_GRANT_PRICE" id="REAL_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>">
			<!-- Add By Michael 2011 12/13 增加 连保、回购、回购含灭失授信金额 -->
			<input type="hidden" name="REAL_LIEN_GRANT_PRICE" id="REAL_LIEN_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/>">
			<input type="hidden" name="REAL_REPURCH_GRANT_PRICE" id="REAL_REPURCH_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/>">
			<input type="hidden" name="REAL_REPURCHLOSS_GRANT_PRICE" id="REAL_REPURCHLOSS_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCHLOSS_GRANT_PRICE }"/>">
			<input type="hidden" name="REAL_ADVANCEMACHINE_GRANT_PRICE" id="REAL_ADVANCEMACHINE_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REAL_ADVANCEMACHINE_GRANT_PRICE }"/>">
			
			<input type="hidden" name="REAL_LIEN_LAST_PRICE" id="REAL_LIEN_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_LAST_PRICE }"/>">
			<input type="hidden" name="REAL_REPURCH_LAST_PRICE" id="REAL_REPURCH_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_LAST_PRICE }"/>">
			<input type="hidden" name="REAL_REPURCHLOSS_LAST_PRICE" id="REAL_REPURCHLOSS_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCHLOSS_LAST_PRICE }"/>">
			<input type="hidden" name="REAL_ADVANCEMACHINE_LAST_PRICE" id="REAL_ADVANCEMACHINE_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_LAST_PRICE }"/>">
			<input type="hidden" name="AUDIT" id="AUDIT" value="AUDIT"/>
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信添加</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${product.ID }"/>
			<input type="hidden" name="product_id" id="product_id" value="${product.ID }"/>
			<input type="hidden" name="PDGP_ID" id="PDGP_ID" value="${grantplan.PDGP_ID }"/>
			<input type="hidden" name="DEL_UNION_ID" id="DEL_UNION_ID" value=""/>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%" height="24px;">供应商</td>
					<td width="20%">${product.NAME }&nbsp;</td>
					<td width="15%">供应商编号</td>
					<td width="20%">${product.CODE }&nbsp;</td>
					<td width="13%">法定代表人</td>
					<td width="20%">${product.COMPANY_CORPORATION }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">签呈编号</td>
					<td><input type="text" name="CUGP_CODE" id="CUGP_CODE" value="${grantplan.CUGP_CODE }" style="width: 200px"></td>
					<td>授信状态</td>
					<td><c:if test="${grantplan.CUGP_STATUS eq 0}"><font color="red">已授信</font> </c:if><c:if test="${empty grantplan.CUGP_STATUS}"><font color="red">未授信</font></c:if> &nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;" rowspan="3">授信金额</td>
					<td>连         保：<input type="text" name="LIEN_GRANT_PRICE" id="LIEN_GRANT_PRICE" <c:if test="${ not empty grantplan.LIEN_GRANT_PRICE}"> value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/>" </c:if> <c:if test="${empty grantplan.LIEN_GRANT_PRICE}"> value="0" </c:if> style="width: 90px" readonly="readonly"></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="LIEN_REPEAT_CREDIT" value="1" <c:if test="${grantplan.LIEN_REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="LIEN_REPEAT_CREDIT"  <c:if test="${grantplan.LIEN_REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.LIEN_REPEAT_CREDIT}">checked="checked"</c:if> value="0">否</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>回         购：<input type="text" name="REPURCH_GRANT_PRICE" id="REPURCH_GRANT_PRICE" <c:if test="${ not empty grantplan.REPURCH_GRANT_PRICE}"> value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/>" </c:if> <c:if test="${empty grantplan.REPURCH_GRANT_PRICE}"> value="0" </c:if> style="width: 90px" readonly="readonly"></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="REPURCH_REPEAT_CREDIT" value="1" <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==1 }">checked="checked"</c:if> readonly="readonly">是&nbsp;<input type="radio"  name="REPURCH_REPEAT_CREDIT"  <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.REPURCH_REPEAT_CREDIT}">checked="checked"</c:if> value="0" readonly="readonly">否<td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>交机前拨款：<input type="text" name="ADVANCEMACHINE_GRANT_PRICE" id="ADVANCEMACHINE_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_GRANT_PRICE }"/>" style="width: 90px" onchange="updateTotalPrice();"></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="ADVANCE_MACHINEREPEAT_CREDIT" value="1" <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==1 }">checked="checked"</c:if> readonly="readonly">是&nbsp;<input type="radio"  name="ADVANCE_MACHINEREPEAT_CREDIT"  <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.ADVANCE_MACHINEREPEAT_CREDIT}">checked="checked"</c:if> value="0" readonly="readonly">否</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信总金额：</td>
					<td colspan=5><input type="text" name="GRANT_PRICE" id="GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>"   style="width: 100px" readonly="readonly"></td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>授信余额</td>
					<td colspan=5>连保：<input type="text" name="LIEN_LAST_PRICE" id="LIEN_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_LAST_PRICE }"/>" style="width: 90px" readonly="readonly">回购：<input type="text" name="REPURCH_LAST_PRICE" id="REPURCH_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_LAST_PRICE }"/>" style="width: 90px" readonly="readonly"> 交机前拨款：<input type="text" name="ADVANCEMACHINE_LAST_PRICE" id="ADVANCEMACHINE_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_LAST_PRICE }"/>" style="width: 90px" readonly>&nbsp;&nbsp;授信总余额：<input type="text" name="LAST_PRICE" id="LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>"   style="width: 100px" readonly="readonly"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信日期</td>
					<td colspan="1"><input type="text" name="START_DATE"  readonly="readonly" id="START_DATE"  value="${grantplan.START_DATE}" onfocus="this.value=''"/> - <input type="text" name="END_DATE" readonly="readonly" id="END_DATE" value="${grantplan.END_DATE}" onfocus="this.value=''"/> </td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		   </table>
		   	<table>
		   		<center  style="height: 22">
		   			<input type="button" name="saveBut" id="saveBut" value="保  存" onclick="addProductCredit();"	class="ui-state-default ui-corner-all">
		   			<input type="reset" name="resetBut" id="resetBut" value="重  置" class="ui-state-default ui-corner-all">
		   		</center>
			</table>
		</div>
		</div>
		</div>
		</form>		
	
	</body>
</html>