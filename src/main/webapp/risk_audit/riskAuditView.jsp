<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
	</head>	
	<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;尽职调查报告</span>
   	</div>
   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">		
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >				
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;" width="608"><strong>审核意见</strong></td>
						<td style="background-color: #e8e8e8;" width="120"><strong>审核人</strong></td>
						<td style="background-color: #e8e8e8;" width="50"><strong>时间</strong></td>
					</tr>							
					<c:forEach items="${memoList}" var="item" varStatus="status" >														
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="width: 50px;"><strong>${status.count}</strong></td>
							<td width="59" align="center">${item.MEMO}</td>
							<td width="121" align="center">${item.NAME}</td>
							<td width="50" align="center"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
						</tr>	
					</c:forEach>			
			</table>
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >				
				<c:forEach items="${riskList}" var="riskList" >
					<tr>编号：${riskList.PRC_HAO }</tr>	
					<tr><c:forEach items="${riskList.riskMemo}" var="riskMemo">
						 <table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
						 	<tr>
						 		<td class="ui-widget-content jqgrow ui-row-ltr" height="24" rowspan="3">${riskMemo.PRCM_USER_LEVEL}级评审</td>
						 		<td class="ui-widget-content jqgrow ui-row-ltr" height="24" colspan="2"><c:if test="${not empty riskMemo.PRCM_LEVEL}">提交到：${riskMemo.PRCM_LEVEL}级评审</c:if><c:if test="${empty riskMemo.PRCM_LEVEL}">结案：<c:if test="${riskList.STATE eq 1}">无条件通过</c:if><c:if test="${riskList.STATE eq 3}">不通过附条件</c:if><c:if test="${riskList.STATE eq 4}">不通过</c:if></c:if></td>
						 	</tr>
						 	<tr>
						 		<td class="ui-widget-content jqgrow ui-row-ltr" height="24">评审意见：${riskMemo.PRCM_CONTEXT}</td>	
						 	</tr>
						 	<tr>
						 		<td class="ui-widget-content jqgrow ui-row-ltr" height="24" align="right">评审人：${riskMemo.NAME}&nbsp;&nbsp;时间：<fmt:formatDate value="${riskMemo.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>						 							 		
						 	</tr>
						 </table>					
					</c:forEach></tr>
				</c:forEach>			
			</table>
			<center>
			<input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1)"/>						
		    </center>
		</form>
		</div>
				</div>
	</body>
</html>
