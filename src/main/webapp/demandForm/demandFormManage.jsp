<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>发票管理</title>
  </head>
  <script type="text/javascript">
  	$(function (){
  		var invoice_id = "${invoice_id}";
  		if (invoice_id != "") {
  			showInvoicesDetail(invoice_id);
		}
  		var msg = "${msg}";
  		if (msg != "") {
  			alert(msg);
		}
  	});
  
  	function showAddInvoices(invoice_id){
  		$("#addInvoicesWin").dialog({modal:true, autoOpen:false, width:400});
  		$("#invoice_id").val(invoice_id);
  		$("#addInvoicesWin").dialog("open");
  	}
  	
  	function addInvoices(){
  		var codeFrom = $("#codeFrom").val();
  		var codeTo = $("#codeTo").val();
  		var money = $("#money").val();
  		var reg_int = /^\d+$/;
  		var reg_dc = /^\d+(.\d+)?$/;
  		if (!reg_int.exec(codeFrom) || !reg_int.exec(codeTo)) {
			alert("发票号必须是数字！");
			return;
		}
  		var codeFromNum = parseInt(codeFrom);
  		var codeToNum = parseInt(codeTo);
  		if (codeFromNum > codeToNum) {
  			alert("发票号区间有误，请重新输入！");
			return;
		}
  		if ((codeToNum - codeFromNum) > 150) {
  			alert("发票数不能超过150张！");
			return;
  		}
  		if ("" == $("#drawer").val()) {
			alert("请输入出票人！");
			return;
		}
  		if (!reg_dc.exec(money)) {
			alert("金额输入有误！");
			return;
		}
  		if ("" == $("#invoice_type").val()) {
			alert("请选择发票类型！");
			return;
		}
  		if(confirm("确定要添加【" + (codeToNum - codeFromNum + 1) + "】张发票吗？")){
  			$("#addInvoicesForm").submit();
  		}
  	}
	function showInvoicesDetail(invoice_id){
		$("#pactAffix_" + invoice_id).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=invoiceManageCommand.showInvoicesDetail&invoice_id=" + invoice_id);
	    });
	}
  	
	function showUpdateInvoice(id, invoice_code, drawer, invoice_money, invoice_type, invoice_id, memo, status){
		$("#updateInvoiceWin").dialog({modal:true, autoOpen:false, width:500, position:top});
		$("#id_update").val(id);
		$("#status_update").val(status);
		$("#invoice_id_update").val(invoice_id);
		$("#invoice_code_update").val(invoice_code);
		$("#drawer_update").val(drawer);
		$("#memo_update").val(memo);
		$("#invoice_money_update").val(invoice_money);
		$("#invoice_type_update").val(invoice_type);
  		$("#updateInvoiceWin").dialog("open");
	}
  	
	function updateInvoice(){
		var invoice_code = $("#invoice_code_update").val();
		var drawer = $("#drawer_update").val();
		var invoice_money = $("#invoice_money_update").val();
		var invoice_type = $("#invoice_type_update").val();
		var reg_dc = /^\d+(.\d+)?$/;
		if ("" == invoice_code) {
			alert("发票号不能为空！");
			return;
		}
		if ("" == drawer) {
			alert("出票人不能为空！");
			return;
		}
		if (!reg_dc.exec(invoice_money)) {
			alert("金额输入有误！");
			return;
		}
		if ("" == invoice_type) {
			alert("请选择发票类型！");
			return;
		}
		$("#updateInvoiceForm").submit();
	}
	
	function cancelInvoice(id, credit_id){
		if(confirm("确定要作废该发票吗？")){
			$("#id_update").val(id);
			$("#invoice_id_update").val(credit_id);
			$("#status_update").val("-1");
			$("#action_update").val("invoiceManageCommand.updateInvoiceStatus");
			$("#updateInvoiceForm").submit();
		}
	}
	
	function startInvoice(id, credit_id){
		if(confirm("确定要启用该发票吗？")){
			$("#id_update").val(id);
			$("#invoice_id_update").val(credit_id);
			$("#status_update").val("0");
			$("#action_update").val("invoiceManageCommand.updateInvoiceStatus");
			$("#updateInvoiceForm").submit();
		}
	}
	
	function showAddProject(){
		$("#showAddProjectWin").dialog({modal:true, autoOpen:false, width:400});
  		$("#showAddProjectWin").dialog("open");
		
	}
	
	function addProject(){
		var url = "${ctx }/servlet/defaultDispatcher";
		var param = {__action : "invoiceManageCommand.getCreditIdByLeaseCode", "lease_code" : $.trim($("#lease_code").val())};
		$.getJSON(url, param, function (data){
			if(data.credit_id != null){
				$("#credit_id").val(data.credit_id);
				//$("#total_money").val(data.total_money);
				$("#lease_code").val($.trim($("#lease_code").val()));
				$("#showAddProjectForm").submit();
			} else {
				alert("没有此合同号！");
			}
		});
	}
	
	function checkedAll(e){
		$("input[type='checkbox'][name='invoice_ids']").each(function (){
			$(this).attr("checked", $(e).attr("checked"));
		});
	}
	
	function batchUpdate(invoice_id){
		var ids = "";
		$("input[type='checkbox'][name='invoice_ids']").each(function (){
			if($(this).attr("checked")){
				ids += $(this).val() + ",";
			}
		});
		if(ids == ""){
			alert("请至少选择1条记录！");
		} else {
			$("#id_batch").val(ids.substring(0, ids.length - 1));
			$("#batchUpdateInvoiceWin").dialog({modal:true, autoOpen:false, width:500, position:top});
			$("#invoice_id_batch").val(invoice_id);
	  		$("#batchUpdateInvoiceWin").dialog("open");
		}
		
	}
	
	function doBatchUpdate(){
		$("#batchUpdateInvoiceForm").submit();
	}
	
	function checkShow(e){
		var relative = $(e).attr("relative");
		var rArray = relative.split(',');
		for ( var i = 0; i < rArray.length; i++) {
			if($(e).attr("checked")){
				$("#" + rArray[i]).val("");
				$("#" + rArray[i]).attr("disabled", false);
			} else {
				$("#" + rArray[i]).val("");
				$("#" + rArray[i]).attr("disabled", true);
			}
		}
		
	}
	
	function showLogForInvoice(id){
		$("#logWin").toggle(
			function() {
				$("#logWin").load("../servlet/defaultDispatcher?__action=invoiceManageCommand.showInvoiceLog&id=" + id);
			});	
		$('#logWin').dialog({
			modal:true,
			autoOpen: false,
			width: 830
		});	
		$('#logWin').dialog('open');
	}
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="invoiceManageCommand.queryPage" />
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;发票管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
				        	<tr>
				        		<td>租赁方式:</td>
				        		<td>
				        			<tac:dropdownListTag name="contract_type" item="${contractTypeSelection }" displayValue="${contract_type }" style="height: 25px; line-height: 25px;"/>
				        		</td>
				        		<td>状态:</td>
				        		<td>
				        			<select name="invoice_status" style="height: 25px;">
				        				<option value="">---全部---</option>
				        				<option value="1" <c:if test="${invoice_status eq '1' }">selected="selected"</c:if>>已齐全</option>
				        				<option value="0" <c:if test="${invoice_status eq '0' }">selected="selected"</c:if>>待补中</option>
				        			</select>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>供应商:</td>
				        		<td colspan="3">
				        			<input type="text" name="search_supl_name" value="${search_supl_name }" class="panel_text" style="width: 300px;"/>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>关键字:</td>
				        		<td colspan="3">
				        			<input type="text" name="search_content" value="${search_content }" class="panel_text" style="width: 300px;"/>
				        		</td>
				        	</tr>
				        </table>
		 		</td>
				<td style="width:50px;" class="ss_bigt" valign="middle">
					<a href="javaScript:void(0)" id="search_but" onclick="$('#form1').submit();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
	</div>
	<br/>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table style="width: 100%">
					<tr>
						<td><input type="button" value="添加案件" onclick="showAddProject();" class="panel_button"/></td>
						<td align="right"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
					</tr>
				</table>
				<table cellspacing="1" class="grid_table">
					<tr>
						<th style="text-align: center;" rowspan="2">
							状态
						</th>
						<th style="text-align: center;" rowspan="2">
							序号
						</th>
						<th style="text-align: center;" rowspan="2">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
						</th>
						<th style="text-align: center;" rowspan="2">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="LEASE_CODE">合同号</page:pagingSort>
						</th>
						<th style="text-align: center;" rowspan="2">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CUST_NAME">客户名称</page:pagingSort>
						</th>
						<th style="text-align: center;" rowspan="2">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="SUPL_NAME">供应商</page:pagingSort>
						</th>
						<th style="text-align: center;" rowspan="2">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="TOTAL_MONEY">合同总价(A)</page:pagingSort>
						</th>
						<th style="text-align: center;" colspan="2">
							发票原件
						</th>
						<th style="text-align: center;" colspan="2">
							发票复印件
						</th>
						<th style="text-align: center;" rowspan="2">
							剩余金额(A-B)
						</th>
						<th style="text-align: center;" rowspan="2">
							操作
						</th>
					</tr>
					<tr>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="INVOICE_COUNT1">数量</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="INVOICE_MONEY1">金额(B)</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="INVOICE_COUNT">数量</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="INVOICE_MONEY">金额(C)</page:pagingSort>
						</th>
						

					</tr>
					<tbody>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="i">
					<tr>
						<td style="cursor: pointer;" onclick="showInvoicesDetail('${item.ID}');">
							<c:if test="${item.INVOICE_STATUS eq 1}">
								<img src="${ctx }/images/u608.gif">
							</c:if>
							<c:if test="${item.INVOICE_STATUS eq 0}">
								<img src="${ctx }/images/u622.gif">
							</c:if>
						</td>
						<td>${i.count}&nbsp;</td>
						<td>${item.CREDIT_RUNCODE}&nbsp;</td>
						<td>${item.LEASE_CODE}&nbsp;</td>
						<td>${item.CUST_NAME}&nbsp;</td>
						<td>${item.SUPL_NAME }&nbsp;</td>
						<td><fmt:formatNumber type="currency" value="${item.TOTAL_MONEY }"/>&nbsp;</td>
						<td>${item.INVOICE_COUNT1 }&nbsp;</td>
						<td><fmt:formatNumber type="currency" value="${item.INVOICE_MONEY1 }"/>&nbsp;</td>
						<td>${item.INVOICE_COUNT }&nbsp;</td>	
					 	<td><fmt:formatNumber type="currency" value="${item.INVOICE_MONEY }"/>&nbsp;</td> 
					 	<td><fmt:formatNumber type="currency" value="${item.REMANENT_MONEY}"/>&nbsp;</td> 
					   	<td>
					   		<a href="#" onclick="showAddInvoices('${item.ID}');">添加发票</a>&nbsp;
					   	</td>
					</tr>
					<tr>
						<th class="pact" colspan="13">
							<div id="pactAffix_${item.ID}" align="center"
								style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</th>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<table style="width: 100%">
				<tr>
					<td align="right">
						<img src="${ctx }/images/u622.gif">
						待补中&nbsp;
						<img src="${ctx }/images/u608.gif">
						已齐全
					</td>
				</tr>
			</table>	
			</div>
			</div>
			</div>
			</form>
			
