<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>竞争对手管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="竞争对手管理页">
<script type="text/javascript"  src="${ctx }/customer/js/custLinkCompetitor.js"></script>
  </head>
  <body>
<form  id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=customerlink.queryLinkCompetitor"  >
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;竞争对手</span></div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >

<div class="zc_grid_body jqgrowleft">
<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>查询内容：</td>
				          <td><input type="text" name="searchValue" value="${searchValue }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<input type="hidden" name="__action" value="customer.queryLinkCompetitor" />
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  style="width:100%" >
	<tr ><td><%@ include file="/common/pageControlTop.jsp"%></td></tr></table>
	<table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  style="width:100%" >
				<thead>
				<tr class="ui-jqgrid-labels"> 
				<th colspan="8" align="left" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:left">
					<a href="javascript:void(0)" onclick="AddCustLinkCompetitor();">添加</a>
				</th>
			</tr>
			<tr>
				<td style="width:6%;text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;
				</td>
				<td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					名称
				</td >
				<td style=" width:26%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head"> 
					客户
				</td>
				<td style="width:8% ;text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					竞争能力
				</td>
				
				<td style="width:18%;text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					负责人
				</td>
				<td style="width:18%;text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</td>
				
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr id="CustLinkCompetitor${item.CULT_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td >${status.count }</td>
					<td style="text-align:center">${item.COMPETITOR_NAME }&nbsp;</td>
					<td style="text-align:center">${item.CUST_NAME }&nbsp;</td>
					<td style="text-align:center" ><c:if test="${item.DANGEROUS_LEVEL eq 0 }">低</c:if><c:if test="${item.DANGEROUS_LEVEL eq 1 }">中</c:if><c:if test="${item.DANGEROUS_LEVEL eq 2 }">高</c:if>  &nbsp;</td>
					<td style="text-align:center">${item.LINK_PRINCIPAL }&nbsp;</td>
					<td style="text-align:center"><a href="javascript:void(0);" onclick="showLinkCompetitor('${item.CULT_ID }')">查看</a> <a onclick="updateComp('${item.CULT_ID }')" href="javascript:void(0);">修改</a> <a href="javascript:void(0);" onclick="delLinkCompetitor('${item.CULT_ID }');">删除</a> &nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<%@ include file="/common/pageControl.jsp"%>

</div>
</div>
</div>
</form>

  </body>
</html>
