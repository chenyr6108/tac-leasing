<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>合同寄件管理</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
		
		function editPostFile(PRCD_ID,CONTRACT_TYPE,POST_ID,FLAG){
		    $("#rentfile").toggle(function(){
		        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentContract.queryRentPostFileByID&POST_ID="+POST_ID+"&FLAG="+FLAG+"&cardFlag=2&prcd_id=" + PRCD_ID + "&CONTRACT_TYPE="+CONTRACT_TYPE + "&QSEARCH_VALUE="+$("#QSEARCH_VALUE").val());
		        
				$("#rentfile").dialog({
				        modal: true,
				        autoOpen: false,
				        width: 900
				    });
				$("#rentfile").dialog('open');        
		    });
		}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentPostFileManage" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同寄件管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>寄件开始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>寄件结束日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
						是否有快递单号&nbsp;
					</td>
					<td>
						<select name="POST_CODE"><option value=""></option><option value="0" <c:if test="${POST_CODE eq 0 }">selected</c:if>>有</option><option value="1" <c:if test="${POST_CODE eq 1 }">selected</c:if>>没有</option></select>&nbsp;
					</td>
					<td>
					快递公司&nbsp;
					</td>
					<td>
					<select name="POST_NAME" id="POST_NAME">
					<option value=""></option>
					<c:forEach items="${postNameList}" var="item" varStatus="status">
						<option value="${item.FLAG }" <c:if test="${item.FLAG eq POST_NAME }">selected</c:if>>${item.FLAG }</option>
					</c:forEach>
					</select>&nbsp;
					</td>
					<td>
					&nbsp;
					</td>
					<td>
					&nbsp;
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" id="QSEARCH_VALUE" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
						<td>&nbsp;</td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										寄件日期
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										寄件单号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										快递公司
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;"><c:if test="${item.POST_DATE !='1900-01-01'}">${item.POST_DATE }</c:if>&nbsp;</td>
										<td style="text-align: center;">&nbsp;${item.POST_CODE }</td>
										<td style="text-align: center;">&nbsp;${item.POST_NAME }</td>
										<td style="text-align: center;"> <a href="javascript:void(0)" onclick="editPostFile('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }','${item.POST_ID }','SHOW');">查看</a> &nbsp;<c:if test="${ postFileUpdate and (empty item.POST_DATE or  empty item.POST_CODE)}">|&nbsp; <a href="javascript:void(0)" onclick="editPostFile('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }','${item.POST_ID }','UPDATE');">修改</a></c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>
	</body>
</html>