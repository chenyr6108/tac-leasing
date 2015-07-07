<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function addBlackBank(){
				document.blackBankAdd.BANK_NAME.value="";
				document.blackBankAdd.MEMO.value="";
				
				$("#blackBankAdd").dialog({
					modal:true,
					autoOpen: false,
					width: 450
				});
				$("#blackBankAdd").dialog('open');
			}
			
			function createBlackBank(){
				var bank_name=document.blackBankAdd.BANK_NAME.value;
				var memo=document.blackBankAdd.MEMO.value;
				
				if(bank_name==""){
					alert("银行名称不能为空！");
					return false;
				}
				document.getElementById("subUpload").disabled=true;
				
				$.post("../servlet/defaultDispatcher",
						{__action : "bankAccount.addBlackBank","BANK_NAME":bank_name,"MEMO":memo},
					function (dataBack){
						if(dataBack.count == "0"){
							alert("保存成功！");
							location.href="../servlet/defaultDispatcher?__action=bankAccount.queryAllBlackBankInfo";
						} else {
							alert("此银行名称已存在，请确认！");
						}
				}, 'json');
			}
			
			function deleteBlackBank(ID){
				if(confirm('确认要删除？')){
					$.post("../servlet/defaultDispatcher",
							{__action : "bankAccount.deleteBlackBank","ID":ID},
						function (dataBack){
							alert("操作成功！");
							location.href="../servlet/defaultDispatcher?__action=bankAccount.queryAllBlackBankInfo";
					}, 'json');
				}
			}
		</script>
		<title>银行黑名单管理</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="bankAccount.queryAllBlackBankInfo" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;银行黑名单管理</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
			<div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;银行名称：&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><a href="#" name="addBlackBank" id="addBlackBank" onclick="addBlackBank()"  class="blue_button">添加黑名单</a></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						银行名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						备注说明
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						创建人
					</th>					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<tbody>
					<c:forEach items="${dw.resultList}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count } &nbsp;</td>
							<td style="text-align: center;">${item.BANK_NAME } &nbsp;</td>
							<td style="text-align: center;">${item.MEMO } &nbsp;</td>
							<td style="text-align: center;">${item.NAME }&nbsp;</td>							
							<td style="text-align: center;"><a href="javaScript:void(0);" onclick="deleteBlackBank(${item.ID});">删除</a>&nbsp;</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
			</div>
		</form> 
		
<!------------弹出层:添加银行黑名单------------>
<div style="display: none;" id="blackBankAdd" title="您当前的位置:添加银行黑名单">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="blackBankAdd" id="blackBankAdd" action="../servlet/defaultDispatcher" method="post">
				
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showlawFeeAddTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">银行名称：<font color="red">*</font></td>
						<td style="text-align: left;"><input name="BANK_NAME" size="30"/></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">备注说明:</td>
						<td style="text-align: left;"><textarea rows="3" cols="5" name="MEMO" style="width:100%;"></textarea></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="2"><input type="button" id="subUpload" value="确&nbsp;定" onclick="createBlackBank();" class="ui-state-default ui-corner-all" style="cursor:pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>			
	</body>
</html>