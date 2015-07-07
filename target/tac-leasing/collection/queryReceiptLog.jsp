<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>本金收据打印记录</title>
 <script type="text/javascript">
 
 
 		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	  <script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>	
	 <script type="text/javascript">
	 $(function (){
			$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
			$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
			$("#JQSTART_DATE").datepicker($.datepicker.regional["zh-CN"]);
			$("#JQEND_DATE").datepicker($.datepicker.regional["zh-CN"]);
		});
	 
 		function viewReceipt(){
 			location.href="../servlet/defaultDispatcher?__action=rentReceipt.queryRentReceiptList";
 		}
 </script>
</head>
<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="rentReceipt.viewLog" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;本金收据打印记录</span>
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
				        	  <td>起始日期：</td>
				              <td> <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }"> </td>
				              <td>结束日期：</td>
				              <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }"></td>
				     	 </tr>
				          <tr>
					          <td>查询内容：</td>
					          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
					          style=" width:395px;height:18px; font-size: 12px;">
					          </td>
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
					<td>
						<input type="button" class="ui-state-default ui-corner-all" id="But" value="返回打印列表" name="Log" onclick="javascript:history.go(-1);">
					</td>
					<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
			</tr>
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									合同编号
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									还款期数
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									收据金额
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									本金收据编号
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									打印日期
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									打印人员
								</th>
							</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.CUSTNAME }</td>	
								<td style="text-align: center;">${item.LEASECODE }</td>	
								<td style="text-align: center;">${item.RECDPERIOD }</td>
								<td style="text-align: center;">${item.REALOWNPRICE }</td>	
								<td style="text-align: center;">${item.PRINCIPALRUNCODE }&nbsp;</td>
								<%-- <td style="text-align: center;">${item.ORIPRINCIPALRUNCODE}&nbsp;</td>	 --%>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.LOGCREATEDATE }" />&nbsp;</td>	
								<td style="text-align: center;">${item.PRINTUSERNAME}&nbsp;</td>
							</tr>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td align="right" colspan="10"><page:pagingToolbar pagingInfo="${dw }"/></td>
						</tr>
					</table>
					<!--  备注弹出层  结束  -->
				</div>
				</div>
			</div>
		</div>		
		</form>
</body>
</html>