<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>资产催收</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="dunTask.selectLatestPayDetail" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;资产催收</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>预期到期天数&nbsp;</td>
				          <td colspan="5"><input type="text"  name="startrange" id="startrange" style="width:40px; height:18px;" value="${empty startrange?3:startrange }">~
				          <input type="text"  name="endrange" id="endrange" style="width:40px; height:18px;" value="${empty endrange?3:endrange}">
				          <font color="red">最大预期到期天数为10天</font>
				          </td>
				          </tr>
				          <tr>
				          <td colspan="6"><input type="text" name="content" value="${content }" style=" width:240px;height:18px; font-size: 12px;">&nbsp;</td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
						<td>&nbsp;</td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${dw}">区域办事处</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										办事处主管
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="PAY_DATE" pagingInfo="${dw}">租金支付日</page:pagingSort>
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LATEST_DAY" pagingInfo="${dw}">租金预期到期天数</page:pagingSort>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.UPPER_NAME }</td>
										<td style="text-align: center;">${item.USER_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
										<td style="text-align: center;">${item.LATEST_DAY }&nbsp;</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
			
		</form>

	</body>
</html>