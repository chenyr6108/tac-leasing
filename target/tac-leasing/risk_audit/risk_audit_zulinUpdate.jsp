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
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>	
		<script type="text/javascript">
			$(function(){
				$("#visit_date").datepicker($.datepicker.regional['zh-CN']);
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
		</script>
		<style type="text/css">
			.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
			.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
			.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
		</style>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">	
			<input type="hidden" id="__action"  name="__action" value="">	
			<input type="hidden" name="credit_id" value="${credit_id}">
			<input type="hidden" name="prc_id" value="${windIdeaMap.PRC_ID}">
			<input type="hidden" id="PRC_HAO"  name="PRC_HAO" value="${windIdeaMap.PRC_HAO}">
			<input type="hidden" id="PRCM_LEVEL"  name="PRCM_LEVEL" value="${riskMemoMap.PRCM_LEVEL}">
			<input type="hidden" id="PRCM_USER_LEVEL"  name="PRCM_USER_LEVEL" value="${riskMemoMap.PRCM_USER_LEVEL}">
			<input type="hidden" id="STATE"  name="STATE" value="${windIdeaMap.STATE}">
			<input type="hidden" id="PRCM_ID"  name="PRCM_ID" value="${riskMemoMap.PRCM_ID}">
			<input type="hidden" id="createDate"  name="createDate" value="${creditMap.INCORPORATING_DATE}">	
			<input type="hidden" id="levelEndMoney"  name="levelEndMoney" value="${levelMap.LEVEL_PRICE_UPPER}">
			<input type="hidden" id="levelGrantMoney"  name="levelGrantMoney" value="${levelMap.GRANT_PRICE_UPPER}">
			<input type="hidden" id="custGrant_Biaozhun"  name="custGrant_Biaozhun" value="${custGrantMap_Biaozhun.GRANT_PRICE}">
						<input type="hidden" id="shenqingBokuan"  name="shenqingBokuan" value="${shenQingBoMap.SHENQINGBOKUANJINE}">
			<input type="hidden" id="custGrantMoney"  name="custGrantMoney" value="${custGrantMap}">
			<input type="hidden" id="rzeMoney"  name="rzeMoney" value="<fmt:formatNumber value="${schemeMap.LEASE_RZE}" pattern="#.##"/>">			
			<input type="hidden" name="LEASE_TERM" id="LEASE_TERM" value="${creditshemadetail.LEASE_TERM}"/>
			流水号:${windIdeaMap.PRC_HAO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;批覆书号:${windIdeaMap.REAL_PRC_HAO}
			<%@ include file="/risk_audit/riskAuditCorp.jsp"%>
			<%@ include file="/risk_audit/risk_checkManage.jsp"%>
				<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">初级评审</TD>
					<TD>
						<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
							<tr>
								<TD>						
									<TABLE align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">					
										<tr>
											<!-- <TD width="5%">评审</TD><td id="memoa" width="13%"><INPUT TYPE="radio" NAME="memo" value="1">无条件通过</td><td id="memoc" width="13%"><INPUT TYPE="radio" NAME="memo" value="3">不通过附条件</td><td id="memod" width="7%"><INPUT TYPE="radio" NAME="memo" value="4">不通过</td><TD id="memo_hu" width="10%"><INPUT TYPE="radio" NAME="memo" value="111">提交</TD><td></td> -->								
											<td width="5%">评审</td>
											<td id="memoa" width="13%"><INPUT TYPE="radio" NAME="memo" value="3">不通过附条件</td>
											<td id="memoc" width="7%"><INPUT TYPE="radio"  NAME="memo" value="111" checked="checked">提交</td>
											<td width="17%">访厂人员:${creditMap.VISITOR }</td>
											<td width="2%">&nbsp;</td>
											<td width="17%">访厂日期:${creditMap.VISIT_DATE }</td>
											<td width="2%">&nbsp;</td>
											<td></td>	
											<%-- <td>共案批覆书号：<input type="text" id="RISKINFO" name="RISKINFO" value="${windIdeaMap.RISKINFO}" size="50"></td> --%>
											<td>共案报告编号：<c:forEach items="${mergedList }" var="obj"><a href="javaScript:void(0)"
												onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${obj.CREDIT_ID }'"
												>[${obj.CREDIT_CODE}]&nbsp;&nbsp;</a></c:forEach></td>
										</TR>
									</TABLE>								
								</TD>															
							</TR>
						    <tr id="memolevelTr" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
								 <!-- <td class="ui-widget-content jqgrow ui-row-ltr"><select name="memoLevel" id="memoLevel"><option value="2">二级评审</option><option value="3">三级评审</option><option value="4">四级评审</option></td> -->							 						        										        	
								 <td class="ui-widget-content jqgrow ui-row-ltr"><input type="hidden" name="memoLevel" id="memoLevel" value="1"/><br></td>
						    </tr>						    													
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr"><TEXTAREA NAME="context" ROWS="6" COLS="145" id="context">${riskMemoMap.PRCM_CONTEXT}</TEXTAREA></TD>
						</TR>
						</TABLE>		
					</TD>
				</TR>
				<tr>
					<td align="center" colspan="10"  class="ui-state-default ui-th-ltr zc_grid_head">		
						<input class="ui-state-default ui-corner-all"type="button" name="subbut" value="保  存" onclick="updatewind();">
					</td>					
				</tr>		
			</table>						
		</form>
	</body>
</html>
