<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查报告审核</title> 
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css"> 
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${showFlag});
			});
		</script>
	</head>
	<body>
	<input type="hidden" name="prc_id" value="${windIdeaMap.PRC_ID}">
	<input type="hidden" name="prc_hao" value="${windIdeaMap.PRC_HAO}">
	<table width="982" align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告审核</span>
					   	</div>
					   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
					           				<div class="zc_grid_body jqgrowleft">
						           				<div class="ui-state-default ui-jqgrid-hdiv ">
														<div id="tabs">
															<ul>
																<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditUpdateAfter.selectRiskAuditForUpdate_zulinAfter&credit_id=${windIdeaMap.CREDIT_ID}&prc_id=${windIdeaMap.PRC_ID}&prc_node=${prc_node}&showFlag=0'">现场调查报告</a></li>
																<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditUpdateAfter.selectRiskAuditForUpda_fenAfter&credit_id=${windIdeaMap.CREDIT_ID}&prc_id=${windIdeaMap.PRC_ID}&prc_node=${prc_node}&showFlag=1'">测评记分表</a></li>
															</ul>
															<div id="tabs-1">	
																	<jsp:include page="risk_audit_zulinUpdateAfter.jsp"></jsp:include> 
																	<br/>
															</div>
															<div id="tabs-2">		
																	<jsp:include page="risk_autit_fenSee.jsp"></jsp:include>
																	<br/>
															</div>
														</div>
												</div>		
											</div>
						</div>
					</td>
				</tr>
			</table>		
	</body>
</html>
