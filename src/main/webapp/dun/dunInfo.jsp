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
	//诉讼时间控件
	$(function (){
		$("#litigationDate").datepicker($.datepicker.regional["zh-CN"]);
	});
	function checkpositive(checkStr)
	{
	    var regex = /^[\+\-]?\d+(\.\d+)?$/;
	    return regex.test(checkStr);
	}
	//法务费用
	function lawFees(recp_id,cust_code){
			document.lawFeeAdd.fee_name.value="";
			document.lawFeeAdd.fee_value.value="";
			document.lawFeeAdd.memo.value="";
			document.lawFeeAdd.recp_id.value="";
			document.lawFeeAdd.recp_id.value=recp_id;
			document.lawFeeAdd.cust_code.value="";
			document.lawFeeAdd.cust_code.value=cust_code;
		
			$("#lawFeeAdd").dialog({
				modal:true,
				autoOpen: false,
				width: 450
			});
			$("#lawFeeAdd").dialog('open');
	}	
	
	//不明款认领
	function claimUnknownSection(){
		var url = "${ctx }";
		var title='暂收款管理(新)';
		window.parent.openNewTab(url,"rentFinanceCommand.queryFundList",title);
	}
	//保存法务费用
	function createLawyFeeList(){
		var fee_name= document.lawFeeAdd.fee_name.value;
		var fee_value= document.lawFeeAdd.fee_value.value;
		var memo= document.lawFeeAdd.memo.value;
		var recp_id=document.lawFeeAdd.recp_id.value;
		var cust_code=document.lawFeeAdd.cust_code.value;
		var fee_name_text=$.trim($("#fee_name").find("option:selected").text());
		if (fee_name==""){
			alert("请选择费用类别");
			return false;
		}
		if (fee_value==""){
			alert("请填入法务费用金额");
			return false;
		}
		
		if(checkpositive(fee_value)==false){
			alert("法务费用必须要输入整数！");
			document.lawFeeAdd.fee_value.focus();
			return false;
		}
		$.ajax({
			type:"POST",
			data: '__action=collectionManage.createLawFeeList&FEE_NAME_TEXT='+fee_name_text+'&CUST_CODE='+cust_code+'&MEMO='+memo+'&FEE_VALUE='+fee_value+'&FEE_NAME='+fee_name+'&RECP_ID='+recp_id,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack){
				alert(databack.writeBackDetails.strReturn);
				$("#lawFeeAdd").dialog('close');
				//location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryPaylistForAddLawyFee';
			},
			error:function(databack){
				alert("网络错误，请稍后重试！");
				return ;
			}
		});
	}
	//诉讼进程
	
	function litigation(custId,custName,heard,phone,lease_code){
			//var i=0;
			//alert($("#showlitigationId").find("tr").length);
			 for(var m=$("#showlitigationId").find("tr").length;m>7;m--) {
				
				$("#showlitigationId").find("tr").eq(m-5).remove();
			} 
			//担保人信息
			$.ajax({
				type:"POST",
				data: '__action=dunTask.getNatureListByCustId&custId='+custId,
				url:"../servlet/defaultDispatcher",
				dataType:"json",
				success:function(databack){
					
					for(var i=0;i<databack.natureList.length;i++){
						var tab=document.getElementById("showlitigationId");
						var row=tab.insertRow(3);
						//row.name="nature";
						row.className="ui-widget-content jqgrow ui-row-ltr";
						//左列
						var cell=row.insertCell(0);
						cell.className = "style='text-align: right;' width='20%;'";
						cell.align='right';
						cell.colSpan=1;
						cell.innerHTML='担保人姓名：';
						//右列
						cell=row.insertCell(1);
						cell.className = "style='text-align: left;' width='20%'";
						cell.align='left';
						cell.colSpan=1;
						cell.innerHTML=databack.natureList[i].CUST_NAME;
						//
						cell=row.insertCell(2);
						cell.className = "style='text-align: right;' width='20%'";
						cell.align='right';
						cell.colSpan=1;
						cell.innerHTML='联系方式:';
						//
						cell=row.insertCell(3);
						cell.className = "style='text-align: left;' width='20%'";
						cell.align='left';
						cell.colSpan=1;
						cell.innerHTML=databack.natureList[i].NATU_MOBILE+"&nbsp;";
					}
					return;
					
				},
				error:function(databack){
					alert("系统出错了，稍后再试试！");
					return ;
				}
			});
				$("#custName").text("");
				$("#lcnum").text("");
				$("#heard").text("");
				$("#phone").text("");
				$("#lease_code").val("");
				$("#lProcess").val("");
				$("#litigationDate").val("");
				$("#lcnum").text(lease_code);
				$("#custName").text(custName);
				$("#heard").text(heard);
				$("#phone").text(phone);
				$("#lease_code").val(lease_code);
				
			$("#litigationAdd").dialog({
				modal:true,
				autoOpen: false,
				width: 450
			});
			$("#litigationAdd").dialog('open');
	}	
	
