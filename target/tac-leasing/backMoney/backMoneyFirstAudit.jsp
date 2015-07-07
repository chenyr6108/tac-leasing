<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>付款信息管理</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
			$(function (){
				$("#PSTART_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#PEND_DATE").datepicker($.datepicker.regional['zh-CN']);
			});	
			//弹出日志的层
			
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			function invalidRentContract(id) { 
				if(confirm('确认作废？')){
					location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.invalidRentContract&RECT_ID='+id;
				}else{
					return false;
				}
			}
		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		
	  
	 	function showEditPayMoneyReviewRecord(code,id)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOne&payMoneyId='+code+'&RECT_ID='+id;
	 	}
	 	function showEditPayMoney(code,id,lease_code)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOneShow&payMoneyId='+code+'&CREDIT_ID='+id+"&LEASE_CODE="+lease_code;
	 	}
	 	
	 	/*  2012/1/5 Yang Yun 增加审批的权限控制
	 	function updateDepartMentById(backId,num)
	{
		var BACKSTATE=document.getElementById("BACKSTATE").value;
		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.updateDepartMentById&backId='+backId+"&Num="+num+"&BACKSTATE="+BACKSTATE;
	}
	
	function updateExamById(backId,num)
	{
	var BACKSTATE=document.getElementById("BACKSTATE").value;
		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.updateExamById&backId='+backId+"&Num="+num+"&BACKSTATE="+BACKSTATE;
	}
	
	function updateFinancialById(backId,num)
	{
	var BACKSTATE=document.getElementById("BACKSTATE").value;
		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.updateFinancialById&backId='+backId+"&Num="+num+"&BACKSTATE="+BACKSTATE;
	}
	 	*/
			
		function updateDepartMentById(backId, num, RECT_ID, credit_id) {
			if (!confirm("确认？")) {
				return false;
			}
			//判断有没有过期
			var url = "../servlet/defaultDispatcher";
			var data = {"__action" : "businessSupport.getIsExpiredByCreditId", "credit_id" : credit_id};
			$.getJSON(url, data, function (result){
				if(result || num == 2){
					var BACKSTATE = document.getElementById("BACKSTATE").value;
					location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateDepartMentById&backId='
							+ backId
							+ "&Num="
							+ num
							+ "&BACKSTATE="
							+ BACKSTATE
							+ "&RECT_ID=" + RECT_ID;
				} else {
					alert("案件已过期,操作失败。");
				}
			});
		}
		
		function updateExamById(backId, num, RECT_ID, credit_id,FSS_ID) {
			//点通过(num == 1)时验证是否已经通过文审，复核，还款
			if(num == 1 && "${BACKSTATE}" != "1"){
				var stepCheck = '0';
				$.ajax({
					url: "../servlet/defaultDispatcher?__action=backMoney.checkExamPassState",
					dataType: 'json',
				 	data:"credit_id_="+credit_id,
					"async": false,
					success: function(result){
						stepCheck = result.step;
					}
				});
				if(stepCheck == '1'){
					alert("案件还未通过'文审'，审核通过失败！");
					return false;
				} else if(stepCheck == '2'){
					alert("案件还未通过'复核'，审核通过失败！");
					return false;
				} else if(stepCheck == '3'){
					alert("案件还未通过'还款'，审核通过失败！");
					return false;
				} else if(stepCheck == '0'){
					alert("验证'文审'、'复核'、'还款'状态时出错！请联系资讯！");
					return false;
				}
				if (RECT_ID == ''&& num==1 && "${BACKSTATE}"!="1") {
					alert("案件未初审，无法投保，请确认是否初审，如已初审，请刷新页面。");
					return false;
				}
			}
			
			if (!confirm("确认？")) {
				return false;
			}
			var BACKSTATE = document.getElementById("BACKSTATE").value;
			if(num == 2){
				location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateExamById&FSS_ID='+FSS_ID+'&CREDIT_ID='+credit_id+'&backId='
				+ backId
				+ "&Num="
				+ num
				+ "&BACKSTATE="
				+ BACKSTATE
				+ "&RECT_ID=" + RECT_ID;
			} else {
				var url = "../servlet/defaultDispatcher";
				var data = {"__action" : "backMoney.checkExamCanDo", "credit_id" : credit_id};
				$.getJSON(url, data, function (result){
					if(result.flag){
						location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateExamById&FSS_ID='+FSS_ID+'&CREDIT_ID='+credit_id+'&backId='
								+ backId
								+ "&Num="
								+ num
								+ "&BACKSTATE="
								+ BACKSTATE
								+ "&RECT_ID=" + RECT_ID;
					} else {
						alert(result.msg);
					}
				});
			}
			
		}
		
		//modify by xuyuefei 2014/8/26
		//当财务审批点击确认且拨款方式为网银时弹出div框
		function openPayWay(){
			$("#openPayWay").dialog({
				modal:true,
				autoOpen: false,
				width: 540,
				hide:'slide',
				show:'slide'
			});
			$("#openPayWay").dialog('open');
		}
		
		function closePayWay(){
			$("#openPayWay").dialog('close');
		}
		
		
		function getBankAccountCode(){
			var r=$("#bankAccount").val();
			if(r==""){
				$("#accountCode").val('');
			}
			else{
			$.post("../servlet/defaultDispatcher?__action=bankAccount.getBankCode",{account:r},function(data){
				$("#accountCode").val(data.ACCOUNT_CODE);
			},'json');
			}
		}
		
		function onsub(){
			var account=$("#bankAccount").val();
			var inputBackId=$("#backId").val();
			var inputCreditId=$("#creditId").val();
			var inputFssId=$("#inputFssId").val();
			var inputRectId=$("#inputRectId").val();
			if(account==""){
				alert('请选择银行!');
				return false;
			}
			//判断有没有过期
			var url = "../servlet/defaultDispatcher";
			var data = {
				"__action" : "businessSupport.getIsExpiredByCreditId", 
				"credit_id" : $("#creditId").val()
			};
			$.getJSON(url, data, function (result){
				if(result){
					var BACKSTATE = document.getElementById("BACKSTATE").value;
					location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateFinancialById&FSS_ID='+inputFssId+'&CREDIT_ID='+inputCreditId+'&backId='
							+ inputBackId
							+ "&Num="
							+ 1
							+ "&BACKSTATE="
							+ BACKSTATE
							+ "&RECT_ID=" + inputRectId
							+ "&account="  +account;
				} else {
					alert("案件已过期,操作失败。");
				}
			});
		}
		
		//如果支票支付直接更新，如果网银支付，请选择银行
		function updateFinancialById(payWay,backId, num, RECT_ID, credit_id,FSS_ID) {
			//if (!confirm("确认？")) {
			//	return false;
			//}
			//当点击确认弹出选择拨款方式对话框
			if(confirm("确认?")){
				if(payWay==1||num==2){
					//判断有没有过期
					var url = "../servlet/defaultDispatcher";
					var data = {"__action" : "businessSupport.getIsExpiredByCreditId", "credit_id" : credit_id};
					$.getJSON(url, data, function (result){
						if(result || num == 2){
							var BACKSTATE = document.getElementById("BACKSTATE").value;
							location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateFinancialById&FSS_ID='+FSS_ID+'&CREDIT_ID='+credit_id+'&backId='
									+ backId
									+ "&Num="
									+ num
									+ "&BACKSTATE="
									+ BACKSTATE
									+ "&RECT_ID=" + RECT_ID;
						} else {
							alert("案件已过期,操作失败。");
						}
					});
				}
				if(num==1&&payWay==2){
					$("#backId").val(backId);
					$("#creditId").val(credit_id);
					$("#inputRectId").val(RECT_ID);
					$("#inputFssId").val(FSS_ID);
					openPayWay();
				}

			}else{
				return false;
			}

		}
			/*  */

			function updateManagerById(backId, num) {
				var BACKSTATE = document.getElementById("BACKSTATE").value;
				location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateManagerById&backId='
						+ backId + "&Num=" + num + "&BACKSTATE=" + BACKSTATE;
			}
			
			function exportExcel() {
				window.parent.callBirt("birtReport/exportPayMoneyAudit/payMoneyAudit.rptdesign","xls",{"START_DATE":$("#PSTART_DATE").val(),"END_DATE":$("#PEND_DATE").val()});
			} 
			function examineRentFile(backId,credit_id,CONTRACT_TYPE,RECT_ID,FSS_ID){
				var BACKSTATE=$("#BACKSTATE").val();
				location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.showExamineRentFile&FSS_ID='+FSS_ID+'&BACKSTATE='+BACKSTATE+'&RECT_ID='+RECT_ID+'&CONTRACT_TYPE='+CONTRACT_TYPE+'&CREDIT_ID='+credit_id+'&backId='
					+ backId ;
			}		
		</script>		
	</head>
	<body>
	<c:set var="departmentstatusNum" value="158"/>
	<c:set var="departmentstatus" value="false"/>
	<c:set var="examstatusNum" value="159"/>
	<c:set var="examstatus" value="false"/>
	<c:set var="financialstatusNum" value="160"/>
	<c:set var="financialstatus" value="false"/>
		<c:forEach items="${sessionScope.firstMenuList}" var="i" varStatus="s">
			<c:forEach items="${sessionScope.firstMenuList[s.index].secondList}" var="j">
				<c:if test="${j.second_id eq departmentstatusNum }">
					<c:set var="departmentstatus" value="true"/>
				</c:if>
				<c:if test="${j.second_id eq examstatusNum }">
					<c:set var="examstatus" value="true"/>
				</c:if>
				<c:if test="${j.second_id eq financialstatusNum }">
					<c:set var="financialstatus" value="true"/>
				</c:if>
			</c:forEach>
		</c:forEach>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.queryPayMoneys" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;拨款审批</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>预计支付日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          至预计支付日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					      </td>
					       <td>拨款类别：</td>
				          <td><select id="BACKSTATE" name="BACKSTATE" style=" width: 80px; height: 18px;">
								<option value="0" <c:if test="${BACKSTATE eq 0 }">selected='selected'</c:if>>设备款</option>
								<option value="1" <c:if test="${BACKSTATE eq 1 }">selected='selected'</c:if>>保证金拨款</option>
								<option value="2" <c:if test="${BACKSTATE eq 2 }">selected='selected'</c:if>>奖金拨款</option>
								<option value="3" <c:if test="${BACKSTATE eq 3 }">selected='selected'</c:if>>保险费</option>
								<option value="4" <c:if test="${BACKSTATE eq 4 }">selected='selected'</c:if>>法务费用</option>
								<option value="5" <c:if test="${BACKSTATE eq 5 }">selected='selected'</c:if>>退款</option>
								<option value="9" <c:if test="${BACKSTATE eq 9 }">selected='selected'</c:if>>手续费</option>
								<option value="10" <c:if test="${BACKSTATE eq 10 }">selected='selected'</c:if>>佣金</option>
							</select>
					      </td>
					      <td>状态：</td>
				          <td><select id="shen_pi_STATE" name="shen_pi_STATE" style=" width: 80px; height: 18px;">
				                <option value="9" <c:if test="${shen_pi_STATE eq 9 }">selected='selected'</c:if>>全部</option>   
								<option value="0" <c:if test="${shen_pi_STATE eq 0 }">selected='selected'</c:if>>审核中</option>
								<option value="1" <c:if test="${shen_pi_STATE eq 1 }">selected='selected'</c:if>>完成拨款</option>
								<option value="2" <c:if test="${shen_pi_STATE eq 2 }">selected='selected'</c:if>>驳回</option>
							</select>
					      </td>
					      <td>办事处：</td>
							<td><select name="search_decp" style=" width: 80px; height: 18px;">
								<option value="">全部</option>
								<c:forEach items="${decpList }" var="decp">
									<option value="${decp.option_value }" <c:if test="${search_decp eq decp.option_value}">selected="selected"</c:if>>${decp.display_name }</option>
								</c:forEach>
							</select></td>
							<td>业务类别：</td>
							<td><select name="production_type" style=" width: 80px; height: 18px;">
								<option value="">全部</option>
								<option value="1" <c:if test="${production_type eq 1}">selected</c:if>>设备</option>
								<option value="2" <c:if test="${production_type eq 2}">selected</c:if>>商用车</option>
								<option value="3" <c:if test="${production_type eq 3}">selected</c:if>>乘用车</option>
							</select>
							</td>
							<td>公司別：</td>
							<td>
								<select name="companyCode" style=" height: 18px;">
									<option value="" >
										全部
									</option>
									<option value="1" <c:if test="${companyCode eq 1}">selected='selected'</c:if>>
										裕融
									</option>
									<option value="2" <c:if test="${companyCode eq 2}">selected='selected'</c:if>>
										裕国
									</option>
								</select>
							</td>
				          </tr>
				          <tr>
				          <td>实际支付日期：</td>
				          <td>
				          <input type="text" name="PSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="PSTART_DATE" value="${PSTART_DATE }"></td>
				          <td>
				          	至实际支付日期：</td>
				          <td>
				          <input type="text" name="PEND_DATE" id="PEND_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${PEND_DATE }">
					      </td>
				          <td>是否首拨款：</td>
					      <td>
					      	<select id="PAY_ORDER" name="PAY_ORDER">
					      		<option value="0" <c:if test="${PAY_ORDER eq 0 }">selected='selected'</c:if>>全部</option>
					      		<option value="1" <c:if test="${PAY_ORDER eq 1 }">selected='selected'</c:if>>首拨</option>
					      		<option value="2" <c:if test="${PAY_ORDER eq 2 }">selected='selected'</c:if>>非首拨</option>
					      	</select>
					      </td>
					      <td>案件类别：</td>
					      <td>
					      	<select name="vip_flag" style="width: 80px;">
								<option value="">全部</option>
								<option value="0" <c:if test="${vip_flag eq 0 }">selected</c:if>>一般</option>
								<option value="1" <c:if test="${vip_flag eq 1 }">selected</c:if>>绿色通道</option>
							</select>
					      </td>
					      <td>交机前后拨款：</td>
					      <td>
					      	<select id="pay_way" name="pay_way">
					      		<option value="">全部</option>
					      		<option value="1" <c:if test="${pay_way eq 1 }">selected='selected'</c:if>>交机前</option>
					      		<option value="2" <c:if test="${pay_way eq 2 }">selected='selected'</c:if>>交际后</option>
					      	</select>
					      </td>
					      <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" style=" width:150px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width=""><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<!--<input type="button" value="导出Excel" class="ui-state-default ui-corner-all" style="cursor: pointer" onclick="exportExcel()"> TODO 要加入权限控制,之前此页面开给财务导出-->
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table class="grid_table">
							<thead>
								<tr>
									<th>
										状态
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="VIP_FLAG">案件类型</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同编号</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户名称</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="DEPT_NAME">办事处</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="CLERK_NAME">办事处主管</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="SENSOR_NAME">客户经理</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="BACKCOMP">收款人</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_MONEY">拨款金额</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_ORDER">是否首拨</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="LESSOR_TIME">签订时间</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="EXPECTEDDATE">预计支付日</page:pagingSort>
									</th>
									<th>
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_DATE">实际支付日</page:pagingSort>
									</th>
								  <c:if test="${(BACKSTATE eq 1) or (BACKSTATE eq 0) or empty BACKSTATE }">	<th>
										单位主管审核
									</th> </c:if>
									<th>
										业管部审核
									</th>
									<th>
										财务部审核
									</th>
								<!--  	<th>
										退件
									</th>-->
									<th>
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">												
									<tr>
										<td style="text-align: center;"><c:if test="${item.STATUS==0 and item.STATE==3 }"><img src="${ctx }/images/u611.gif" title="完成拨款"></c:if><c:if test="${item.STATUS==0 and (item.STATE==0 or item.STATE==1)}"><img src="${ctx }/images/u608.gif" title="审核中"></c:if><c:if test="${item.STATUS==1 }"><img src="${ctx }/images/u622.gif" title="驳回"></c:if></td>
										<td style="text-align: center;">&nbsp;<c:if test="${item.VIP_FLAG==0 or item.VIP_FLAG==null }">一般案件</c:if><c:if test="${item.VIP_FLAG==1 }">绿色通道</c:if></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DEPT_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BACKCOMP }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEY }" />&nbsp;</td>
										<td style="text-align: right;"><c:if test="${item.PAY_ORDER  eq '1' }">首拨</c:if><c:if test="${item.PAY_ORDER == null  }">未拨款</c:if><c:if test="${item.PAY_ORDER != null  }"><c:if test="${item.PAY_ORDER ne '1' }">非首拨</c:if></c:if>&nbsp;</td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.EXPECTEDDATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
									    
									    <c:if test="${(BACKSTATE eq 1) or(BACKSTATE eq 0) or empty BACKSTATE }"><td style="text-align: center;"><c:if test="${item.DEPARTMENTSTATUS==0 }"><c:if test="${departmentstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="examineRentFile('${item.ID }','${item.CREDIT_ID }','${item.CONTRACT_TYPE }','${item.RECT_ID }','${item.FSS_ID}');">审核</c:otherwise></c:choose></c:if><c:if test="${departmentstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.DEPARTMENTSTATUS==1 }">Y</c:if><c:if test="${item.DEPARTMENTSTATUS==2 }">N</c:if></td>
										</c:if>
										<td style="text-align: center;">
											<c:if test="${item.EXAMSTATUS==0 }">
											<c:if test="${examstatus == 'true' }">
												<c:choose>
													<c:when
														test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}">
														<font color="#C0C0C0">通过 |驳回</font>
													</c:when>
													<c:otherwise>
														<a href="javaScript:void(0);"
															onClick="updateExamById('${item.ID }','1','${item.RECT_ID }','${item.CREDIT_ID }')">通过
															|</a>&nbsp;&nbsp;<a href="javaScript:void(0);"
															onClick="updateExamById('${item.ID }','2','${item.RECT_ID }','${item.CREDIT_ID }','${item.FSS_ID}')">驳回</a>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${examstatus != 'true' }">未审核</c:if>
										</c:if>
										<c:if test="${item.EXAMSTATUS==1 }">Y</c:if>
										<c:if test="${item.EXAMSTATUS==2 }">N</c:if>
									</td>
									<td style="text-align: center;"><c:if test="${item.FINANCIALSTATUS==0 }">
										<c:if test="${financialstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise>
										<div id="updateFinancialById${item.ID }"></div>
										
										<!-- 财务拨款审核按钮在预计拨款日前一天下午14:00后 For IT201305001 -->
										<script type="text/javascript">	
											$(function (){
												var tempStr = "${item.EXPECTEDDATE_BEFOR}";
											    var arys= tempStr.split('-');     
											    var d = new Date(arys[0], arys[1]-1, arys[2],'14','00','00');  
												var date = new Date();
												var div_id="updateFinancialById"+${item.ID }+"";
												var tempStr="";
												if(date>=d){
													tempStr="<a href=\"javaScript:void(0);\" onClick=\"updateFinancialById('${item.PAY_WAY}','${item.ID }','1','${item.RECT_ID }','${item.CREDIT_ID }')\">通过 </a>|&nbsp;<a href=\"javaScript:void(0);\"  onClick=\"updateFinancialById('${item.PAY_WAY}','${item.ID }','2','${item.RECT_ID }','${item.CREDIT_ID }','${item.FSS_ID}')\">驳回</a>";
												} else {
													tempStr="<a href=\"javaScript:void(0);\"  onClick=\"updateFinancialById('${item.PAY_WAY}','${item.ID }','2','${item.RECT_ID }','${item.CREDIT_ID }','${item.FSS_ID}')\">驳回</a>";
												}
												document.getElementById(div_id).innerHTML=tempStr;
											});
										
											<%-- 	<a href="javaScript:void(0);" onClick="updateFinancialById('${item.ID }','1','${item.RECT_ID }','${item.CREDIT_ID }')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);"  onClick="updateFinancialById('${item.ID }','2','${item.RECT_ID }','${item.CREDIT_ID }','${item.FSS_ID}')">驳回</a>
										 --%>
											</script>
										</c:otherwise></c:choose></c:if><c:if test="${financialstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.FINANCIALSTATUS==1 }">Y</c:if><c:if test="${item.FINANCIALSTATUS==2 }">N</c:if></td>
									<!-- 	<td style="text-align: center;"><c:if test="${item.MANAGER==0 }"><a href="javaScript:void(0);"  onClick="updateManagerById('${item.ID }','1')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);"  onClick="updateManagerById('${item.ID }','2')"/>驳回</a></c:if><c:if test="${item.MANAGER==1 }">Y</c:if><c:if test="${item.MANAGER==2 }">N</c:if></td>
									 -->	<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showEditPayMoney('${item.ID }','${item.CREDIT_ID }','${item.LEASE_CODE }');">查看</a></td>
									</tr>
									<tr>
										<th class="pact" colspan="18">
											<div id="contractTr${item.RECT_ID }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
								<tr>
									<th style="text-align: right;" colspan="9">
										合计：
									</th>
									<td style="text-align: right;">
										<fmt:formatNumber type="currency" value="${TOTAL }"></fmt:formatNumber>&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">
										审核中
										<img src="${ctx }/images/u611.gif">
										完成拨款&nbsp;
										<img src="${ctx }/images/u622.gif">
										驳回
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
			
				<!--  日志弹出层开始   -->
			<!-- 弹出用函数 接收参数 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志" style="display: none" id="showBusinessLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=business.showBusinessLog">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号</td>
								<td style="text-align:center"  width="6%">编号</td>
								<td style="text-align:center"  width="6%">日志对象</td>
								<td style="text-align:center"  width="4%">日志操作</td>
								<td style="text-align:center"  width="6%">创建人</td>
								<td style="text-align:center"  width="6%">创建时间</td>
								<td style="text-align:center"  width="15%">备注</td>
							</tr>
					</table>
					<center>
					共<span id="barNum"></span>条,共<span id="total"></span>页
					当前第<span id="pageNum" ></span>页
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
					</center>
				</div>
				</div>
			</div>	
		</form>
		</div>
		
		<div title="拨款方式" id="openPayWay" style="display: none;">
		     <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		        <!-- <tr>
		           <td class="ui-widget-content jqgrow ui-row-ltr" width="15%" style="text-align: right;"> &nbsp;&nbsp; 拨款方式:</td>
		           <td class="ui-widget-content jqgrow ui-row-ltr" width="85%" style="text-align: center;" colspan="3">
		                                           支票<input type="radio" name="payway" value="0"   disabled="disabled">&nbsp;&nbsp;
		                                           网银<input type="radio" name="payway" value="1" checked="checked" disabled="disabled">&nbsp;&nbsp;
		           </td>
		        </tr> -->
		        <tr style="display:none">
		          <td><input type="hidden" value="" id="backId"></td>
		          <td><input type="hidden" value="" id="creditId"></td>
		          <td><input type="hidden" value="" id="inputRectId"></td>
		          <td><input type="hidden" value="" id="inputFssId"></td>
		        </tr>
		        
		        <!-- 选择网银时会显示  -->
		        <tr id="selectBank">
		          <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;" width="25%">开户行:</td>
		          <td class="ui-widget-content jqgrow ui-row-ltr" width="25%">
		             <select onchange="getBankAccountCode()" id="bankAccount" name="bankAccount">
		                  <option value="">----请选择 ----</option>
		               <c:forEach items="${bankAccountList }" var="item">
		                  <option value="${item.ACCOUNT_NO }">${item.BANK_NAME }</option>
		               </c:forEach>
		             </select>
		          </td>
		          <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;" width="25%" >编码:</td>
		          <td class="ui-widget-content jqgrow ui-row-ltr" width="25%">
		            <input type="text" value="" id="accountCode" readonly="readonly">
		          </td>
		        </tr>
		        
		        <tr>
			        <td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr" colspan="4">
			          <input type="button" value="提交" onclick="onsub()" class="ui-state-default ui-corner-all">&nbsp;&nbsp;
			          <input type="button" value="关闭" onclick="closePayWay()" class="ui-state-default ui-corner-all">
			        </td>
		        </tr>
		     </table>
		</div>

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
	</body>
</html>