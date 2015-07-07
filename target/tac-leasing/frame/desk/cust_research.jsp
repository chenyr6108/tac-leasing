<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id='cust_research' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'cust_research');" title="点击删除导航"></span>客户调查
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">类型</td>
					<td style="text-align: center;">客户名称</td>
					<td style="text-align: center;">区域</td>
					<td style="text-align: center;">生成时间</td>
					<td style="text-align: center;">客户经理</td>
				</tr>
				<c:forEach items="${custResearchList}" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${item.TYPE }</td>
						<td style="text-align: center;">${item.CUST_NAME }</td>
						<td style="text-align: center;">${item.AREA_NAME }</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_DATE }" /></td>
						<td style="text-align: center;">${item.SENSOR_NAME }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>