</script>
<div style="margin-top: 5px;">  
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
		id="main">
				<div class="zc_grid_body ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="background-color: #e8e8e8"><strong>&nbsp;</strong></td>
								<td style="background-color: #e8e8e8"><strong>状态</strong></td>
								<td style="background-color: #e8e8e8"><strong>合同号</strong></td>
								<td style="background-color: #e8e8e8"><strong>支付表号</strong></td>
								<td style="background-color: #e8e8e8"><strong>应付日期</strong></td>
								<td style="background-color: #e8e8e8"><strong>应付总金额</strong></td>
								<td style="background-color: #e8e8e8"><strong>逾期金额</strong></td>
								<td style="background-color: #e8e8e8"><strong>逾期天数</strong></td>
								<td style="background-color: #e8e8e8"><strong>罚息</strong></td>
							</tr>
						</thead>
						<tbody>
						 <c:forEach items="${dunList}" var="item">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td align="center"><input type="checkbox" id="recp_id${item.CUST_CODE }" name="recp_id${item.CUST_CODE }" value="${item.RECP_ID }" onclick="$dunTask.singleChecked(this,'recp_id${item.CUST_CODE }')"></td>
								<td height="26px" align="center"><c:choose><c:when test="${item.RECP_STATE eq 0 }"><img src="${ctx }/images/u614.gif"></c:when><c:otherwise><img src="${ctx }/images/u617.gif"></c:otherwise></c:choose></td>
								<td align="center">${item.LEASE_CODE }&nbsp;</td>
								<td align="center">${item.RECP_CODE }&nbsp;</td>
								<td align="center">${item.SHOULD_PAYDATE }&nbsp;</td>
								<td align="right"><div align="right"><fmt:formatNumber type="currency" value="${item.DUN_TOTALPRICE }"></fmt:formatNumber></div></td>
								<td align="right"><div align="right"><fmt:formatNumber type="currency" value="${item.DUN_MONTHPRICE }"></fmt:formatNumber></div></td>
								<td align="center">${item.DUN_DAY }&nbsp;</td>
								<td align="right"><div align="right"><fmt:formatNumber type="currency" value="${item.DUN_FINE }"></fmt:formatNumber></div></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td style="height: 28px">
							<!-- Marked by Michael 2011 12/29取消减免罚息按钮 -->
							<!-- add by Xuyuefei 2014 5/22添加不明款认领按钮 -->
								<!--<input type="button" class="ui-state-default ui-corner-all" value="减免罚息" onclick="$dunTask.derateFine('${dunList[0].CUST_CODE }')"/> -->
								<!-- <input type="button" class="ui-state-default ui-corner-all" value="催收通知单"/>
								<input type="button" class="ui-state-default ui-corner-all" value="催收警告单"/>
								<input type="button" class="ui-state-default ui-corner-all" value="律师函"/> -->
								<input type="button" class="ui-state-default ui-corner-all" value="发送短信" onclick="$dunTask.sendMessge('${dunList[0].CUST_CODE }')"/>
								<c:if test="${law}"><input type="button" class="ui-state-default ui-corner-all" value="法务费用管理" onclick="lawFees('${contract.RECP_ID}','${contract.CUST_CODE }');"/></c:if>
								<c:if test="${litigation}"><input type="button" class="ui-state-default ui-corner-all" value="诉讼案件管控" onclick="litigation('${contract.CUST_ID}','${contract.CUST_NAME}','${contract.CORP_HEAD_SIGNATURE}','${contract.CORP_HS_LINK_MODE}','${contract.LEASE_CODE}');"/></c:if>
								<input type="button" class="ui-state-default ui-corner-all" value="不明款认领" onclick="claimUnknownSection()"/>
							</td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th colspan="10" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
					承租人联系方式&nbsp;
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
					<td ><input type="checkbox" id="mobileToMessage${dunList[0].CUST_CODE }" name="mobileToMessage${dunList[0].CUST_CODE }" value="${item.LINK_MOBILE }" ></td>
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
			<c:if test="${creditCustomerCorpMap.NATU_MATE_NAME != null && creditCustomerCorpMap.NATU_MATE_NAME ne '' || creditCustomerCorpMap.MATE_NAME != null && creditCustomerCorpMap.MATE_NAME ne '' }">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td><input type="checkbox" id="mobileToMessage${dunList[0].CUST_CODE }" name="mobileToMessage${dunList[0].CUST_CODE }" value="${creditCustomerCorpMap.NATU_MATE_MOBILE }${creditCustomerCorpMap.MATE_MOBILE }" ></td>
					<td>${fn:length(custLinkmanList) + 1 }&nbsp;</td>
					<td>${creditCustomerCorpMap.NATU_MATE_NAME }${creditCustomerCorpMap.MATE_NAME }&nbsp;</td>
					<td>-</td>
					<td>共同还款人</td>
					<td>${creditCustomerCorpMap.NATU_MATE_MOBILE }${creditCustomerCorpMap.MATE_MOBILE }&nbsp;</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
				</tr>
			</c:if>
				<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
					<td  colspan="10" style="text-align: center;">保证人列表&nbsp;</td>
				</tr>
			<!-- 保证人列表 -->
			<c:forEach items="${natureList}" var="nature" varStatus="statusN">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td >&nbsp;</td>
					<td ><span id="custLinkmanIndex">${statusN.count}</span></td>
					<td >${nature.CUST_NAME}&nbsp;</td>
					<td >${nature.NATU_GENDER}&nbsp;</td>
					<td >保证人&nbsp;</td>
					<td >${nature.NATU_MOBILE}&nbsp;</td>
					<td >${nature.NATU_PHONE}&nbsp;</td>
					<td >&nbsp;</td>
					<td>联系人&nbsp;</td>
					<td ><c:if test="${nature.STATUS eq 0 }">正常</c:if><c:if test="${nature.STATUS eq 1 }">作废</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
					
					
					
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
								onclick="location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getAllDunRecords&cust_code=${CUST_CODE }'">更多</a></strong></td>
		</tr>
	<c:forEach items="${dunRecordList}" var="item">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td><fmt:formatDate value="${item.CALL_DATE}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${item.CALL_USER_NAME}</td>
			<td>${item.ANSWERPHONE_NAME}</td>
			<td>${item.PHONE_NUMBER}</td>
			<td>${item.CALL_CONTENT}</td>
			<td><c:forEach items="${dictionary}" var="dictionary" varStatus="sta"><c:if test="${item.RESULT==dictionary.CODE}">${dictionary.FLAG}</c:if></c:forEach>&nbsp;</td> 
			<td>&nbsp;<!-- Marked By Michael 去除删除功能
			<a  style="cursor: pointer"  onclick="$dunTask.deleteDunRecord(${item.DUDR_ID },'${item.CUST_CODE }','${dunList[0].CUST_ID }')">删除</a>
			--></td> 
		</tr>
	</c:forEach>
	 
	 
