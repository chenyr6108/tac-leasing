<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>竞争对手详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="竞争对手详细信息">
	<script type="text/javascript"  src="${ctx }/customer/js/custLinkCompetitor.js"></script>

  </head>
  <body>
  
  <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;竞争对手详细信息</span>
		   	</div>
   <form action="#" method="post" id="DivAddCustLinkCompetitorForm" style="width:90%;align:center;text-aling:center ">
	
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table  align="center" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
					<tr >
						<td class="ui-widget-content jqgrow ui-row-ltr" style="width:8%; height : 24px">负责人</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"  style="width:30%; height : 24px">${pam.LINK_PRINCIPAL} </td>
						<td class="ui-widget-content jqgrow ui-row-ltr"  style="width:8%; height : 24px">日期</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">${pam.LINK_DATE}   </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 24px">名称</td>
						<td   style="height : 24px"> ${pam.COMPETITOR_NAME} </td>
							<td  style="height : 24px"> &nbsp;</td><td  style="height : 24px"> &nbsp;</td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 24px">客户</td>
						<td   style="height : 24px">${pam.CUST_NAME }</td>
						<td  style="height : 24px"> &nbsp;<input type="hidden" id="cust_id" ></td>
						<td  style="height : 24px">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 23px">竞争能力</td>
						<td><c:if test="${pam.DANGEROUS_LEVEL eq 0}">低</c:if><c:if test="${pam.DANGEROUS_LEVEL eq 1}">中</c:if><c:if test="${pam.DANGEROUS_LEVEL eq 2}">高</c:if></td>
						<td  > &nbsp;</td>
						<td  >&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>竞争产品</td>
						<td >${pam.COMPETITOR_PRODUCT} &nbsp;</td>
						<td>优势</td>
						<td >${pam.LINK_SUPERIORITY} &nbsp;</td>
			    </tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>劣势</td>
						<td >${pam.LINK_DISADVANTAGE}&nbsp;</td>
						<td>策略</td>
						<td >${pam.LINK_TACTICS} &nbsp;</td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3">${pam.LINK_MEMO}  &nbsp;</td>
					
				</tr>
							
							</table>
							<center>
							<input type="button" value="返回" class="ui-state-default ui-corner-all"  onclick="reverseBack()">
							</center>
							</div>
							</div>
							</div>
	</form>
  </body>
</html>
