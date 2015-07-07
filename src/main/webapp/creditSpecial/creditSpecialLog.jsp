<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
	$(function () {
		for(var i=0;i<$("#logTable").find("tr").length;i++) {
			if($("#logTable").find("tr").eq(i).index()!=0) {
				$("#logTable").find("tr").eq(i).find("td").eq(5).html(//去掉最后的br
						$("#logTable").find("tr").eq(i).find("td").eq(5).html().substring(0,$("#logTable").find("tr").eq(i).find("td").eq(5).html().length-4)
						);
			}
		}
	});
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" id="form1" method="post">
		<input type="hidden" name="__action" id="__action" value="creditSpecialCommand.logQuery">
	<div class="ui-state-default ui-jqgrid ui-corner-top" style="background: white">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;专案卡关日志</span>
	</div>
	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
      <tr>
      	<td width="8">&nbsp;</td>
        <td width="60" class="ss_o"></td>
        <td width="60%" class="ss_t" valign="center">
          <table style="margin-left: 10px;">
          <tr>
          	<td>查询内容：</td>
          	<td><input type="text" name="content" value="${content }"></td>
          </tr>
          </table>
        </td>
        <td width="55" class="ss_th" valign="top">&nbsp;</td>
        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
      </tr>
    </table>
	<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
		<table id="logTable" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
					序号
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="creditCode" pagingInfo="${pagingInfo }">案件号</page:pagingSort>
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					客户名称
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }">提交报告人</page:pagingSort>
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="creditName" pagingInfo="${pagingInfo }">专案名称</page:pagingSort>
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					卡关条件
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="creditDate" pagingInfo="${pagingInfo }">提交时间</page:pagingSort>
				</th>
			</tr>
			<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
				<tr class="ui-widget-content jqgrow ui-row-ltr">   
					<td style="text-align: center;">&nbsp;${index.count }</td>
					<td style="text-align: center;">&nbsp;${item.creditCode }</td>
					<td style="text-align: center;">&nbsp;${item.custName }</td>
					<td style="text-align: center;">&nbsp;${item.name }</td>
					<td style="text-align: center;">&nbsp;${item.creditName }</td>
					<td style="text-align: left;">${item.logContent }</td>
					<td style="text-align: center;">&nbsp;${item.creditDateDescr }</td>
				</tr>
			</c:forEach>
		</table>
	 <page:pagingToolbar pagingInfo="${pagingInfo }"/>
     </div>
	 </form>
</body>
</html>