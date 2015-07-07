<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/creditSpecial/js/creditSpecialAlter.js"></script>
<html>
	<head>
		<title>现场调查报告审核</title> 
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css"> 
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				/* $("#tabs").tabs();
				$("#tabs").tabs('select',${showFlag}); */
				//if(${showFlag}==0) {
					//检查该案件是否是专案,如果是专案,检查专案有效期,在有效期范围外,灰掉提交,无条件通过按钮 add by ShenQi
					$.ajax({
						type: 'post',
						url: "${ctx }/servlet/defaultDispatcher",
						dataType: 'json',
						data: '__action=creditReport.checkDatePeriod&credit_id='+${credit_id},
						success: function(data) {
							data.creditName = data.creditName == null ? "无" : data.creditName;
							if(data.creditName!="无") {
								$("#creditName").html(data.creditName+"&nbsp;&nbsp;(<a href='javascript:void(0)' onclick='showUpdateDiv()' style='text-decoration: none;color: #6093B8;'>查看专案</a>)<input name='creditSpecial' id='creditSpecial' value='"+data.creditCode+"' type='hidden'>");
							} else {
								$("#creditName").html(data.creditName);
							}
							if(data.flag) {
								alert("当前日期不在专案有效期内,请退回该案件");
								$("#tabs").tabs({disabled:[1]});
								if($("#typeOfContract").val()==3) {
									$("#tabs ul li").eq(1).html("<a href='#tabs-2' style='text-align:center'>信用评分表</a>");
								} else {
									$("#tabs ul li").eq(1).html("<a href='#tabs-2' style='text-align:center'>测评记分表</a>");
								}
								
								$("input[name=memo]").eq(0).attr("disabled","disabled");
								$("input[name=memo]").eq(3).attr("disabled","disabled");
							}
						}
					});
				//}
			});
		</script>
	</head>
	<body>
	<input type="hidden" name="typeOfContract" id="typeOfContract" value="${typeOfContract}"></input>
	<table width="982" align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告审核</span>
					   	</div>
					   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		           				<div class="zc_grid_body jqgrowleft">
		           				<font color="red">专案名称：</font><span id="creditName"></span>
		           				<div class="ui-state-default ui-jqgrid-hdiv ">
									<%-- <div id="tabs">
										<ul>
											<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAudit.selectRiskAuditForSucc_zulinAfter&VIP_FLAG=${VIP_FLAG }&credit_id=${credit_id}&prc_id=${prc_id}&prc_node=${prc_node}&showFlag=0'">现场调查报告</a></li>
											<c:choose>
												<c:when test="${typeOfContract eq '3'}">
													<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAudit.selectRiskAuditForSucc_fenAfter&credit_id=${credit_id }&prc_id=${prc_id}&prc_node=${prc_node}&showFlag=1&typeOfContract=${typeOfContract}'">信用评分表</a></li>
												</c:when>
												<c:otherwise>
													<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAudit.selectRiskAuditForSucc_fenAfter&credit_id=${credit_id }&prc_id=${prc_id}&prc_node=${prc_node}&showFlag=1'">测评记分表</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
										<div id="tabs-1">	 --%>
												<jsp:include page="risk_audit_zulinAfter.jsp"></jsp:include> 
												<!-- <br/>
										</div> -->
										<%-- <div id="tabs-2">	
											<c:choose>
												<c:when test="${typeOfContract eq '3'}">
													<jsp:include page="risk_autit_fenAfter_zhongChen.jsp"></jsp:include>
												</c:when>	
												<c:otherwise>
													<jsp:include page="risk_autit_fenAfter.jsp"></jsp:include>
												</c:otherwise>
											</c:choose>
												<br/>
										</div> --%>
									</div>	
								</div>
								</div>
						</div>
					</td>
				</tr>
			</table>	
			<div style="display: none;" id="updateDiv" title="<font style='font-family: 微软雅黑'>专案限制提醒</font>">
        	<div>
        		<div class="ui-state-default ui-jqgrid" style="background: white;width: 472px;margin-left: 1px;">
        		<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
        			<tr>
        				<td class="ui-widget-content jqgrow ui-row-ltr" id="startDate">
        				</td>
        				<td class="ui-widget-content jqgrow ui-row-ltr" id="endDate">
        				</td>
        			</tr>
        		</table>
        		</div>
        		<table id="updateTable" cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
        			
        		</table>
        		<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td align="center">
							<br>
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#updateDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</div>	
	</body>
</html>