<!-- 添加案件 -->
<div id="showAddProjectWin" title="添加案件" style="display: none;">
<form action="../servlet/defaultDispatcher" id="showAddProjectForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="invoiceManageCommand.addProject" />
<input type="hidden" id="credit_id" name="credit_id" />
	<table class="panel_table">
		<tr>
			<th>合同号：</th>
			<td style="text-align: left;">
				<input type="text" name="lease_code" id="lease_code" class="panel_text" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="addProject();">
			</th>
		</tr>
	</table>
</form>
</div>

<!-- 添加发票 -->
<div id="addInvoicesWin" title="添加发票" style="display: none;">
<form action="../servlet/defaultDispatcher" id="addInvoicesForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="invoiceManageCommand.addInvoices" />
<input type="hidden" id="invoice_id" name="invoice_id" />
	<table class="panel_table">
		<tr>
			<th>发票号：</th>
			<td style="text-align: left;">
				<input type="text" name="codeFrom" id="codeFrom" class="panel_text" style="width: 100px;"/>
				至
				<input type="text" name="codeTo" id="codeTo" class="panel_text" style="width: 100px;"/>
			</td>
		</tr>
		<tr>
			<th>出票人：</th>
			<td style="text-align: left;"><input type="text" name="drawer" id="drawer" class="panel_text" style="width: 220px;"/></td>
		</tr>
		<tr>
			<th>金额：</th>
			<td style="text-align: left;"><input type="text" name="money" id="money" class="panel_text" style="width: 220px;"/></td>
		</tr>
		<tr>
			<th>发票类型：</th>
			<td style="text-align: left;">
				<select name="invoice_type" id="invoice_type" style="height: 25px;">
					<option value="">请选择</option>
					<option value="0">复印件</option>
					<option value="1">原件</option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="addInvoices();">
			</th>
		</tr>
	</table>
