<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function doQuery() {
		$("#form").submit();
	}
	

</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资讯统计表</title>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post" name="form"
		id="form">
		<input type="hidden" name="__action" value="information.query">

		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资讯统计表(单位:件)</span>
		</div>

		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;年份： <select id="YEAR" name="YEAR"
									style="width: 70px">
										<c:forEach items="${yearList}" var="year" varStatus="status">
											<option value="${year}"
												<c:if test="${year eq YEAR}">selected='selected'</c:if>>${year}</option>
										</c:forEach>
								</select>&nbsp;&nbsp;&nbsp;资讯类型: <select id="TYPE" name="TYPE">
								        <option value="" 
								        <c:if test="${TYPE==2}">selected='selected'</c:if>>全部</option>
										<option value="0"
											<c:if test="${TYPE==0}">selected='selected'</c:if>>内部申请</option>
										<option value="1"
											<c:if test="${TYPE==1}">selected='selected'</c:if>>普通申请</option>
								</select>
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			<br> <br> <br>
			<div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white">
				<table cellspacing="0" cellpadding="0" border="0" class="grid_table"
					style="width: 1900px;">
					<tr>
						<th style="width: 2%;" rowspan="2"><strong>序号</strong></th>
						<th style="width: 4%;" rowspan="2"><strong>姓名</strong></th>
						<th colspan="2" style="width: 6%">1月</th>
						<th colspan="2" style="width: 6%">2月</th>
						<th colspan="2" style="width: 6%">3月</th>
						<th colspan="2" style="width: 6%">4月</th>
						<th colspan="2" style="width: 6%">5月</th>
						<th colspan="2" style="width: 6%">6月</th>
						<th colspan="2" style="width: 6%">7月</th>
						<th colspan="2" style="width: 6%">8月</th>
						<th colspan="2" style="width: 6%">9月</th>
						<th colspan="2" style="width: 6%">10月</th>
						<th colspan="2" style="width: 6%">11月</th>
						<th colspan="2" style="width: 6%">12月</th>
						<th colspan="3" style="width: 12%">小计</th>
					</tr>

					<tr class="ui-state-default zc_grid_head">
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配数</th>
						<th style="text-align: center;">完成数</th>
						<th style="text-align: center;">分配总数</th>
						<th style="text-align: center;">完成总数</th>
						<th style="text-align: center;">完成率</th>
					</tr>

					<c:forEach items="${DataList}" var="item" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${item.name}</td>
							<td style="text-align: right;">${item.preForJan}</td>
							<td style="text-align: right;">${item.fisForJan}</td>
							<td style="text-align: right;">${item.preForFeb}</td>
							<td style="text-align: right;">${item.fisForFeb}</td>
							<td style="text-align: right;">${item.preForMar}</td>
							<td style="text-align: right;">${item.fisForMar}</td>
							<td style="text-align: right;">${item.preForApi}</td>
							<td style="text-align: right;">${item.fisForApi}</td>
							<td style="text-align: right;">${item.preForMay}</td>
							<td style="text-align: right;">${item.fisForMay}</td>
							<td style="text-align: right;">${item.preForJun}</td>
							<td style="text-align: right;">${item.fisForJun}</td>
							<td style="text-align: right;">${item.preForJul}</td>
							<td style="text-align: right;">${item.fisForJul}</td>
							<td style="text-align: right;">${item.preForAus}</td>
							<td style="text-align: right;">${item.fisForAus}</td>
							<td style="text-align: right;">${item.preForSep}</td>
							<td style="text-align: right;">${item.fisForSep}</td>
							<td style="text-align: right;">${item.preForOct}</td>
							<td style="text-align: right;">${item.fisForOct}</td>
							<td style="text-align: right;">${item.preForNov}</td>
							<td style="text-align: right;">${item.fisForNov}</td>
							<td style="text-align: right;">${item.preForDec}</td>
							<td style="text-align: right;">${item.fisForDec}</td>
							<td style="text-align: right;">${item.preTotal}</td>
							<td style="text-align: right;">${item.fisTotal}</td>
							<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.finishForScale}"/>%</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</form>
	<br><br>
	<div>
	  <span style="color:red">*</span>&nbsp;${backDate}之数据
	</div>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-34</p>
</body>
</html>