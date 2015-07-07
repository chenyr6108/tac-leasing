<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
			<script type="text/javascript" src="${ctx }/credit/js/selectEquipment.js"></script>
			<script type="text/javascript" src="${ctx }/credit/js/schemeControl.js"></script>
			<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
			<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
			<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>		
			<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
			<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
			<script type="text/javascript" src="${ctx }/productcredit/js/productcreditManage.js"></script>
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>授信添加</title>
		<script type="text/javascript">
		$(function(){
		    //$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
		    //$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		    $("input[name$='DATE']").datepicker($.datepicker.regional['zh-CN']);
		    var modal = "${modal}";
		    if(modal == "show"){
		    	$("#saveBut").hide();
		    }
		    $("#formaddupd").find("input").each(function (){
		    	if(modal == "show"){
		    		$(this).attr("disabled", true);
		    	} else {
		    		if($(this).attr("type") == "radio"){
			    		$(this).data("old_data", $(this).attr("checked"));
			    	} else {
			    		$(this).data("old_data", $(this).val().replace(/,/g, ""));
			    	}
		    	}
			});
		});
		
		function defaultDate(){
			var now = new Date();
			$("#credit_table").find("tr").each(function (){
				var texts = $(this).find("input");
				if (texts.length > 0 && $.trim(texts.eq(0).val()) != "") {
					$(this).find("input[name$='DATE']").each(function (){
						if ($.trim($(this).val()) == "") {
							$(this).val(now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate());
						}
					});
				}
		    });
		}
		
		function backToPage(){
			$("#backFrom").submit();
		}
		
		function updateLastCredit(creditId, lastId){
			var last = $("#" + lastId).val().replace(/,/g, "");
			var credit = $("#" + creditId).val().replace(/,/g, "");
			if($.trim(credit) == "" || parseFloat(credit) == 0){
				$("#" + creditId).val("0");
				$("#" + lastId).val("0");
				cleanDateRange($("#" + creditId));
				$("#" + creditId).parent().parent().find("input[type='checkbox']").each(function (){
					$(this).attr("checked", false);
					$("#" + $(this).attr("class")).val("N");
				});
			} else {
				var old_last = parseFloat($("#" + lastId).data("old_data") == "" ? 0 : $("#" + lastId).data("old_data"));
				var old_credit = parseFloat($("#" + creditId).data("old_data") == "" ? 0 : $("#" + creditId).data("old_data"));
				var credit = parseFloat(credit);
				$("#" + lastId).val(old_last + (credit - old_credit));
				defaultDateRange($("#" + creditId));
				$("#" + creditId).parent().parent().find("input[type='checkbox']").each(function (){
					$(this).attr("checked", true);
					$("#" + $(this).attr("class")).val("Y");
				});
			}
			
		}
		
		function cleanDateRange(e){
			$(e).parent().parent().find("input[type='text'][name$='DATE']").each(function (){
				$(this).val("");
			});
		}
		
		function defaultDateRange(e){
			var date = new Date();
			$(e).parent().parent().find("input[type='text'][name$='DATE']").each(function (){
				if ($.trim($(this).val()) == "" || $.trim($(this).val()) == "0") {
					if($(this).attr("name").indexOf("_START_DATE") != -1){
						date = date;
					} else if ($(this).attr("name") == "ADVANCE_END_DATE") {
						date.setDate(date.getDate() + 3 * 30);
					} else {
						date.setDate(date.getDate() + 365);
					}
					$(this).val(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
				}
			});
		}
		
		function saveProductCredit(){
			var canSubmit = true;
			$("input[type='text']").each(function (){
				$(this).val($(this).val().replace(/,/g, ""));
			});
			$("#credit_table").find("td").each(function (){
				if($(this).attr("cellIndex") == 2){
					$(this).find("input").each(function (){
						var reg_int = /^\d+(.\d+)?$/;
						if ($.trim($(this).val()) != "" && !reg_int.exec($(this).val())){
							alert("授信额度必须是数字！");
							$(this).select();
							$(this).focus();
							canSubmit = false;
							return false;
						}
					});
					if (!canSubmit) {
						return false;
					}
				}
			});
			if (canSubmit) {
				$("#formaddupd").submit();
			}
		}
		
		function changeHasValue(e){
			if($(e).attr("checked")){
				$("#" + $(e).attr("class")).val("Y");
				$(e).parent().parent().find("input[type!='hidden']").each(function (){
					if($(this).attr("type") == "radio"){
						$(this).attr("checked", $(this).data("old_data"));
					}
					if($.trim($(this).val()) == ""){
						$(this).val($(this).data("old_data") == "" ? "0" : $(this).data("old_data"));
					}
				});
				defaultDateRange($(e));
			} else {
				$("#" + $(e).attr("class")).val("N");
				$(e).parent().parent().find("input[type!='hidden']").each(function (){
					if($(this).attr("type") == "radio" && $(this).attr("value") == "1"){
						$(this).attr("checked", false);
					} else if($(this).attr("type") == "radio" && $(this).attr("value") == "0"){
						$(this).attr("checked", true);
					} else {
						$(this).val("");
					}
				});
			}
		}
		
		</script>
	</head>
<body>
	<form action="../servlet/defaultDispatcher" name="formaddupd" id="formaddupd" method="post">
		<input type="hidden" name="__action" id="__action" value="productCredit.creatProductCreditPlan">
		<input type="hidden" name="AUDIT" id="AUDIT" value=""/>
		<input type="hidden" name="modal" id="modal" value="${modal }"/>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;授信添加</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${product.ID }"/>
		<input type="hidden" name="product_id" id="product_id" value="${product.ID }"/>
		<input type="hidden" name="PDGP_ID" id="PDGP_ID" value="${grantplan.PDGP_ID }"/>
		<input type="hidden" name="DEL_UNION_ID" id="DEL_UNION_ID" value=""/>
		<table class="panel_table" style="width: 100%">
			<tr>
				<th style="text-align: left; width: 10%">供应商：</th>
				<td style="text-align: left; width: 40%">${product.NAME }(${product.SUPP_LEVEL })&nbsp;</td>
				<th style="text-align: left; width: 10%">供应商编号：</th>
				<td style="text-align: left; width: 40%">${product.CODE }&nbsp;</td>
			</tr>
			<tr>
				<th style="text-align: left;">法定代表人：</th>
				<td style="text-align: left;" colspan="3">${product.COMPANY_CORPORATION }&nbsp;</td>
			</tr>
			<tr>
				<th style="text-align: left;">签呈编号：</th>
				<td style="text-align: left;"><input type="text" name="CUGP_CODE" id="CUGP_CODE" value="${grantplan.CUGP_CODE }" class="panel_text" style="width: 200px;"></td>
				<th style="text-align: left;">授信状态：</th>
				<td style="text-align: left;">
					<c:if test="${grantplan.CUGP_STATUS eq 0}"><font color="red">已授信</font></c:if>
					<c:if test="${grantplan.CUGP_STATUS eq 1}"><font color="red">取消</font></c:if>
					<c:if test="${empty grantplan.CUGP_STATUS}"><font color="red">未授信</font></c:if>&nbsp;
				</td>
			</tr>
			<tr>
				<th colspan="4">
					<table class="panel_table" id="credit_table">
						<tr>
							<th>是否授信</th>
							<th>授信类型</th>
							<th>授信额度</th>
							<th>是否循环</th>
							<th>授信日期</th>
							<th>授信余额</th>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${grantplan.LIEN_HAS eq 'Y' }">checked="checked"</c:if> class="LIEN_HAS">
								<input type="hidden" name="LIEN_HAS" id="LIEN_HAS" value="${grantplan.LIEN_HAS }">
							</td>
							<td>连保</td>
							<td>
								<input type="text" name="LIEN_GRANT_PRICE" id="LIEN_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_GRANT_PRICE }"/>" onchange="updateLastCredit('LIEN_GRANT_PRICE', 'LIEN_LAST_PRICE');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="LIEN_REPEAT_CREDIT" value="1" <c:if test="${grantplan.LIEN_REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="LIEN_REPEAT_CREDIT"  <c:if test="${grantplan.LIEN_REPEAT_CREDIT==0 or empty grantplan.LIEN_REPEAT_CREDIT }">checked="checked"</c:if> value="0">否
							</td>
							<td>
								<input type="text" class="panel_text" name="LIEN_START_DATE" value="${grantplan.LIEN_START_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="LIEN_END_DATE" value="${grantplan.LIEN_END_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="LIEN_LAST_PRICE" id="LIEN_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.LIEN_LAST_PRICE }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${grantplan.REPURCH_HAS eq 'Y' }">checked="checked"</c:if> class="REPURCH_HAS">
								<input type="hidden" name="REPURCH_HAS" id="REPURCH_HAS" value="${grantplan.REPURCH_HAS }">
							</td>
							<td>回购</td>
							<td>
								<input type="text" name="REPURCH_GRANT_PRICE" id="REPURCH_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_GRANT_PRICE }"/>" onchange="updateLastCredit('REPURCH_GRANT_PRICE', 'REPURCH_LAST_PRICE');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="REPURCH_REPEAT_CREDIT" value="1" <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="REPURCH_REPEAT_CREDIT"  <c:if test="${grantplan.REPURCH_REPEAT_CREDIT==0 or empty grantplan.REPURCH_REPEAT_CREDIT}">checked="checked"</c:if> value="0">否
							</td>
							<td>
								<input type="text" class="panel_text" name="REPURCH_START_DATE" value="${grantplan.REPURCH_START_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="REPURCH_END_DATE" value="${grantplan.REPURCH_END_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="REPURCH_LAST_PRICE" id="REPURCH_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.REPURCH_LAST_PRICE }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${grantplan.ADVANCEMACHINE_HAS eq 'Y' }">checked="checked"</c:if> class="ADVANCEMACHINE_HAS">
								<input type="hidden" name="ADVANCEMACHINE_HAS" id="ADVANCEMACHINE_HAS" value="${grantplan.ADVANCEMACHINE_HAS }">
							</td>
							<td>交机前拨款</td>
							<td>
								<input type="text" name="ADVANCEMACHINE_GRANT_PRICE" id="ADVANCEMACHINE_GRANT_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_GRANT_PRICE }"/>" onchange="updateLastCredit('ADVANCEMACHINE_GRANT_PRICE', 'ADVANCEMACHINE_LAST_PRICE');" class="panel_text">
							</td>
							<td>
								<input type="radio" name="ADVANCE_MACHINEREPEAT_CREDIT" value="1" <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==1 }">checked="checked"</c:if>>是&nbsp;
								<input type="radio"  name="ADVANCE_MACHINEREPEAT_CREDIT"  <c:if test="${grantplan.ADVANCE_MACHINEREPEAT_CREDIT==0 or empty grantplan.ADVANCE_MACHINEREPEAT_CREDIT }">checked="checked"</c:if> value="0">否
							</td>
							<td>
								<input type="text" class="panel_text" name="ADVANCE_START_DATE" value="${grantplan.ADVANCE_START_DATE}" readonly="readonly">~
								<input type="text" class="panel_text" name="ADVANCE_END_DATE" value="${grantplan.ADVANCE_END_DATE}" readonly="readonly">
							</td>
							<td>
								<input type="text" name="ADVANCEMACHINE_LAST_PRICE" id="ADVANCEMACHINE_LAST_PRICE" value="<fmt:formatNumber pattern="#,##0.00" value="${grantplan.ADVANCEMACHINE_LAST_PRICE }"/>" readonly="readonly" class="panel_text">
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" onclick="changeHasValue(this);" <c:if test="${grantplan.VOICE_HAS eq 'Y' }">checked="checked"</c:if> class="VOICE_HAS">
								<input type="hidden" name="VOICE_HAS" id="VOICE_HAS" value="${grantplan.VOICE_HAS }">
							</td>
							<td>发票待补</td>
							<td>
								<input type="text" class="panel_text" id="VOICE_CREDIT" name="VOICE_CREDIT" value="${grantplan.VOICE_CREDIT}" onchange="updateLastCredit('VOICE_CREDIT', 'VOICE_LAST_CREDIT');">
							</td>
							<td>
								<input type="radio" class="panel_text" value="1" <c:if test="${grantplan.VOICE_CONTINUE eq 1}">checked="checked"</c:if> name="VOICE_CONTINUE">是&nbsp;
								<input type="radio" class="panel_text" value="0" <c:if test="${grantplan.VOICE_CONTINUE eq 0 or empty grantplan.VOICE_CONTINUE}">checked="checked"</c:if> name="VOICE_CONTINUE">否
							</td>
							<td>
								<input type="text" class="panel_text" name="VOICE_START_DATE" value="${grantplan.VOICE_START_DATE}" >~
								<input type="text" class="panel_text" name="VOICE_END_DATE" value="${grantplan.VOICE_END_DATE}" >
							</td>
							<td>
								<input type="text" class="panel_text" id="VOICE_LAST_CREDIT" name="VOICE_LAST_CREDIT"  value="${grantplan.VOICE_LAST_CREDIT}" readonly="readonly">
							</td>
						</tr>
					</table>
				</th>
			</tr>
			<tr>
	   			<th style="text-align: center;" colspan="6">
		   			<button type="button" name="saveBut" id="saveBut" onclick="saveProductCredit();" class="panel_button">保  存</button>
		   			<button type="button" onclick="backToPage();" class="panel_button">返回</button>
	   			</th>
	   		</tr>
	   </table>
	   
	</div>
	</div>
	</div>
	</form>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" style="margin-top: -11px;">
		<input type="hidden" name="__action" id="__action" value="productCredit.getProductCreditJsp">
		<input type="hidden" name="modal" value="${modal }"/>
		<input type="hidden" name="PRODUCT_ID" value="${product.ID }"/>
		<table class="panel_table" style="margin-top: 0px;">
			<tr>
				<th colspan="7" style="text-align: left;">
					授信历史记录
				</th>
			</tr>
			<tr>
				<th colspan="7" style="text-align: right;">
					<page:pagingToolbarTop pagingInfo="${logInfo }"/>
				</th>
			</tr>
			<tr>
				<th rowspan="2">序号</th>
				<th colspan="4">内容(额度，是否循环，日期区间)</th>
				<th rowspan="2">修改时间</th>
				<th rowspan="2">修改人</th>
			</tr>
			<tr>
				<th>连保</th>
				<th>回购</th>
				<th>交机前拨款</th>
				<th>发票待补次数</th>
			</tr>
			<c:set var="indext"/>
			<c:forEach items="${logInfo.resultList }" var="item" varStatus="i">
			<c:choose>
				<c:when test="${i.count == fn:length(logInfo.resultList)}">
					<c:set var="indext" value="${i.count - 1}"/>
				</c:when>
				<c:otherwise>
					<c:set var="indext" value="${i.count}"/>
				</c:otherwise>
			</c:choose>
			<tr>
				<td>${i.count }</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].LIEN_GRANT_PRICE != item.LIEN_GRANT_PRICE }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.LIEN_GRANT_PRICE }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].LIEN_REPEAT_CREDIT != item.LIEN_REPEAT_CREDIT }">style="color: red"</c:if>>
						<c:if test="${item.LIEN_REPEAT_CREDIT==1 }">是</c:if>
						<c:if test="${item.LIEN_REPEAT_CREDIT==0 or empty item.LIEN_REPEAT_CREDIT }">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].LIEN_START_DATE != item.LIEN_START_DATE }">style="color: red"</c:if>>
						${item.LIEN_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].LIEN_END_DATE != item.LIEN_END_DATE }">style="color: red"</c:if>>
						${item.LIEN_END_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].REPURCH_GRANT_PRICE != item.REPURCH_GRANT_PRICE }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.REPURCH_GRANT_PRICE }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].REPURCH_REPEAT_CREDIT != item.REPURCH_REPEAT_CREDIT }">style="color: red"</c:if>>
						<c:if test="${item.REPURCH_REPEAT_CREDIT==1 }">是</c:if>
						<c:if test="${item.REPURCH_REPEAT_CREDIT==0 or empty item.REPURCH_REPEAT_CREDIT}">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].REPURCH_START_DATE != item.REPURCH_START_DATE }">style="color: red"</c:if>>
						${item.REPURCH_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].REPURCH_END_DATE != item.REPURCH_END_DATE }">style="color: red"</c:if>>
						${item.REPURCH_END_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].ADVANCEMACHINE_GRANT_PRICE != item.ADVANCEMACHINE_GRANT_PRICE }">style="color: red"</c:if>>
						<fmt:formatNumber pattern="#,##0.00" value="${item.ADVANCEMACHINE_GRANT_PRICE }"/>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].ADVANCE_MACHINEREPEAT_CREDIT != item.ADVANCE_MACHINEREPEAT_CREDIT }">style="color: red"</c:if>>
						<c:if test="${item.ADVANCE_MACHINEREPEAT_CREDIT==1 }">是</c:if>
						<c:if test="${item.ADVANCE_MACHINEREPEAT_CREDIT==0 or empty item.ADVANCE_MACHINEREPEAT_CREDIT }">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].ADVANCE_START_DATE != item.ADVANCE_START_DATE }">style="color: red"</c:if>>
						${item.ADVANCE_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].ADVANCE_END_DATE != item.ADVANCE_END_DATE }">style="color: red"</c:if>>
						${item.ADVANCE_END_DATE}
					</font>；&nbsp;
				</td>
				<td style="text-align: left;">
					<font <c:if test="${logInfo.resultList[indext].VOICE_CREDIT != item.VOICE_CREDIT }">style="color: red"</c:if>>
						${item.VOICE_CREDIT}
					</font>，
					<font <c:if test="${logInfo.resultList[indext].VOICE_CONTINUE != item.VOICE_CONTINUE }">style="color: red"</c:if>>
						<c:if test="${item.VOICE_CONTINUE eq 1}">是</c:if>
						<c:if test="${item.VOICE_CONTINUE eq 0 or empty item.VOICE_CONTINUE}">否</c:if>
					</font>，
					<font <c:if test="${logInfo.resultList[indext].VOICE_START_DATE != item.VOICE_START_DATE }">style="color: red"</c:if>>
						${item.VOICE_START_DATE}
					</font>~
					<font <c:if test="${logInfo.resultList[indext].VOICE_END_DATE != item.VOICE_END_DATE }">style="color: red"</c:if>>
						${item.VOICE_END_DATE}
					</font>
				</td>
				<td><fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${item.CREATE_BY}</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="7" style="text-align: right;">
					
				</th>
			</tr>
		</table>
		<page:pagingToolbar pagingInfo="${logInfo }"/>
	</form>
	
	<form action="../servlet/defaultDispatcher" name="backFrom" id="backFrom" method="post">
		<input type="hidden" name="__action" value="productCredit.queryAllProductCredit">
		<input type="hidden" name="res" value="ccm">
	</form>	
</body>
</html>