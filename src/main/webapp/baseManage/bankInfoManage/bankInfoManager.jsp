<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/bankInfoManage/js/bankInfo.js"></script>
		<title>银行信息</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="bankInfo.queryBankAllInfo" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;银行信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="javascript:location.href='${ctx}/servlet/defaultDispatcher?__action=bankInfo.getCreateBankJsp'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加银行"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
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
							银行编号(或简称)
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							联系人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							联系电话
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
						<c:forEach items="${dw.rs}" var="bank" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count } &nbsp;</td>
								<td style="text-align: center;">${bank.BANK_NAME } &nbsp;</td>
								<td style="text-align: center;">${bank.BANK_CODE } &nbsp;</td>
								<td style="text-align: center;">${bank.BANK_LINKMAN } &nbsp;</td>
								<td style="text-align: center;">${bank.BANK_PHONE} &nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showBank(${bank.BABI_ID});">查看</a> <a href="javaScript:void(0);" onclick="preUpdateBank(${bank.BABI_ID});">修改</a> <a href="javaScript:void(0);" onclick="invalidBank(${bank.BABI_ID});">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>					
		</form> 
	</body>
</html>