<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
    pageContext.setAttribute("ctx", request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctx }/script/search.css" rel="stylesheet"/>
<link type="text/css" href="${ctx }/resources/jquery/plugins/jq-grid/ui.jqgrid.css" rel="stylesheet"></link>
<link type="text/css" href="${ctx }/resources/jquery/themes/redmond/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<style type="text/css">
	* {
		font-size: 12px;
	}
	
	#main {
		text-align: left;
	}
	
	div.zc_grid {
		font-size: 12px;
	}
	
	table.zc_grid_title {
		width: 100%;
	}
	
	div.zc_grid_body {
		
	}
	
	th.zc_grid_head {
		text-align: center;
		border-bottom: 1px solid #C5DBEC;
	}
	
	.jqgrow table.zc_grid_table {
		width: 99%;
		margin: 5px 0.5%;
		border-left: 1px solid #C5DBEC;
	}
	
	.huise {
		background-color: #cccccc;
	}
	.kk { border: 1px solid #c5dbec; background: #fbf3f3 repeat-x; font-weight: bold; color: #2e6e9e; }
</style>	
 <script type="text/javascript">
//业务员提示
$(function() {

						$.ajax({
							type:'post',
							url:'../servlet/defaultDispatcher',
							data:'__action=dunTask.getCustLinkman&cust_code=${cust_code}&cust_id=${cust_id}',
							dataType:'json',
							success: initAutoComplete
						}); 	
});
</script> 

<br>	
<div> 
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
		id="main">
				<div class="zc_grid_body ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>状态</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>合同号</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>支付表号</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>应付日期</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>期次</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>应付金额</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>已付金额</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>差额</strong></td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach items="${dunList}" var="item">
							<c:choose>
								<c:when test="${item.MONTH_PRICE-item.REDUCE_PRICE<0.004}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><input type="checkbox" id="recp_id${item.CUST_CODE }" name="recp_id${item.CUST_CODE }" value="${item.RECP_ID }" onclick="$dunRent.singleChecked(this,'recp_id${item.CUST_CODE }')"></td>
										<td height="26px" style="text-align: center;"><c:choose><c:when test="${item.DUN eq 0 }"><img src="${ctx }/images/u614.gif"></c:when><c:when test="${item.DUN eq 1 }"><img src="${ctx }/images/u617.gif"></c:when><c:otherwise><img src="${ctx }/images/u608.gif"></c:otherwise></c:choose></td>
										<td style="text-align: center; color: #009900;">${item.LEASE_CODE }</td>
										<td style="text-align: center;color: #009900;">${item.RECP_CODE }</td>
										<td style="text-align: center;color: #009900;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;color: #009900;">${item.PERIOD_NUM }</td>
										<td style="text-align: right;color: #009900;"><fmt:formatNumber type="currency" value="${item.MONTH_PRICE+item.VALUE_ADDED_TAX}"></fmt:formatNumber></td>
										<td style="text-align: right;color: #009900;"><fmt:formatNumber type="currency" value="${item.REDUCE_PRICE }"></fmt:formatNumber></td>
										<td style="text-align: right;color: #009900;"><fmt:formatNumber type="currency" value="${item.MONTH_PRICE+item.VALUE_ADDED_TAX-item.REDUCE_PRICE }"></fmt:formatNumber><input type="hidden" name="hinfo" value="${item.MONTH_PRICE-item.REDUCE_PRICE }" /></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><input type="checkbox" name="recp_id${item.CUST_CODE }" value="${item.RECP_ID }" onclick="$dunRent.singleChecked(this,'recp_id${item.CUST_CODE }')"></td>
										<td height="26px" style="text-align: center;"><c:choose><c:when test="${item.DUN eq 0 }"><img src="${ctx }/images/u614.gif"></c:when><c:when test="${item.DUN eq 2 }"><img src="${ctx }/images/u617.gif"></c:when><c:otherwise><img src="${ctx }/images/u608.gif"></c:otherwise></c:choose></td>
										<td style="text-align: center;">${item.LEASE_CODE }</td>
										<td style="text-align: center;">${item.RECP_CODE }</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">${item.PERIOD_NUM }</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.MONTH_PRICE+item.VALUE_ADDED_TAX }"></fmt:formatNumber></td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.REDUCE_PRICE }"></fmt:formatNumber></td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.MONTH_PRICE+item.VALUE_ADDED_TAX-item.REDUCE_PRICE }"></fmt:formatNumber><input type="hidden" name="hinfo" value="${item.MONTH_PRICE-item.REDUCE_PRICE }" /></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</tbody>
					</table>
					
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td style="height: 28px">
							
							<input type="button" class="ui-state-default ui-corner-all" value="发送短信" onclick="$dunRent.sendMessge('${dunList[0].CUST_CODE }')"/> 
								<!-- Marked by Michael 2011 12/29取消减免罚息按钮 -->
								<!-- <input type="button" class="ui-state-default ui-corner-all" value="减免罚息" onclick="$dunRent.derateFine('${dunList[0].CUST_CODE }')"/> -->
							</td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th colspan="10" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					承租人联系方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<td style="background-color: #e8e8e8">
					<strong>&nbsp;</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>序号</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人名称</strong>
				</td >
				<td style="background-color: #e8e8e8">
					<strong>姓别</strong>
				</td>
				<td style="background-color: #e8e8e8"> 
					<strong>与承租人关系</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人手机</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人固话</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人Email</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人类型</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>状态</strong>
				</td>
			</tr>
		</thead>
		<tbody id="divCustLinkman">
			<c:forEach items="${custLinkmanList}" var="item" varStatus="status">
				<tr id="CustLinkman_${item.CULM_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;"><input type="checkbox" id="mobileToMessage${dunList[0].CUST_CODE }" name="mobileToMessage${dunList[0].CUST_CODE }" value="${item.LINK_MOBILE }" ></td>
					<td ><span id="custLinkmanIndex">${status.count }</span></td>
					<td >${item.LINK_NAME }&nbsp;</td>
					<td >${item.LINK_GENDER }&nbsp;</td>
					<td >${item.LINK_RELATION2CUST }&nbsp;</td>
					<td >${item.LINK_MOBILE }&nbsp;</td>
					<td >${item.LINK_PHONE }&nbsp;</td>
					<td>${item.LINK_EMAIL }    &nbsp;   </td>
					<td><c:if test="${item.LINK_TYPE eq 0 }">主要联系人</c:if><c:if test="${item.LINK_TYPE eq 1 }">联系人</c:if><c:if test="${item.LINK_TYPE eq null }">联系人</c:if> &nbsp;   </td>
					<td ><c:if test="${item.STATUS eq 0 }">正常</c:if><c:if test="${item.STATUS eq 1 }">作废</c:if></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
					 
					
