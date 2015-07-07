<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审核</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
	<style type="text/css">
		@import url('${ctx }/customer/calendar/skins/aqua/theme.css');
	</style>
		<script type="text/javascript" src="${ctx }/customer/calendar/calendar.js"></script>
		<script type="text/javascript" src="${ctx }/customer/calendar/calendar-setup.js"></script>
		<script type="text/javascript" src="${ctx }/customer/calendar/lang/calendar-zh_CN.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_fenUpdate.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			var fenType=$("#fenType").val();
		    for(var i=1;i<=fenType;i++){
		     var typvalue=$("#typ"+i).val();
		    	changeTotal1(typvalue);
		    }			
			});				
		</script>				
	</head>
  <body>
		<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post">
			<input type="hidden" name="__action" value="" id="__action">
			<input type="hidden" name="credit_id" value="${credit_id}">
			<input type="hidden" name="prc_id" value="${prc_id }">
			<input type="hidden" name="prc_node" value="${prc_node }">
			<input type="hidden" name="fenshu" value="${fenshu}" id="fenshu">			
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<input type="hidden" name="fenType" value="${fenType}" id="fenType">
			<c:forEach items="${fenTypes}" var="fenTypes" varStatus="status">
				<input type=hidden name="typ${status.count }" value="${fenTypes.TYPE_CODE}" id="typ${status.count}">
			</c:forEach>			
			<TABLE align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<TR>
				<TD class="ui-widget-content jqgrow ui-row-ltr" width="8%">客户姓名:</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CUST_NAME}</TD>
			</TR>
			</TABLE>
			<c:set var="psTypeValue" value="${xuanList[0].PSTYPE}"></c:set>	
			<TABLE align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<TR>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center">序号</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center">指标类型</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">评定指标</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center">内容</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center">得分</TD>
			</TR>
			<c:set var="ty_code" value=""></c:set>
			<c:forEach items="${xuanList}" var="xuanList" varStatus="status">
			<c:choose>
				<c:when test="${status.count eq 1}">
					<c:set var="ty_code" value="${xuanList.TYPE_CODE}"></c:set>
				</c:when>
				<c:otherwise>		
						<c:if test="${ty_code != xuanList.TYPE_CODE}">
							<tr align="left"><td align="right"   style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr" colspan="5">小  计：<input type="text" id="x_sum${xuanList.TYPE_CODE-1}" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" name="x_sum">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>					
						</c:if>
						<c:set var="ty_code" value="${xuanList.TYPE_CODE}"></c:set>
				</c:otherwise>
			</c:choose>						
			<TR name="${xuanList.TYPE_CODE}">
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${status.count }</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.FLAG}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.POINTS_NAME}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.T_PRP_CONTENT}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="center"  ><input type="text" id="pointss" name="pointss" value="${xuanList.T_PRP_POINT}" readonly="readonly" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center"></TD>			
			</TR>
			</c:forEach>
				<tr align="left"><td align="right" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">小  计：<input type="text" id="x_sum${ty_code}" name="x_sum"  style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
				<tr align="left"><td align="right" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">合  计：<input type="text" id="s_sum" name="s_sum"  style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>							
			</TABLE>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr align="right"><td  class="ui-widget-content jqgrow ui-row-ltr" align="center" colspan="5"><b>贷款申请人信用得分必须在D级以上（含D级）为评分合格</b></td></tr>
			<tr align="right">
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >A</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >B</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right">C</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >D</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >E</td>
			</tr>
			<tr align="right">
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >75分以上</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >74-65分</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right">64-55分</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >54-45分</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" >44分(含)以下</td>
			</tr>
			</table>				
		</form>
  </body>
</html>
