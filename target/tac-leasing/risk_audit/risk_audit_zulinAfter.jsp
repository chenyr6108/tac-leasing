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
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_zulinAfter.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_return_type.js"></script>
		<script src="${ctx }/common/js/money.js" type="text/javascript"></script>	
		<link rel="stylesheet" type="text/css" href="${ctx}/modifyOrder/js/html5uploader.css">
		<script type="text/javascript" src="${ctx }/modifyOrder/js/jquery.html5uploader.js"></script>
		<script type="text/javascript">
			var jq = jQuery.noConflict(true);
			jq(function (){
				jq("#file_upload").html5uploader({
					auto:false,
					multi:true,
					buttonText:'[文件上传（可多选）]',
		   			fileSizeLimit:2097152,
					url:'${ctx}/servlet/defaultDispatcher?__action=riskAudit.uploadFiles'
				});
				jq('.uploadfilebtn').addClass("panel_a");
				saveDataSession('riskAuditAfter', '${credit_id }', true);
			});	
		
			function updateCredit(){
				$("#showUpdateCreditReport").dialog({
					closeOnEscape : true,
					modal : true,
					width : 850
				});
			}
			
			function updateCreditInfo(e){
				$(e).hide();
				if(confirm("确定要保存这些修改吗？")){
					$("#UpdateCreditReportForm").submit();
				} else {
					$(e).show();
				}
			}
			
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
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">		
		    <input type="hidden" id="__action"  name="__action" value="">
			<input type="hidden" name="credit_id" id="credit_id" value="${credit_id}">
			<input type="hidden" name="prc_id" value="${windMap.PRC_ID}">
			<input type="hidden" name="prc_hao" value="${windMap.PRC_HAO}">
			<input type="hidden" name="prc_node" id="prc_node"  value="${prc_node}">
			<input type="hidden" name="VIP_FLAG" id="VIP_FLAG"  value="${VIP_FLAG}">
			<input type="hidden" name="modify_date" value="${creditMap.MODIFY_DATE }"/>
			<input type="hidden" id="createDate"  name="createDate" value="${creditMap.INCORPORATING_DATE}">
			<input type="hidden" id="levelEndMoney"  name="levelEndMoney" value="${levelMap.LEVEL_PRICE_UPPER}">
			<input type="hidden" id="rzeMoney"  name="rzeMoney" value="<fmt:formatNumber value="${schemeMap.LEASE_RZE}" pattern="#.##"/>">
			<input type="hidden" id="levelGrantMoney"  name="levelGrantMoney" value="${levelMap.GRANT_PRICE_UPPER}">
			<input type="hidden" id="custGrantMoney"  name="custGrantMoney" value="${custGrantMap}">
			<input type="hidden" id="custGrant_Biaozhun"  name="custGrant_Biaozhun" value="${custGrantMap_Biaozhun.GRANT_PRICE}">
						<input type="hidden" id="shenqingBokuan"  name="shenqingBokuan" value="${shenQingBoMap.SHENQINGBOKUANJINE}">
			<input type="hidden" id="prcm_id"  name="prcm_id" value="${manageMap.PRCM_ID}">
			<input type="hidden" id="beforePrcId"  name="beforePrcId" value="${before.PRC_ID}">
			<input type="hidden" name="LEASE_TERM" id="LEASE_TERM" value="${creditshemadetail.LEASE_TERM}"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
           		<div class="zc_grid_body jqgrowleft">
        			<div class="ui-state-default ui-jqgrid-hdiv ">			
					<div class="ui-state-default ui-jqgrid-hdiv ">流水号:${windMap.PRC_HAO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;批覆书号:${windMap.REAL_PRC_HAO}</div>
			<%@ include file="/risk_audit/riskAuditCorp.jsp"%>
			<%@ include file="/risk_audit/risk_checkManage.jsp"%>
			<!-- Modify by Michael 2012 1/13修改评审级别，二级及以上评审的不过公司成立是否有达到6个月及以上  -->
			<!-- <c:if test="${defuMonth	eq 0}"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >${levelMap.RANK}级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：万元),承租公司成立在半年内</span></c:if> -->		
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >${levelMap.RANK}级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：万元)</span>
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上次评审总分为：${before.BEFORE}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="showBeforeMemo('${credit_id}');">[查看以往审核记录]</a></span>					
			<div class="panel_a" style="float: right; margin-top: 8px; margin-right: 50px; font-size: 14px;" onclick="showFileList();">
				<c:if test="${empty fileList }">
					(0<img alt="附件" src="../images/attach.jpg">)
				</c:if>
				<c:if test="${not empty fileList }">
					(${fn:length(fileList) }<img alt="附件" src="../images/attach.jpg">)
				</c:if>
				[附件管理]
			</div>
				<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title dataSession">
				<c:forEach items="${riskMemoList}" var="riskMemo" varStatus="index">				
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">
						<c:choose>
							<c:when test="${riskMemo.PRCM_USER_LEVEL eq 0}">初级评审</c:when><c:otherwise>${riskMemo.PRCM_USER_LEVEL}级评审</c:otherwise>
						</c:choose>
					</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="85%">
						<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
								<TR>
									<TD class="ui-widget-content jqgrow ui-row-ltr">提交到：${riskMemo.PRCM_USER_LEVEL + 1}级评审
										<c:if test="${index.count == 1 }">&nbsp;&nbsp;&nbsp;&nbsp;
											访厂人员：${creditMap.VISITOR }&nbsp;&nbsp;
											访厂时间：${creditMap.VISIT_DATE }
											<input type="hidden" name="visitor_id" value="${windMap.VISITOR_ID }" />
											<input type="hidden" name="visit_date" value="${windMap.VISITOR_DATE }" />
										</c:if>
									</TD>																								
								</TR>
								<TR>						
									<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA ROWS="7" COLS="145"  readonly="readonly">${riskMemo.PRCM_CONTEXT}</TEXTAREA></pre></TD>													
								</TR>											
								<TR>
									<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${riskMemo.NAME} &nbsp;&nbsp;时间：<fmt:formatDate value="${riskMemo.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>								
								</TR>
						</table>
					</TD>
				</TR>
				</c:forEach>					
				<TR>				
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">${prc_node+1}级评审</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="85%">						
							<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
								<tr id="riskmemoTr">
									<TD>						
										<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
											<tr>
												<TD width="5%">评审</TD>
												<td id="memoa" width="13%">
													<INPUT TYPE="radio" NAME="memo" value="1" <c:if test="${(prc_node + 1) < windMap.RISK_LEVEL }">disabled="disabled"</c:if>>无条件通过
												</td>
												<td id="memoc" width="13%"><INPUT TYPE="radio" NAME="memo" value="3">不通过附条件</td>
												<td id="memod" width="7%"><INPUT TYPE="radio" NAME="memo" value="4">不通过</td>
												
												<c:if test="${prc_node < 3 || (prc_node ==3 && creditMap.PRODUCTION_TYPE == 3) }">
													<TD width="10%" id="riskmemoa"><INPUT TYPE="radio" NAME="memo" value="111">提交</TD>
												</c:if>
												<td></td>								
												<%-- <td>共案批覆书号：<input type="text" id="RISKINFO" name="RISKINFO" value="${windMap.RISKINFO}" size="50"></td> --%>
												<td>
													<c:if test="${not empty mergedList }">
														共案报告编号：
													</c:if>
													<c:forEach items="${mergedList }" var="obj"><a href="javaScript:void(0)"  class="panel_a"
													onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${obj.CREDIT_ID }'"
													>[${obj.CREDIT_CODE}]&nbsp;&nbsp;</a></c:forEach></td>
											</TR>
											<tr>
												<td colspan="9">
													<div id="risk_return_type_panel" style="padding: 1px 5px;"></div>
													<div id="risk_return_type_panel_2" style="padding: 1px 5px;"></div>
												</td>
											</tr>
										</TABLE>								
									</TD>															
								</tr>
							    <tr id="memolevelTr" style='display:none'>
									 <td class="ui-widget-content jqgrow ui-row-ltr"><select name="memoLevel" id="memoLevel"><c:forEach var="x" begin="${prc_node+2}" end="4" step="1"><option value="${x}">${x}级评审</option></c:forEach></select></td>							 						        										        	
							    </tr>							
								<tr>
									<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><TEXTAREA NAME="context" ROWS="6" COLS="145" id="context">${context }</TEXTAREA></TD>
								</tr>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td align="center" colspan="10">
						<button type="button" onclick="getDataSession('riskAuditAfter', '${credit_id }');" class="panel_button">恢复最后修改</button>
						<button type="button" onclick="saveDataSession('riskAuditAfter', '${credit_id }', false);" class="panel_button">暂存</button>
						<button type="button" name="subbut" class="panel_button" onclick="updatewind();">保  存</button>
						<button type="button" name="subbut" class="panel_button" onclick="updateCredit();">修改报告内容</button>
					</td>					
				</tr>		
			</table>	
			</div>
			</div>
			</div>					
		</form>
		<div id="showBeforeMemo" align="center" title="以往审核记录" style="display: none;  text-align:center; width:480px">		
			<table id="data1" align="center" width="480px"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">																																										
			</table>
		</div>		
		<div id="showUpdateCreditReport" title="修改报告内容" style="display: none;">
			<form action="../servlet/defaultDispatcher" id="UpdateCreditReportForm" method="post">
				<input type="hidden" id="__action"  name="__action" value="riskAudit.updateCreditReport">
				<input type="hidden" name="credit_id" value="${creditMap.CREDIT_ID }"/>
				<input type="hidden" name="prc_id" value="${prc_id }"/>
				<input type="hidden" name="prc_node" id="prc_node"  value="${prc_node}">
				<input type="hidden" name="VIP_FLAG" id="VIP_FLAG"  value="${VIP_FLAG}">
				<table class="panel_table">
					<tr>
						<th>
							保证人信息
						</th>
						<td>
							<table class="panel_table">
								<tr>
									<th>保证人</th>
									<th>证号</th>
								</tr>
								<c:set var="g_count" value="0"/>
								<c:forEach var="danbaorens" items="${danbaorens}" varStatus="i">
								<c:set var="g_count" value="${i.count }"/>
								<tr>
									<td style="white-space: normal;">${danbaorens.NAME}</td>
									<td>
										<input type="text" name="guarantor_code_${i.count }" class="panel_text" style="width: 400px;" value="${danbaorens.CODE}">
										<input type="hidden" name="guarantor_state_${i.count }" value="${danbaorens.STATE}">
										<input type="hidden" name="guarantor_id_${i.count }" value="${danbaorens.ID}">
									</td>
								</tr>
								</c:forEach>
							</table>
							<input type="hidden" name="g_count" value="${g_count}">
						</td>
					</tr>
					<tr>
						<th style="width: 25%;">租赁物放置地</th>
						<td style="width: 75%;">
							<input type="text" name="equpment_address" class="panel_text" style="width: 400px;" value="${schemeMap.EQUPMENT_ADDRESS }">
						</td>
					</tr>
					<!-- ********************** -->
					
					<%-- <tr>
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
						<th  >办事处主管审核意见</th>
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
					</tr> --%>
					<tr>
						<th colspan="2">
							<button class="panel_button" type="button" onclick="updateCreditInfo(this);">保存</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="showFileWin" title="附件管理" style="display: none;">
			<iframe style="width: 100%; height: 100%; border: 0px;" 
				src="${ctx }/servlet/defaultDispatcher?__action=riskAudit.getFiles&credit_id=${credit_id}&prc_id=${prc_id }">
			</iframe>
		</div>	
	</body>
</html>
