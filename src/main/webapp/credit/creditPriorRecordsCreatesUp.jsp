<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
		<title>担保人</title> 
		<script type="text/javascript" src="${ctx }/credit/js/creditVoucherAndDebt2.js"></script>
 <input type="hidden" name="statuscount" id="statuscount" value="${status.count }">
 <input type="hidden" name="lengthpc" id="lengthpc" value="${fn:length(corpList) }">
  <c:if test="${not empty objlist}">
 <c:forEach items="${objlist}" var="obj" varStatus="objcount">
    <c:if test="${obj.objcount==(status.count*3-2)}">
    <c:set var="obj1" value="${obj }"   />
    </c:if>
     <c:if test="${obj.objcount==(status.count*3-1)}">
    <c:set var="obj2" value="${obj }"   />
    </c:if>
     <c:if test="${obj.objcount==(status.count*3)}">
    <c:set var="obj3" value="${obj }"   />
    </c:if>
 </c:forEach>   </c:if>

     <c:if test="${not empty obj1}">
      <c:if test="${obj1.PJCCC_ID==item.PJCCC_ID}">
		<%@ include file="creditVoucherAndDebt.jsp"%>
		<%@ include file="creditVoucherAndDebt2.jsp"%>
      </c:if>
     </c:if>
<!-- 	<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<th width="19%"  class="ui-state-default ui-th-ltr zc_grid_head" align="left">
				项目名称 
			</th>
			<th colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head">
				财务情况说明 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位（万元）
			</th>
		</tr> 
		<tr>
			<td width="20%" class="ui-widget-content jqgrow ui-row-ltr">
				项目
				<jsp:useBean id="nows" class="java.util.Date" /> 
				<jsp:setProperty name="nows" property="month" value="${nows.month-1}"/>
			</td>
			<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
				<c:choose>
					<c:when test="${empty v1}">
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME11s${statu.count }" value="<fmt:formatDate value="${nows}" pattern="yyyy年MM月" />" style="width: 130px">
					</c:when>
					<c:otherwise>
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME11s${statu.count }" value="${v1.PROJECT_NAME}" style="width: 130px">
				 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v1.PCFS_ID}">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="15%" class="ui-widget-content jqgrow ui-row-ltr"> 
			<jsp:setProperty name="nows" property="month" value="${nows.month-12}"/>
				<c:choose>
					<c:when test="${empty v2}">
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME22s${statu.count }" value="<fmt:formatDate value="${nows}" pattern="yyyy年" />" style="width: 130px">
					</c:when>
					<c:otherwise>
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME22s${statu.count }" value="${v2.PROJECT_NAME}" style="width: 130px">
				 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v2.PCFS_ID}">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
				<jsp:setProperty name="nows" property="month" value="${nows.month-12}"/>
				<c:choose>
					<c:when test="${empty v3}">
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME33s${statu.count }" value="<fmt:formatDate value="${nows}" pattern="yyyy年" />" style="width: 130px">
					</c:when>
					<c:otherwise>
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME33s${statu.count }" value="${v3.PROJECT_NAME}" style="width: 130px">
				 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v3.PCFS_ID}">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
				<jsp:setProperty name="nows" property="month" value="${nows.month-12}"/>
				<c:choose>
					<c:when test="${empty v4}">
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME44s${statu.count }" value="<fmt:formatDate value="${nows}" pattern="yyyy年" />" style="width: 130px">
					</c:when>
					<c:otherwise>
						 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME44s${statu.count }" value="${v4.PROJECT_NAME}" style="width: 130px">
				 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v4.PCFS_ID}">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="20%" align="center" class="ui-widget-content jqgrow ui-row-ltr">
				备注<input type="hidden" name="PROJECT_NAME" id="PROJECT_NAME55" value="备注">
				    <input type="hidden" name="PCFS_ID" id="PCFS_ID5s" value="${v5.PCFSR_ID}">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				货币资金
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.MONEY_FUNDS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.MONEY_FUNDS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.MONEY_FUNDS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.MONEY_FUNDS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS5s" value="${v5.MONEY_FUNDS}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				应收账款
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.ACCOUNTS_RECEIVABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.ACCOUNTS_RECEIVABLE}"/>"  style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.ACCOUNTS_RECEIVABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.ACCOUNTS_RECEIVABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE5s${statu.count }" value="${v5.ACCOUNTS_RECEIVABLE}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				存货
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="STOCK" id="STOCK1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.STOCK}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="STOCK" id="STOCK2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.STOCK}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="STOCK" id="STOCK3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.STOCK}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="STOCK" id="STOCK4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.STOCK}"/>" style="width: 130px;text-align: right;">
			</td>
			<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="STOCK" id="STOCK5s" value="${v5.STOCK}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				固定资产（净值）
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.CAPITAL_ASSERTS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.CAPITAL_ASSERTS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.CAPITAL_ASSERTS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.CAPITAL_ASSERTS}"/>" style="width: 130px;text-align: right;">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS5s" value="${v5.CAPITAL_ASSERTS}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				总资产
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.TOTAL_ASSERTS}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.TOTAL_ASSERTS}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.TOTAL_ASSERTS}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.TOTAL_ASSERTS}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS5s" value="${v5.TOTAL_ASSERTS}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				短期借款
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.SHORTTIME_LOAN}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.SHORTTIME_LOAN}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.SHORTTIME_LOAN}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.SHORTTIME_LOAN}"/>" style="width: 130px;text-align: right;">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN5s" value="${v5.SHORTTIME_LOAN}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
				应付账款
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.ACCOUNTS_PAYABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.ACCOUNTS_PAYABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.ACCOUNTS_PAYABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.ACCOUNTS_PAYABLE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE5s" value="${v5.ACCOUNTS_PAYABLE}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				总负债
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_OWES" id="TOTAL_OWES1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.TOTAL_OWES}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_OWES" id="TOTAL_OWES2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.TOTAL_OWES}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_OWES" id="TOTAL_OWES3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.TOTAL_OWES}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_OWES" id="TOTAL_OWES4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.TOTAL_OWES}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="TOTAL_OWES" id="TOTAL_OWES5s" value="${v5.TOTAL_OWES}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				实收资本
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.CONTRIBUTED_CAPITAL}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.CONTRIBUTED_CAPITAL}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.CONTRIBUTED_CAPITAL}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.CONTRIBUTED_CAPITAL}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL5s${statu.count }" value="${v5.CONTRIBUTED_CAPITAL}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				资本公积
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.CAPITAL_RESERVE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.CAPITAL_RESERVE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.CAPITAL_RESERVE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.CAPITAL_RESERVE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE5s${statu.count }" value="${v5.CAPITAL_RESERVE}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				未分配利润
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.UNDISTRIBUTED_PROFIT}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.UNDISTRIBUTED_PROFIT}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.UNDISTRIBUTED_PROFIT}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.UNDISTRIBUTED_PROFIT}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT5s${statu.count }" value="${v5.UNDISTRIBUTED_PROFIT}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				销售收入
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_REVENUE" id="SALES_REVENUE1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.SALES_REVENUE}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_REVENUE" id="SALES_REVENUE2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.SALES_REVENUE}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_REVENUE" id="SALES_REVENUE3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.SALES_REVENUE}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_REVENUE" id="SALES_REVENUE4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.SALES_REVENUE}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="SALES_REVENUE" id="SALES_REVENUE5s${statu.count }" value="${v5.SALES_REVENUE}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				销售成本
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.COST_OF_MARKETING}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.COST_OF_MARKETING}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.COST_OF_MARKETING}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.COST_OF_MARKETING}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING5s" value="${v5.COST_OF_MARKETING}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				期间费用
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.PERIOD_EXPENSE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.PERIOD_EXPENSE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.PERIOD_EXPENSE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.PERIOD_EXPENSE}"/>" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE5s" value="${v5.PERIOD_EXPENSE}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
				利润总额
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT1s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v1.TOTAL_PROFIT}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT2s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v2.TOTAL_PROFIT}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT3s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v3.TOTAL_PROFIT}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT4s${statu.count }" value="<fmt:formatNumber pattern='#,##0.00' value="${v4.TOTAL_PROFIT}"/>" onchange="changeDEBTRs('${statu.count }');" style="width: 130px;text-align: right;">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT5s" value="${v5.TOTAL_PROFIT}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				资产负债率
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="DEBTR" id="DEBTR1s${statu.count }" value="${v1.DEBTR}" style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="DEBTR" id="DEBTR2s${statu.count }" value=" ${v2.DEBTR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="DEBTR" id="DEBTR1s${statu.count }" value=" ${v3.DEBTR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="DEBTR" id="DEBTR4s${statu.count }" value=" ${v4.DEBTR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="DEBTR" id="DEBTR5s${statu.count }" value="${v5.DEBTR}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				销售净利率
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN1s${statu.count }" value=" ${v1.PROFIT_MARGIN} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN2s${statu.count }" value=" ${v2.PROFIT_MARGIN} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN3s${statu.count }" value=" ${v3.PROFIT_MARGIN} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN4s${statu.count }" value=" ${v4.PROFIT_MARGIN} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN5s${statu.count }" value="${v5.PROFIT_MARGIN}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				毛利率
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TTM" id="TTM1s${statu.count }" value=" ${v1.TTM} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TTM" id="TTM2s${statu.count }" value=" ${v2.TTM} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TTM" id="TTM3s${statu.count }" value=" ${v3.TTM} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TTM" id="TTM4s${statu.count }" value=" ${v4.TTM} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="TTM" id="TTM5s${statu.count }" value="${v5.TTM}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				销售增长率
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_GROWTH" id="SALES_GROWTH1s${statu.count }" value=" ${v1.SALES_GROWTH} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_GROWTH" id="SALES_GROWTH2s${statu.count }" value=" ${v2.SALES_GROWTH} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_GROWTH" id="SALES_GROWTH3s${statu.count }" value=" ${v3.SALES_GROWTH} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="SALES_GROWTH" id="SALES_GROWTH4s${statu.count }" value=" ${v4.SALES_GROWTH} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="SALES_GROWTH" id="SALES_GROWTH5s" value="${v5.SALES_GROWTH}" style="width: 150px">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				净资产增长率
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="NAGR" id="NAGR1s${statu.count }" value=" ${v1.NAGR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="NAGR" id="NAGR2s${statu.count }" value=" ${v2.NAGR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="NAGR" id="NAGR3s${statu.count }" value=" ${v3.NAGR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="NAGR" id="NAGR4s${statu.count }" value=" ${v4.NAGR} " style="width: 110px;text-align: right;">%
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
				<input type="text" name="NAGR" id="NAGR5s${statu.count }" value="${v5.NAGR}" style="width: 150px">
			</td>
		</tr>
	</table> 
	-->
	<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td  class="ui-state-default ui-th-ltr zc_grid_head">
				<strong style="font-size: 14px;">其他调查说明</strong>
			</td>
			<td width="75.5%"  class="ui-state-default ui-th-ltr zc_grid_head">
				<table border="0" cellspacing="0" cellpadding="5" align="right">
					<tr >
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							相关操作：
							<img src="${ctx }/images/u100.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="addOtherProjectss('sssss${status.count }');">添加</a>
						</td>
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							<img src="${ctx }/images/u103.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="deleteOtherProjectss();">删除</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:forEach items="${creditPriorProject}" var="itemss" varStatus="stat">
			<c:if test="${itemss.STATE eq 2}">
				<tr>
					<td width="19%" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="checkbox" name="otherProjects_check" value="${stat.count }"> 项目名称：
					</td>
					<td width="81%" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PROJECT_NAME2"  value="${itemss.PROJECT_NAME }"
							style="width: 200px;">
					</td>
				</tr> 
				<tr>
					<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						内容：
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<textarea name="PROJECT_CONTENT2" id="PROJECT_CONTENT2${stat.count }"
								style="width: 500px; height: 50px; font-size: 12px"
								class="txtk">${itemss.PROJECT_CONTENT }</textarea>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		</table>
		<div id="sssss${status.count }" class="ui-state-default ui-jqgrid-hdiv "></div>
		<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong style="font-size: 14px;">名下资产</strong>
			</td>
			<td   colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<table border="0" cellspacing="0" cellpadding="5" align="right">
					<tr >
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							相关操作：
							<img src="${ctx }/images/u100.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="addOtherProrerty('zzzz${status.count }');">添加</a>
						</td>
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							<img src="${ctx }/images/u103.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="deleteOtherProrerty();">删除</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:forEach items="${corpProperty}" var="items" varStatus="s">
		  <c:if test="${item.PJCCC_ID eq items.VOUCH_ID }">
			<input type="hidden" name="ID" value="${items.ID }">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="font-size: 14px;">房产名称</td>
				<td colspan="3" style="font-size: 14px;"><input type="text" id="HOUSE_NAME" name="HOUSE_NAME" value="${items.HOUSE_NAME }"></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="font-size: 14px;">房产坐落地点</td>
				<td width="30%" style="font-size: 14px;"><input style="width: 500" type="text" id="HOUSE_ADDRESS" name="HOUSE_ADDRESS" value="${items.HOUSE_ADDRESS }"></td>
				<td style="font-size: 14px;">面积</td>
				<td style="font-size: 14px;"><input type="text" id="HOUSE_AREA" name="HOUSE_AREA" value="${items.HOUSE_AREA }"></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="font-size: 14px;">国土证/房产证</td>
				<td width="30%" style="font-size: 14px;"><input style="width: 500"  type="text" id="HOUSE_PROVE" name="HOUSE_PROVE" value="${items.HOUSE_PROVE }"></td>
				<td style="font-size: 14px;">他项权利</td>
				<td style="font-size: 14px;"><input type="text" id="HOUSE_OTHERRIGHT" name="HOUSE_OTHERRIGHT" value="${items.HOUSE_OTHERRIGHT }"></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="font-size: 14px;">备注 </td>
				<td colspan="3" style="font-size: 14px;"><textarea class="txtk" style="width: 500px; height: 50px; font-size: 12px" name="NOTES" id="NOTES">${items.NOTES }</textarea><img src="${ctx }/images/u103.gif">&nbsp;<a href="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.deleteCropProperty&credit_id=${prcd_id }&id=${items.ID }';">删除</a></td>
			</tr>
		  </c:if>
		</c:forEach>
		</table>
		<div id="zzzz${status.count }" class="ui-state-default ui-jqgrid-hdiv "></div>
		<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
			<c:forEach items="${creditPriorProject}" var="itemss" varStatus="stat">
				<c:if test="${itemss.STATE eq 3}">
					<tr>
						<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							意见：
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="hidden" name="PROJECT_NAME3" value="" style="width: 200px;">
							<textarea name="PROJECT_CONTENT3" id="PROJECT_CONTENT3${status.count }"
									style="width: 500px; height: 50px; font-size: 12px"
									class="txtk">${itemss.PROJECT_CONTENT }</textarea>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
