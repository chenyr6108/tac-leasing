<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新增竞争对手</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="新增竞争对手">
	<script type="text/javascript"  src="${ctx }/customer/js/custLinkCompetitor.js"></script>
	<script type="text/javascript"  src="${ctx }/customer/js/autocom.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />	
  </head>
  <body>
  
   <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新增竞争对手</span>
		   	</div>
   <form action="#" method="post" id="DivAddCustLinkCompetitorForm" style="width:90%;align:center;text-aling:center ">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
    <div class="zc_grid_body jqgrowleft">
   
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table  align="center" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
					<tr >
						<td class="ui-widget-content jqgrow ui-row-ltr" style="width:8%; height : 24px">负责人</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"  style="width:30%; height : 24px">     <input type="text" name="COMPTLINK_PRINCIPAL" id="COMPTLINK_PRINCIPAL"  style="height : 20px"></td>
						<td class="ui-widget-content jqgrow ui-row-ltr"  style="width:8%; height : 24px">日期</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="COMPTLINK_DATE" readonly="readonly" id="COMPTLINK_DATE"  style="height : 20px"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 24px">名称</td>
						<td   style="height : 24px"><input type="text" name="COMPETITOR_NAME" id="COMPETITOR_NAME" style="width:200; height : 20px" /></td>
							<td  style="height : 24px"> &nbsp;</td><td  style="height : 24px"> &nbsp;</td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 24px">客户</td>
						<td   style="height : 24px"><input type="text" name="LINK_CUSTOMER1"  id="LINK_CUSTOMER1"  style="width:200; height : 20px"></td>
						
						<td  style="height : 24px"> &nbsp;<input type="hidden" id="cust_id" ><input type="hidden" id="LINK_CUSTOMER" ></td>
						<td  style="height : 24px">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="height : 23px">竞争能力</td>
						<td><select name="DANGEROUS_LEVEL" id="DANGEROUS_LEVEL"  style="width : 48px" ><option value="0">低</option><option value="1">中</option><option value="2">高</option></select></td>
						<td  > &nbsp;</td>
						<td  >&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>竞争产品</td>
						<td ><textarea name="COMPETITOR_PRODUCT" id="COMPETITOR_PRODUCT" rows="3" cols="60"></textarea></td>
						<td>优势</td>
						<td ><textarea name="LINK_SUPERIORITY" id="LINK_SUPERIORITY" rows="3" cols="60"></textarea></td>
			    </tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>劣势</td>
						<td ><textarea name="LINK_DISADVANTAGE" id="LINK_DISADVANTAGE" rows="3" cols="60"></textarea></td>
						<td>策略</td>
						<td ><textarea name="LINK_TACTICS" id="LINK_TACTICS" rows="3"  cols="60"></textarea></td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"><textarea name="LINK_MEMO" id="LINK_MEMO"  cols="160" rows="2"></textarea></td>
					
				</tr>
							
							</table>
							<center>
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="submitAddCustLinkCompetitor()">
							<input type="button" value="取消" class="ui-state-default ui-corner-all"  onclick="reverseBack()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="Linkcare_reset" >
							</center>
							</div>
							</div>
							</div>
	</form>
  </body>
</html>
