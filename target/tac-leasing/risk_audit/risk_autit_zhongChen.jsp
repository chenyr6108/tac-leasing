<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审核</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_fen.js"></script>		
	</head>
  <body>
		<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post">
			<input type="hidden" name="__action" value="" id="__action">
			<input type="hidden" name="credit_id" value="${credit_id}"> 
			<input type="hidden" name="prc_id" value="${prc_id }"> 
			<input type="hidden" name="fenshu" value="${fenshu}" id="fenshu">
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<TABLE align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<TR>
				<TD class="ui-widget-content jqgrow ui-row-ltr" width="8%">承租人:</TD>
				<TD class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CUST_NAME} &nbsp; </TD>
			</TR>
			</TABLE>
			<TABLE align="center" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">		
			<TR>
			    <TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">序号</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">指标类型</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">评定指标</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">内容</TD>
				<TD class="ui-state-default ui-th-ltr zc_grid_head" align="center">得分</TD>
			</TR>
			<c:set var="ty_code" value=""></c:set>				
			<c:forEach items="${fenList}" var="fenlist" varStatus="status">						
				<input type="hidden" name="fen_id" value="${fenlist.points_id}">
				<input type="hidden" name="fencontext${status.count }" value="" id="fencontext${status.count}">
			<c:choose>
				<c:when test="${status.count eq 1}">
					<c:set var="ty_code" value="${fenlist.type_code}"></c:set>
				</c:when>
				<c:otherwise>		
						<c:if test="${ty_code != fenlist.type_code}">
							<tr align="right"><td  class="ui-widget-content jqgrow ui-row-ltr"  align="right" colspan="5">小  计：<input type="text" id="x_sum${fenlist.type_code-1}" name="x_sum" readonly="readonly" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center"></td></tr>					
						</c:if>
						<c:set var="ty_code" value="${fenlist.type_code}"></c:set>
				</c:otherwise>
			</c:choose>
			<TR name="${fenlist.type_code}" id="area${fenlist.type_code}"  >
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="center">${status.count } &nbsp;</TD>			
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="center">${fenlist.flag} &nbsp;</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="center">${fenlist.points_name}: &nbsp;</TD>
				<TD  class="ui-widget-content jqgrow ui-row-ltr"  align="left">
					<select name="point" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"  id="point${status.count }" onchange="changvalue(${status.count });changeTotal1(${fenlist.type_code },${status.count })" >
							<option value="-1">
								请点击选择评分内容！ 
							</option>					
						<c:forEach items="${fenlist.xiangList}" var="xList">
							<option value="${xList.subitem_point}">
								${xList.subitem_content} 
							</option>
						</c:forEach>
					</select>								
				</TD>
				<TD align="center" class="ui-widget-content jqgrow ui-row-ltr">			
					<input type="text" id="fen${status.count }" name="fen${status.count }" value="请选择得分" readonly="readonly">
				</TD>			
			</TR>					
			</c:forEach>
			<tr align="right"><td class="ui-widget-content jqgrow ui-row-ltr" align="right" colspan="5">小  计：<input readonly="readonly" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" type="text" id="x_sum${ty_code}" name="x_sum"></td></tr>
			<tr align="right"><td  class="ui-widget-content jqgrow ui-row-ltr" align="right" colspan="5">合  计：<input readonly="readonly" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;text-align: center" type="text" id="s_sum" name="s_sum"></td></tr>
			<tr align="center"><td align="center"  class="ui-state-default ui-th-ltr zc_grid_head"colspan="5"><input type="button" name="subbut" value="提  交" onclick="inserttopoint();" class="ui-state-default ui-corner-all"></td></tr>		
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