</table>

<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td height="26px" width="20%">打电话人：</td>
			<td height="26px"  colspan="5">${s_employeeName }<input type="hidden" name="CALL_USER_ID${CUST_CODE }" id="CALL_USER_ID${CUST_CODE }" value="${s_employeeId }"></td>
			
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td height="26px"  width="20%">接电话人：</td>
			<td height="26px"  width="15%"><input type="text" name="ANSWERPHONE_NAME${CUST_CODE }" id="ANSWERPHONE_NAME${CUST_CODE }"></td>
			<td height="26px" width="17%">联系电话：</td> 
			<td height="26px" width="15%"><input type="text" name="PHONE_NUMBER${CUST_CODE }" id="PHONE_NUMBER${CUST_CODE }"></td>
			<td height="26px"  width="17%">催收结果：</td>
			<td height="26px"  width="16%"><select name="RESULT${CUST_CODE }" id="RESULT${CUST_CODE }" style=" height: 18px;">
          	 <c:forEach items="${dictionary}" var="dictionary" varStatus="sta">
          	 	<option value="${dictionary.CODE}">${dictionary.FLAG}</option>
          	 </c:forEach>
			</select>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>简要记录:</td>
			<td colspan="3" valign="middle"><textarea rows="3" cols="55" name="CALL_CONTENT${CUST_CODE}" id="CALL_CONTENT${CUST_CODE}"></textarea></td>
			<td valign="middle" colspan="2"><input  type="button" onclick="$dunTask.addDunRecord('${CUST_CODE}','${CUST_ID }' );"
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

