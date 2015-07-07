<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	$(function() {
		$("#searchDate").datepicker($.datepicker.regional['zh-CN']);
	});

	function doQuery() {
		$("#form").submit();
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>预估付款表</title>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="estimatePay.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;预估拨款表</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="50%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;&nbsp; 时间:<input type="text"
									id="searchDate" readonly="readonly" name="searchDate"
									value="${searchTime}"> &nbsp;&nbsp;区间:&nbsp;未来<select
									name="DISPLAY">
										<option value="1"
											<c:if test="${display==1}">selected='selected'</c:if>>1</option>
										<option value="2"
											<c:if test="${display==2}">selected='selected'</c:if>>2</option>
										<option value="3"
											<c:if test="${display==3}">selected='selected'</c:if>>3</option>
										<option value="4"
											<c:if test="${display==4}">selected='selected'</c:if>>4</option>
										<option value="5"
											<c:if test="${display==5}">selected='selected'</c:if>>5</option>
										<option value="6"
											<c:if test="${display==6}">selected='selected'</c:if>>6</option>
										<option value="7"
											<c:if test="${display==7}">selected='selected'</c:if>>7</option>
										<option value="8"
											<c:if test="${display==8}">selected='selected'</c:if>>8</option>
										<option value="9"
											<c:if test="${display==9}">selected='selected'</c:if>>9</option>
										<option value="10"
											<c:if test="${display==10}">selected='selected'</c:if>>10</option>
										<option value="11"
											<c:if test="${display==11}">selected='selected'</c:if>>11</option>
										<option value="12"
											<c:if test="${display==12}">selected='selected'</c:if>>12</option>
										<option value="13"
											<c:if test="${display==13}">selected='selected'</c:if>>13</option>
										<option value="14"
											<c:if test="${display==14}">selected='selected'</c:if>>14</option>
										<option value="15"
											<c:if test="${display==15}">selected='selected'</c:if>>15</option>
										<option value="16"
											<c:if test="${display==16}">selected='selected'</c:if>>16</option>
										<option value="17"
											<c:if test="${display==17}">selected='selected'</c:if>>17</option>
										<option value="18"
											<c:if test="${display==18}">selected='selected'</c:if>>18</option>
										<option value="19"
											<c:if test="${display==19}">selected='selected'</c:if>>19</option>
										<option value="20"
											<c:if test="${display==20}">selected='selected'</c:if>>20</option>
										<option value="21"
											<c:if test="${display==21}">selected='selected'</c:if>>21</option>
										<option value="22"
											<c:if test="${display==22}">selected='selected'</c:if>>22</option>
										<option value="23"
											<c:if test="${display==23}">selected='selected'</c:if>>23</option>
										<option value="24"
											<c:if test="${display==24}">selected='selected'</c:if>>24</option>
										<option value="25"
											<c:if test="${display==25}">selected='selected'</c:if>>25</option>
										<option value="26"
											<c:if test="${display==26}">selected='selected'</c:if>>26</option>
										<option value="27"
											<c:if test="${display==27}">selected='selected'</c:if>>27</option>
										<option value="28"
											<c:if test="${display==28}">selected='selected'</c:if>>28</option>
										<option value="29"
											<c:if test="${display==29}">selected='selected'</c:if>>29</option>
										<option value="30"
											<c:if test="${display==30}">selected='selected'</c:if>>30</option>
								</select>天
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="30%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">查 询</a></td>
				</tr>
			</table>
			<br> <br> <br>


			<div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white">
				<table cellspacing="0" cellpadding="0" border="0" class="grid_table"
					style="width: 100%">
					<tr>
						<th style="width: 0.6%;" rowspan="2"><strong>序号</strong></th>
						<th style="width: 1.4%;" rowspan="2"><strong>办事处</strong></th>
						<c:forEach items="${workDayList}" var="item">
							<th colspan="2" style="width: 1.65%">${item}</th>
						</c:forEach>
					</tr>

					<c:if test="${display==1}">
						<tr class="ui-state-default zc_grid_head">
							<th style="text-align: center;">拨款件数</th>
							<th style="text-align: center;">金额</th>
						</tr>
					</c:if>

					<c:if test="${display==2}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==3}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==4}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==5}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==6}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==7}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==8}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==9}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==10}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==11}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==12}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==13}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==14}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==15}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==16}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==17}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==18}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==19}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==20}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==21}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==22}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==23}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==24}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==25}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==26}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==27}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==28}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==29}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<c:if test="${display==30}">
						<tr class="ui-state-default zc_grid_head">
							<c:forEach
								items="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30}">
								<th style="text-align: center;">拨款件数</th>
								<th style="text-align: center;">金额</th>
							</c:forEach>
						</tr>
					</c:if>

					<%--显示 输出符合条件的数据 --%>
					<c:if test="${display==1}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==2}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==3}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==4}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>


					<c:if test="${display==5}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==6}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==7}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==8}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==9}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==10}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==11}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==12}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==13}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==14}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==15}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==16}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==17}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==18}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==19}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==20}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==21}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==22}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==23}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==24}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==25}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==26}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D25 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S25}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==27}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D25 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S25}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D26 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S26}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==28}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D25 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S25}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D26 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S26}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D27 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S27}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==29}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D25 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S25}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D26 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S26}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D27 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S27}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D28 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S28}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${display==30}">
						<c:forEach items="${dataList}" var="item" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>${item.DECP_NAME_CN}</td>
								<td style="text-align: right;">${item.D0 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S0}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D1 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S1}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D2 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S2}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D3 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S3}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D4 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S4}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D5 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S5}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D6 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S6}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D7 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S7}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D8 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S8}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D9 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S9}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D10 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S10}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D11 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S11}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D12 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S12}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D13 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S13}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D14 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S14}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D15 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S15}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D16 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S16}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D17 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S17}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D18 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S18}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D19 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S19}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D20 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S20}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D21 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S21}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D22 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S22}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D23 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S23}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D24 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S24}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D25 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S25}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D26 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S26}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D27 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S27}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D28 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S28}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;">${item.D29 }</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${item.S29}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</c:if>


					<tr class="ui-state-default zc_grid_head">
						<th colspan="2">小计</th>

						<c:if test="${display==1}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==2}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==3}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==4}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==5}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==6}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>


						<c:if test="${display==7}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==8}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==9}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==10}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==11}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>


						<c:if test="${display==12}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==13}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==14}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>


						<c:if test="${display==15}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==16}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==17}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==18}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==19}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==20}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==21}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==22}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==23}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==24}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==25}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==26}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP25}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP25}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==27}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP25}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP25}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP26}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP26}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==28}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP25}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP25}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP26}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP26}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP27}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP27}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==29}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP25}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP25}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP26}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP26}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP27}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP27}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP28}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP28}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>

						<c:if test="${display==30}">
							<c:forEach items="${total}" var="item">
								<th style="text-align: right;">${item.NOP0}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP0}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP1}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP1}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP2}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP2}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP3}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP3}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP4}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP4}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP5}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP5}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP6}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP6}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP7}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP7}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP8}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP8}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP9}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP9}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP10}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP10}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP11}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP11}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP12}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP12}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP13}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP13}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP14}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP14}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP15}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP15}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP16}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP16}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP17}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP17}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP18}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP18}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP19}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP19}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP20}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP20}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP21}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP21}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP22}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP22}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP23}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP23}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP24}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP24}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP25}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP25}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP26}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP26}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP27}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP27}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP28}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP28}" type="currency"></fmt:formatNumber></th>
								<th style="text-align: right;">${item.NOP29}</th>
								<th style="text-align: right;"><fmt:formatNumber
										value="${item.SOP29}" type="currency"></fmt:formatNumber></th>
							</c:forEach>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</form>
					<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-32</p>
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
	    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
	});
</script>
</body>
</html>