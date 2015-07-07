<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id='case_compare_day'
	class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick"
			onclick="deleteDIV(this,'case_compare_day');" title="点击删除导航"></span>各区案件时间表(${year }年${month }月拨款案件)
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="font-family: 微软雅黑">
       			<div class="zc_grid_body jqgrowleft">
				<table cellspacing="0" cellpadding="0" border="0"
					style="width:523px;">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:60px;" rowspan="3">办事处
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:30px;" rowspan="3">件数
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:200px;" colspan="8">
							平均天數</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:20px;"
							style="width:40px;" rowspan="2">进件-<br>访厂</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:20px;"
							style="width:40px;" rowspan="2">访厂-<br>提交</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;" colspan="2">
							案件審查時間</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;" rowspan="2">
							核准-<br>文审</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;" rowspan="2">
							文審-<br>撥款</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;" colspan="2">
							进件-撥款</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;">一次<br>過案</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;">非一次<br>過案</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;">一次<br>過案</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"
							style="text-align: center;" style="width:40px;">非一次<br>過案</td>
					</tr>
					<c:forEach var="item" items="${resultList}">
					<c:set var="countTotal" value="${item.countCase+countTotal }"/>
					<c:set var="fgTotal" value="${item.f_g_sum+fgTotal }"/>
					<c:set var="efTotal" value="${item.e_f_sum+efTotal }"/>
					<c:set var="bcTotal" value="${item.b_c_sum+bcTotal }"/>
					<c:set var="abTotal" value="${item.a_b_sum+abTotal }"/>
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: center;">${item.deptName }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;">${item.countCase }&nbsp;</td>
						    <td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;">${item.f_g }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;">${item.e_f }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;"><c:if test="${item.c_e_1 ==0.00 }">-</c:if><c:if test="${item.c_e_1 !=0.00 }">${item.c_e_1 }</c:if>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;"><c:if test="${item.c_e_2 ==0.00 }">-</c:if><c:if test="${item.c_e_2 !=0.00 }">${item.c_e_2 }</c:if>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;">${item.b_c }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;">${item.a_b }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;"><c:if test="${item.a_g_1 ==0.00 }">-</c:if><c:if test="${item.a_g_1 !=0.00 }">${item.a_g_1 }</c:if>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr"
								style="text-align: right;"><c:if test="${item.a_g_2 ==0.00 }">-</c:if><c:if test="${item.a_g_2 !=0.00 }">${item.a_g_2 }</c:if>&nbsp;</td>
						</tr>
					</c:forEach>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							合计：
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							${countTotal }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${fgTotal/countTotal }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${efTotal/countTotal }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${c_e_1 }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${c_e_2 }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${bcTotal/countTotal }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${abTotal/countTotal }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${a_g_1 }" pattern="#,##0.00"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
							<fmt:formatNumber type="currency" value="${a_g_2 }" pattern="#,##0.00"/>&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<font color="red">*</font>${date }&nbsp;20:00之数据
		</div>
	</div>
</div>
