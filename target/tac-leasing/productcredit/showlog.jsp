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
			<script type="text/javascript" src="${ctx }/productcredit/js/productcreditManage.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>授信日志</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
			<input type="hidden" name="__action" id="__action" value="custCredit.creatCustCreditPlan">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信查看</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${product.ID }"/>
			<input type="hidden" name="product_id" id="product_id" value="${product.ID }"/>
			<input type="hidden" name="PDGP_ID" id="PDGP_ID" value="${grantplan.PDGP_ID }"/>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%" height="24px;">供应商</td>
					<td width="20%">${product.NAME }&nbsp;</td>
					<td width="10%">供应商编号</td>
					<td width="20%">${product.CODE }&nbsp;</td>
					<td width="10%">法定代表人</td>
					<td width="28%">${product.COMPANY_CORPORATION }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">协议编号</td>
					<td>${grantplan.CUGP_CODE }&nbsp;</td>
					<td>授信状态</td>
					<td><c:if test="${grantplan.CUGP_STATUS eq 0}"><font color="red">已授信</font> </c:if><c:if test="${grantplan.CUGP_STATUS eq 1}"><font color="red">取消授信</font> </c:if><c:if test="${empty grantplan.CUGP_STATUS}"><font color="red">未授信</font></c:if> &nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信金额</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>&nbsp;</td>
					<td> &nbsp;</td>
					<td style="text-align: right;">&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
<%-- 				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信金额</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>&nbsp;</td>
					<td>授信余额</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr> --%>
				<!-- Modify by Michael 2011 12/13日 将授信金额拆分为连保、回购、回购含灭失额度 -->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;" rowspan="3">授信金额</td>
					<td>连         保：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="LIEN_REPEAT_CREDIT" value="1" <c:if test="${grantplan.LIEN_REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="LIEN_REPEAT_CREDIT"  <c:if test="${grantplan.LIEN_REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.LIEN_REPEAT_CREDIT}">checked="checked"</c:if> value="0">否</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>回         购：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="REPURCH_REPEAT_CREDIT" value="1" <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="REPURCH_REPEAT_CREDIT"  <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.REPURCH_REPEAT_CREDIT}">checked="checked"</c:if> value="0">否<td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>交机前拨款：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_GRANT_PRICE }"/></td>
					<td colspan="4">是否循环授信&nbsp;<input type="radio" name="ADVANCE_MACHINEREPEAT_CREDIT" value="1" <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;<input type="radio"  name="ADVANCE_MACHINEREPEAT_CREDIT"  <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==0 }">checked="checked"</c:if> <c:if test="${empty grantplan.ADVANCE_MACHINEREPEAT_CREDIT}">checked="checked"</c:if> value="0">否</td>
				</tr>
<%-- 				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>授信余额</td>
					<td colspan=5>连保：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_LAST_PRICE }"/>回购：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_LAST_PRICE }"/> 交机前拨款：<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_LAST_PRICE }"/>&nbsp;&nbsp;</td>
				</tr> --%>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信日期</td>
					<td colspan="1">${grantplan.START_DATE} - ${grantplan.END_DATE} </td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
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
							<td height="24px;">联合授信供应商</td>
							<td>${result.NAME }&nbsp;</td>
							<td>联合授信余额</td>
							<td><fmt:formatNumber pattern="#,##0.00" value="${result.UNION_GRANT_PRICE }"/>&nbsp;</td>
							<td> &nbsp;</td>
							<td>&nbsp;</td>
						</tr>		
					</c:forEach>
				</c:if> -->
		   </table>
		   <div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px"> 
						序号 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px" colspan="3">
						操作时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px" colspan="2">
						操作人
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }&nbsp;</td>
					<td style="text-align: center;" colspan="3">${item.CREATE_DATE}&nbsp;</td>
					<!-- Modify By Michael 将此处显示为实际修改人的名字 -->
					<!--  <td style="text-align: center;">${item.NAME}&nbsp;</td> -->
					<td style="text-align: center;" colspan="2">${item.USERNAME}&nbsp;</td>
				</tr>
				<TR>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						日志
					</th>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;" colspan="5">${item.MEMO}&nbsp;</td>
				</TR>
			</c:forEach>
			</tbody>
		</table>
		<table>
		   		<center  style="height: 22">
		   			<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
		   		</center>
			</table>
		</div>
		</div>
		</div>
		</div>
		</form>		
	</body>
</html>