<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
		$("#toDate").datepicker($.datepicker.regional['zh-CN']);
	});
</script>
</head>
<body>
	<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="invoiceManagementCommand.queryLog"/>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	 	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出开票资料日志</span>
	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
			<div>
				<table style="width: 40%" border="0" cellspacing="0" cellpadding="0">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          	<tr>
				          	  	<td style="text-align: right;">查询内容：</td>
			         			<td><input id="content" name="content" value="${content }" style="width: 168px;"></td>
				          	</tr>
				          	<tr>
			         			<td style="text-align: right;">导出日期：</td>
			         			<td>
			         				<input readonly="readonly" name="fromDate" id="fromDate" value="${fromDate }" style="width: 78px">至<input readonly="readonly" name="toDate" id="toDate" value="${toDate }" style="width: 78px">
			         			</td>
			         		</tr>
				          </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
			</div>
			<br>
			<div class="ui-state-default ui-jqgrid-hdiv">
			<table class="panel_table">
				<tr>
					<td>
						<page:pagingToolbarTop pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th style="text-align:center;">序号</th>
					<th style="text-align:center;">导出开票资料类型</th>
					<th style="text-align:center;">导出开票资料条件</th>
					<th style="text-align:center;">导出开票资料行数</th>
					<th style="text-align:center;">导出开票资料时间</th>
					<th style="text-align:center;">导出开票资料操作人</th>
				</tr>
			<c:forEach items="${dw.resultList}" var="item" varStatus="index">
				<tr>
					<td style="text-align:center;">${index.count }&nbsp;</td>
					<td style="text-align:center;">${item.LOG_TITLE }&nbsp;</td>
					<td style="text-align:center;">${item.LOG_CONTENT }&nbsp;</td>
					<td style="text-align:right;">${item.EXPORT_FILE_SIZE }&nbsp;</td>
					<td style="text-align:center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
					<td style="text-align:center;">${item.NAME }&nbsp;</td>
				</tr>
			</c:forEach>
		    </table>
		    <table class="panel_table">
				<tr>
					<td style="border:0px;color:red;">
						*导出开票资料的条件是指用户导出开票资料时候在页面上选择的过滤条件<br>
						*其中开票情况与租金缴款是系统自动选择的过滤条件
					</td>
					<td>
						<page:pagingToolbar pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
		  </div>
		</div>
		</div>
	</form>
</body>