</form>
</div>

<!-- 修改发票 -->
<div id="updateInvoiceWin" title="修改发票" style="display: none;">
<form action="../servlet/defaultDispatcher" id="updateInvoiceForm" method="post">
<input type="hidden" id="action_update" name="__action"  value="invoiceManageCommand.updateInvoice" />
<input type="hidden" id="id_update" name="invoice.id" />
<input type="hidden" id="invoice_id_update" name="invoice.invoice_id" />
	<table class="panel_table">
		<tr>
			<th>发票号：</th>
			<td>
				<input type="text" name="invoice.invoice_code" id="invoice_code_update" class="panel_text" style="width: 120px;"/>
			</td>
			<th>出票人：</th>
			<td>
				<input type="text" name="invoice.drawer" id="drawer_update" class="panel_text" style="width: 120px;"/>
			</td>
		</tr>
		<tr>
			<th>金额：</th>
			<td>
				<input type="text" name="invoice.invoice_money" id="invoice_money_update" class="panel_text" style="width: 120px;"/>
			</td>
			<th>发票类型：</th>
			<td>
				<select name="invoice.invoice_type" id="invoice_type_update" style="height: 25px;">
					<option value="0">复印件</option>
					<option value="1">原件</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>备注：</th>
			<td>
				<input type="text" name="invoice.memo" id="memo_update" class="panel_text" style="width: 120px;"/>
			</td>
			<th>发票类型：</th>
			<td>
				<select name="invoice.status" id="status_update" style="height: 25px;">
					<option value="0">正常</option>
					<option value="-1">作废</option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="4" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="updateInvoice();">
			</th>
		</tr>
	</table>
