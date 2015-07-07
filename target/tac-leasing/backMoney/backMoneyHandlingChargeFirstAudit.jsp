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

		
	function updateDepartMentById(backId, num) {
		if (!confirm("确定吗？")) {
			return false;
		}

		location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateDepartMentHandlingChargeById&backId='
				+ backId
				+ "&Num="
				+ num
				+ "&BACKSTATE=9";
	}
	
	function updateExamById(backId, num) {
		if (!confirm("确定吗？")) {
			return false;
		}
		location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateExamHandlingChargeById&BACKSTATE=9&backId='
				+ backId
				+ "&Num="
				+ num;
			
	}
	
	function updateFinancialById(backId, num) {
		if (!confirm("确定吗？")) {
			return false;
		}

		location.href = '${ctx }/servlet/defaultDispatcher?__action=backMoney.updateFinancialHandlingChargeById&BACKSTATE=9&backId='
				+ backId
				+ "&Num="
				+ num;
	}
	
	function showDetail(po_id){
		$("#pactAffix_" + po_id).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=backMoney.queryHandlingChargeDetail&po_id=" + po_id);
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
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车手续费拨款审批</span>
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
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
						<td><page:pagingToolbarTop pagingInfo="${dw }"/> </td>
						</tr>
					</table>
						<table class="grid_table">
							<thead>
								<tr>
									<th>
										状态
									</th>
									<th>
										拨款流水号
									</th>
									<th>
										请款单位
									</th>
									<th>
										开户行
									</th>
									<th>
										账号
									</th>
									<th>
										拨款金额
									</th>
									<th>
										申请日期
									</th>
									<th>
										申请人
									</th>
									<th>
										业务部审核
									</th>
									<th>
										业管部审核
									</th>
									<th>
										财务部审核
									</th>
									<th>
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
										<td style="text-align: center;">
											<c:if test="${item.STATUS==0 and item.STATE==3 }"><img src="${ctx }/images/u611.gif" title="完成拨款"></c:if>
											<c:if test="${item.STATUS==0 and (item.STATE==0 or item.STATE==1)}"><img src="${ctx }/images/u608.gif" title="审核中"></c:if>
											<c:if test="${item.STATUS==1 }"><img src="${ctx }/images/u622.gif" title="驳回"></c:if>
										</td>
										
										<td style="text-align: center;">${item.ORDER_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.BACKCOMP }&nbsp;</td>
										<td style="text-align: center;">${item.BANK_NAME }</td>
										<td style="text-align: center;">${item.BANK_ACCOUNT }</td>
										<td style="text-align: center;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,###,##0.00"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.APPLICATION_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
										<td style="text-align: right;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;"><c:if test="${item.DEPARTMENTSTATUS==0 }"><c:if test="${departmentstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateDepartMentById('${item.ID }','1');">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);" onClick="updateDepartMentById('${item.ID }','2')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${departmentstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.DEPARTMENTSTATUS==1 }">Y</c:if><c:if test="${item.DEPARTMENTSTATUS==2 }">N</c:if></td>
										<td style="text-align: center;"><c:if test="${item.EXAMSTATUS==0 }"><c:if test="${examstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateExamById('${item.ID }','1')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);" onClick="updateExamById('${item.ID }','2')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${examstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.EXAMSTATUS==1 }">Y</c:if><c:if test="${item.EXAMSTATUS==2 }">N</c:if></td>
										<td style="text-align: center;"><c:if test="${item.FINANCIALSTATUS==0 }"><c:if test="${financialstatus == 'true' }"><c:choose><c:when test="${item.DEPARTMENTSTATUS==2 or item.EXAMSTATUS==2 or item.FINANCIALSTATUS==2}"><font color="#C0C0C0">通过 |驳回</font></c:when><c:otherwise><a href="javaScript:void(0);" onClick="updateFinancialById('${item.ID }','1')">通过 |</a>&nbsp;&nbsp;<a href="javaScript:void(0);"  onClick="updateFinancialById('${item.ID }','2')">驳回</a></c:otherwise></c:choose></c:if><c:if test="${financialstatus != 'true' }">未审核</c:if></c:if><c:if test="${item.FINANCIALSTATUS==1 }">Y</c:if><c:if test="${item.FINANCIALSTATUS==2 }">N</c:if></td>
									    <td style="text-align: center;">
									    	<a href="javascript:void(0);" onclick="showDetail('${item.PO_ID}');">查看明细</a>
									    </td>
									</tr>
									<tr>
										<th class="pact" colspan="12">
											<div id="pactAffix_${item.PO_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
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

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
	</body>
</html>