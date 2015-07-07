<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
		$("#toDate").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function addRemark(RECP_ID,TYPE) {
		$("#RECP_ID").val(RECP_ID);
		$("#TYPE").val(TYPE);
		var url="";
		if(TYPE=="NOT_STOP") {
			url='__action=invoiceManagementCommand.checkDuplicate&RECP_ID='+$("#RECP_ID").val()+"&FLAG=NOT_STOP";
		} else if(TYPE=="NOT_OPEN") {
			url='__action=invoiceManagementCommand.checkDuplicate&RECP_ID='+$("#RECP_ID").val()+"&FLAG=NOT_OPEN";
		}
		$("#remarkDiv").dialog({
			resizable:true,modal:true,title:"设定原因",
			width:320,height:200,position:[620,100],
			buttons: {
			 	关闭:function() {
			 		$(this).dialog("close");
			 	},
			 	保存:function() {
			 		$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:url,
						dataType:'json',
						success: function(flag)	{
							if(flag) {
								alert("发票状态有更新,请关闭页面,重新搜索后进行操作!");
							} else {
								if($("#REMARK").val()=="") {
									alert("请填写设定原因!");
									$("#REMARK").focus();
									return;
								}
								$("#form2").submit();
							}
						}	
					});
			 	}
			}				
		});
		$("#REMARK").focus();
	}
	function showLog(recpId) {
		$("#pactAffix"+recpId).toggle(function() {
            $(this).load("../servlet/defaultDispatcher?__action=invoiceManagementCommand.showSpecialLog&RECP_ID="+recpId);
        });
	}
