<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>律师函寄发申请</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">
$(function (){
	$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
});
	function nopassLaw(auditId){
		if(confirm("你确定要驳回这份委外回访?")){
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=dunTaskLawCommand.nopassOutVisit&AUDIT_ID=' + auditId,
				dataType:'json',
				async: false,
				success: function(result){		
					alert("已驳回。");
					location.href="../servlet/defaultDispatcher?__action=dunTaskLawCommand.getOutVisitAuditList";
				},
				error:function(result){
					alert("error!");
					return false;
				}
			});
		   }
	}
		function sendLaw(auditId){
			if(confirm("你确定要通过这份委外回访申请?")){
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=dunTaskLawCommand.getPassOutVisit&AUDIT_ID='+auditId,
					dataType:'json',
					async: false,
					success: function(result){		
						alert("已通过。");
						location.href="../servlet/defaultDispatcher?__action=dunTaskLawCommand.getOutVisitAuditList";
					},
					error:function(result){
						alert("error!");
						return false;
					}
				});
			   }
		}
		function submitserach() {
			$("#__currentPage").val("1");
			$("#form1").submit();
		}
		function outVisitToExcel(){
			var OUT_DATE= document.getElementById("datebegin").value;
			window.parent.callBirt("birtReport/outVisit/outVisitToExcel.rptdesign","xls",{"OUT_DATE":OUT_DATE});
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" id="__action" name="__action" value="dunTaskLawCommand.getOutVisitAuditList" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp委外回访审批</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px;">
									
								<tr>
									<td>状态:</td>
									<td>
									<select name="SELECT_STATUS" style=" height: 18px;" id="SelectStatus">
										<option value="" <c:if test="${empty SELECT_STATUS}">selected='selected'</c:if>> 请选择 </option>
										<option value="0" <c:if test="${SELECT_STATUS eq '0'}">selected='selected'</c:if>> 未审批 </option>
										<option value="1" <c:if test="${SELECT_STATUS eq '1'}">selected='selected'</c:if>> 通过 </option>
										<option value="2" <c:if test="${SELECT_STATUS eq '2'}">selected='selected'</c:if>> 驳回 </option>
									</select>
									</td>
								</tr>
								<tr>
									<td>查询内容：</td>
									<td colspan="3"><input type="text" name="content" value="${content}" style="width: 240px; height: 18px; font-size: 12px;"></td>
								</tr>
							</table>

						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="searchs" id="searchs" onclick="submitserach();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div class="zc_grid_body ">
			<br/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
					<tr>	
							<td class="ui-state-default ui-corner-all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委访日期：<input type="text" name="datebegin" style="width: 80px; height: 18px;"  id="datebegin" value="${datebegin}"/>
								<input type="button" style="margin-left:10px;" class="ui-state-default ui-corner-all" id="excel" value="导出委外回访管控表" name="excel" onclick="outVisitToExcel();">
								<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
							</td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">状态</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">承租人</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">合同号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">逾期日期</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">申请人</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">申请日期</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">操作 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagingInfo.resultList}" var="letter" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">&nbsp;
									<c:if test="${letter.STATUS eq '0'}">未审批</c:if>
									<c:if test="${letter.STATUS eq '1'}">通过</c:if>
									<c:if test="${letter.STATUS eq '2'}"><font color="red">驳回</font></c:if>
								</td>
								<td style="text-align: center;">&nbsp;${letter.CUST_NAME}</td>
								<td style="text-align: center;">&nbsp;${letter.LEASE_CODE}</td>
								<td style="text-align: center;">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd " type="both" value="${letter.TDDCREATEDATE}"/>&nbsp;</td>
								<td style="text-align: center;">&nbsp;${letter.APPLY_NAME}</td>
								<td style="text-align: center;">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" type="both" value="${letter.CREATE_DATE}"/>&nbsp;</td>
								<td style="text-align: center;">&nbsp;
									<c:if test="${audit}">
										<c:if test="${letter.STATUS eq '0'}">
											<input type="button" name="addbutton" onclick="sendLaw('${letter.AUDIT_ID}');" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="通过">
											<input type="button" name="addbutton" onclick="nopassLaw('${letter.AUDIT_ID}');" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="驳回">
										</c:if>
									</c:if>
									<c:if test="${letter.STATUS eq '1'}">&nbsp;已通过 </c:if>
									<c:if test="${letter.STATUS eq '2'}">&nbsp;已驳回 </c:if>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td align="right" colspan="14" style="text-align: center; background-color: #C5DBEC;" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbar pagingInfo="${pagingInfo }"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>