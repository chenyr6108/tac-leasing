<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>保证金、押金冲回</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function doPledgeRedBack(FICB_ITEM,RECP_ID) { 
				if(confirm('确认冲回？')){
					$.post('../servlet/defaultDispatcher',
							{__action : 'decompose.doPledgeRedBack',FICB_ITEM : FICB_ITEM,RECP_ID:RECP_ID},
						function (dataBack){
							alert(dataBack.returnStr);
							location.href='${ctx }/servlet/defaultDispatcher?__action=decompose.pledgeRedBack';
					}, 'json');
				}else{
					return false;
				}
			}
			function confirmPledgeRedBack(FICB_ITEM,RECP_ID) { 
				if(confirm('确认冲回？')){
					$.post('../servlet/defaultDispatcher',
							{__action : 'decompose.confirmPledgeRedBack',FICB_ITEM : FICB_ITEM,RECP_ID:RECP_ID},
						function (dataBack){
							alert(dataBack.returnStr);
							location.href='${ctx }/servlet/defaultDispatcher?__action=decompose.pledgeRedBack';
					}, 'json');
				}else{
					return false;
				}
			}
		</script>
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="decompose.pledgeRedBack" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保证金、押金冲回</span>
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
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:28px; font-size: 12px;">
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
						<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>客户名称</strong>
									</th>
									<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>合同号</strong>
									</th>
									<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>分解项目</strong>
									</th>
									<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>金额</strong>
									</th>
									<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
										<strong>操作</strong>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.FICB_ITEM }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatNumber value="${item.REAL_PRICE }" type="currency" />&nbsp;</td>
										<td style="text-align: center;">
										<c:if test="${empty item.RETURN_FLAG }"> 
											<a href="javascript:void(0);" onclick="doPledgeRedBack('${item.FICB_ITEM }','${item.RECP_ID}');">冲回申请</a>
										</c:if>
										<c:if test="${not empty item.RETURN_FLAG }"> 
											<a href="javascript:void(0);" onclick="confirmPledgeRedBack('${item.FICB_ITEM }','${item.RECP_ID}');">冲回确认</a>
										</c:if>
										&nbsp;</td>
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