</form>
</div>

<!-- 批量修改 -->
<div id="batchUpdateInvoiceWin" title="批量修改" style="display: none;">
<form action="../servlet/defaultDispatcher" id="batchUpdateInvoiceForm" method="post">
<input type="hidden" id="action_batch" name="__action"  value="invoiceManageCommand.batchUpdateInvoice" />
<input type="hidden" id="invoice_id_batch" name="invoice.invoice_id" />
<input type="hidden" id="id_batch" name="invoice.id" />
	<table class="panel_table">
		<tr>
			<th>状态：</th>
			<td style="width: 20px;">
				<input type="checkbox" relative="status_batch" onclick="checkShow(this);">
			</td>
			<td>
				<select name="invoice.status" id="status_batch" disabled="disabled" style="width: 200px;" class="panel_select">
					<option value="0">正常</option>
					<option value="-1">作废</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>发票号：</th>
			<td style="width: 20px;">
				<input type="checkbox" relative="invoice_code_batch" onclick="checkShow(this);">
			</td>
			<td>
				<input type="text" name="invoice.invoice_code" id="invoice_code_batch" disabled="disabled" class="panel_text" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th>出票人：</th>
			<td>
				<input type="checkbox" relative="drawer_batch" onclick="checkShow(this);">
			</td>
			<td>
				<input type="text" name="invoice.drawer" id="drawer_batch" disabled="disabled" class="panel_text" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th>金额：</th>
			<td>
				<input type="checkbox" relative="invoice_money_batch" onclick="checkShow(this);">
			</td>
			<td>
				<input type="text" name="invoice.invoice_money" id="invoice_money_batch" disabled="disabled" class="panel_text" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th>发票类型：</th>
			<td>
				<input type="checkbox" relative="invoice_type_batch" onclick="checkShow(this);">
			</td>
			<td>
				<select name="invoice.invoice_type" id="invoice_type_batch" disabled="disabled" style="width: 200px;" class="panel_select">
					<option value="0">复印件</option>
					<option value="1">原件</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>备注：</th>
			<td>
				<input type="checkbox" relative="memo_batch" onclick="checkShow(this);">
			</td>
			<td>
				<input type="text" name="invoice.memo" id="memo_batch" disabled="disabled" class="panel_text" style="width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th colspan="3" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="doBatchUpdate();">
			</th>
		</tr>
	</table>
</form>
</div>

<!-- 日志 -->
<div id="logWin" title="日志" style="display: none;">
	<img src="${ctx }/images/loading.gif">
</div>

	</body>
</html>		