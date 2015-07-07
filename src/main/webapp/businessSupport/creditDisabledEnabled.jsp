<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
		function doQuery() {
			$("#form").submit();
		}	
</script>
</head>
<body style="text-align:center;">
	<form id="form" method="post">
	<input type="hidden" name="__action" id="__action"
			value="creditDisabledEnabledCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;报告废除</span>
			</div>
		<div>
			<table width="97%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="60%" class="ss_t">
						<table style="margin-left:10px;">
							<tr>
								<td>客户名称：</td>
								<td colspan="5"><input type="text" name="CUST_NAME"
									value="${CUST_NAME }"
									style="width:160px; height:18px; font-size:12px;"></td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
		</div>
		<br><br><br>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<%@ include file="/common/pageTagTop.jsp"%>
				<table cellspacing="0" cellpadding="0" border="0" style="width:1202px;">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:60px;"><strong>状态</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>资信类型</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:200px;"><strong>客户编号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:200px;"><strong>客户名称</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>区域</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>办事处主管</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>客户经理</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>生成时间</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>操作</strong></td>
					</tr>
					<c:forEach items="${resultList}" var="item">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><c:if test="${item.state eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if><c:if test="${item.state eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.type }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.custCode }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.custName }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.province }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.supervisorName }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.userName }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.createDate }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><c:if test="${item.status eq 0}"><c:choose><c:when test="${item.state eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.invCredit&credit_id=${item.creditId }'">作废</a></c:when><c:otherwise><font color="#c0c0c0">作废</font></c:otherwise></c:choose></c:if><c:if test="${item.status eq -1}"><c:choose><c:when test="${item.state eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.enaCredit&credit_id=${item.creditId }'">启用</a></c:when><c:otherwise><font color="#c0c0c0">启用</font></c:otherwise></c:choose></c:if></td>
						</tr>						
					</c:forEach>
				</table>
				<%@ include file="/common/pageTagBottom.jsp"%>
				<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							提交主管
							<img src="${ctx }/images/u614.gif">
							主管驳回
							<img src="${ctx }/images/u622.gif">
							主管通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			</div>
	</form>
</body>
</html>