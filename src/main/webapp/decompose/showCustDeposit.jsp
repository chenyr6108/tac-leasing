<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/showdeposit.js"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag });
			});
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>分解单管理--来款分解</title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">未处理</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">冲抵租金</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">平均冲抵租金</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-4" onclick="selectCard(3)">期末退回</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-5" onclick="selectCard(4)">全部</a></li>
		</ul>
		<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
			<!--<input type="hidden" name="__action" id="__action" value="decompose.showAllIncomeInfo" />-->
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
				<br>	    
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="60%" class="ss_t" valign="center" >
				         <table width="95%" border="0" cellspacing="0" cellpadding="0" class="ss_wenzi"style="margin-left: 10px;">
				           <tr>
				             <td width="10%">承租人名称:</td>
				             <td colspan="2">
				             <input type="text" name="cust_name" id="cust_name" value="${cust_name }" style="width: 200px"
							  										onKeyPress="if (event.keyCode == 13) { searchdeposit() }">
				             <td width="10%">支付表编号:</td>
				             <td colspan="2">
				             <input type="text" name="recp_code" id="recp_code" value="${recp_code }" style="width: 200px"
							 										onKeyPress="if (event.keyCode == 13) { searchdeposit() }">
				             </td>
				           </tr>
				         </table>
				        </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="javaScript:void(0)" onclick="searchdeposit();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    <br>	
				<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr >
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<div id="tabs-1">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>承租人名称</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>支付表编号</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>质押金金额</strong>
						</th>
						<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理时间</strong>
						</th>
						<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作</strong>
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="deposit" varStatus="status">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td height="26" style="text-align: center;">${deposit.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.RECP_CODE }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${deposit.REAL_PRICE }" type="currency" ></fmt:formatNumber>&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${deposit.DEPOSIT_STATUS eq 0}"><input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button1" value="冲抵租金" onclick="counterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button2" value="平均冲抵租金" onclick="averagecounterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }','${deposit.REAL_PRICE }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button3" value="期末退回" onclick="endoftermback('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;</c:when><c:otherwise><input type="button" disabled name="button1" value="冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button2" value="平均冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button3" value="期末退回" onclick="" />&nbsp;</c:otherwise></c:choose></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				
				<div id="tabs-2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>承租人名称</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>支付表编号</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>质押金金额</strong>
						</th>
						<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理时间</strong>
						</th>
						<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作</strong>
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="deposit" varStatus="status">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td height="26" style="text-align: center;">${deposit.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.RECP_CODE }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${deposit.REAL_PRICE }" type="currency" ></fmt:formatNumber>&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${deposit.DEPOSIT_STATUS eq 0}"><input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button1" value="冲抵租金" onclick="counterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button2" value="平均冲抵租金" onclick="averagecounterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button3" value="期末退回" onclick="endoftermback('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;</c:when><c:otherwise><input type="button" disabled name="button1" value="冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button2" value="平均冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button3" value="期末退回" onclick="" />&nbsp;</c:otherwise></c:choose></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				
				<div id="tabs-3">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>承租人名称</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>支付表编号</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>质押金金额</strong>
						</th>
						<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理时间</strong>
						</th>
						<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作</strong>
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="deposit" varStatus="status">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td height="26" style="text-align: center;">${deposit.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.RECP_CODE }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${deposit.REAL_PRICE }" type="currency" ></fmt:formatNumber>&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${deposit.DEPOSIT_STATUS eq 0}"><input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button1" value="冲抵租金" onclick="counterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button2" value="平均冲抵租金" onclick="averagecounterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button3" value="期末退回" onclick="endoftermback('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;</c:when><c:otherwise><input type="button" disabled name="button1" value="冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button2" value="平均冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button3" value="期末退回" onclick="" />&nbsp;</c:otherwise></c:choose></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				
				<div id="tabs-4">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>承租人名称</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>支付表编号</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>质押金金额</strong>
						</th>
						<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理时间</strong>
						</th>
						<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作</strong>
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="deposit" varStatus="status">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td height="26" style="text-align: center;">${deposit.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.RECP_CODE }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${deposit.REAL_PRICE }" type="currency" ></fmt:formatNumber>&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${deposit.DEPOSIT_STATUS eq 0}"><input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button1" value="冲抵租金" onclick="counterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button2" value="平均冲抵租金" onclick="averagecounterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button3" value="期末退回" onclick="endoftermback('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;</c:when><c:otherwise><input type="button" disabled name="button1" value="冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button2" value="平均冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button3" value="期末退回" onclick="" />&nbsp;</c:otherwise></c:choose></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				
				<div id="tabs-5">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>承租人名称</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>支付表编号</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>质押金金额</strong>
						</th>
						<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人</strong>
						</th>
						<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理时间</strong>
						</th>
						<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作</strong>
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="deposit" varStatus="status">
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td height="26" style="text-align: center;">${deposit.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.RECP_CODE }&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${deposit.REAL_PRICE }" type="currency" ></fmt:formatNumber>&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_NAME }&nbsp;</td>
							<td style="text-align: center;">${deposit.DECOMPOSE_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${deposit.DEPOSIT_STATUS eq 0}"><input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button1" value="冲抵租金" onclick="counterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button2" value="平均冲抵租金" onclick="averagecounterbalance('${deposit.RECP_CODE }','${deposit.RECP_ID }','${deposit.REAL_PRICE }')" />&nbsp;&nbsp;<input type="button" style="background-color: #eff6fe; cursor:pointer;" name="button3" value="期末退回" onclick="endoftermback('${deposit.RECP_CODE }','${deposit.RECP_ID }')" />&nbsp;</c:when><c:otherwise><input type="button" disabled name="button1" value="冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button2" value="平均冲抵租金" onclick="" />&nbsp;&nbsp;<input type="button" disabled name="button3" value="期末退回" onclick="" />&nbsp;</c:otherwise></c:choose></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><br><%@ include file="/common/pageControl.jsp"%><br></td>
					</tr>
				</table>
				</div>
				</div>
			</div>
		</form>
		</div>
	</body>
</html>