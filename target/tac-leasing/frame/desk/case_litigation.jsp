<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id='${divName}' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName}');" title="点击删除导航"></span>移法案件统计表
		<!-- 
		<br>
		<span onclick="showCount()" style="cursor:pointer" id="showOrHidden">显示件数</span>
		 -->
	</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="font-family: 微软雅黑">
       			<div class="zc_grid_body jqgrowleft">

					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td  style="text-align: center;font-size:12px;" rowspan="2">月份 </td>
							<td  style="text-align: center;font-size:12px;" colspan="2">机器设备 </td>
							<td  style="text-align: center;font-size:12px;" colspan="2">乘用车 </td>
							<td  style="text-align: center;font-size:12px;" colspan="2">商用车 </td>
							<td  style="text-align: center;font-size:12px;" colspan="2">合计 </td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
						   <td  style="text-align: center;font-size:12px;">件数 </td>
						   <td  style="text-align: center;font-size:12px;">金额 </td>
						   <td  style="text-align: center;font-size:12px;">件数 </td>
						   <td  style="text-align: center;font-size:12px;">金额</td>
						   <td  style="text-align: center;font-size:12px;">件数</td>
						   <td  style="text-align: center;font-size:12px;">金额 </td>
						   <td  style="text-align: center;font-size:12px;">件数 </td>
						   <td  style="text-align: center;font-size:12px;">金额</td>
						</tr>
					<c:forEach var="item" items="${result}" >
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.YearAndMonth }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;">${item.count1}</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> ￥<fmt:formatNumber type="currency" value="${item.sum1 }" pattern="#,##0.00"/></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.count2} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.sum2 }" pattern="#,##0.00"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.count3} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.sum3 }" pattern="#,##0.00"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.count1+item.count2+item.count3}</td> 
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> ￥<fmt:formatNumber type="currency" value="${item.sum1+item.sum2+item.sum3 }" pattern="#,##0.00"/>&nbsp;</td>
						</tr>
					</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					  <td style="text-align: center;font-size:12px;">合计</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;">${total1}</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money1 }" pattern="#,##0.00"/>&nbsp;</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;">${total2} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money2 }" pattern="#,##0.00"/>&nbsp;</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;">${total3} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money3 }" pattern="#,##0.00"/>&nbsp;</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;">${total1+total2+total3} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money1+money2+money3 }" pattern="#,##0.00"/>&nbsp;</td>
					</tr>
					</table>
				

			</div>
			<font color="red">*</font>${backDate }之数据<br>
			<font color="red">*</font>按自然月统计
		</div>
</div>				