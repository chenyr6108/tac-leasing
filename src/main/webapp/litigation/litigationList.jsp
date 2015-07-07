<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>更改单列表</title>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">
	//查看详情
	function showLtion(rectId){
		//alert(rectId)
	    $("#l_"+rectId).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=litigationCommand.queryLProcessList&RECT_ID="+rectId);
	    });
	}
	function doQuery() {
		$("#form1").submit();
	}
</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action" value="litigationCommand.queryLitigationList">
		<input type="hidden" name="id" id="id">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;诉讼案件</span></div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				         <td width="8">&nbsp;</td>
				         <td width="60" class="ss_o"></td>
				         <td width="60%" class="ss_t" valign="top">
						 <table style="margin-left: 10px;">
				         <tr>
							<td>状态： </td>
							<td><select name="selectStatus" style=" height: 18px;" id="selectStatus">
								<option value=""> 请选择 </option>
								<c:forEach items="${classList}" var="list">
									<c:choose>
										<c:when test="${selectStatus eq list.CODE}"><option value="${ list.CODE}" selected="selected">${ list.FLAG}</option></c:when>
										<c:otherwise>
										<option value="${ list.CODE}">${ list.FLAG}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							   </select></td>
							<td>办事处 :<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="office" items="${officeList}">
											<option value="${office.DEPT_ID }" <c:if test="${office.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${office.DEPT_NAME }
											</option>
										</c:forEach>
									</select></td> 
				     	 </tr>
				          <tr>
					          <td>查询内容：</td>
					          	<td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" style=" width:395px;height:18px; font-size: 12px;">
					          </td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
					</div>	
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<br>
			<page:pagingToolbarTop pagingInfo="${dw }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>支付表号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>承租人</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>主管</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商责任</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>锁码方式</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>逾期天数</strong>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="litigation" varStatus="index">
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;"><a href="javascript:void(0);" onclick="showLtion('${litigation.RECT_ID}');">${litigation.FLAG}</a>&nbsp;</td>
						<td style="text-align: center;">${litigation.RECP_CODE}&nbsp;</td>
						<td style="text-align: center;">${litigation.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${litigation.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${litigation.NAME }&nbsp;</td>
						<td style="text-align: center;">${litigation.UPNAME}&nbsp;</td>
						<td style="text-align: center;">${litigation.BRAND}&nbsp;</td>
						<td style="text-align: center;">${litigation.SUPL_TRUE}&nbsp;</td>
						<td style="text-align: center;">${litigation.LOCK_CODE}&nbsp;</td>
						<td style="text-align: center;">${litigation.DUN_DAY}&nbsp;</td>
					</tr>
					<td style="text-align:center;" colspan="10" align="center">
						<div id="l_${litigation.RECT_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%"></div>
					</td>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${dw}"/>
			</div>
		</div>
	</form>
</body>