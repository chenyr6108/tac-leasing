<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
<script type="text/javascript">
	$(function (){
		var credit_id = "${creditMap.CREDIT_ID }";
		var url = "${ctx }/servlet/defaultDispatcher";
		var param = {__action : "riskAudit.getGuiHuByCreditId", "credit_id" : credit_id};
		$.getJSON(url, param, function (data){
			//担保人归户
			$("#guar_line").html("");
			var guihuGuarList = data.guihuForGuar;
			if(guihuGuarList.length <= 0){
				$("<tr>").append($("<td>").text("无担保人归户。").attr("colspan", 6))
					.appendTo($("#guar_line"));
			} else {
				for(var i = 0 ; i < guihuGuarList.length; i ++){
					$("<tr>").append($("<td>").text(guihuGuarList[i].name).css("textAlign", "center"))
						.append($("<td>").text(guihuGuarList[i].projectCount).css("textAlign", "center"))
						.append($("<td>").text(guihuGuarList[i].totalRentMoney).attr("className", "currency_text"))
						.append($("<td>").text(guihuGuarList[i].remainingRentMoney).attr("className", "currency_text"))
						.append($("<td>").text(guihuGuarList[i].totalPrincipal).attr("className", "currency_text"))
						.append($("<td>").text(guihuGuarList[i].remainingPrincipal).attr("className", "currency_text"))
						.appendTo($("#guar_line"));
				}
			}
			//客户归户
			$("#cust_line").html("");
			$("<tr>").append($("<td>").text(data.guihuForCust.projectCount).css("textAlign", "center"))
				.append($("<td>").text(data.guihuForCust.totalRentMoney).attr("className", "currency_text"))
				.append($("<td>").text(data.guihuForCust.remainingRentMoney).attr("className", "currency_text"))
				.append($("<td>").text(data.guihuForCust.totalPrincipal).attr("className", "currency_text"))
				.append($("<td>").text(data.guihuForCust.remainingPrincipal).attr("className", "currency_text"))
				.appendTo($("#cust_line"));
			
			//供应商归户
			$("#supl_line").html("");
			var suplLine = data.creditLine;
			if(suplLine.length == 0){
				$("<tr>").append($("<td>").text("无供应商归户。").attr("colspan", 6).css("textAlign", "center"))
					.appendTo($("#supl_line"));
			} else {
				for(var i = 0 ; i < suplLine.length; i ++){
					$("<tr>").append($("<td>").text(suplLine[i].lineName).css("textAlign", "center"))
						.append($("<td>").text(suplLine[i].repeatFlag == 1 ? "是" : "否").css("textAlign", "center"))
						.append($("<td>").text(suplLine[i].startDateStr + " ~ " + suplLine[i].endDateStr).css("textAlign", "center"))
						.append($("<td>").text(suplLine[i].line).attr("className", "currency_text"))
						.append($("<td>").text(suplLine[i].realUsedLine).attr("className", "currency_text"))
						.append($("<td>").text(suplLine[i].lastLine).attr("className", "currency_text"))
						.appendTo($("#supl_line"));
				}
			}
			
			
			$(".currency_text").each(function (){
				var thisText = formatCurrency($(this).text());
				thisText = thisText.replace(/-,/g, '-');
				$(this).text("￥" + thisText);
				$(this).css("textAlign", "right");
			});
		});
		
	});
	
	function idcardVerify(e, name, code){
		var url = "${ctx }/riskAudit/doIdcardVerified.do";
		var param = {"name" : name, "code" : code};
		$.post(url, param, function (data){
			$(e).hide();
			if(data.result_msg == "一致"){
				var a = $("<a>");
				a.text("一致");
				a.attr("href", "${ctx }/riskAudit/getImg.do?name=" + name + "&code=" + code);
				a.addClass("panel_a");
				a.appendTo($(e).parent());
			} else {
				$(e).parent().text(data.result_msg);
			}
		}, "json");
	}
	
