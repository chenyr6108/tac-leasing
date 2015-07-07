<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id='dun_rent' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'dun_rent');" title="点击删除导航"></span>租金提醒
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">    
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td  style="text-align: center;">承租人 </td>
					<td  style="text-align: center;">合同个数 </td>
					<td  style="text-align: center;">支付表个数 </td>
					<td  style="text-align: center;">应付总额 </td>
					<td  style="text-align: center;">实付总额 </td>
					<td   style="text-align: center;">差额 </td>
				</tr>
				<c:forEach var="item" items="${dunRentList}" >
				<c:set var ="leaveP" value="${item.MONTH_PRICE-item.REDUCE_PRICE }" ></c:set>
				<c:set var ="ln" value="${item.MONTH_PRICE-item.REDUCE_PRICE }" ></c:set>
				<tr >
					<td class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${leaveP lt 0.05}"> style="text-align:center;color : #009900;" </c:if>  <c:if test="${leaveP gt 0.05}"> style="text-align:center;" </c:if> > ${item.CUST_NAME }	&nbsp; </td>
					<td class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${leaveP lt 0.05}"> style="text-align:center;color : #009900;" </c:if> <c:if test="${leaveP gt 0.05}"> style="text-align:center;" </c:if>> ${item.CNT_RECT }  &nbsp; </td>
					<td class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${leaveP lt 0.05}"> style="text-align:center;color : #009900;" </c:if>  <c:if test="${leaveP gt 0.05}"> style="text-align:center;" </c:if>  > ${item.CNT_RECP }	&nbsp; </td>
					<td class="ui-widget-content jqgrow ui-row-ltr"  <c:if test="${leaveP lt 0.05}"> style="text-align:right;color : #009900;" </c:if>  <c:if test="${leaveP gt 0.05}"> style="text-align:right;" </c:if> > <fmt:formatNumber type="currency" value="${item.MONTH_PRICE }"></fmt:formatNumber>&nbsp; </td>
					<td class="ui-widget-content jqgrow ui-row-ltr"  <c:if test="${leaveP lt 0.05}"> style="text-align:right;color : #009900;" </c:if>  <c:if test="${leaveP gt 0.05}"> style="text-align:right;" </c:if> >	<fmt:formatNumber type="currency" value="${item.REDUCE_PRICE }"></fmt:formatNumber>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr"  <c:if test="${leaveP lt 0.05}"> style="text-align:right;color : #009900;" </c:if>   <c:if test="${leaveP gt 0.05}"> style="text-align:right;" </c:if>  >	<fmt:formatNumber type="currency" value="${leaveP }"></fmt:formatNumber>&nbsp;</td>
				</tr>
				
				</c:forEach>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>