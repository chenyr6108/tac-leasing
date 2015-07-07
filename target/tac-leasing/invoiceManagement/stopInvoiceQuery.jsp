<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function() {
		$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
		$("#toDate").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function getPaymentDetail(RECP_ID,TAX_PLAN_CODE,FLAG) {
		$("#paymentDetail").toggle(
			function() {
				$("#paymentDetail").load("../servlet/defaultDispatcher?__action=invoiceManagementCommand.getPaymentDetail&recpId="+RECP_ID+"&flag="+FLAG+"&taxPlanCode="+TAX_PLAN_CODE);
		});
		var t="";
		if(FLAG=="STOP") {
			t="发票停开";
		} else {
			t="发票复开";
		}
		$('#paymentDetail').dialog({
			modal:true,
			autoOpen:false,
			height:830,
			width:800,
			resizable:false,
			title:t
		});	
		$('#paymentDetail').dialog('open');
	}
	
	function showLog(recpId) {
		$("#pactAffix"+recpId).toggle(function() {
            $(this).load("../servlet/defaultDispatcher?__action=invoiceManagementCommand.showLog&RECP_ID="+recpId);
        });
	}
</script>
<title>手动停复开票管理</title>
</head>
<body>
	<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="invoiceManagementCommand.stopInvoiceQuery"/>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	 	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;手动停复开票管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
			<div>
			<table style="width: 70%" border="0" cellspacing="0" cellpadding="0">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center">
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
				         		<tr>
				         			<td style="text-align: right;">
				         				停复开生效日：
				         			</td>
				         			<td>
				         				<select id="effectDate" name="effectDate">
					         				<option value="">--所有--</option>
					         				<c:forEach items="${effectDateList }" var="item">
					         					<option <c:if test="${item eq effectDate  }">selected="selected"</c:if> value="${item }">${item }</option>
					         				</c:forEach>
					         			</select>
				         			</td>
				         		</tr>
				 			</table>
				 			</td>
				        <td width="100" class="ss_bigt">
			       		 	<a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
		         	    <td width="13" class="ss_bigth" valign="top">&nbsp;
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
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="EFFECT_DATE">停复开生效日</page:pagingSort></th>
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
					<td style="text-align:center;">
						<c:if test="${item.STATE==0 }">停开生效时间:</c:if>
						<c:if test="${item.STATE==-1 }">复开生效时间:</c:if>
						${item.EFFECT_DATE }&nbsp;
					</td>
					<td style="text-align:center;">
					<c:if test="${item.IS_STOP eq 'Y' }">
					设定发票停开
					&nbsp;|&nbsp;
					<a href="#" onclick="getPaymentDetail('${item.RECP_ID }','${item.TAX_PLAN_CODE }','OPEN')">设定发票复开</a>
					<%-- <c:if test="${item.IS_REAL_STOP eq 'Y' }">
						<a href="#" onclick="getPaymentDetail('${item.RECP_ID }','${item.TAX_PLAN_CODE }','OPEN')">设定发票复开</a>
					</c:if>
					<c:if test="${item.IS_REAL_STOP eq 'N' }">
						设定发票复开
					</c:if> --%>
					</c:if>
					<c:if test="${item.IS_STOP eq 'N' }">
					<a href="#" onclick="getPaymentDetail('${item.RECP_ID }','${item.TAX_PLAN_CODE }','STOP')">设定发票停开</a>
					&nbsp;|&nbsp;
					设定发票复开
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
					<th colspan="10" class="pact" style="background-color: white">
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
	<div id="paymentDetail" title="开票资料" style="display:none;">
			<img src="${ctx }/images/loading.gif">
	</div>
</body>
</html>