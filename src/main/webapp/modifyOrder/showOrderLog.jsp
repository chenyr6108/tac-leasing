<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
 <script type="text/javascript">
 
 
 		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	  <script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>	
	 <script type="text/javascript">
	 function showOrderList(){
		 location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.queryModifyOrderList";
	 }
	 
 </script>
</head>
<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="modifyOrderCommand.showOrderLog" />  
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;日志</span>
			</div>
			<div><input type="button" value="返回更改单列表" onclick="showOrderList();" style="height: 30px"/></div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
			<tr>
					<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
			</tr>
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									承租人名称
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									操作人
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									内容
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									工时(小时)
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									时间
								</th>
								
								
							</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count}<input type="hidden"  name="MODIFY_ID" value="${item.MODIFY_ID}" /></td>	
								<td style="text-align: center;">${item.CUST_NAME }</td>	
								<td style="text-align: center;">${item.ALTER_NAME}</td>
								<td style="text-align: center;"><c:if test="${item.ORDER_TYPE_LOG eq 0}"><c:if test="${item.ORDER_STATUS_LOG eq 0}">提交</c:if><c:if test="${item.ORDER_STATUS_LOG eq 1}">通过</c:if><c:if test="${item.ORDER_STATUS_LOG eq 2}">驳回</c:if></c:if><c:if test="${item.ORDER_TYPE_LOG eq 1}"><c:if test="${item.ORDER_STATUS_LOG eq 0}">处理</c:if><c:if test="${item.ORDER_STATUS_LOG eq 1}">处理审核</c:if><c:if test="${item.ORDER_STATUS_LOG eq 2}">处理驳回</c:if></c:if><c:if test="${item.ORDER_TYPE_LOG eq 2}"><c:if test="${item.ORDER_STATUS_LOG eq 0}">验收</c:if><c:if test="${item.ORDER_STATUS_LOG eq 1}">验收通过</c:if><c:if test="${item.ORDER_STATUS_LOG eq 2}">验收驳回</c:if></c:if><c:if test="${item.ORDER_TYPE_LOG eq 3}">转移</c:if><c:if test="${item.ORDER_TYPE_LOG eq 4}">修改</c:if><c:if test="${item.ORDER_TYPE_LOG eq 5}">撤案</c:if><c:if test="${item.ORDER_TYPE_LOG eq 6}">退回</c:if></td>
								<td style="text-align: center;">${item.REMARK_LOG}&nbsp;</td>	
								<td style="text-align: center;">${item.WORK_HOURS}&nbsp;</td>	
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" type="both" value="${item.CREATE_TIME}" />&nbsp;</td>	
								
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