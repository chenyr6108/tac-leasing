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
		    	changeTotal(typvalue);
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
				<TD class="ui-widget-content jqgrow ui-row-ltr" width="8%">承租人:</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CUST_NAME}</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr" width="8%">区域:</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr">${creditMap.PROV_NAME}	${creditMap.CITY_NAME}</TD>
			</TR>
			</TABLE>
			<c:set var="psTypeValue" value="${xuanList[0].PSTYPE}"></c:set>	
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<TR>
					<TD style="text-align: center;">选择的评审行业为：
						<c:forEach items="${psTypeList}" var="psTypeList"><c:if test="${psTypeList.CODE eq psTypeValue}">${psTypeList.FLAG}</c:if></c:forEach>						
					</TD>
				</TR>				
			</table>				
			<TABLE align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<TR>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center"width="5%">序号</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="10%">指标类型</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="11%">评定指标</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center">说明</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center"width="5%">标准分</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center"width="17%">内容</TD>
				<TD  class="ui-state-default ui-th-ltr zc_grid_head" align="center"width="5%">得分</TD>
			</TR>
			<c:set var="ty_code" value=""></c:set>
			<c:forEach items="${xuanList}" var="xuanList" varStatus="status">
			<c:choose>
				<c:when test="${status.count eq 1}">
					<c:set var="ty_code" value="${xuanList.TYPE_CODE}"></c:set>
				</c:when>
				<c:otherwise>		
						<c:if test="${ty_code != xuanList.TYPE_CODE}">
							<tr align="left"><td align="right"   style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr" colspan="7">小  计：<input type="text" id="x_sum${xuanList.TYPE_CODE-1}" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" name="x_sum"></td></tr>					
						</c:if>
						<c:set var="ty_code" value="${xuanList.TYPE_CODE}"></c:set>
				</c:otherwise>
			</c:choose>						
			<TR name="${xuanList.TYPE_CODE}">
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${status.count }</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.FLAG}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.POINTS_NAME}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.MEMO}</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr"  align="center">&nbsp;${xuanList.STANDARD_SCORE}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr" align="center">&nbsp;${xuanList.T_PRP_CONTENT}</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="center"  ><input type="text" id="pointss" name="pointss" value="${xuanList.T_PRP_POINT}" readonly="readonly" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center"></TD>			
			</TR>
			</c:forEach>
			<tr align="left"><td align="right" colspan="7"class="ui-widget-content jqgrow ui-row-ltr">小  计：<input type="text" id="x_sum${ty_code}" name="x_sum"  style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" ></td></tr>
			<tr align="left"><td align="right" colspan="7"class="ui-widget-content jqgrow ui-row-ltr">合  计：<input type="text" id="s_sum" name="s_sum"  style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" ></td></tr>							
			</TABLE>				
		</form>
  </body>
</html>
