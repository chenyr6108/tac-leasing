<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<script type="text/javascript" src="${ctx }/customercredit/js/custcreditManage.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>授信添加</title>
		<script type="text/javascript">
		$(function(){
		    $("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
		    $("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		function updateLastPrice(){
		   var real_last_price=$("#REAL_LAST_PRICE").val();
			var real_grant_price=$("#REAL_GRANT_PRICE").val();
			if(real_grant_price==null||real_grant_price==""){
			   now_last_price=$("#GRANT_PRICE").val();
			}else{
		    var now_grant_price=$("#GRANT_PRICE").val();
			var now_last_price=parseFloat(now_grant_price.replace(/[￥,]/g, ''))-parseFloat(real_grant_price.replace(/[￥,]/g, ''))+parseFloat(real_last_price.replace(/[￥,]/g, ''));
			}
			$("#LAST_PRICE").val(now_last_price);
		 //	$("#LAST_PRICE").val($("#GRANT_PRICE").val());
		}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
			<input type="hidden" name="__action" id="__action" value="custCredit.creatCustCreditPlan">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信添加</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<input type="hidden" name="CUST_ID" id="CUST_ID" value="${cust.CUST_ID }"/>
			<input type="hidden" name="cust_id" id="cust_id" value="${cust.CUST_ID }"/>
			<input type="hidden" name="CUGP_ID" id="CUGP_ID" value="${grantplan.CUGP_ID }"/>
			<input type="hidden" name="REAL_LAST_PRICE" id="REAL_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>">
			<input type="hidden" name="REAL_GRANT_PRICE" id="REAL_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%" height="24px;">客户</td>
					<td width="20%">${cust.CUST_NAME }&nbsp;</td>
					<td width="10%">客户编号</td>
					<td width="20%">${cust.CUST_CODE }&nbsp;</td>
					<td width="10%">组织机构/身份证号</td>
					<td width="28%"><c:if test="${cust.CUST_TYPE eq 0}">${cust.NATU_IDCARD}</c:if><c:if test="${cust.CUST_TYPE eq 1}">${cust.CORP_ORAGNIZATION_CODE}</c:if>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">协议编号</td>
					<td><input type="text" name="CUGP_CODE" id="CUGP_CODE" value="${grantplan.CUGP_CODE }" style="width: 200px"></td>
					<td>授信状态</td>
					<td><c:if test="${grantplan.CUGP_STATUS eq 0}"><font color="red">已授信</font> </c:if><c:if test="${empty grantplan.CUGP_STATUS}"><font color="red">未授信</font></c:if> &nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信金额</td>
					<td><input type="text" name="GRANT_PRICE" id="GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>" style="width: 200px" onchange="updateLastPrice();">&nbsp;</td>
					<td>授信余额</td>
					<td><input type="text" name="LAST_PRICE" id="LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>" readonly="readonly" style="width: 200px">&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信日期</td>
					<td colspan="1"><input type="text" name="START_DATE"  readonly="readonly" id="START_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.START_DATE}"/> " onfocus="this.value=''"/> - <input type="text" name="END_DATE" readonly="readonly" id="END_DATE" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.END_DATE}"/>" onfocus="this.value=''"/> </td>
					<td>是否循环授信&nbsp;</td>
					<td><input type="radio" name="REPEAT_CREDIT" value="1" <c:if test="${grantplan.REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="REPEAT_CREDIT"  <c:if test="${grantplan.REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.REPEAT_CREDIT}">checked="checked"</c:if> value="0">否</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		   </table>
		   
	<!-- 	   <table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="6" height="26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>&nbsp;&nbsp;授权方案</strong>
					</td>
					<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addCustRow();">添加方案</a>
						&nbsp;
						<img src="${ctx }/images/u103.gif"><a href="#" onclick="deletecugd();">删除方案</a>
					</td>
				</tr>
				<tr>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="3%">
						<strong><input type="checkbox" name="ckb" id="ckb" value="0" onclick="checkallbox();"></strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="13%">
						<strong>还款期数</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="14%">
						<strong>还款年期</strong>
					</th>
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="14%">
						<strong>支付方式</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="14%">
						<strong>管理费（百分比）</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="14%">
						<strong>首期租金（百分比）</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="14%">
						<strong>保证金（百分比）</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="14%">
						<strong>利率上浮率（百分比）</strong>
					</th>
				</tr>
				<c:forEach items="${grantdetail.rs}" var="item" varStatus="status">
					<tr>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="checkbox" name="oldbox" id="oldbox" value="${item.CUGD_ID }">
							<input type="hidden" name=CUGD_ID id="CUGD_ID" value="${item.CUGD_ID }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="LEASE_PERIOD" id="LEASE_PERIOD" value="${item.LEASE_PERIOD }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="LEASE_TERM" id="LEASE_TERM" value="${item.LEASE_TERM }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select name="PAY_WAY" id="PAY_WAY">
								<option value="-11">---请选择---</option>
								<c:forEach items="${payInfor }" var="payInfor" varStatus="vs">
								<option value="${payInfor.CODE }" <c:if test="${payInfor.CODE eq item.PAY_WAY }">selected</c:if> >${payInfor.FLAG }</option>
								</c:forEach>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="MANAGEMENT_FEE_RATE" id="MANAGEMENT_FEE_RATE" value="${item.MANAGEMENT_FEE_RATE }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="HEAD_HIRE_PERCENT" id="HEAD_HIRE_PERCENT" value="${item.HEAD_HIRE_PERCENT }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="PLEDGE_PRICE_RATE" id="PLEDGE_PRICE_RATE" value="${item.PLEDGE_PRICE_RATE }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="FLOAT_RATE" id="FLOAT_RATE" value="${item.FLOAT_RATE }">
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${payInfor }" var="payIn" varStatus="vs">
					<input type="hidden" name="ccode" id="ccode" value="${payIn.CODE }">
					<input type="hidden" name="cflag" id="cflag" value="${payIn.FLAG }">
				</c:forEach>
			</table>  -->
		   
		   	<table>
		   		<center  style="height: 22">
		   			<input type="button" name="saveBut" id="saveBut" value="保  存" onclick="addCustomerCredit();"	class="ui-state-default ui-corner-all">
		   			<input type="reset" name="resetBut" id="resetBut" value="重  置" class="ui-state-default ui-corner-all">
		   		</center>
			</table>
		</div>
		</div>
		</div>
		</form>		
	</body>
</html>