<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="background-color: #e8e8e8"><strong>时间</strong></td>
								<td style="background-color: #e8e8e8"><strong>打电话人</strong></td>
								<td style="background-color: #e8e8e8"><strong>接电话人</strong></td>
								<td style="background-color: #e8e8e8"><strong>联系电话</strong></td>
								<td style="background-color: #e8e8e8"><strong>简要记录</strong></td>
								<td style="background-color: #e8e8e8"><strong>催收结果</strong></td>
								<td style="background-color: #e8e8e8"><strong><a href="javascript:void(0)" 
								onclick="location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getAllDunRecords&cust_code=${dunList[0].CUST_CODE }'">更多</a></strong></td>
		</tr>
	<c:forEach items="${dunRecordList}" var="item">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td><fmt:formatDate value="${item.CALL_DATE}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${item.CALL_USER_NAME}</td>
			<td>${item.ANSWERPHONE_NAME}</td>
			<td>${item.PHONE_NUMBER}</td>
			<td>${item.CALL_CONTENT}</td>
			<td><c:forEach items="${dictionary}" var="dictionary" varStatus="sta"><c:if test="${item.RESULT==dictionary.CODE}">${dictionary.FLAG}</c:if></c:forEach>&nbsp;</td> 
			<!-- 绝对不能删除,see mantis系统0000341 request(add by ShenQi 2012.3.2) -->
			<td><!--a  style="cursor: pointer"  onclick="$dunRent.deleteDunRecord(${item.DUDR_ID },'${item.CUST_CODE }','${dunList[0].CUST_ID }')">删除</a--></td> 
		</tr>
	</c:forEach>
	 
	 
</table>

<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td height="26px" width="20%">打电话人：</td>
			<td height="26px" colspan="5">${s_employeeName }<input type="hidden" name="CALL_USER_ID${dunList[0].CUST_CODE }" id="CALL_USER_ID${dunList[0].CUST_CODE }" value="${s_employeeId }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td height="26px"  width="20%">接电话人：</td>
			<td height="26px"  width="15%"><input type="text" name="ANSWERPHONE_NAME${dunList[0].CUST_CODE }" id="ANSWERPHONE_NAME${dunList[0].CUST_CODE }"></td>
			<td height="26px" width="17%">联系电话：</td> 
			<td height="26px"  width="15%"><input type="text" name="PHONE_NUMBER${dunList[0].CUST_CODE }" id="PHONE_NUMBER${dunList[0].CUST_CODE }"></td>
			<td height="26px"  width="17%">催收结果：</td>
			<td height="26px"  width="16%"><select name="RESULT${dunList[0].CUST_CODE }" id="RESULT${dunList[0].CUST_CODE }" style=" height: 18px;"> <c:forEach items="${dictionary}" var="dictionary" varStatus="sta"><option value="${dictionary.CODE}">${dictionary.FLAG}</option></c:forEach></select></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>简要记录:</td>
			<td colspan="3" valign="middle"><textarea rows="3" cols="55" name="CALL_CONTENT${dunList[0].CUST_CODE}" id="CALL_CONTENT${dunList[0].CUST_CODE }"></textarea></td>
			<td valign="middle" colspan="2"><input  type="button" onclick="$dunRent.addDunRecord('${dunList[0].CUST_CODE }','${dunList[0].CUST_ID }' );"
                  style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(${ctx }/images/save_big_white.gif);
                  BORDER-LEFT: 0px; WIDTH: 55px; BORDER-BOTTOM: 0px; HEIGHT: 55px; cursor: pointer;"
                   value="" onMouseOver="this.style.backgroundImage='url(${ctx }/images/save_big_lan.gif)'" 
                   onMouseOut="this.style.backgroundImage='url(${ctx }/images/save_big_white.gif)'" /></td> 
		</tr>
	</table>					
   </div>
 </div>
</div>	
<br>	