<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="page" uri="/pagingtarglib"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>非业务日志</title>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#grid-data td{text-align: center;}
</style>	 
<script type="text/javascript">
</script>
<style type="text/css">
	.showTd {background-color: #FFFFFF; border: 1px solid #A6C9E2;}
</style>
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="actionLogCommand.getAllLog"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;非业务日志</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	      <tr>
	      <td width="65">&nbsp;</td>
	        <td width="60" class="ss_o">&nbsp;</td>
	        <td width="439" class="ss_t">
	        	<!-- &nbsp;&nbsp;状态：&nbsp;
	        	<select name="search_status" id="search_status">
		        	<option value="2">全部</option>
					<option value="0">未审批</option>
					<option value="1">已审批</option>
				</select> &nbsp;&nbsp; -->
			<input type="text" name="search_content" value="${search_content }" style="width:395px; height:20px;"></td>
	        <td width="55" class="ss_th" valign="top">&nbsp;</td>
	        <td><a href="#" name="search" id="search"  class="blue_button" onclick="$('#form1').submit();">搜 索</a></td>
	      </tr>
	    </table>
	    </div>
<br/>
<div class="ui-state-default ui-jqgrid-hdiv">
<font color="red"><b>${errorMsg }</b></font>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr >
		<td>
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
		<%-- <%@ include file="/common/pageControlTop.jsp"%> --%></td>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>序号</strong>
		</th>
		<th style="width:16%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="LOG_ACTION" pagingInfo="${pagingInfo }"><strong>动作</strong></page:pagingSort> 
		</th>
		<th style="width:40%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>内容 </strong>
		</th>
		<th style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="LOG_BY" pagingInfo="${pagingInfo }"><strong>操作人</strong></page:pagingSort> 
		</th>
		<th style="width:20%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="CREATE_DATE" pagingInfo="${pagingInfo }"><strong>操作时间 </strong></page:pagingSort> 
		</th>
		<th style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="LOG_IP" pagingInfo="${pagingInfo }"><strong>IP</strong></page:pagingSort> 
		</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
			<tr>
				<td class="showTd">${index.count }&nbsp;</td>
				<td class="showTd">${item.LOG_ACTION }&nbsp;</td>
				<td class="showTd" id="content_${index.count }">
					${
					fn:replace(
						fn:replace(
							fn:replace(
								fn:replace(
									fn:replace(
										fn:replace(
											fn:replace(
												fn:replace(
													fn:replace(
														fn:replace(
															item.LOG_CONTENT, ';', '<br/>'
														),'[','<font color=\"red\">[</font>'
													),']','<font color=\"red\">]</font>'
												),'{','<font color=\"red\">{</font>'
											),'}','<font color=\"red\">}</font>'
										),',','<font color=\"red\">,</font>'
									),'(','<font color=\"red\">(</font>'
								),')','<font color=\"red\">)</font>'
							),'‘','<font color=\"red\">‘</font>'
						),'’','<font color=\"red\">’</font>'
					)
					}&nbsp;
				</td>
				<td class="showTd">${item.LOG_BY }&nbsp;</td>
				<td class="showTd"><fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
				<td class="showTd">${item.LOG_IP } &nbsp;</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
</div>
</div>
</div>
</form>
</body>
</html>