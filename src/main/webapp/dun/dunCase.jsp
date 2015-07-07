<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;width:600px">
     <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;逾期180天以上案件统计表</span>
</div>

			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="font-family: 微软雅黑;width:600px">
       			<div class="zc_grid_body jqgrowleft" >

					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td  style="text-align: center;font-size:12px;" rowspan="2">年度月份 </td>
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
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">${item.sbCount} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.sbMoney }" pattern="#,##0.00"/></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> ${item.cycCount} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.cycMoney }" pattern="#,##0.00"/></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> ${item.sycCount} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.sycMoney }" pattern="#,##0.00"/></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> ${item.sbCount+item.cycCount+item.sycCount} </td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${item.sbMoney+item.cycMoney+item.sycMoney }" pattern="#,##0.00"/>&nbsp;</td>
						</tr>
					</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					  <td style="text-align: center;font-size:12px;">合计</td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">${total1} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money1 }" pattern="#,##0.00"/></td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">${total2} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money2 }" pattern="#,##0.00"/></td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">${total3} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money3 }" pattern="#,##0.00"/></td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">${total1+total2+total3} </td>
					  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;">￥<fmt:formatNumber type="currency" value="${money1+money2+money3 }" pattern="#,##0.00"/></td>
					</tr>
					</table>
				

			</div>
			<font color="red">*</font>${backDate }&nbsp;23:00之数据<br>
			<font color="red">*</font>按自然月统计
		</div>
</body>
</html>