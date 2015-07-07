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
	<input type="hidden" id="__action" name="__action" value="invoiceManagementCommand.queryUploadLog"/>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	 	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;上传开票资料日志</span>
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
			         			<td style="text-align: right;">上传日期：</td>
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
					<th style="text-align:center;">合同号</th>
					<th style="text-align:center;">期数</th>
					<th style="text-align:center;">发票号码</th>
					<th style="text-align:center;">类型</th>
					<th style="text-align:center;">上传来源</th>
					<th style="text-align:center;">上传时间</th>
					<th style="text-align:center;">上传人</th>
				</tr>
			<c:forEach items="${dw.resultList}" var="item" varStatus="index">
				<tr>
					<td style="text-align:center;">${index.count }&nbsp;</td>
					<td style="text-align:center;">${item.LEASE_CODE }&nbsp;</td>
					<td style="text-align:center;">${item.PERIOD_NUM }&nbsp;</td>
					<td style="text-align:center;">${item.INVOICE_NUM }&nbsp;</td>
					<td style="text-align:center;">
						<c:if test="${item.PRICE_TYPE eq 'INTEREST' }">利息</c:if>
						<c:if test="${item.PRICE_TYPE eq 'CAPITAL' }">本金</c:if>
						<c:if test="${item.PRICE_TYPE eq 'DEPOSIT' }">保证金</c:if>
					&nbsp;</td>
					<td style="text-align:center;">
						<c:if test="${item.CASE_TYPE eq 'NORMAL' }">普通开票上传</c:if>
						<c:if test="${item.CASE_TYPE eq 'SPECIFIC' }">红冲或者作废开票上传</c:if>
					&nbsp;</td>
					<td style="text-align:center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
					<td style="text-align:center;">${item.NAME }&nbsp;</td>
				</tr>
			</c:forEach>
		    </table>
		    <table class="panel_table">
				<tr>
					<td style="border:0px;color:red;">
						*开票模组分为【正常开票】,【红冲,作废开票】2大块功能<br>
						*普通开票上传是指正常开票的回传资料<br>
						*红冲或者作废开票上传是指红冲或作废开票的回传资料
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