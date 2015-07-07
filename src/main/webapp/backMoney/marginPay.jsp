<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>保证金请款</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
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
		
	  	<%--2011/12/22 Yang Yun Add check has default link man. Start--%>
	  	<%--
		function showEditPayMoneyReviewRecord(code,id)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOneByMargin&lease_code='+code+'&CREDIT_ID='+id;
	 	}
		--%>
	 	function showEditPayMoneyReviewRecord(code,id,has_linkman)
	 	{
	 		if(has_linkman >= 1){
	 			location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOneByMargin&lease_code='+code+'&CREDIT_ID='+id;
	 		} else {
	 			alert("请先维护客户联系人！");
	 		}
	 	}
	 	<%--2011/12/22 Yang Yun Add check has default link man. Start--%>
	  
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.queryRentContractBackMoneyByMargin" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保证金请款</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="middle">
				          <table style="margin-left: 10px;">
				          		<tr>
						          <td>状态：</td>
						          <td>
						          	<select name="search_status" class="panel_select">
						          		<option value="">全部</option>
						          		<option value="1" <c:if test="${search_status eq '1' }">selected="selected"</c:if>>未拨款</option>
						          		<option value="2" <c:if test="${search_status eq '2' }">selected="selected"</c:if>>拨款中</option>
						          		<option value="3" <c:if test="${search_status eq '3' }">selected="selected"</c:if>>已拨款</option>
						          	</select>
						          </td>
						          <td>查询内容：</td>
						          <td>
						          	<input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" class="panel_text" style="width: 300px;">
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
						<td>
							<page:pagingToolbarTop pagingInfo="${dw }"/>
						</td>
						</tr>
					</table>
						<table class="grid_table">
							<tr>
								<th>
									状态
								</th>
								<th>
									案件号
								</th>
								<th>
									合同编号
								</th>
								<th>
									客户名称
								</th>
								<th>
									办事处
								</th>
								<th>
									办事处主管
								</th>
								<th>
									客户经理
								</th>
								<th>
									供应商
								</th>
								<th>
									拨款金额
								</th>
								<th>
									审核中金额
								</th>
								<th>
									已核准金额
								</th>
								<th>
									剩余金额
								</th>
								<th>
									操作
								</th>
							</tr>
							<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
								<tr>
									<td style="text-align: center; cursor: pointer;" onClick="exBankMoney('contractTr${item.ID }','${item.ID }','manage','1');">
										<c:if test="${item.AUTHED_MONEY <= 0 && item.AUTHING_MONEY <= 0}">
											<img src="${ctx }/images/u608.gif" title="未拨款">
										</c:if>
										<c:if test="${item.AUTHED_MONEY >= item.PLEDGE_MONEY}">
											<img src="${ctx }/images/u611.gif" title="完成付款">
										</c:if>
										<c:if test="${item.AUTHING_MONEY > 0}">
											<img src="${ctx }/images/u622.gif" title="拨款中">
										</c:if>
									</td>
									<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
									<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
									<td style="text-align: center;">${item.CUST_NAME }</td>
									<td style="text-align: center;">${item.DECP_NAME_CN }</td>
									<td style="text-align: center;">${item.UP_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.BRAND }&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PLEDGE_MONEY }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AUTHING_MONEY }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AUTHED_MONEY }" />&nbsp;</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PLEDGE_MONEY - item.AUTHING_MONEY - item.AUTHED_MONEY }" />&nbsp;</td>
									<td style="text-align: center;">
										<c:if test="${item.PLEDGE_MONEY - item.AUTHED_MONEY - item.AUTHING_MONEY > 0 }">
											<a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.LEASE_CODE }','${item.CREDIT_ID }', '${item.HAS_LINKMAN }');">申请拨款</a>
										</c:if>
										<c:if test="${item.PLEDGE_MONEY - item.AUTHED_MONEY - item.AUTHING_MONEY <= 0 }">
											<font color="#c0c0c0">申请拨款</font>
										</c:if>
										&nbsp;
									</td>
								</tr>
								<tr>
									<th class="pact" colspan="13">
										<div id="contractTr${item.ID }" align="center"
											style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</th>
								</tr>
							</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">
										未拨款
										<img src="${ctx }/images/u622.gif">
										拨款中
										<img src="${ctx }/images/u611.gif">
										完成拨款&nbsp;
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