</script>
</head>
<body>
	<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="invoiceManagementCommand.maintenanceSpecialInvoiceQuery"/>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	 	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;自动停复开发票管理</span>
	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
			<div>
				<table style="width: 70%" border="0" cellspacing="0" cellpadding="0">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          	<tr>
				          	  	<td style="text-align: right;">查询内容：</td>
			         			<td><input id="content" name="content" value="${content }" style="width: 168px;"></td>
			         			<td style="text-align: right;">
				        			&nbsp;&nbsp;办事处：
				        		</td>
				         		<td>
				         			<select id="deptId" name="deptId">
				         				<option value="">--所有--</option>
				         				<c:forEach items="${deptList }" var="item">
				         					<option <c:if test="${item.DECP_ID eq deptId  }">selected="selected"</c:if> value="${item.DECP_ID }">${item.DECP_NAME_CN }</option>
				         				</c:forEach>
				         			</select>
			         			</td>
			         			<td style="text-align: right;">
				         				&nbsp;&nbsp;公司别：
			         			</td>
			         			<td style="text-align: right;">
			         				<select id="companyCode" name="companyCode">
			         					<option value="">--所有--</option>
			         					<option value="1" <c:if test="${companyCode eq '1'  }">selected="selected"</c:if>>裕融</option>
			         					<option value="2" <c:if test="${companyCode eq '2'  }">selected="selected"</c:if>>裕国</option>
			         				</select>
			         			</td>
				          	</tr>
				          	<tr>
			         			<td style="text-align: right;">拨款日：</td>
			         			<td>
			         				<input readonly="readonly" name="fromDate" id="fromDate" value="${fromDate }" style="width: 78px">至<input readonly="readonly" name="toDate" id="toDate" value="${toDate }" style="width: 78px">
			         			</td>
			         			<td style="text-align: right;">已设定停开案件：</td>
			         			<td>
			         				<input type="checkbox" name="hasStop" value="Y" <c:if test="${not empty hasStop }">checked="checked"</c:if> style="cursor: pointer;">
			         			</td>
			         			<td style="text-align: right;">有操作记录：</td>
			         			<td>
			         				<input type="checkbox" name="hasLog" value="Y" <c:if test="${not empty hasLog }">checked="checked"</c:if> style="cursor: pointer;">
		         				</td>
			         		</tr>
				          </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
			</div>
			<br>
			<div class="ui-state-default ui-jqgrid-hdiv">
			<table class="panel_table">
				<tr>
					<td>
						<page:pagingToolbarTop pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th style="text-align:center;">序号</th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同号</page:pagingSort></th>
					<th style="text-align:center;">客户名称</th>
					<th style="text-align:center;">拨款日</th>
					<th style="text-align:center;">起租日</th>
					<th style="text-align:center;">业务经理</th>
					<th style="text-align:center;">办事处</th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="DUN_DAY">逾期天数</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="IS_STOP">停开状态</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="TYPE">自动设定状态</page:pagingSort></th>
					<th style="text-align:center;">操作</th>
				</tr>
			<c:forEach items="${dw.resultList}" var="item" varStatus="index">
				<tr>
					<td style="text-align:center;">${index.count }&nbsp;</td>
					<td style="text-align:center;">${item.CREDIT_RUNCODE }&nbsp;</td>
					<td style="text-align:center;">
						<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'" href="javascript:void(0);">
							${item.LEASE_CODE }
						</a>
						&nbsp;
					</td>
					<td style="text-align:center;">${item.CUST_NAME }&nbsp;</td>
					<td style="text-align:center;">${item.PAY_DATE }&nbsp;</td>
					<td style="text-align:center;">${item.START_DATE }&nbsp;</td>
					<td style="text-align:center;">${item.NAME }&nbsp;</td>
					<td style="text-align:center;">${item.DECP_NAME_CN }&nbsp;</td>
					<td style="text-align:right;">${item.DUN_DAY }&nbsp;</td>
					<td style="text-align:center;">
						<c:if test="${item.IS_STOP eq 'Y' and item.IS_DUN_45_STOP eq 'Y' }"><font color="red">逾期45天自动停开</font></c:if>
						<c:if test="${item.IS_STOP eq 'Y' and item.IS_DUN_45_STOP eq 'N' }"><font color="red">手动停开</font></c:if>
						<c:if test="${item.IS_STOP eq 'N' }">未停开</c:if>
					</td>
					<td style="text-align:center;">
						<c:if test="${empty item.TYPE }">
							未设定
						</c:if>
						<c:if test="${item.TYPE eq 'NOT_OPEN' }">
							<font color="red">不自动复开</font>
						</c:if>
						<c:if test="${item.TYPE eq 'NOT_STOP' }">
							<font color="red">不自动停开</font>
						</c:if>
						&nbsp;
					</td>
					<td style="text-align:center;">
					 	<c:if test="${item.IS_STOP eq 'Y' }"><!-- 发票状态为停开,可能是手动停开,也可能是逾期45天自动停开2种情况 -->
					 		<c:if test="${item.IS_DUN_45_STOP eq 'Y' }"><!-- 情况1逾期45天自动停开 -->
					 			设定不自动停开
					 			&nbsp;|&nbsp;
					 			<c:if test="${item.TYPE eq 'NOT_OPEN' }"><!-- 不自动复开 -->
					 				设定不自动复开
					 			</c:if>
					 			<c:if test="${item.TYPE ne 'NOT_OPEN' }">
					 				<a href="#" onclick="addRemark('${item.RECP_ID }','NOT_OPEN')">设定不自动复开</a>
					 			</c:if>
					 		</c:if>
					 		<c:if test="${item.IS_DUN_45_STOP eq 'N' }"><!-- 情况2手动停开 -->
					 			设定不自动停开
					 			&nbsp;|&nbsp;
					 			设定不自动复开
					 		</c:if>
					 	</c:if>
					 	<c:if test="${item.IS_STOP eq 'N' }"><!-- 发票状态为正常 -->
					 		<c:if test="${item.TYPE eq 'NOT_OPEN' }"><!-- 不自动复开 -->
					 			设定不自动停开
					 			&nbsp;|&nbsp;
					 			设定不自动复开	
					 		</c:if>
					 		<c:if test="${item.TYPE eq 'NOT_STOP' }">
					 			<a href="#" onclick="addRemark('${item.RECP_ID }','NOT_STOP')">设定不自动停开</a>
					 			&nbsp;|&nbsp;
					 			设定不自动复开
					 		</c:if>
					 		<c:if test="${empty item.TYPE }">
					 			<a href="#" onclick="addRemark('${item.RECP_ID }','NOT_STOP')">设定不自动停开</a>
					 			&nbsp;|&nbsp;
					 			设定不自动复开
					 		</c:if>
					 	</c:if>
					 	&nbsp;|&nbsp;
						<c:if test="${item.HAS_LOG eq 'Y' }">
						<a href="#" onclick="showLog('${item.RECP_ID }')">查看操作记录</a>
						</c:if>
						<c:if test="${item.HAS_LOG eq 'N' }">
						查看操作记录
						</c:if>
					</td>
				</tr>
				<tr>
					<th colspan="12" class="pact" style="background-color: white">
						<div id="pactAffix${item.RECP_ID}" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;">
							<img src="${ctx }/images/loading.gif">
						</div>
					</th>
				</tr>
			</c:forEach>
		    </table>
		    <table class="panel_table">
				<tr>
					<td>
						<page:pagingToolbar pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
		  </div>
		</div>
		</div>
	</form>
	<div id="remarkDiv" style="display:none">
		<form action="../servlet/defaultDispatcher?__action=invoiceManagementCommand.maintenanceSpecialInvoice" name="form2" id="form2" method="post">
			<input type="hidden" name="RECP_ID" id="RECP_ID">
			<input type="hidden" name="TYPE" id="TYPE">
			<div>
				<textarea rows="3" cols="42" id="REMARK" name="REMARK" style="resize:none"></textarea>
			</div>	
		</form>
	</div>
</body>