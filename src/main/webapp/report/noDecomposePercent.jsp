<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
				选项
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Sep-09</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Oct-09</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Nov-09</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Dec-09</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Jan-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Feb-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Mar-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Apr-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>May-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Jun-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Jul-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>Aug-10</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>本年度</strong>
			</th>
		</tr>
		<c:forEach items="${executePercentList}" var="percent" varStatus="status">
			<tr	class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;">${percent.ITEM }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_0909 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_0910 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_0911 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_0912 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1001 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1002 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1003 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1004 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1005 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1006 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1007 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_1008 }&nbsp;</td>
				<td style="text-align: center;">${percent.COUNT_ALL_2010 }&nbsp;</td>
			</tr>
		</c:forEach>
	</table>