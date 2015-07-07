<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectInsureItem.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/jquery-1.3.2.js" ></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_zulinUpdate.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_return_type.js"></script>
		<script src="${ctx }/common/js/money.js" type="text/javascript"></script>
	</head>
	<script type="text/javascript">	
	$(document).ready(function(){
		var vflag_hidden=$("#moren").val();
	    $("input[name=statee][value="+vflag_hidden+"]").attr("checked",true);//value=vflag_hidden的radio被选中			
		});
	
	function showFileList(){
		$("#showFileWin").dialog({
			closeOnEscape : true,
			modal : true,
			width : 700
		});
	}
	
	</script>	
	<style type="text/css">
			.uploadfilebtn{
				border: none;
				color: #2E6E9E!important;
				font-size: 13px;
				font-weight: bold;
			}
			.filelist *{
				text-align: left!important;
			}
		</style>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">		
			<input type="hidden" name="credit_id" value="${credit_id}">
			<input type="hidden" name="prc_id" value="${windIdeaMap.PRC_ID}">
			<input type="hidden" name="s_employeeId" value="${s_employeeId}">	
			<input type="hidden" name="moren" value="${windIdeaMap.STATE}" id="moren">		
			<input type="hidden" id="__action"  name="__action" value="">
			<div class="ui-state-default ui-jqgrid-hdiv ">流水号:${windIdeaMap.PRC_HAO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;批覆书号:${windIdeaMap.REAL_PRC_HAO}</div>
			<%@ include file="/risk_audit/riskAuditCorp.jsp"%>
			<%@ include file="/risk_audit/risk_checkManage_show.jsp"%>
				<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<%-- <c:if test="${windIdeaMap.RISKINFO != null && windIdeaMap.RISKINFO != ''}"><TR><td colspan="1" class="ui-widget-content jqgrow ui-row-ltr" width="15%" >&nbsp;</TD><td  class="ui-widget-content jqgrow ui-row-ltr" align="right">共案批覆书号：${windIdeaMap.RISKINFO}</td></TR></c:if> --%>
				<TR>
					<td colspan="1" class="ui-widget-content jqgrow ui-row-ltr" width="15%" >&nbsp;</TD>
					<td  class="ui-widget-content jqgrow ui-row-ltr" align="right" style="padding-top: 5px;">
						<c:if test="${not empty mergedList }">
							共案报告编号：
						</c:if>
						<c:forEach items="${mergedList }" var="obj"><a href="javaScript:void(0)" class="panel_a"
							onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${obj.CREDIT_ID }'"
							>[${obj.CREDIT_CODE}]&nbsp;&nbsp;</a>
						</c:forEach>
					<br/>
					<div class="panel_a" style="float: right; margin-right: 50px; font-size: 14px;" onclick="showFileList();">
						<c:if test="${empty fileList }">
							(0<img alt="附件" src="../images/attach.jpg">)
						</c:if>
						<c:if test="${not empty fileList }">
							(${fn:length(fileList) }<img alt="附件" src="../images/attach.jpg">)
						</c:if>
						[附件管理]
					</div>	
				</td></TR>
				<c:forEach items="${riskMemoList}" var="riskMemo" varStatus="index">				
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">
						<c:choose>
							<c:when test="${riskMemo.PRCM_USER_LEVEL eq 0}">初级评审</c:when><c:otherwise>${riskMemo.PRCM_USER_LEVEL}级评审</c:otherwise>
						</c:choose>
					</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">
						<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
											<TR>
												<TD class="ui-widget-content jqgrow ui-row-ltr">
													<c:choose>
														<c:when test="${index.count != fn:length(riskMemoList) || windIdeaMap.STATE eq 0 }">
															提交到：${riskMemo.PRCM_USER_LEVEL + 1}级评审
														</c:when>
														<c:otherwise>
															<c:if test="${windIdeaMap.STATE eq 1}">结案：无条件通过</c:if>
															<c:if test="${windIdeaMap.STATE eq 3}">结案：不通过附条件</c:if>
															<c:if test="${windIdeaMap.STATE eq 4}">结案：不通过</c:if>
														</c:otherwise>
													</c:choose>
													<c:if test="${index.count == 1 }">&nbsp;&nbsp;&nbsp;&nbsp;
														访厂人员：${windIdeaMap.VISITOR }&nbsp;&nbsp;
														访厂时间：${windIdeaMap.VISIT_DATE }
													</c:if>
												</TD>
											</TR>
											
											<c:if test="${windIdeaMap.STATE eq 3 or windIdeaMap.STATE eq 4}">
												<tr>
													<td>
														&nbsp;${windIdeaMap.RETURN_CLASS_LEVEL_ONE }
														&nbsp;${windIdeaMap.RETURN_CLASS_LEVEL_TWO }
													</td>
												</tr>		
											</c:if>
																			
											<TR>										
												<TD class="ui-widget-content jqgrow ui-row-ltr"><pre><TEXTAREA  ROWS="6" COLS="145" readonly="readonly">${riskMemo.PRCM_CONTEXT}</TEXTAREA></pre></TD>														
											</TR>											
											<TR>
												<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${riskMemo.NAME} &nbsp;&nbsp;时间：<fmt:formatDate value="${riskMemo.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>								
											</TR>
						</table>
					</TD>
				</TR>
				</c:forEach>				
			</table>						
		</form>
		<div id="showFileWin" title="附件管理" style="display: none;">
			<form action="../servlet/defaultDispatcher" id="fileForm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="__action" name="__action" value="riskAudit.saveFileList">
				<input type="hidden" name="credit_id" value="${credit_id}">
				<input type="hidden" name="prc_id" value="${prc_id }"/>
				<input type="hidden" name="prc_node" id="prc_node"  value="${prc_node}">
				<input type="hidden" name="VIP_FLAG" id="VIP_FLAG"  value="${VIP_FLAG}">
				<table class="panel_table">
					<tr>
						<td>
							<c:if test="${empty fileList }">
								无附件
							</c:if>
							<c:forEach items="${fileList}" var="f" varStatus="index">
								<a style="padding: 2px; margin: 2px; float:left; clear:both;" class="ui-state-default panel_a" 
								href="${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${f.ORG_FILE_NAME }&path=${f.PATH}&bootPath=${bootPath}">${f.ORG_FILE_NAME }</a>
							</c:forEach>
						</td>
					</tr>
				</table>
			</form>
		</div>	
	</body>
</html>