</script>


	<input type="hidden" id="creditCustType" name="creditCustType">
	<input type="hidden" name="riskLevel" value="${windMap.RISK_LEVEL }">
	<c:set var="vipFlag" value=""/>
	<c:if test="${creditMap.VIP_FLAG eq '1' }">
		<c:set var="vipFlag" value="Vip"/>
	</c:if>
			<c:choose>
				<c:when test="${creditMap.CUST_TYPE eq 0}">
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					
				<tr >
					<td width="60%" class="ui-widget-content jqgrow ui-row-ltr" rowspan="2" align="center" colspan="6"><h2><%=Constants.COMPANY_NAME %></h2></td>
					<td width="10%" class="ui-widget-content jqgrow ui-row-ltr" >送件单位：</td>					
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${newbeforemap.DECP_NAME_CN }&nbsp;</td>					
				</tr>
				<tr>
					<td width="10%" class="ui-widget-content jqgrow ui-row-ltr" >营业人员：</td>					
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${newbeforemap.YINGYENAME }&nbsp;</td>					
				</tr>
				<tr>
					<td width="40%" class="ui-widget-content jqgrow ui-row-ltr" align="center" rowspan="2" colspan="6"><h2>核准函</h2></td>
					<td width="10%" class="ui-widget-content jqgrow ui-row-ltr" rowspan="2">权限别：</td>
					 <td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${windMap.RISK_LEVEL }&nbsp;</td>
				</tr> 
				<tr>
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${windMap.RISK_LEVEL_MEMO }&nbsp;</td>					
				</tr>
			</table>
			
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="left" colspan="10" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>承租人信息(自然人)</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >报告编号：</td>
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr" ><a href="javaScript:void(0)"
							onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport${vipFlag }.selectCreditForShow&credit_id=${creditMap.CREDIT_ID }'">${creditMap.CREDIT_CODE}</a></td>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr">收件日期：</td>		
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >${newbeforemap.COMMIT_WIND_DATE }</td>
				</tr>
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >承租人：</td>
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CUST_NAME}&nbsp;</td>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >法人代表：</td>
					<td colspan="3" width="25%"  class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.LEGAL_PERSON }&nbsp;</td>		
				</tr>				
				<tr>
					<td  colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >营业执照注册号：</td>
					<td  colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.BUSINESS_LICENCE_CODE }&nbsp;</td>
					<td  colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >税务登记号：</td>
					<td  colspan="3" width="25%"  class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.TAX_REGISTRATION_NUMBER }&nbsp;</td>		
				</tr>
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
				<tr>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >报告类型：</td>
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CREDIT_TYPE}&nbsp;</td>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >客户额度：</td>
					<td colspan="3" width="25%"  class="ui-widget-content jqgrow ui-row-ltr">${customeredu.GRANT_PRICE }&nbsp;</td>		
				</tr>				
				<tr>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr">租赁方式：</td>
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr" ><c:forEach items="${contractType}" var="contractType"><c:if test="${contractType.CODE eq creditMap.CONTRACT_TYPE}">${contractType.FLAG }</c:if></c:forEach>&nbsp;</td>
					<td colspan="2" width="25%" class="ui-widget-content jqgrow ui-row-ltr">供应商：</td>
					<td colspan="3" width="25%" class="ui-widget-content jqgrow ui-row-ltr">
						<c:forEach var="applydusin" items="${applydu}">
							${applydusin.NAME } 额度：<fmt:formatNumber  value="${applydusin.GRANT_PRICE }" type="currency"/>
						</c:forEach>&nbsp;
					</td>		
				</tr>
				<!-- 小车部分增加是否集团内 -->
				<c:if test="${creditMap.PRODUCTION_TYPE eq '3'}">
				<tr>
					<td colspan="2" width="25%" style="text-align: left;" class="ui-widget-content jqgrow ui-row-ltr">						
						是否集团内：
					</td>
					<td colspan="3" width="25%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">						
						<c:if test="${creditMap.GROUP_INSIDE eq 1}">集团内</c:if>
						<c:if test="${empty creditMap.GROUP_INSIDE or creditMap.GROUP_INSIDE eq 2}">集团外</c:if>
					</td>	
					<td colspan="2" width="25%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">						
						&nbsp;
					</td>	
					<td colspan="3" width="25%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">						
						&nbsp;
					</td>		
				</tr>	
				</c:if>																			
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<c:forEach var="danbaoren" items="${danbaorens}">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" >保证人：</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" >${danbaoren.NAME}&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" >证号：</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">${danbaoren.CODE}&nbsp;</td>	
					<td style="width: 20%;text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${danbaoren.STATE eq '1'}">
								<c:choose>
									<c:when test="${empty danbaoren.VERIFY_RESULT }">
										<c:choose>
											<c:when test="${idCard_verify_auth }">
												<button type="button" class="panel_button" onclick="idcardVerify(this, '${danbaoren.NAME}', '${danbaoren.CODE}');">验证</button>
											</c:when>
											<c:otherwise>
												未验证
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${not empty danbaoren.IMG }">
												<a href="${ctx }/riskAudit/getImg.do?name=${danbaoren.NAME}&code=${danbaoren.CODE}" class="panel_a">${danbaoren.VERIFY_RESULT }</a>
											</c:when>
											<c:otherwise>
												${danbaoren.VERIFY_RESULT }
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
						&nbsp;
					</td>	
					<td class="ui-widget-content jqgrow ui-row-ltr" >本票：</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="statecorpornatu" id="statecorpornatu" value="${danbaoren.STATE }">
						<input type="checkBox" onchange="changeIs()" name="corpMan" id="corpMan" value="${danbaoren.ID }" <c:if test="${danbaoren.ISTYPE==0 }">checked="checked"</c:if>>&nbsp;
					</td>		
				</tr>
				</c:forEach>				
			</table>	
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<c:forEach var="applydusin" items="${applydu}">
				<tr>
					<td rowspan="2" width="50%" class="ui-widget-content jqgrow ui-row-ltr" colspan="5">供应商：${applydusin.NAME }&nbsp;(${applydusin.SUPP_LEVEL })</td>
					<td  width="50%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">供应商类型：<c:if test="${applydusin.SUPP_TYPE == 0 }">非大型供应商</c:if><c:if test="${applydusin.SUPP_TYPE == 1 }">大型供应商</c:if>&nbsp;</td>		
				</tr>				
				<tr>
					<td  width="50%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">营业执照注册号：${applydusin.ORGANIZATION_CERTIFICATE }&nbsp;</td>		
				</tr>
				</c:forEach>
			</table>	
			</c:when>
			
			<c:when test="${creditMap.CUST_TYPE eq 1}">
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					
				<tr >
					<td width="60%" class="ui-widget-content jqgrow ui-row-ltr" rowspan="2" align="center" colspan="6"><h2><%=Constants.COMPANY_NAME %></h2></td>
					<td width="10%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >送件单位：</td>					
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3" >${newbeforemap.DECP_NAME_CN }&nbsp;</td>					
				</tr>
				<tr>
					<td width="10%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >营业人员：</td>					
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${newbeforemap.YINGYENAME }&nbsp;</td>					
				</tr>
				<tr>
					<td width="60%" class="ui-widget-content jqgrow ui-row-ltr" align="center" rowspan="2" colspan="6"><h2>核准函</h2></td>
					<td width="10%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" rowspan="2" width="10%" >权限别：</td>	
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${windMap.RISK_LEVEL }&nbsp;</td>
				</tr> 
				<tr>
					<td width="30%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">${windMap.RISK_LEVEL_MEMO }&nbsp;</td>					
				</tr>
			</table>
			
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="left" colspan="10" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>承租人信息(法人)</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >报告编号：</td>
					<td colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" ><a href="javaScript:void(0)"
							onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport${vipFlag }.selectCreditForShow&credit_id=${creditMap.CREDIT_ID }'">${creditMap.CREDIT_CODE}</a></td>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr">收件日期：</td>		
					<td colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >${newbeforemap.COMMIT_WIND_DATE }</td>
				</tr>
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >承租人：</td>
					<td colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CUST_NAME}&nbsp;</td>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >法人代表：</td>
					<td colspan="3" style="text-align: center" width="25%"  class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.LEGAL_PERSON }&nbsp;</td>		
				</tr>				
				<tr>
					<td  colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >营业执照注册号：</td>
					<td  colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.BUSINESS_LICENCE_CODE }&nbsp;</td>
					<td  colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >税务登记号：</td>
					<td  colspan="3" style="text-align: center" width="25%"  class="ui-widget-content jqgrow ui-row-ltr">${newbeforemap.TAX_REGISTRATION_NUMBER }&nbsp;</td>		
				</tr>
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
				<tr>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >报告类型：</td>
					<td colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr">${creditMap.CREDIT_TYPE}&nbsp;</td>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" >客户额度：</td>
					<td colspan="3" style="text-align: center" width="25%"  class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${customeredu.GRANT_PRICE eq null}">￥0.00</c:if><fmt:formatNumber  value="${customeredu.GRANT_PRICE }" type="currency"/>&nbsp;</td>		
				</tr>				
				<tr>
					<td colspan="2" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr">租赁方式：</td>
					<td colspan="3" style="text-align: center" width="25%" class="ui-widget-content jqgrow ui-row-ltr" ><c:forEach items="${contractType}" var="contractType"><c:if test="${contractType.CODE eq creditMap.CONTRACT_TYPE}">${contractType.FLAG }</c:if></c:forEach>&nbsp;</td>
					
					<!-- 评分 -->
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						评分/评等：
					</td>	
					<td colspan="3" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${empty windMap.SCORE }">未评分</c:when>
							<c:otherwise>
								<fmt:formatNumber pattern="##0" value="${windMap.SCORE }"/>&nbsp;/
								<c:if test="${windMap.SCORE <= 16 }">R6</c:if>
								<c:if test="${windMap.SCORE <= 22 and windMap.SCORE > 16 }">R5</c:if>
								<c:if test="${windMap.SCORE <= 28 and windMap.SCORE > 22 }">R4</c:if>
								<c:if test="${windMap.SCORE <= 34 and windMap.SCORE > 28 }">R3</c:if>
								<c:if test="${windMap.SCORE <= 40 and windMap.SCORE > 34 }">R2</c:if>
								<c:if test="${windMap.SCORE <= 46 and windMap.SCORE > 40 }">R1</c:if>
							</c:otherwise>
						</c:choose>&nbsp;
					</td>
				</tr>
				
				<!-- 小车部分增加是否集团内 -->
				<c:if test="${creditMap.PRODUCTION_TYPE eq '3'}">
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						是否集团内：
					</td>
					<td colspan="3" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						<c:if test="${creditMap.GROUP_INSIDE eq 1}">集团内</c:if>
						<c:if test="${empty creditMap.GROUP_INSIDE or creditMap.GROUP_INSIDE eq 2}">集团外</c:if>
					</td>	
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						&nbsp;
					</td>	
					<td colspan="3" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						&nbsp;
					</td>		
				</tr>	
				</c:if>
				<c:if test="${creditMap.CONTRACT_TYPE eq '7' or creditMap.CONTRACT_TYPE eq '9'}">
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						是否为进口设备，成本不确定：
					</td>
					<td colspan="3" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">						
						<c:if test="${creditMap.IS_IMPORT_EQIP == 1}">是</c:if>
						<c:if test="${creditMap.IS_IMPORT_EQIP != 1}">否</c:if>
					</td>	
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						<c:if test="${creditMap.CONTRACT_TYPE eq '2' }">
							是否为三个月新机：
						</c:if>&nbsp;
					</td>	
					<td colspan="3" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						<c:if test="${creditMap.CONTRACT_TYPE eq '2' }">
							<c:if test="${creditMap.IS_NEW_PRODUCTION eq 'Y' }">是</c:if>
							<c:if test="${creditMap.IS_NEW_PRODUCTION eq 'N' }">否</c:if>
						</c:if>&nbsp;
					</td>	
				</tr>	
				</c:if>																						
			</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<c:forEach var="danbaoren" items="${danbaorens}">
				<tr>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >保证人：</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >${danbaoren.NAME}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >证号：</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${danbaoren.CODE}&nbsp;</td>
					<td style="width: 20%;text-align: center;" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${danbaoren.STATE eq '1'}">
								<c:choose>
									<c:when test="${empty danbaoren.VERIFY_RESULT }">
										<c:choose>
											<c:when test="${idCard_verify_auth }">
												<button type="button" class="panel_button" onclick="idcardVerify(this, '${danbaoren.NAME}', '${danbaoren.CODE}');">验证</button>
											</c:when>
											<c:otherwise>
												未验证
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${not empty danbaoren.IMG }">
												<a href="${ctx }/riskAudit/getImg.do?name=${danbaoren.NAME}&code=${danbaoren.CODE}" class="panel_a">${danbaoren.VERIFY_RESULT }</a>
											</c:when>
											<c:otherwise>
												${danbaoren.VERIFY_RESULT }
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
						&nbsp;
					</td>	
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >本票：</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="hidden" name="statecorpornatu" id="statecorpornatu" value="${danbaoren.STATE }"><input type="checkBox" onchange="changeIs()" name="corpMan" id="corpMan" value="${danbaoren.ID }" <c:if test="${danbaoren.ISTYPE==0 }">checked="checked"</c:if>>&nbsp;</td>		
				</tr>
				</c:forEach>				
			</table>	
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<c:forEach var="applydusin" items="${applydu}">
				<tr>
					<td rowspan="2" width="50%" class="ui-widget-content jqgrow ui-row-ltr" colspan="5">供应商：${applydusin.NAME }&nbsp;(${applydusin.SUPP_LEVEL })</td>
					<td  width="50%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">供应商类型：<c:if test="${applydusin.SUPP_TYPE == 0 }">非大型供应商</c:if><c:if test="${applydusin.SUPP_TYPE == 1 }">大型供应商</c:if>&nbsp;</td>		
				</tr>
				<tr>
					<td  width="50%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">营业执照注册号：${applydusin.BUSINESS_LICENCE }&nbsp;</td>		
				</tr>
				<c:choose><c:when test="${applydusin.GRANT_PRICE eq null }">
				<tr>
					<td  width="100%" colspan="10" class="ui-widget-content jqgrow ui-row-ltr">
					供应商：${applydusin.NAME }没有授信额度&nbsp;
					</td>		
				</tr>
				</c:when><c:otherwise>
				<tr>
					<td  width="40%" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
					授信额度为：
					</td>
					<td  width="20%" style="text-align: right" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
					￥<fmt:formatNumber pattern='#,##0.00' value="${applydusin.GRANT_PRICE }" type="currency"/>&nbsp;
					</td>
					<td  width="20%" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
					剩余额度为：
					</td>
					<td  width="20%" colspan="3" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
					￥<fmt:formatNumber pattern='#,##0.00' value="${applydusin.applyGrantLastPrice }" type="currency"/>&nbsp;
					</td>		
				</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</table>				
				</c:when>
			</c:choose>
			<!-- 设备 -->
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
				<tr>
					<td align="left" colspan="11" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户购买意向</strong>
					</td>
				</tr>
				<TR align="center">
					<TD class="ui-state-default ui-th-ltr zc_grid_head">制造商</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">产品名称</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">规格型号</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">锁码方式</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">留购价(元)</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">含税单价(元)</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">单价(元)</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">数量</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">单位</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">合计</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">备注</TD>
				</TR>
				<c:forEach var="equipmentsList" items="${equipmentsList}">							
				<tr align="center">
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.THING_KIND}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.THING_NAME}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.MODEL_SPEC}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						<c:forEach items="${lockList}" var="items">
							<c:if test="${equipmentsList.LOCK_CODE eq items.CODE}">${items.FLAG }</c:if>
						</c:forEach>&nbsp;
					</td>
					<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${equipmentsList.STAYBUY_PRICE}"/>&nbsp;</td>		
					<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${equipmentsList.SHUI_PRICE}"/>&nbsp;</td>
					<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${equipmentsList.UNIT_PRICE}"/>&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.AMOUNT}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.UNIT}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${equipmentsList.TOTAL}"/>&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${equipmentsList.MEMO}&nbsp;</td>
				</tr>
				<tr align="center">
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">配件说明:</td>
					<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr" colspan="10">${equipmentsList.MOUNTINGS}&nbsp;</td>
				</tr>
				
			</c:forEach>
				<tr>
					<td colspan="5" style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">合计（大写）：<span id="leaseTopricBig"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${sheBeiHeX });</script></td>
					<td colspan="6"   class="ui-widget-content jqgrow ui-row-ltr">合计（小写）：<fmt:formatNumber type="currency" value="${sheBeiHeX}"/></td>					
				</tr>

			</table>
			
			<!-- 归户 -->
			<!-- 2012/09/25 Yang Yun 保证归户 -->
			<table class="panel_table">				
				<tr>
					<th colspan="6" style="text-align: left;">
						<strong>保证归户</strong>
					</th>
				</tr>
				<tr align="center">
					<th>保证人</th>
					<th>合同数</th>
					<th>租金总额</th>
					<th>实际剩余租金</th>
					<th>本金总额</th>
					<th>实际剩余本金</th>
				</tr>
				<tbody id="guar_line">
					<tr>
						<td colspan="6" style="text-align: center;">
							<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
						</td>
					</tr>
				</tbody>
				<%-- <c:forEach items="${guihuForGuar }" var="v">
					<tr align="center">
						<td style="text-align: center">${v.name }</td>
						<td style="text-align: center">${v.projectCount }</td>
						<td style="text-align: center"><fmt:formatNumber type="currency" value="${v.totalRentMoney }"/></td>
						<td style="text-align: center"><fmt:formatNumber type="currency" value="${v.remainingRentMoney }"/></td>
						<td style="text-align: center"><fmt:formatNumber type="currency" value="${v.totalPrincipal }"/></td>
						<td style="text-align: center"><fmt:formatNumber type="currency" value="${v.remainingPrincipal }"/></td>
					</tr>
				</c:forEach> --%>
			</table>
			<!-- 客户归户 -->
			<table class="panel_table">				
				<tr>
					<th colspan="5" style="text-align: left;">
						<strong>合同归户</strong>
					</th>
				</tr>
				<tr align="center">
					<th>合同数</th>
					<th>租金总额</th>
					<th>实际剩余租金</th>
					<th>本金总额</th>
					<th>实际剩余本金</th>
				</tr>
				<tbody id="cust_line">
					<tr>
						<td colspan="6" style="text-align: center;">
							<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
						</td>
					</tr>
				</tbody>
				<%-- <tr align="center">
					<td style="text-align: center">${guihuForCust.projectCount }</td>
					<td style="text-align: center"><fmt:formatNumber type="currency" value="${guihuForCust.totalRentMoney }"/></td>
					<td style="text-align: center"><fmt:formatNumber type="currency" value="${guihuForCust.remainingRentMoney }"/></td>
					<td style="text-align: center"><fmt:formatNumber type="currency" value="${guihuForCust.totalPrincipal }"/></td>
					<td style="text-align: center"><fmt:formatNumber type="currency" value="${guihuForCust.remainingPrincipal }"/></td>
				</tr> --%>
			</table>
			<table class="panel_table">
				<tr>
					<th colspan="6" style="text-align: left;">
						<strong>供应商归户</strong>
					</th>
				</tr>
				<tr>
					<th style="text-align: center!important;">类型</th>
					<th style="text-align: center!important;">是否循环</th>
					<th style="text-align: center!important;">有效期</th>
					<th style="text-align: center!important;">额度</th>
					<th style="text-align: center!important;">已用额度</th>
					<th style="text-align: center!important;">剩余额度</th>
				</tr>
				<tbody id="supl_line">
					<tr>
						<td colspan="6" style="text-align: center;">
							<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
						</td>
					</tr>
				</tbody>
				<%-- <c:forEach items="${creditLine }" var="i">
					<tr>
						<td style="text-align: center;">${i.lineName }</td>
						<td style="text-align: center;">${i.repeatFlag == 1 ? '是' : '否' }</td>
						<td style="text-align: center;">${i.startDate } ~ ${i.endDate }</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.line }"/></td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.realUsedLine }"/></td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.lastLine }"/></td>
					</tr>
				</c:forEach> --%>
			</table>
			
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
				<tr>
					<td align="left" colspan="10"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>本案</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" >风险额度：</td>
					<td colspan="3" width="25%" style="text-align:right"class="ui-widget-content jqgrow ui-row-ltr" ><fmt:formatNumber type="currency" value="${creditshemadetail.LEASE_RZE }"/>&nbsp;</td>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"width="17%">本金余额：</td>			
					<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${creditshemadetail.LEASE_RZE+creditshemadetail.HEAD_HIRE+creditshemadetail.PLEDGE_LAST_PRICE+creditshemadetail.PLEDGE_BACK_PRICE}"/>&nbsp;</td>
				</tr>	
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">申请拨款金额：</td>
					<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${creditshemadetail.LEASE_TOPRIC-creditshemadetail.PLEDGE_AVE_PRICE }"/>&nbsp;</td>					
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">租赁期数(月)：</td>
					<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">${creditshemadetail.LEASE_TERM * creditshemadetail.LEASE_COURSE}&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">保证金：</td>
				<!--  	<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_BACK_PRICE+creditshemadetail.PLEDGE_AVE_PRICE+creditshemadetail.PLEDGE_LAST_PRICE}" />&nbsp;</td>	-->				
					<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_PRICE}" />&nbsp;</td>					
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">保证金成数：</td>
					<td colspan="3" width="25%" style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${creditshemadetail.PLEDGE_PRICE_RATE}" pattern="##0.00"></fmt:formatNumber>%&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">合同TR：</td>
					<td colspan="3" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${creditshemadetail.YEAR_INTEREST }" pattern="##0.00"></fmt:formatNumber>%&nbsp;</td>					
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">税后TR：</td>
					<td colspan="3" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${creditshemadetail.TR_IRR_RATE }" pattern="##0.00"></fmt:formatNumber>%&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">	承作成數:</font></td>
					<td colspan="3" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
							<c:if test="${schemeMap.LEASE_TOPRIC>0 }">					
							<fmt:formatNumber maxFractionDigits="2"  type ="percent" value="${schemeMap.LEASE_RZE /schemeMap.LEASE_TOPRIC }" />				
						    </c:if>
					</td>					
					<td colspan="5" width="50%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="1" width="10%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">保证金入账金流</td>
					<td colspan="7" width="60%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">入我司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保证金：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_CMPRICE}" />元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;稅金：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_CMRATE}" />元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</td>					
					<td colspan="2" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">合计：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_CMRATE+creditshemadetail.PLEDGE_ENTER_CMPRICE}" />元&nbsp;</td>								
				
					</tr>
				<tr>
					<td colspan="1" width="10%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
					<td colspan="7" width="60%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">我司入供应商的：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_MCTOAG}" />元&nbsp;&nbsp;税金：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_MCTOAGRATE}" />元</td>					
					<td colspan="2" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">合计：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_MCTOAG+creditshemadetail.PLEDGE_ENTER_MCTOAGRATE}" />元&nbsp;</td>								
				
					</tr>
				
				<tr>
					<td colspan="1" width="10%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
					<td colspan="7" width="60%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">入供应商&nbsp;&nbsp;&nbsp;&nbsp;保证金：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_AG}" />元;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;税金：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_AGRATE}" />元&nbsp;</td>					
					<td colspan="2" width="25%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">合计：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_ENTER_AG+creditshemadetail.PLEDGE_ENTER_AGRATE}" />元&nbsp;</td>				
				
				</tr>
				<tr>
					<td colspan="2" width="25%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">保证金方式:</td>
					<td colspan="8" width="75%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${creditMap.CONTRACT_TYPE eq 7 }">
								&nbsp;&nbsp;一次性抵冲：&nbsp;&nbsp;
							</c:when>
							<c:otherwise>
								&nbsp;&nbsp;平均抵冲：&nbsp;&nbsp;
							</c:otherwise>
						</c:choose>
						<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_AVE_PRICE}" />元;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用于最后抵冲含税金额/期数：&nbsp;&nbsp;
						<fmt:formatNumber type="currency" value="${(empty creditshemadetail.PLEDGE_LAST_PRICE?0:creditshemadetail.PLEDGE_LAST_PRICE)+(empty creditshemadetail.PLEDGE_LAST_PRICE_TAX?0:creditshemadetail.PLEDGE_LAST_PRICE_TAX) }" />元/${empty creditshemadetail.PLEDGE_LAST_PERIOD?0:creditshemadetail.PLEDGE_LAST_PERIOD };
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期末返还：&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${creditshemadetail.PLEDGE_BACK_PRICE}" />元&nbsp;
					</td>					
				</tr>
				<tr>
					<td colspan="2" width="20%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">租金收取方式：</td>
					<td colspan="8" width="80%" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr"><c:forEach items="${payWayList}" var="item"><c:choose><c:when test="${item.CODE eq schemeMap.PAY_WAY}">${item.FLAG }</c:when></c:choose></c:forEach>&nbsp;</td>					
					<!-- <td colspan="2" width="20%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">拨款方式：</td>
					<td colspan="1" width="10%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><c:forEach items="${bokuanType}" var="item"><c:choose><c:when test="${item.CODE eq reportBoKuanMap.PAYWAY}">${item.FLAG }</c:when></c:choose></c:forEach>&nbsp;<c:if test="${reportBoKuanMap.PAYWAY eq null}">无</c:if></td>
					<td width="10%" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">拨款金额：</td>
					<td colspan="2" width="20%" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><c:if test="${reportBoKuanMap.PAY_MONEY eq null}"><fmt:formatNumber type="currency" value="0.00" /></c:if><fmt:formatNumber type="currency" value="${reportBoKuanMap.PAY_MONEY}" /></td>
					 -->
				</tr>
				<tr>
					<td rowspan="2" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						拨款方式（交机/设定情形）
					</td>
					<td colspan="9" class="ui-widget-content jqgrow ui-row-ltr">
					<c:forEach items="${appropiateList}" var="item">
						<c:if test="${item.TYPE eq 0 }">交机/设定前&nbsp;
							交机/设定前比例:${item.PAYPERCENT}%&nbsp;
							交机/设定前拨款金额:<fmt:formatNumber type="currency" value="${item.APPRORIATEMON}"/>&nbsp;
							交机/设定前拨款给:${item.APPRORIATENAME}&nbsp;
							</c:if>
							
						
					</c:forEach>
					&nbsp;
					</td>
					
				</tr>
				<tr>
					<td colspan="9" class="ui-widget-content jqgrow ui-row-ltr">
					<c:forEach items="${appropiateList}" var="item">
							<c:if test="${item.TYPE eq 1 }">交机/设定后&nbsp;
							交机/设定后比例:${item.PAYPERCENT}%&nbsp;
							交机/设定后拨款金额:<fmt:formatNumber type="currency" value="${item.APPRORIATEMON}" />&nbsp;
							交机/设定后拨款给:${item.APPRORIATENAME}&nbsp;
						</c:if>						
					</c:forEach>
					&nbsp;
					</td>
				</tr>
				
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						拨款方式（勾选）
					</td>
					<td colspan="10" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="radio" id="OnlinetBank" name="appropriation_way" <c:if test="${schemeMap.APPROPRIATION_WAY ne 1 }">checked="checked"</c:if>  value="2" disabled="disabled"><label for="OnlinetBank">网银</label>
						<input type="radio" id="cheque" name="appropriation_way" <c:if test="${schemeMap.APPROPRIATION_WAY eq 1 }">checked="checked"</c:if>  value="1" disabled="disabled"><label  for="cheque">支票</label>
						<span id="chequespan">
						<c:if test="${schemeMap.DEFER_PERIOD >0}">(延迟拨款期数:${schemeMap.DEFER_PERIOD})</c:if>
						</span>
						<br>
					</td>
					
				</tr>
				<tr <c:if test="${schemeMap.APPROPRIATION_WAY ne 1 }">style="display:none"</c:if>>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						背书人
					</td>
					<td colspan="10" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						第一背书人：<input type="text" id="endorser_1" name="endorser_1"  value="${schemeMap.ENDORSER_1 }" disabled="disabled"/>;第二背书人：<input type="text" id="endorser_2" name="endorser_2"  value="${schemeMap.ENDORSER_2 }" disabled="disabled"/>
					</td>	
				</tr>
				
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">供应商保证</td>
					<td colspan="10" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="SUPL" name="SUPL" <c:if test="${view == true }">disabled="disabled"</c:if>>
									<c:forEach items="${suplList}" var="item">
									   <option value="${item.CODE }" <c:if test="${item.CODE eq schemeMap.SUPL_TRUE}">selected="selected"</c:if>>${item.FLAG }</option>
									</c:forEach>
							</select>
							&nbsp;
					</td>
					<!-- <td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						申请拨款金额
					</td>
					<td colspan="4" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
						<fmt:formatNumber type="currency" value="${creditshemadetail.LEASE_TOPRIC-creditshemadetail.PLEDGE_AVE_PRICE }" />&nbsp;
					</td> -->
				<tr>																								
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						管理费收入(影响TR计算)
					</td>
					<td   class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						非管理费收入(不影响TR计算)
					</td>
				</tr>	
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
										&nbsp;${item.CREATE_SHOW_NAME }
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
										<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />
									</td>
								</tr>
							</c:forEach>							
							<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
										&nbsp;${item.CREATE_SHOW_NAME }
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
										<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />
									</td>
								</tr>
							</c:forEach>	
						</table>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
							<c:forEach items="${feeList }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
										&nbsp;${item.CREATE_SHOW_NAME }
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
										<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${feeSetList }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" width="35%">
										&nbsp;${item.CREATE_SHOW_NAME }
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="65%" style="font-size: 14px;">
										<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="5">
						<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
					</td>
				</tr>
				<c:forEach var="item" items="${irrMonthPaylines}" varStatus="status">
					<tr>
						<td style="text-align:  center"  class="ui-widget-content jqgrow ui-row-ltr">
							应付租金
						</td>
						<td style="text-align:  right"  style="text-align:  right" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />
						</td>
						<td  style="text-align:  center" class="ui-widget-content jqgrow ui-row-ltr">
							对应期次
						</td>
						<td   style="text-align:  center" class="ui-widget-content jqgrow ui-row-ltr">
							第${item.IRR_MONTH_PRICE_START}期到第${item.IRR_MONTH_PRICE_END}期
									
						</td>
					</tr>
				</c:forEach>
				<c:if test="${schemeMap.TAX_PLAN_CODE eq '2' }">
					<c:forEach var="item" items="${newIrrMonthPaylines}" varStatus="status">
						<tr>
							<td style="text-align:  center"  class="ui-widget-content jqgrow ui-row-ltr">
								含税应付租金
							</td>
							<td style="text-align:  right"  style="text-align:  right" class="ui-widget-content jqgrow ui-row-ltr">
								&nbsp;<fmt:formatNumber value="${item.MONTH_PRICE_TAX}" type="currency" />
							</td>
							<td  style="text-align:  center" class="ui-widget-content jqgrow ui-row-ltr">
								对应期次
							</td>
							<td   style="text-align:  center" class="ui-widget-content jqgrow ui-row-ltr">
								第${item.MONTH_PRICE_START}期到第${item.MONTH_PRICE_END}期
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >				
				<tr>
					<td align="left" colspan="10"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>添加保险费</strong>
					</td>
				</tr>
				<TR align="center">
					<TD class="ui-state-default ui-th-ltr zc_grid_head">保险项目</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">保险期间</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">保险费率</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">保险费用</TD>
					<TD colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">备注</TD>
				</TR>	
				<c:forEach items="${insuresList}" var="insuresList" >						
				<tr align="center">
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${insuresList.INTP_NAME}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${insuresList.START_DATE} 到 ${insuresList.END_DATE}&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">${insuresList.INSURE_RATE}%&nbsp;</td>
					<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${insuresList.INSURE_PRICE}" />&nbsp;</td>
					<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" colspan="4">${insuresList.MEMO}&nbsp;</td>
				</tr>
				</c:forEach>				
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" colspan="5">保险费合计（大写）：<span id="leaseTopricBig2"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig2').innerHTML=atoc(${insureHeX });</script></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" colspan="5">保险费合计(小写):<fmt:formatNumber type="currency" value="${insureHeX}" />&nbsp;</td>				
				</tr>	
				
				</table>
			<table align="center" width="95%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
				<tr>
					<td align="left" colspan="10"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>其他费用</strong>
					</td>
				</tr>			
				<TR align="center">
					<TD class="ui-state-default ui-th-ltr zc_grid_head">费用名称</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">费用金额</TD>
					<TD class="ui-state-default ui-th-ltr zc_grid_head">产生费用时间</TD>
					<TD colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">备注</TD>
				</TR>
				<c:forEach items="${otherPriceList}" var="otherPriceList" >							
					<TR align="center">
						<TD class="ui-widget-content jqgrow ui-row-ltr">${otherPriceList.OTHER_NAME}&nbsp;</TD>
						<TD style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${otherPriceList.OTHER_PRICE}" />&nbsp;</TD>
						<TD class="ui-widget-content jqgrow ui-row-ltr">${otherPriceList.OTHER_DATE}&nbsp;</TD>
						<TD colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">${otherPriceList.MEMO}&nbsp;</TD>
					</TR>					
				</c:forEach>
				<tr>
					<td colspan="5"  class="ui-widget-content jqgrow ui-row-ltr">合计（大写）：<span id="leaseTopricBig3"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig3').innerHTML=atoc(${otherHeX });</script></td>
					<td colspan="5"  class="ui-widget-content jqgrow ui-row-ltr">合计(小写):<fmt:formatNumber type="currency" value="${otherHeX}" />&nbsp;</td>				
				</tr>							
			</TABLE>
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
				<tr>
					<td align="left" colspan="6"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>调查说明</strong>
					</td>
				</tr>
				<c:forEach items="${explainlist}" var="explainlist" >											
					<TR>
						<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">项目名称</TD>
						<TD class="ui-widget-content jqgrow ui-row-ltr">${explainlist.PROJECT_NAME}&nbsp;</TD>
					</TR>
					<TR>
						<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">内容</TD>
						<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${explainlist.PROJECT_CONTENT}&nbsp;</TEXTAREA></pre></TD>
					</TR>
				</c:forEach>
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">建议承做理由</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">								
						<TABLE align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${empty pSIdeaMap.PROJECT_CONTENT ? '无' : pSIdeaMap.PROJECT_CONTENT}&nbsp;</TEXTAREA></pre></TD>	
						</TR>
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${pSIdeaMap.NAME} &nbsp; 时间：<fmt:formatDate value="${pSIdeaMap.CRATE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>
						</TR>
						</TABLE>
					</TD>					
				</TR>
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">其他租赁条件</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">								
						<TABLE align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${empty pSIdeaMapOther.PROJECT_CONTENT ? '无' : pSIdeaMapOther.PROJECT_CONTENT}&nbsp;</TEXTAREA></pre></TD>	
						</TR>
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="right"><c:if test="${not empty pSIdeaMapOther.NAME}">签字：${pSIdeaMapOther.NAME} &nbsp; 时间：<fmt:formatDate value="${pSIdeaMapOther.CRATE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>&nbsp;</TD>
						</TR>
						</TABLE>
					</TD>					
				</TR>	
				<%-- <TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">业务员意见</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">								
						<TABLE align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${pSIdeaMap.PROJECT_CONTENT}&nbsp;</TEXTAREA></pre></TD>	
						</TR>
						<TR>
							<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${pSIdeaMap.NAME} &nbsp; 时间：<fmt:formatDate value="${pSIdeaMap.CRATE_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>
						</TR>
						</TABLE>
					</TD>					
				</TR> --%>
				</table>
			<table align="center" width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">单位主管审核意见</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">								
						<TABLE align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<TR>
								<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${manageMap.MEMO}&nbsp;</TEXTAREA></pre></TD>	
							</TR>
							<TR>
								<TD class="ui-widget-content jqgrow ui-row-ltr" align="right">签字：${manageMap.NAME} &nbsp; 时间：<fmt:formatDate value="${manageMap.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>
							</TR>		
						</TABLE>
					</TD>					
				</TR>
				<TR>
					<TD class="ui-widget-content jqgrow ui-row-ltr" width="15%" align="center">业务副总审核意见</TD>
					<TD class="ui-widget-content jqgrow ui-row-ltr">								
						<TABLE align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<TR>
								<TD class="ui-widget-content jqgrow ui-row-ltr" align="center"><pre><TEXTAREA  ROWS="6" COLS="145">${empty manageMapDGM.MEMO ? '无' : manageMapDGM.MEMO}&nbsp;</TEXTAREA></pre></TD>	
							</TR>
							<TR>
								<TD class="ui-widget-content jqgrow ui-row-ltr" align="right"><c:if test="${not empty manageMapDGM.NAME}">签字：${manageMapDGM.NAME} &nbsp; 时间：<fmt:formatDate value="${manageMapDGM.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>&nbsp;</TD>
							</TR>		
						</TABLE>
					</TD>					
				</TR>
			</table>
				<input type="hidden" name="corpManBox" id="corpManBox">		
				<script type="text/javascript">
					function changeIs()
					{
						var y="";
						var x="";
						var corpMan=document.getElementsByName("corpMan");
						var state=document.getElementsByName("statecorpornatu");
						for(i=0;i<corpMan.length;i++)
						{
							
							if(corpMan[i].checked)
							{
								x+=corpMan[i].value+",0";
							}
							else
							{
								x+=corpMan[i].value+",1";
							}
							if(i+1<corpMan.length)
							{
								x+=";";
							}
						}
						
						for(j=0;j<state.length;j++)
						{
							if(j+1<state.length)
							{
								y+=state[j].value+",";
							}
							else
							{
								y+=state[j].value;
							}
						}
						
						document.getElementById("corpManBox").value=x;
						document.getElementById("creditCustType").value=y;
					}
				</script>					