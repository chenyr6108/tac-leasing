<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script>
		function addRow() {
			var tableName=document.getElementById("industrialTable");
			var row=tableName.insertRow(tableName.rows.length);
			var sed=tableName.rows.length;
			cell=row.insertCell(0); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML ="<input id=\"PRODUCTION_NAME"+sed+"\" name=\"PRODUCTION_NAME\" style=\"width:200px;\" /><font color=\"red\">*</font>";
			cell=row.insertCell(1); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML ="<input id=\"INNER_INVERSE"+sed+"\" name=\"INNER_INVERSE\" style=\"width:50px;\" onkeyup=\"value=value.replace(/[^\\d]/g,'')\" />%<font color=\"red\">*</font>";
			cell=row.insertCell(2); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML ="<input id=\"EXTERNAL_INVERSE"+sed+"\" name=\"EXTERNAL_INVERSE\" style=\"width:50px;\" onkeyup=\"value=value.replace(/[^\\d]/g,'')\" />%<font color=\"red\">*</font>";
			cell=row.insertCell(3); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML ="<input id=\"GAIN_INVERSE"+sed+"\" name=\"GAIN_INVERSE\" style=\"width:50px;\" onkeyup=\"value=value.replace(/[^\\d]/g,'')\" />%<font color=\"red\">*</font>";
			cell=row.insertCell(4); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML ="<img src=\"../images/u103.gif\"><input type=\"button\" onclick=\"delRow.call(this)\" class=\"ui-state-default ui-corner-all\" style=\"cursor: pointer;\" value=\"删除\">";
			row.appendChild(cell);
		}
		
		function delRow() {
		        var tr=this.parentNode.parentNode;
		        tr.parentNode.removeChild(tr); 
		}
		
		function saveIndustrial() {
			//验证主要产品
/* 			for(var i=0;i<document.getElementsByName("PRODUCTION_NAME").length;i++) {
				if(blank(document.getElementsByName("PRODUCTION_NAME")[i],"产品名称")) {
					return;
				}
			}
			for(var i=0;i<document.getElementsByName("INNER_INVERSE").length;i++) {
				if(blank(document.getElementsByName("INNER_INVERSE")[i],"内销比例")) {
					return;
				}
			}
			for(var i=0;i<document.getElementsByName("EXTERNAL_INVERSE").length;i++) {
				if(blank(document.getElementsByName("EXTERNAL_INVERSE")[i],"外销比例")) {
					return;
				}
			}
			for(var i=0;i<document.getElementsByName("GAIN_INVERSE").length;i++) {
				if(blank(document.getElementsByName("GAIN_INVERSE")[i],"营收比重")) {
					return;
				}
			} */
			$("#industrialAnalyseForm").submit();
		}
