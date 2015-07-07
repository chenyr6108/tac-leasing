<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectInsureItem.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_zulinUpdateAfter.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">	
			<input type="hidden" id="__action"  name="__action" value="">	
			<input type="hidden" name="credit_id" value="${credit_id}">
			<input type="hidden" id="createDate"  name="createDate" value="${creditMap.INCORPORATING_DATE}">	
			<input type="hidden" name="prc_id" value="${windIdeaMap.PRC_ID}">
			<input type="hidden" name="prc_hao" value="${windIdeaMap.PRC_HAO}">
			<input type="hidden" id="STATE"  name="STATE" value="${windIdeaMap.STATE}">
			<input type="hidden" id="prc_node" name="prc_node" value="${prc_node}">	
			<input type="hidden" id="PRCM_LEVEL"  name="PRCM_LEVEL" value="${riskMemoMap.PRCM_LEVEL}">
			<input type="hidden" id="PRCM_USER_LEVEL"  name="PRCM_USER_LEVEL" value="${riskMemoMap.PRCM_USER_LEVEL}">
			<input type="hidden" id="PRCM_ID"  name="PRCM_ID" value="${riskMemoMap.PRCM_ID}">	
			<input type="hidden" id="levelEndMoney"  name="levelEndMoney" value="${levelMap.LEVEL_PRICE_UPPER}">
			<input type="hidden" id="levelGrantMoney"  name="levelGrantMoney" value="${levelMap.GRANT_PRICE_UPPER}">
			<input type="hidden" id="custGrant_Biaozhun"  name="custGrant_Biaozhun" value="${custGrantMap_Biaozhun.GRANT_PRICE}">
			<input type="hidden" id="shenqingBokuan"  name="shenqingBokuan" value="${shenQingBoMap.SHENQINGBOKUANJINE}">
			<input type="hidden" id="custGrantMoney"  name="custGrantMoney" value="${custGrantMap}">
			<input type="hidden" id="rzeMoney"  name="rzeMoney" value="<fmt:formatNumber value="${schemeMap.LEASE_RZE}" pattern="#.##"/>">
			<input type="hidden" name="LEASE_TERM" id="LEASE_TERM" value="${creditshemadetail.LEASE_TERM}"/>
			<div class="ui-state-default ui-jqgrid-hdiv ">流水号:${windIdeaMap.PRC_HAO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;批覆书号:${windIdeaMap.REAL_PRC_HAO}</div>
				<%@ include file="/risk_audit/riskAuditCorp.jsp"%>
				<%@ include file="/risk_audit/risk_checkManage.jsp"%>
				<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
				<c:forEach items="${riskMemoList}" var="riskMemo" varStatus="index">	
					<c:if test="${riskMemo.PRCM_USER_LEVEL ne prc_node+1}">
									<TR>
										<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">
											<c:choose>
												<c:when test="${riskMemo.PRCM_USER_LEVEL eq 0}">初级评审</c:when><c:otherwise>${riskMemo.PRCM_USER_LEVEL}级评审</c:otherwise>
											</c:choose>
										</TD>
										<TD class="ui-widget-content jqgrow ui-row-ltr">
											<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
												<TR>
													<TD class="ui-widget-content jqgrow ui-row-ltr">提交到：${riskMemo.PRCM_LEVEL}级评审
														<c:if test="${index.count == 1 }">&nbsp;&nbsp;&nbsp;&nbsp;
															访厂人员：${creditMap.VISITOR }&nbsp;&nbsp;
															访厂时间：${creditMap.VISIT_DATE }
															<input type="hidden" name="visitor_id" value="${windIdeaMap.VISITOR_ID }" />
															<input type="hidden" name="visit_date" value="${windIdeaMap.VISITOR_DATE }" />
														</c:if>
													</TD>																								
												</TR>									
												<TR>										
													<TD class="ui-widget-content jqgrow ui-row-ltr"><pre><TEXTAREA  ROWS="6" COLS="145" >${riskMemo.PRCM_CONTEXT}</TEXTAREA></pre></TD>																		
												</TR>											
												<TR>
													<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${riskMemo.NAME} &nbsp;&nbsp;时间：<fmt:formatDate value="${riskMemo.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>								
												</TR>
											</table>
										</TD>
									</TR>
					</c:if>
				</c:forEach>					
				<TR>				
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">${prc_node+1}级评审</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">					
								<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
									<tr id="riskmemoTr">
										<TD>						
											<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
												<tr>
													<TD width="5%">评审</TD>
													<td id="memoa" width="13%"><c:if test="${(prc_node + 1) >= riskLevel }"><INPUT TYPE="radio" NAME="memo" value="1">无条件通过</c:if></td>
													<td id="memoc" width="13%"><INPUT TYPE="radio" NAME="memo" value="3">不通过附条件</td>
													<td id="memod" width="7%"><INPUT TYPE="radio" NAME="memo" value="4">不通过</td>
													<TD width="10%" id="riskmemoa"><INPUT TYPE="radio" NAME="memo" value="111">提交</TD>
													<td></td>						
													<%-- <td>共案批覆书号：<input type=/k"text" id="RISKINFO" name="RISKINFO" value="${windIdeaMap.RISKINFO}" size="50"></td> --%>
													<td>共案报告编号：<c:forEach items="${mergedList }" var="obj"><a href="javaScript:void(0)"
														onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${obj.CREDIT_ID }'"
														>[${obj.CREDIT_CODE}]&nbsp;&nbsp;</a></c:forEach></td>
												</TR>
											</TABLE>								
										</TD>															
									</tr>
								    <tr id="prcmlevel" style='display:none'>
										 <td class="ui-widget-content jqgrow ui-row-ltr"><select name="memoLevel" id="memoLevel"><c:forEach var="x" begin="${prc_node+2}" end="4" step="1"><option value="${x}">${x}级评审</option></c:forEach></td>							 						        										        	
								    </tr>								
									<tr>
										<TD class="ui-widget-content jqgrow ui-row-ltr"><pre><TEXTAREA NAME="context" ROWS="6" COLS="145" id="context">${riskMemoMap.PRCM_CONTEXT}</TEXTAREA></pre></TD>				
									</tr>
							</TABLE>
					</TD>
				</TR>
				<tr>
					<td align="center" colspan="10">		
						<input class="ui-state-default ui-corner-all" type="button" name="subbut" value="保  存" onclick="updatewind();">																
					</td>					
				</tr>		
			</table>						
		</form>
	</body>
</html>
