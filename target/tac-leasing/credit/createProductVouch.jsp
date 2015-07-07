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
			<script type="text/javascript" src="${ctx }/credit/js/vouchManage.js"></script>
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
	//   function 	changetype(){
	//    var UNION_SUPPLIER_ID_sl=$("#UNION_SUPPLIER_ID_sl").val();
	//	   var UNION_SUPPLIER_ID=UNION_SUPPLIER_ID_sl.split("_")[0] ;
	//		var UNION_SUPPLIER_TYPE=UNION_SUPPLIER_ID_sl.split("_")[1];
	//		$("#UNION_SUPPLIER_ID").val(UNION_SUPPLIER_ID);
	//		$("#UNION_SUPPLIER_TYPE").val(UNION_SUPPLIER_TYPE);
	//	}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
			<input type="hidden" name="__action" id="__action" value="creditVouchManage.creatProductCreditPlan">
			<input type="hidden" name="REAL_LAST_PRICE" id="REAL_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>">
			<input type="hidden" name="REAL_GRANT_PRICE" id="REAL_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信添加</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${product.ID }"/>
			<input type="hidden" name="VOUCH_NAME" id="VOUCH_NAME" value="${product.NAME }"/>
			<input type="hidden" name="VOUCH_CODE" id="VOUCH_CODE" value="${product.CODE }"/>
			<input type="hidden" name="PDVP_ID" id="PDVP_ID" value="${grantplan.PDVP_ID }"/>
			<input type="hidden" name="DEL_UNION_ID" id="DEL_UNION_ID" value=""/>
			<input type="hidden" name="VOUCH_TYPE" id="VOUCH_TYPE" value="${product.TYPE }">
			<input type="hidden" name="TYPE" id="TYPE" value="${product.TYPE }">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%" height="24px;">担保人</td>
					<td width="20%">${product.NAME }&nbsp;</td>
					<td width="10%">担保人编号</td>
					<td width="20%">${product.CODE }&nbsp;</td>
					<td width="10%">法定代表人</td>
					<td width="28%">${product.COMPANY_CORPORATION }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">协议编号</td>
					<td><input type="text" name="CUGP_CODE" id="CUGP_CODE" value="${grantplan.CUVP_CODE }" style="width: 200px"></td>
					<td>授信状态</td>
					<td><c:if test="${grantplan.CUVP_STATUS eq 0}"><font color="red">已授信</font> </c:if><c:if test="${empty grantplan.CUVP_STATUS}"><font color="red">未授信</font></c:if> &nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信金额</td>
					<td colspan=2>
					连保：
					<input type="text" name="LIEN_GRANT_PRICE" id="LIEN_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					回购:
					<input type="text" name="REPURCH_GRANT_PRICE" id="REPURCH_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					回购含灭失
					<input type="text" name="REPURCHLOSS_GRANT_PRICE" id="REPURCHLOSS_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCHLOSS_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					</td>
					<td>授信余额</td>
					<td colspan=2>
					连保：
					<input type="text" name="LIEN_LAST_PRICE" id="LIEN_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					回购:
					<input type="text" name="REPURCH_LAST_PRICE" id="REPURCH_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					回购含灭失
					<input type="text" name="REPURCHLOSS_LAST_PRICE" id="REPURCHLOSS_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCHLOSS_GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">
					<input type="text" name="LAST_PRICE" id="LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>" readonly="readonly" style="width: 200px">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信日期</td>
					<td colspan="1"><input type="text" name="START_DATE"  readonly="readonly" id="START_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.START_DATE}"/> " onfocus="this.value=''"/> - <input type="text" name="END_DATE" readonly="readonly" id="END_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.END_DATE}"/>" onfocus="this.value=''"/> </td>
					<td>是否循环授信&nbsp;</td>
					<td><input type="radio" name="REPEAT_CREDIT" value="1" <c:if test="${grantplan.REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="REPEAT_CREDIT"  <c:if test="${grantplan.REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.REPEAT_CREDIT}">checked="checked"</c:if> value="0">否</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<!-- 
				<c:if test="${not empty unionGrantPlan}">
					<tr class="ui-state-default ui-th-ltr zc_grid_head">
						<td height="24px;" colspan="6">联合授信</td>
					</tr>
					<c:forEach items="${unionGrantPlan}" var="result" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td height="24px;">联合授信担保人</td>
							<td>${result.NAME }&nbsp;<input type="hidden" name="PURP_ID" id="PURP_ID" value="${result.PURP_ID }"/></td>
							<td>联合授信余额</td>
							<td><fmt:formatNumber pattern="#,##0.00" value="${result.UNION_VOUCH_PRICE }"/>&nbsp;</td>
							<td><input type="button" value="修改" onclick="updateUnion('${result.PUVP_ID }')" class="ui-state-default ui-corner-all"> &nbsp;<input type="button" value="取消" onclick="delUnion('${result.PUVP_ID }')" class="ui-state-default ui-corner-all"></td>
							<td>&nbsp;</td>
						</tr>		
					</c:forEach>
				</c:if> 
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>是否添加联合授信&nbsp;</td>
					<td><input type="radio" name="UNION_CREDIT" id="UNION_CREDIT" value="1" onchange="changeValue(1)">是&nbsp;<input type="radio" checked="checked" name="UNION_CREDIT" value="0" onchange="changeValue(0)">否</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr id="union1" style="display: none;" class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">担保人<input type="hidden" name="UNION_SUPPLIER_ID" id="UNION_SUPPLIER_ID" value=""/>
			                                <input type="hidden" name="UNION_SUPPLIER_TYPE" id="UNION_SUPPLIER_TYPE" value=""></td>
					<td><select id="UNION_SUPPLIER_ID_sl" name="UNION_SUPPLIER_ID_sl" onchange="changetype();">
							<option value="-1">
								-请选择担保人-
							</option>
							<c:forEach items="${supplier}" var="item">
								<option value="${item.ID }_${item.TYPE }">${item.NAME }_${item.CODE }</option>
							</c:forEach>
						</select></td>
					<td>联合授信金额&nbsp;</td>
					<td><input type="text" name="UNION_GRANT_PRICE" id="UNION_GRANT_PRICE" value="" style="width: 200px" >&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>-->
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
		<!-- 
		<div id="updateUnion" style="display: none;" title="修改联合授信">
	<form action="${ctx}/servlet/defaultDispatcher?__action=creditVouchManage.updateUnion" method="post" id="updateForm" name="updateForm">
		<input type="hidden" name="UNION_ID" id="UNION_ID"/>
		<input type="hidden" name="TYPE" id="TYPE" value="${product.TYPE }">
		<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${product.ID }"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">联合授信供应商</td>
			<td><span id="UNION_SUPPLIER"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">联合授信余额</td>
			<td><input type="text" name="UNION_PRICE" id="UNION_PRICE"></input></td>
		</tr>		
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="修改" onclick="updateUnionPrice()"></input>
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>-->
	</body>
</html>