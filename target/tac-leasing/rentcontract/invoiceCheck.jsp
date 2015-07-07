<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/rentcontract/js/invoiceCheck.js"></script>
		<title>开票协议书管理</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" value="" id="__action">
			<input type="hidden" name="RECT_ID" value="${RECT_ID}" id="RECT_ID">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;开票协议书－支付表选择</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" width="25%">合同编号：</td>
						<td style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</td>
						<td style="text-align: center;" width="25%">客户名称：</td>
						<td style="text-align: center;" width="25%">${infor.CUST_NAME}&nbsp;</td>					
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" width="25%">所属公司：</td>
						<td style="text-align: center;" width="25%">${comInfor.DECP_NAME_CN}&nbsp;</td>				
						<td style="text-align: center;" width="25%"></td>				
						<td style="text-align: center;" width="25%"></td>				
					</tr>					
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							<INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');">
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							支付表编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							版本号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							起租日期
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							创建日期
						</th>						
					</tr>
					<tbody>
						<c:forEach items="${invoiceCheck}" var="invoice" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${invoice.RECP_ID}" onclick="checkItem(this,'all')"></td>
								<td style="text-align: center;">${invoice.RECP_CODE}&nbsp;</td>
								<td style="text-align: center;">${invoice.VERSION_CODE }&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${invoice.START_DATE}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${invoice.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="ui-jqgrid-labels">
							<td style="text-align: center;" align="right" colspan="5">
								<input type="button" class="ui-state-default ui-corner-all" id="addOrUpdate" value="确定" name="sub" onclick="create();">
							</td>							
						</tr>								
					</tfoot>					
				</table>
				</div>
				</div>
			</div>				
		</form> 	
	</body>
</html>