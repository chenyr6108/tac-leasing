<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="page" uri="/pagingtarglib"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绿色通道转换</title>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function changeVip(prcd_id, flag){
		if(confirm("确定要转换吗？")){
			var url = "${ctx }/servlet/defaultDispatcher";
			var param = {"to_vip_flag" : flag, "__action" : "businessSupport.doChangeVip", "prcd_id" : prcd_id};
			$.post(url,param,function (data){
				$('#form1').submit();
			}, "json");
		}
	}
</script>
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="businessSupport.getAllCredit"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;绿色通道转换</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	      <tr>
	        <td width="60" class="ss_o">&nbsp;</td>
	        <td width="439" class="ss_t">
	        	报告类型：
				<select name="vip_flag">
					<option value="">请选择</option>
					<option value="2" <c:if test="${vip_flag eq '2' }">selected="selected"</c:if>>普通</option>
					<option value="1" <c:if test="${vip_flag eq '1' }">selected="selected"</c:if>>绿色通道</option>
				</select>
				<br/>
				查询内容：
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
		<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>序号</strong>
		</th>
		<th style="width:16%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>报告号</strong></page:pagingSort> 
		</th>
		<th style="width:40%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>承租人 </strong></page:pagingSort> 
		</th>
		<th style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="UP_NAME" pagingInfo="${pagingInfo }"><strong>办事处主管</strong></page:pagingSort> 
		</th>
		<th style="width:20%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo }"><strong>客户经理</strong></page:pagingSort> 
		</th>
		<th style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort orderBy="VIP_FLAG" pagingInfo="${pagingInfo }"><strong>报告类型</strong></page:pagingSort> 
		</th>
		<th style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>操作</strong>
		</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>${index.count }&nbsp;</td>
				<td>${item.CREDIT_RUNCODE }&nbsp;</td>
				<td>${item.CUST_NAME }&nbsp;</td>
				<td>${item.UP_NAME }&nbsp;</td>
				<td>${item.NAME }&nbsp;</td>
				<td><c:choose><c:when test="${item.VIP_FLAG eq '1' }">绿色通道</c:when><c:otherwise>普通</c:otherwise></c:choose>&nbsp;</td>
				<td><c:choose><c:when test="${item.VIP_FLAG eq '1' }"><a href="javascript:void(0)" onclick="changeVip('${item.ID}', '0')">转为普通</a></c:when><c:otherwise><a href="javascript:void(0)" onclick="changeVip('${item.ID}', '1')">转为绿色通道</a></c:otherwise></c:choose>&nbsp;</td>
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