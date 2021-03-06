<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
			<script type="text/javascript" src="${ctx }/credit/car/js/selectEquipment.js"></script>
			<script type="text/javascript" src="${ctx }/credit/car/js/schemeControl.js"></script>
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
					<td width="12%" height="24px;">担保人</td>
					<td width="20%">${product.NAME }&nbsp;</td>
					<td width="10%">担保人编号</td>
					<td width="20%">${product.CODE }&nbsp;</td>
					<td width="10%">法定代表人</td>
					<td width="28%">${product.COMPANY_CORPORATION }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">协议编号</td>
					<td>${grantplan.CUVP_CODE }&nbsp;</td>
					<td>授信状态</td>
					<td><c:if test="${grantplan.CUVP_STATUS eq 0}"><font color="red">已授信</font> </c:if> <c:if test="${empty grantplan.CUVP_STATUS}"><font color="red">未授信</font></c:if> &nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信金额</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${grantplan.GRANT_PRICE }"/>&nbsp;</td>
					<td>授信余额</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${grantplan.LAST_PRICE }"/>&nbsp;</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td height="24px;">授信日期</td>
					<td colspan="1"><fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.START_DATE}"/> - <fmt:formatDate pattern="yyyy-MM-dd" value="${grantplan.END_DATE}"/> </td>
					<td>是否循环授信&nbsp;</td>
					<td><input type="radio" name="REPEAT_CREDIT" <c:if test="${grantplan.REPEAT_CREDIT eq 1 }">checked="checked"</c:if> value="1">是&nbsp;<input type="radio" <c:if test="${grantplan.REPEAT_CREDIT eq 0 }">checked="checked"</c:if> name="REPEAT_CREDIT" value="0">否</td>
					<td> &nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<!--<c:if test="${not empty unionGrantPlan}">
					<tr class="ui-state-default ui-th-ltr zc_grid_head">
						<td height="24px;" colspan="6">联合授信</td>
					</tr>
					<c:forEach items="${unionGrantPlan}" var="result" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td height="24px;">联合授信供应商</td>
							<td>${result.NAME }&nbsp;</td>
							<td>联合授信余额</td>
							<td><fmt:formatNumber pattern="#,##0.00" value="${result.UNION_VOUCH_PRICE }"/>&nbsp;</td>
							<td> &nbsp;</td>
							<td>&nbsp;</td>
						</tr>		
					</c:forEach>
				</c:if>-->
		   </table>
		   <div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px"> 
						序号 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px">
						授信金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px">
						授信余额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px">
						授信起始日期
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 130px">
						授信结束日期
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 130px">
						操作时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 130px">
						操作人
					</th>					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${item.GRANT_PRICE}"/>&nbsp;<input type="hidden" name="custname" id="custname" value="${item.CUST_NAME }"/></td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${item.LAST_PRICE}"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.START_DATE}"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.END_DATE}"/>&nbsp;</td>
					<td style="text-align: center;">${item.MODITY_DATE}&nbsp;</td>
					<td style="text-align: center;">${item.NAME}&nbsp;</td>
					
				</tr>
				<TR>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						日志
					</th>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;" colspan="6">${item.MEMO}&nbsp;</td>
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