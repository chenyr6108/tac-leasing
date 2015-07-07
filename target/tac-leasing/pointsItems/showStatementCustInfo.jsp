<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/statement/js/showcust.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title>对账单管理--客户管理</title>
	</head>
	<body>
		<div id="tabs">
		<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" id="__action" value="statement.queryDecomposeCustInfo" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;对账单管理--客户信息</span>
		   	</div>
				<br>	    
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="60%" class="ss_t" valign="center" >
				         <table width="95%" border="0" cellspacing="0" cellpadding="0" class="ss_wenzi"style="margin-left: 10px;">
				          <tr>
				            <td width="20%">关键字:</td>
				            <td width="80%"><input type="text" value="${QSEARCH_VALUE}" name="QSEARCH_VALUE" id="QSEARCH_VALUE" style="width:400px; height:18px;" onkeypress="if (event.keyCode == 13) { searchcust() }">            </td>
				          </tr>
				         </table>
				        </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="javaScript:void(0)" onclick="searchcust();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    <br>
				<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body ">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr >
									<td><%@ include file="/common/pageControlTop.jsp"%></td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr class="ui-jqgrid-labels">
									<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
										序号
									</th>
									<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>支付表号</strong>
									</th>
									<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>承租人</strong>
									</th>
									<th width="7.5%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>版本号</strong>
									</th>
									<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>客户经理</strong>
									</th>
									<th width="7.5%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>办事处主管</strong>
									</th>
									<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>承租人地址</strong>
									</th>
									<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>操作</strong>
									</th>
								</tr>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
									<tr	class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }&nbsp;</td>
										<td style="text-align: center;">${item.RECP_CODE}&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.VERSION_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.SENSORNAME }&nbsp;</td>
										<td style="text-align: center;">${item.CLERKNAME }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_ADDRESS }&nbsp;</td>
										<td style="text-align: center;"><a href="../servlet/defaultDispatcher?__action=statement.queryCustStatementInfo&recp_id=${item.RECP_ID }&cust_name=${item.CUST_NAME }">查看</a>&nbsp;</td>
									</tr>
								</c:forEach>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr >
									<td><%@ include file="/common/pageControl.jsp"%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
		</form>
		</div>
	</body>
</html>