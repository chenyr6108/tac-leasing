<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function(){
	$("#QEND_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("#QSTART_DATE").datepicker($.datepicker.regional['zh-CN']);
})

</script>

	</head>
	<body>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=rentContract.queryMDFLockCodeLog">
			<input type="hidden" name="__action" value="rentContract.queryMDFLockCodeLog" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改锁码日志</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
    <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="QSTART_DATE" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="QEND_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
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
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td>&nbsp;&nbsp;</td><td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>

		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						产品名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						型号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						机号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						修改内容
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						修改人
					</th>					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						修改时间
					</th>
					<del></del>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }</td>
					<td style="text-align: center;">${item.LEASE_CODE }</td>
					<td style="text-align: center;">${item.CUST_NAME }</td>
					<td style="text-align: center;">${item.THING_NAME }&nbsp;</td>
					<td style="text-align: center;">${item.MODEL_SPEC }&nbsp;</td>
					<td style="text-align: center;">${item.THING_NUMBER }&nbsp;</td>
					<td style="text-align: center;">${item.ORI_FLAG }&nbsp;&nbsp;改为&nbsp;&nbsp;${item.FLAG }&nbsp;</td>
					<td style="text-align: center;">${item.NAME }&nbsp;</td>
					<td style="text-align: center;">${item.MODIFY_TIME }&nbsp;</td>
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