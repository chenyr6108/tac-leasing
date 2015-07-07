<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改各类意见</title>
<script type="text/javascript">
	
	function doUpdateMemo(){
		$("#__action").val("businessSupport.doUpdateMemo");
		$('#thisForm').submit();
	}

</script>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdateMemo"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改各类意见</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="height: 90%">
<div class="zc_grid_body jqgrowleft">
<div>
	<br>
	<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="60" class="ss_o">&nbsp;</td>
			<td width="439" class="ss_t">&nbsp;&nbsp;
				案件号：<input type="text" name="credit_runcode" value="${credit_runcode }" class="panel_text">&nbsp;&nbsp;
				合同号：<input type="text" name="lease_code" value="${lease_code }" class="panel_text">
			
			</td>
			<td width="55" class="ss_th" valign="top">&nbsp;</td>
			<td><a href="#" name="search" id="search"  class="blue_button" onclick="$('#thisForm').submit();">搜 索</a></td>
		</tr>
	</table>
</div>
<br/>

	<c:if test="${empty item }">
		请搜索后再修改。
	</c:if>
	<c:if test="${not empty item }">
		<input type="hidden" name="ID" value="${item.ID }"/>
		<table class="panel_table" align="left" style="width: 80%">
			<tr>
				<th style="width: 20%">案件号：</th>
				<td style="width: 80%">${item.CREDIT_RUNCODE }</td>
			</tr>
			<tr>
				<th>合同号：</th>
				<td>${item.LEASE_CODE }</td>
			</tr>
			<tr>
				<th>客户名称：</th>
				<td>${item.CUST_NAME }</td>
			</tr>
			<tr>
				<th>供应商：</th>
				<td>${item.SUPL_NAME }</td>
			</tr>
			<tr>
				<td colspan="2">
					<table class="panel_table">
						<tr>
							<th>建议承做理由</th>
							<td>								
								<table class="panel_table">
								<tr>
									<td>
										<textarea name="project_content" ROWS="3" COLS="100">${empty pSIdeaMap.PROJECT_CONTENT ? '无' : pSIdeaMap.PROJECT_CONTENT}</textarea>
										<input type="hidden" name="project_content_id" value="${pSIdeaMap.PCPP_ID}">
									</td>	
								</tr>
								<tr>
									<td>签字：${pSIdeaMap.NAME} &nbsp; 时间：<fmt:formatDate value="${pSIdeaMap.CRATE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
								</table>
							</td>					
						</tr>
						<tr>
							<th  >其他租赁条件</th>
							<td>								
								<table class="panel_table">
								<tr>
									<td>
										<textarea name="project_content_other" ROWS="3" COLS="100">${empty pSIdeaMapOther.PROJECT_CONTENT ? '无' : pSIdeaMapOther.PROJECT_CONTENT}</textarea>
										<input type="hidden" name="project_content_other_id" value="${pSIdeaMapOther.PCPP_ID}">
									</td>	
								</tr>
								<tr>
									<td><c:if test="${not empty pSIdeaMapOther.NAME}">签字：${pSIdeaMapOther.NAME} &nbsp; 时间：<fmt:formatDate value="${pSIdeaMapOther.CRATE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>&nbsp;</td>
								</tr>
								</table>
							</td>					
						</tr>	
						<tr>
							<th  >区域主管审核意见</th>
							<td>								
								<table class="panel_table">
									<tr>
										<td>
											<textarea name="memo_manage" ROWS="3" COLS="100">${manageMap.MEMO}</textarea>
											<input type="hidden" name="memo_manage_id" value="${manageMap.PRCM_ID}">
										</td>	
									</tr>
									<tr>
										<td>签字：${manageMap.NAME} &nbsp; 时间：<fmt:formatDate value="${manageMap.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>		
								</table>
							</td>					
						</tr>
						<tr>
							<th  >业务副总审核意见</th>
							<td>								
								<table class="panel_table">
									<tr>
										<td>
											<textarea name="memo_manage_dgm" ROWS="3" COLS="100">${empty manageMapDGM.MEMO ? '无' : manageMapDGM.MEMO}</textarea>
											<input type="hidden" name="memo_manage_dgm_id" value="${manageMapDGM.PRCM_ID}">
										</td>	
									</tr>
									<tr>
										<td><c:if test="${not empty manageMapDGM.NAME}">签字：${manageMapDGM.NAME} &nbsp; 时间：<fmt:formatDate value="${manageMapDGM.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>&nbsp;</td>
									</tr>		
								</table>
							</td>					
						</tr>
						<c:set var="prcm_id_str" value=""/>
						<c:forEach items="${riskMemo }" var="rm">
							<tr>
								<th>${rm.PRCM_USER_LEVEL == 0 ? '初' : rm.PRCM_USER_LEVEL}级评审意见</th>
								<td>								
									<table class="panel_table">
										<tr>
											<td>
												<textarea name="PRCM_CONTEXT_${rm.PRCM_ID}" ROWS="3" COLS="100">${empty rm.PRCM_CONTEXT ? '无' : rm.PRCM_CONTEXT}</textarea>
												<input type="hidden" name="PRCM_ID_${rm.PRCM_ID}" value="${rm.PRCM_ID}">
												<input type="hidden" name="LOG_TITLE_${rm.PRCM_ID}" value="${rm.PRCM_USER_LEVEL == 0 ? '初' : rm.PRCM_USER_LEVEL}级评审意见">
											</td>	
										</tr>
										<tr>
											<td>签字：${rm.NAME} &nbsp; 时间：<fmt:formatDate value="${rm.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
										</tr>		
									</table>
								</td>					
							</tr>
							<c:set var="prcm_id_str" value="${prcm_id_str}${rm.PRCM_ID },"/>
						</c:forEach>
					</table>
					<input type="hidden" name="prcm_id_str" value="${fn:substring(prcm_id_str, 0 , fn:length(prcm_id_str) - 1) }">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdateMemo();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>