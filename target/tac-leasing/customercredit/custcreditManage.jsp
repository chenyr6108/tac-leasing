<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/customercredit/js/custcreditManage.js"></script>

	</head>
	<body>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="custCredit.queryAllCustCredit" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户授信管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>授信额度：</td>
				          <td>
				          	<input type="text" name="QSTARTMONEY" id="QSTARTMONEY" value="${QSTARTMONEY }" style=" width:66px;height:18px; font-size: 12px;">-
				          	<input type="text" name="QENDMONEY" id="QENDMONEY" value="${QENDMONEY }" style=" width:66px;height:18px; font-size: 12px;">
				          </td>
				          <td>客户级别：</td>
				          <td>
				          	<select name="QCUSTLEVEL" id="QCUSTLEVEL" style=" height: 18px;">
				          	 	<option value="">请选择</option>
				          	<c:forEach items="${custInfor}" var="custInfor" varStatus="sta">
				          	 	<option value="${custInfor.CODE}" <c:if test="${QCUSTLEVEL eq custInfor.CODE}">selected="selected"</c:if>>${custInfor.FLAG}</option>
				          	</c:forEach>
				          	</select>
				          </td>
				          <td>
				          	授信状态：
				          	<select name="QCUGPDTATUS" id="QCUGPDTATUS" style=" height: 18px;">
				          	 	<option value="-1">请选择</option>
				          	 	<option value="2" <c:if test="${QCUGPDTATUS eq 2 }">selected</c:if>>未授信</option>
				          	 	<option value="0" <c:if test="${QCUGPDTATUS eq 0 }">selected</c:if> >已授信</option>
				          	 	<option value="1" <c:if test="${QCUGPDTATUS eq 1 }">selected</c:if>>取消授信</option>
				          	</select>
				          </td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="4"><input type="text" name="QSEARCHVALUE" value="${QSEARCHVALUE }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="tableForColor">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px">
						客户编号
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" style="width: 300px">
						客户
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						客户级别
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						客户类型
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" style="width: 130px">
						授信额度
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" style="width: 130px">
						授信余额
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						联系方式
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						授信状态
					</th>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
						<a href="javascript:void(0)" onclick="initCreate('${ctx }')">操作</a>
					</th>
					<input type="hidden" name="cust_id" id="cust_id"/>
					<input type="hidden" name="CUST_ID" id="CUST_ID"/>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>${item.CUST_CODE }&nbsp;<input type="hidden" name="custid" id="custid" value="${item.CUST_ID }"/></td>
					<td><a href="javaScript:void(0)" onclick="window.parent.openTab({tabName:'客户信息浏览',location:'${ctx }/servlet/defaultDispatcher?__action=customer.readCust&cust_id=${item.CUST_ID }&cust_type=${item.CUST_TYPE }&showFlag=0'});">${item.CUST_NAME }</a>&nbsp;<input type="hidden" name="custname" id="custname" value="${item.CUST_NAME }"/></td>
					<td><c:forEach items="${custInfor}" var="custInfor" varStatus="sta"><c:if test="${item.CUST_LEVEL eq custInfor.CODE}">${custInfor.FLAG}</c:if></c:forEach>&nbsp;</td>
					<td><c:if test="${item.CUST_TYPE eq 0}">自然人</c:if><c:if test="${item.CUST_TYPE eq 1}">法人</c:if>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${item.GRANT_PRICE}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00" value="${item.LAST_PRICE}"/>&nbsp;</td>
					<td>${item.NATU_PHONE }<c:if test="${empty item.NATU_PHONE }">${item.NATU_MOBILE }</c:if> &nbsp;</td>
					<td><c:if test="${empty item.CUGP_ID}">未授信</c:if><c:if test="${item.CUGP_STATUS eq 0}">已授信</c:if><c:if test="${item.CUGP_STATUS eq 1}">取消授信</c:if></td>
					<td><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=custCredit.queryLog&CUST_ID=${item.CUST_ID }'">查看</a>&nbsp;<a href="#" onclick="showCust('${item.CUST_ID }');">添加授信</a>&nbsp;<a href="javascript:void(0)" onclick="delCreditPlan('${item.CUST_ID }');">取消授信</a>&nbsp;</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
			</div>
			</div>
</form>
	</body>
</html>