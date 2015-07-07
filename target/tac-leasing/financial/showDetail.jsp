<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ include file="/common/taglibs.jsp"%>

<table class="panel_table">
	<tr>
		<th>
			支付日
		</th>
		<th>
			期数
		</th>
		<th>
			利息
		</th>
	</tr>
	
		<c:forEach items="${resultDetail}" var="item" varStatus="status">
		   <tr>
		     <td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
		     <td style="text-align: center;">${item.PERIOD_NUM}&nbsp;</td>
		     <td style="text-align: right;">&nbsp;<c:if test="${item.PRODUCTION_TYPE==1 or item.PRODUCTION_TYPE==3}"><fmt:formatNumber type="currency" value="${item.REN_PRICE/1.17 }" pattern="#,##0.00"/></c:if>
		     <c:if test="${item.PRODUCTION_TYPE==2}"><fmt:formatNumber type="currency" value="${item.REN_PRICE }" pattern="#,##0.00"/></c:if>
		     </td>
		   </tr>
		</c:forEach>


</table>
