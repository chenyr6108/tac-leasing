<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已核未拨与缓拨图</title>

<script type="text/javascript">
	function doSearch() {
		$("#form1").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post" name="form1"
		id="form1">
		<input type="hidden" name="__action" id="__action"
			value="report.exportChart">

		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;已核未拨与缓拨图</span>
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
								<td colspan="5"><%@ include
										file="../report/chartWithCondition.jsp"%>
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" id="search" onclick="doSearch();"
						class="blue_button">搜 索</a></td>
				</tr>
			</table>
			<br> <br> <br>

			<div class="ui-jqgrid-hdiv" style="background-color: white">
				<br> <font color="red">*</font>按周生成图表X轴取日期范围内每周周5的数据<br> <font
					color="red">*</font>按月生成图表X轴取日期范围内每月最后一天的数据<br>
				<table class="grid_table" style="width:50%">
					<tr></tr>
					<tr>
						<th colspan="${size+1}" style="text-align: left"><chart:chartTag
								chartResult="${chartResult1 }" /></th>
					</tr>
					<tr>
						<th></th>
						<c:forEach items="${result}" var="item">
							<th>${item.backDate}</th>
						</c:forEach>
					</tr>
					<tr>
						<td>未拨件数</td>
						<c:forEach items="${result}" var="item">
							<td style="text-align: right">${item.unAllotCount }</td>
						</c:forEach>
					</tr>
					<tr>
						<td>缓拨件数</td>
						<c:forEach items="${result}" var="item">
							<td style="text-align: right">${item.delayAllotCount}</td>
						</c:forEach>
					</tr>
					<tr>
						<td colspan="${size+1}" style="text-align: left;"><font color="red">*</font>
							${backDate}&nbsp;20:00之数据</td>
					</tr>
				</table>
				<br>
				<br>
				<br>
				<br>


				<table class="grid_table" style="width: 50%">
					<tr></tr>
					<tr>
						<th colspan="${size+1}" style="text-align: left"><chart:chartTag
								chartResult="${chartResult2 }" /></th>
					</tr>
					<tr>
						<th></th>
						<c:forEach items="${result}" var="item">
							<th>${item.backDate}</th>
						</c:forEach>
					</tr>
					<tr>
						<td>未拨金额</td>
						<c:forEach items="${result}" var="item">
							<td style="text-align: right">${item.unAllotPayWithDisplay }</td>
						</c:forEach>
					</tr>
					<tr>
						<td>缓拨金额</td>
						<c:forEach items="${result}" var="item">
							<td style="text-align: right">${item.delayAllotPayWithDisplay }</td>
						</c:forEach>
					</tr>
					<tr>
						<td colspan="${size+1}" style="text-align: left;"><font color="red">*</font>
							${backDate}&nbsp;20:00之数据</td>
					</tr>
				</table>
			</div>

		</div>
	</form>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-31</p>
</body>
</html>