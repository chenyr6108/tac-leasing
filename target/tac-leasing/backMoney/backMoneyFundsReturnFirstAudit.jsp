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

		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}

			
		function updateDepartMentById(backId, num, return_id) {
			if (!confirm("确认退款操作？")) {
				return false;
			}

			location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateDepartMentReturnMoneyById&backId='
					+ backId
					+ "&Num="
					+ num
					+ "&BACKSTATE=5"
					+"&RETURN_PAY_ID="
					+return_id;
		}
		
		function updateExamById(backId, num,return_id) {
			if (!confirm("确认退款操作？")) {
				return false;
			}
			location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateExamReturnMoneyById&BACKSTATE=5&backId='
					+ backId
					+ "&Num="
					+ num
					+"&RETURN_PAY_ID="
					+return_id;
				
		}
		
		function updateFinancialById(backId, num,return_id) {
			if (!confirm("确认退款操作？")) {
				return false;
			}

			location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateFinancialReturnMoneyById&BACKSTATE=5&backId='
					+ backId
					+ "&Num="
					+ num
					+"&RETURN_PAY_ID="
					+return_id;
		}

/* 			function updateManagerById(backId, num,return_id) {
				var BACKSTATE = document.getElementById("BACKSTATE").value;
				location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateManagerById&backId='
						+ backId + "&Num=" + num + "&BACKSTATE=" + BACKSTATE;
			} */
			
			function showFundsReturn(ID,CREATE_DATE){
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'decompose.getFundsReturnDetailByID',
						ID:ID,CREATE_DATE:CREATE_DATE},
					dataType:'json',
					success: function(dataBack){ 
						$("#payee").val(dataBack.fundsReturnDetail.PAYEE);
						$("#amount").val(dataBack.fundsReturnDetail.AMOUNT);
						$("#bank_account").val(dataBack.fundsReturnDetail.BANK_ACCOUNT);
						$("#return_date").val(dataBack.fundsReturnDetail.RETURNDATE);
						$("#remark").val(dataBack.fundsReturnDetail.REMARK);
						$("#bank_name").val(dataBack.fundsReturnDetail.BANK_NAME);
						$("#pay_type").val(dataBack.fundsReturnDetail.PAY_TYPE);
						$("#reason").val(dataBack.fundsReturnDetail.REASON);
					}
				});
				
				$("#fundsReturn").dialog({modal:true, autoOpen:false, width:600});
				$("#fundsReturn").dialog("open");
			}
			
			function expand(return_id){	
			    $("#pactAffix"+return_id).toggle(function(){
			        $(this).load("../servlet/defaultDispatcher?__action=decompose.queryReturnMoneyLog&return_id=" + return_id);
			    });
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
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;退款审批</span>
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
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:250px;height:18px; font-size: 12px;">
				          </td>
				          <td>&nbsp;</td>
					      <td>&nbsp;</td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width=""><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										申请人
									</th>					
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="DEPT_NAME">办事处</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										办事处主管
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="BACKCOMP">收款人</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_MONEY">退款金额</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="EXPECTEDDATE">预计退款日</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_DATE">实际退款日</page:pagingSort>
									</th>
								  <th class="ui-state-default ui-th-ltr zc_grid_head">
										单位主管审核
									</th> 
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业管部审核
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										财务部审核
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">												
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td onclick="expand('${item.FSS_ID}');" style="cursor: pointer;text-align: center;"><c:if test="${item.STATUS==0 and item.STATE==3 }"><img src="${ctx }/images/u611.gif" title="完成拨款"></c:if><c:if test="${item.STATUS==0 and (item.STATE==0 or item.STATE==1)}"><img src="${ctx }/images/u608.gif" title="审核中"></c:if><c:if test="${item.STATUS==1 }"><img src="${ctx }/images/u622.gif" title="驳回"></c:if></td>
										<td style="text-align: center;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.UPPER_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BACKCOMP }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEY }" />&nbsp;</td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.EXPECTEDDATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
									    <td style="text-align: center;"><c:if test="${item.DEPARTMENTSTATUS==0 }"><c:if test="${departmentstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateDepartMentById('${item.ID }','1','${item.FSS_ID }');">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);" onClick="updateDepartMentById('${item.ID }','2','${item.FSS_ID }')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${departmentstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.DEPARTMENTSTATUS==1 }">Y</c:if><c:if test="${item.DEPARTMENTSTATUS==2 }">N</c:if></td>
										<td style="text-align: center;"><c:if test="${item.EXAMSTATUS==0 }"><c:if test="${examstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateExamById('${item.ID }','1','${item.FSS_ID }')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);" onClick="updateExamById('${item.ID }','2','${item.FSS_ID }')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${examstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.EXAMSTATUS==1 }">Y</c:if><c:if test="${item.EXAMSTATUS==2 }">N</c:if></td>
										<td style="text-align: center;"><c:if test="${item.FINANCIALSTATUS==0 }"><c:if test="${financialstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateFinancialById('${item.ID }','1','${item.FSS_ID }')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);"  onClick="updateFinancialById('${item.ID }','2','${item.FSS_ID }')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${financialstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.FINANCIALSTATUS==1 }">Y</c:if><c:if test="${item.FINANCIALSTATUS==2 }">N</c:if></td>
									    <td style="text-align: center;"><a href="javaScript:void(0);" onclick="showFundsReturn('${item.FSS_ID }','${item.CREATE_DATE }');">查看</a></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="10"  align="center">
											<div id="pactAffix${item.FSS_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>											
									</tr>
								</c:forEach>
								
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

<div style="display:none;" id="fundsReturn" title="当前位置——退款单">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="../servlet/defaultDispatcher" id="funds_return_form" method="post">
<%-- 				<input type="hidden" id="fiin_id_return" name="fiin_id" value="${fundReturn.fiin_id }"/>
				<input type="hidden" id="BIZ_TYPE" name="BIZ_TYPE" value="1"/>
				<input type="hidden" id="surplus_money_return" name="surplus_money" value="${fundReturn.surplus_money }"/> --%>
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">受款人:</td>
						<td><input type="text" name="payee" id="payee" class="tb_return" readonly="readonly" size="40"/></td>
						<td align="right">退款日期</td>
						<td><input type="text" id="return_date" name="return_date" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">请款说明:</td>
						<td><input type="text" id="reason" name="reason" class="tb_return" readonly="readonly"/>
						</td>
						<td colspan="2">
							&nbsp;
						</td>
						
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">退款金额:</td>
						<td><input type="text" name="amount" id="amount" class="tb_return" readonly="readonly"/></td>
						<td align="right">支付方式:<font color="red">*</font></td>
						<td>
						<input type="text" name="pay_type" id="pay_type" class="tb_return" readonly="readonly"/>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">银行名称:</td>
						<td><input type="text" id="bank_name" name="bank_name" class="tb_return" readonly="readonly" size="40"/></td>
						<td align="right">银行账号:</td>
						<td><input type="text" name="bank_account" id="bank_account" class="tb_return" readonly="readonly"/></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">备注:</td>
						<td colspan="3">
							<textarea id="remark" name="remark" rows="8" cols="76" style="border: 1px solid #A6C9E2;" readonly="readonly"></textarea>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="4" id="button_flag" style="text-align: center;">
							<input type="button" value="关&nbsp;闭" onclick="$('#fundsReturn').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>		
	</body>
</html>