</script>
<form action="${ctx}/servlet/defaultDispatcher" name="industrialAnalyseForm" id="industrialAnalyseForm" method="post">
	<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
	<input type="hidden" name="credit_id" value="${creditMap.ID }">
	<input type="hidden" id="__action" name="__action" value="creditPaylistService.saveIndustrialAnalyse">
	<input type="hidden" id="showFlag" name="showFlag" value="6">
	<input type="hidden" id="word" name="word" value="up">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    <div class="zc_grid_body jqgrowleft">
	        <div class="ui-state-default ui-jqgrid-hdiv" style="background-color:white">
	       <%--  <table width="980px" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="industrialTable">
			<tr>
				<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
					<b style="font-size: 14px;">&nbsp;&nbsp;主要产品</b>
				</td>
				<td style="text-align: right;height: 24px;width: 70px" class="ui-widget-content jqgrow ui-row-ltr">
					&nbsp;
				 	<c:if test="${READ ==false }">
						<img src="${ctx }/images/u100.gif"><input type="button" value="添加" onclick="addRow()" class="ui-state-default ui-corner-all" style="cursor: pointer;">
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center;width: 220px;">
					产品
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					内销比例
				</td>
			 
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					外销比例
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					营收比重
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center;width: 70px">
					&nbsp;
				</td>
			</tr>
			<c:forEach items="${productionList }" var="item">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						<input name="PRODUCTION_NAME" <c:if test="${READ == true }">readonly="readonly"</c:if> value="${item.PRODUCTION_NAME }" style="width:200px;"><font color="red">*</font>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						<input name="INNER_INVERSE" <c:if test="${READ == true }">readonly="readonly"</c:if> value="${item.INNER_INVERSE }" style="width:50px;">%<font color="red">*</font>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						<input name="EXTERNAL_INVERSE" <c:if test="${READ == true }">readonly="readonly"</c:if> value="${item.EXTERNAL_INVERSE }" style="width:50px;">%<font color="red">*</font>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						<input name="GAIN_INVERSE" <c:if test="${READ == true }">readonly="readonly"</c:if> value="${item.GAIN_INVERSE }" style="width:50px;">%<font color="red">*</font>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					    <c:if test="${READ == false }">
							<img src="../images/u103.gif"><input type="button" onclick="delRow.call(this)" class="ui-state-default ui-corner-all" style="cursor: pointer;" value="删除">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br><br><br> --%>
		<table width="980px" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;&nbsp;产业环境及趋势<font style="font-size: 12px;" color="#000000">(如:市场规模及成长状况,法规政策和未来科技影响,产业特征,产销价值链,进入障碍及替代品威胁)</font>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="MARKET_STATUS" name="MARKET_STATUS">${industryMap.MARKET_STATUS }</textarea>
				</td>
			</tr>
			<%-- <tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<b style="font-size: 14px;">:</b>
					<br>
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="POLICY_EFFECT" name="POLICY_EFFECT">${industryMap.POLICY_EFFECT }</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<b style="font-size: 14px;">:</b>
					<br>
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="INDUSTRY_CHARACTER" name="INDUSTRY_CHARACTER">${industryMap.INDUSTRY_CHARACTER }</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<b style="font-size: 14px;">:</b>
					<br>
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="VALUE_CHAIN" name="VALUE_CHAIN">${industryMap.VALUE_CHAIN }</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<b style="font-size: 14px;">:</b>
					<br>
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="BALK_BULLY" name="BALK_BULLY">${industryMap.BALK_BULLY }</textarea>
				</td>
			</tr> --%>
		</table>
		<br><br><br>
		<table width="980px" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="wuzd">
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head" >
					&nbsp;&nbsp;风险点分析<font style="font-size: 12px;" color="#000000">(如:优势,缺点,机会,威胁分析)</font>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr" >
					<textarea rows="6" cols="150" <c:if test="${READ == true }">readonly="readonly"</c:if> id="RISK_ANALYSE" name="RISK_ANALYSE">${industryMap.RISK_ANALYSE }</textarea>
				</td>
			</tr>
		</table>
		<br><br>
				<c:if test="${READ == false }">
			        <table align="center" width="950px" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td colspan="5" align="center">
								<input type="button" value="保  存" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="saveIndustrial()">
								<input type="reset" value="重  置" class="ui-state-default ui-corner-all" style="cursor: pointer;">
							</td>
						</tr>
					</table>
				</c:if>
			 	<c:if test="${commit_flag eq 1}">
				 	<table align="center" width="950px" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" align="center">
		 							<input type="button" class="ui-state-default ui-corner-all"  value="提交" onclick="commitCredit()" id="commitButton"/>
		 						</td>
		 					</tr>
		 			</table>
	 			</c:if>
	        </div>
	    </div>
	</div>
</form>
<script>
	function commitCredit() {
		document.getElementById("commitButton").disabled=true;
		location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.commitCrditToWindControl&credit_id=${creditMap.ID }&isSalesDesk=${isSalesDesk }';
	}
</script>