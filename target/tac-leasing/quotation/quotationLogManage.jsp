<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>报价单管理</title>
	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	
	</script>	
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="quotation.queryQuotationExportLog" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报价单日志查询</span>
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
				          <td colspan="5">查询内容：</td>
				          <td>
				          <input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;"></td>
				          <td>
				          </td>
				          <td>
				         <a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a>
					</td>
					<td>
					
					</td>
					<td>

					</td>
					<td>
					
					</td>
					<td>

					</td>
					<td>
					
					</td>
					<td>

					</td>
				          </tr>
				          <tr>
				          <td></td>
				          <td colspan="5">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"></td>
				      </tr>
				    </table>
	          		</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td>
								&nbsp;
							</td>
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										内容
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										创建时间
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.MEMO }&nbsp;</td>
										<td style="text-align: center;">&nbsp;${item.CREATE_TIME }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>