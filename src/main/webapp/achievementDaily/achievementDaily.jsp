<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<script>
			$(function () {
				var d=new Date();
			    var sec=d.getSeconds();
			    var min=d.getMinutes();
			    var hour=d.getHours();
			    if(sec<10) {
			    	sec="0"+sec;
			    }
			    if(min<10) {
			    	min="0"+min;
			    }
			    if(hour<10) {
			    	hour="0"+hour;
			    }
			    
			    var day=d.getDay();  
			    
			    document.getElementById("clock1").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
			    document.getElementById("clock2").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
			});
		</script>
</head>
<body style="text-align:left;">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="background-color: white;">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align:left;">
			<span class="ui-jqgrid-title"
				style="font-size: 15px;">&nbsp;&nbsp;日业绩累计比较图表</span>
		</div>
		<chart:chartTag chartResult="${chartResult1 }"/>
		<div class="ui-state-default ui-jqgrid-hdiv" style="background: white;">
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
				<tr><td colspan="33" class="ui-state-default ui-th-ltr zc_grid_head"><strong>金额(单位K)</strong></td></tr>
				<tr>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;日期&nbsp;<br>&nbsp;月份&nbsp;</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>1</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>2</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>3</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>4</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>5</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>6</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>7</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>8</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>9</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>10</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>11</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>12</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>13</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>14</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>15</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>16</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>17</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>18</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>19</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>20</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>21</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>22</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>23</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>24</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>25</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>26</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>27</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>28</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>29</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>30</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>31</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>总计</strong></th>
				</tr>
				<c:forEach items="${resultList}" var="item">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;font-size: 10px;">${fn:substring(item.PAY_DATE_1, 0, 7)}</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px;"><c:if test="${item.DISPLAY_1 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_1 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px;"><c:if test="${item.DISPLAY_2 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_2 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_3 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_3 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_4 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_4 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_5 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_5 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_6 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_6 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_7 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_7 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_8 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_8 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_9 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_9 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_10 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_10 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_11 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_11 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_12 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_12 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_13 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_13 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_14 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_14 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_15 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_15 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_16 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_16 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_17 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_17 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_18 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_18 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_19 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_19 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_20 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_20 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_21 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_21 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_22 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_22 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_23 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_23 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_24 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_24 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_25 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_25 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_26 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_26 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_27 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_27 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_28 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_28 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_29 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_29 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_30 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_30 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;font-size: 10px"><c:if test="${item.DISPLAY_31 eq 'Y'}"><fmt:formatNumber value="${item.PAY_MONEY_31 }" type="currency" pattern="#,##0"/></c:if></td>
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;font-weight:normal;font-size: 10px">
							<fmt:formatNumber value="${item.PAY_TOTAL }" type="currency" pattern="#,##0"/>
						</td>
					</tr>						
				</c:forEach>
			</table>
			<span id="clock1" style="font-weight: normal;color: black;"></span>
		</div>
		<br><br>
		<font color="#FF0000">*</font>日业绩累计比较表不含企金委贷
		<br><br><br>
		<div>
		<chart:chartTag chartResult="${chartResult2 }"/>
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
				<tr><td colspan="33" class="ui-state-default ui-th-ltr zc_grid_head"><strong>件数</strong></td></tr>
				<tr>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;日期&nbsp;<br>&nbsp;月份&nbsp;</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>1</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>2</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>3</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>4</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>5</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>6</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>7</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>8</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>9</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>10</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>11</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>12</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>13</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>14</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>15</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>16</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>17</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>18</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>19</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>20</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>21</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>22</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>23</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>24</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>25</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>26</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>27</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>28</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>29</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>30</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>31</strong></th>
					<th style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>总计</strong></th>
				</tr>
				<c:forEach items="${resultList}" var="item">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${fn:substring(item.PAY_DATE_1, 0, 7)}</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_1 eq 'Y'}">${item.PAY_COUNT_1 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_2 eq 'Y'}">${item.PAY_COUNT_2 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_3 eq 'Y'}">${item.PAY_COUNT_3 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_4 eq 'Y'}">${item.PAY_COUNT_4 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_5 eq 'Y'}">${item.PAY_COUNT_5 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_6 eq 'Y'}">${item.PAY_COUNT_6 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_7 eq 'Y'}">${item.PAY_COUNT_7 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_8 eq 'Y'}">${item.PAY_COUNT_8 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_9 eq 'Y'}">${item.PAY_COUNT_9 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_10 eq 'Y'}">${item.PAY_COUNT_10 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_11 eq 'Y'}">${item.PAY_COUNT_11 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_12 eq 'Y'}">${item.PAY_COUNT_12 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_13 eq 'Y'}">${item.PAY_COUNT_13 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_14 eq 'Y'}">${item.PAY_COUNT_14 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_15 eq 'Y'}">${item.PAY_COUNT_15 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_16 eq 'Y'}">${item.PAY_COUNT_16 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_17 eq 'Y'}">${item.PAY_COUNT_17 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_18 eq 'Y'}">${item.PAY_COUNT_18 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_19 eq 'Y'}">${item.PAY_COUNT_19 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_20 eq 'Y'}">${item.PAY_COUNT_20 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_21 eq 'Y'}">${item.PAY_COUNT_21 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_22 eq 'Y'}">${item.PAY_COUNT_22 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_23 eq 'Y'}">${item.PAY_COUNT_23 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_24 eq 'Y'}">${item.PAY_COUNT_24 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_25 eq 'Y'}">${item.PAY_COUNT_25 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_26 eq 'Y'}">${item.PAY_COUNT_26 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_27 eq 'Y'}">${item.PAY_COUNT_27 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_28 eq 'Y'}">${item.PAY_COUNT_28 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_29 eq 'Y'}">${item.PAY_COUNT_29 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_30 eq 'Y'}">${item.PAY_COUNT_30 }</c:if></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;font-weight:normal;"><c:if test="${item.DISPLAY_31 eq 'Y'}">${item.PAY_COUNT_31 }</c:if></td>
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;font-weight:normal;"><c:if test="${item.LAST_DAY ==28 }"><fmt:formatNumber value="${item.PAY_COUNT_28 }" type="currency" pattern="#,##0"/></c:if><c:if test="${item.LAST_DAY ==29 }"><fmt:formatNumber value="${item.PAY_COUNT_29 }" type="currency" pattern="#,##0"/></c:if><c:if test="${item.LAST_DAY ==30 }"><fmt:formatNumber value="${item.PAY_COUNT_30 }" type="currency" pattern="#,##0"/></c:if><c:if test="${item.LAST_DAY ==31 }"><fmt:formatNumber value="${item.PAY_COUNT_31 }" type="currency" pattern="#,##0"/></c:if></td>
					</tr>						
				</c:forEach>
			</table>
		</div>
		<span id="clock2"></span>
		</div>
		<br><br>
		<font color="#FF0000">*</font>日业绩累计比较表不含企金委贷
		<br>
		<font color="red">*</font>周期按照自然月
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-2</p>
</body>
</html>