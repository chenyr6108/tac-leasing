<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/modifyOrder/js/html5uploader.css">
		<script type="text/javascript" src="${ctx }/modifyOrder/js/jquery.html5uploader.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectInsureItem.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_audit_zulin.js"></script>
		<script type="text/javascript" src="${ctx }/risk_audit/js/risk_return_type.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>	
		<script type="text/javascript">
			var j = jQuery.noConflict(true);
			j(function (){
				j("#file_upload").html5uploader({
					auto:false,
					multi:true,
					buttonText:'[文件上传（可多选）]',
		   			fileSizeLimit:2097152,
					url:'${ctx}/servlet/defaultDispatcher?__action=riskAudit.uploadFiles'
				});
				j('.uploadfilebtn').addClass("panel_a");
				
				saveDataSession('riskAudit', '${credit_id }', true);
			});	
		
			function getTheSame(e){
				if($.trim($(e).val()) != ""){
					//alert("do post");
					$.ajax({
						type: 'post',
						url: "${ctx }/servlet/defaultDispatcher",
						dataType: 'json',
						data: {"__action":"riskAudit.getTheSame", "searchTo.content":$(e).val()},
						success: function(data){
							$("#theSameName").html("");
							if(data != null && data.length > 0){
								var htmlContent = "";
								$.each(data,function(i){
									htmlContent += "<div class='nameTag" + ((i%2) + 1) + "' " + 
											"onmouseover=\"$(this).attr('className','nameTagOver')\" " +
											"onmouseout=\"$(this).attr('className','nameTag" + ((i%2) + 1) + "')\" " + 
											"onclick=\"nameClick('" + data[i].userId + "','" + data[i].userName + "')\" >" + data[i].userName + 
											"<span id=\"span_" + i + "\" style=\"display: none;\">" + data[i].userId + "," + data[i].userName + "</span></div>";
								});
								$("#theSameName").html(htmlContent);
								$("#theSameName").css("display", "block");
							} else {
								$("#theSameName").css("display", "none");
							}
						}
					});
				} else {
					$("#theSameName").html("");
					$("#theSameName").css("display", "none");
				}
			}
			function nameClean(){
				$("#theSameName").html("");
				$("#theSameName").css("display", "none");
			}
			function nameClick(userId, userName){
				$("#visitor").val(userName);
				$("#visitor_id").val(userId);
				nameClean();
			}
			function nameOut(){
				var spanText = $("#span_0").text();
				if($.trim(spanText) != ''){
					var spanInfo = spanText.split(",");
					$("#visitor").val(spanInfo[1]);
					$("#visitor_id").val(spanInfo[0]);
				}
				setTimeout(nameClean, 1000);
			}
			
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
					width : 700,
					height : 300
				});
			}
			
		</script>
		<style type="text/css">
			.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
			.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
			.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
			
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
			<input type="hidden" id="memoLevelUrl"  name="memoLevelUrl" value="${memoLevel}">
			<input type="hidden" name="credit_id" id="credit_id" value="${credit_id}">
			<input type="hidden" id="createDate"  name="createDate" value="${creditMap.INCORPORATING_DATE}">	
			<input type="hidden" id="levelEndMoney"  name="levelEndMoney" value="${levelMap.LEVEL_PRICE_UPPER}">
			<input type="hidden" id="levelGrantMoney"  name="levelGrantMoney" value="${levelMap.GRANT_PRICE_UPPER}">
			<input type="hidden" id="custGrantMoney"  name="custGrantMoney" value="${custGrantMap}">
			<input type="hidden" id="custGrant_Biaozhun"  name="custGrant_Biaozhun" value="${custGrantMap_Biaozhun.GRANT_PRICE}">
			<input type="hidden" id="shenqingBokuan"  name="shenqingBokuan" value="${shenQingBoMap.SHENQINGBOKUANJINE}">
			<input type="hidden" id="rzeMoney"  name="rzeMoney" value="<fmt:formatNumber value="${schemeMap.LEASE_RZE}" pattern="#.##"/>">
			<input type="hidden" id="prcm_id"  name="prcm_id" value="${manageMap.PRCM_ID}">
			<input type="hidden" id="beforePrcId"  name="beforePrcId" value="${before.PRC_ID}">
			<input type="hidden" name="prc_id" value="${prc_id }"/>
			<input type="hidden" name="VIP_FLAG" id="VIP_FLAG"  value="${creditMap.VIP_FLAG}">
			<input type="hidden" name="modify_date" value="${creditMap.MODIFY_DATE }"/>
			<input type="hidden" name="LEASE_TERM" id="LEASE_TERM" value="${creditshemadetail.LEASE_TERM}"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
           		<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
			<%@ include file="/risk_audit/riskAuditCorp.jsp"%>	
			<!-- Modify by Michael 2012 1/13修改评审级别，二级及以上评审的不过公司成立是否有达到6个月及以上  -->
			<!--<c:if test="${defuMonth	eq 0}"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >1级评审&nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：万元),承租公司成立在半年内</span></c:if> 	-->	
			<%@ include file="/risk_audit/risk_checkManage.jsp"%>
			<c:if test="${defuMonth	eq 1}"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >初级评审<%-- &nbsp;&nbsp;&nbsp;&nbsp;评审金额：${levelMap.LEVEL_PRICE_LOW }到${levelMap.LEVEL_PRICE_UPPER }(单位：万元),承租公司成立在半年以上 --%></span></c:if>	
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上次评审总分为：${before.BEFORE}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="panel_a" onclick="showBeforeMemo('${credit_id}');">[查看以往审核记录]</a></span>
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
				<tr>			
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">初级评审</td>
					<TD class="ui-widget-content jqgrow ui-row-ltr">
						<table align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
							<tr>
								<TD class="ui-widget-content jqgrow ui-row-ltr">						
									<table align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
										<tr>
											<td width="5%">评审</td>
											<td width="13%"><INPUT TYPE="radio" NAME="memo" value="3">不通过附条件</td>
											<td width="7%"><INPUT TYPE="radio"  NAME="memo" value="111">提交</td>
											<td width="17%">访厂人员:${creditMap.VISITOR }</td>
											<td width="2%">&nbsp;</td>
											<td width="17%">访厂日期:${creditMap.VISIT_DATE }</td>
											<td width="2%">&nbsp;</td>
											<td></td>							
											<!-- <td>共案批覆书号：<input type="text" id="RISKINFO" name="RISKINFO" value="" size="50"></td> -->
											<td>
												<c:if test="${not empty mergedList }">
													共案报告编号：
												</c:if>
												<c:forEach items="${mergedList }" var="obj">
													<a href="javaScript:void(0)" class="panel_a"
													onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${obj.CREDIT_ID }'"
													>[${obj.CREDIT_CODE}]&nbsp;&nbsp;</a>
												</c:forEach></td>
										</tr>
										<tr>
											<td colspan="9">
												<div id="risk_return_type_panel" style="padding: 2px 5px;"></div>
												<div id="risk_return_type_panel_2" style="padding: 2px 5px;"></div>
											</td>
										</tr>
									</table>								
								</td>													
							</tr>
						    <tr id="memolevelTr" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
								 <td class="ui-widget-content jqgrow ui-row-ltr"><input type="hidden" name="memoLevel" id="memoLevel" value="1"/><br></td>							 						        										        	
						    </tr>						    													
							<tr>
								<TD class="ui-widget-content jqgrow ui-row-ltr"><textarea NAME="context" ROWS="6" COLS="145" id="context">${context }</textarea></td>
							</tr>
						</table>		
					</td>
				</tr>
				<tr>
					<td align="center" colspan="10">
						<button type="button" onclick="getDataSession('riskAudit', '${credit_id }');" class="panel_button">恢复最后修改</button>
						<button type="button" onclick="saveDataSession('riskAudit', '${credit_id }', false);" class="panel_button">暂存</button>
						<button type="button" name="subbut" class="panel_button" onclick="addwind();">提交</button>
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
				<input type="hidden" name="flag" value="1"/>
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
