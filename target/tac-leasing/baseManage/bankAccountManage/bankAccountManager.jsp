<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/bankAccountManage/js/bankAccount.js"></script>
		<title>银行帐号</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="bankAccount.queryBankAccountAllInfo" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;银行帐号</span>
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
					<td><input type="button" onclick="javascript:location.href='${ctx}/servlet/defaultDispatcher?__action=bankAccount.getCreateAccountJsp'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加银行账号"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						开户人
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						开户行
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						账号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						账户性质
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						币种
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						编码
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<tbody>
					<c:forEach items="${dw.rs}" var="account" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count } &nbsp;</td>
							<td style="text-align: center;">${account.ACCOUNT_NAME } &nbsp;</td>
							<td style="text-align: center;">${account.BANK_NAME } &nbsp;</td>
							<td style="text-align: center;">${account.ACCOUNT_NO } &nbsp;</td>
							<td style="text-align: center;">&nbsp;
							<c:if test="${account.ACCOUNT_PROPERTY==873 }">一般户</c:if>
							<c:if test="${account.ACCOUNT_PROPERTY==874 }">基本户</c:if>
							<c:if test="${account.ACCOUNT_PROPERTY==875 }">现金</c:if>
							<c:if test="${account.ACCOUNT_PROPERTY==876 }">纳税户</c:if>
							<c:if test="${account.ACCOUNT_PROPERTY==877 }">贷款户</c:if>
							<c:if test="${account.ACCOUNT_PROPERTY==878 }">资本金户</c:if>
							</td>
							<td style="text-align: center;">&nbsp;<c:if test="${account.CURRENCY==0 }">人民币</c:if><c:if test="${account.CURRENCY==1 }">美元</c:if></td>
							<td style="text-align: center;">${account.ACCOUNT_CODE }&nbsp;</td>							
							<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showBankAccount(${account.BABA_ID});">查看</a> <a href="javaScript:void(0);" onclick="preUpdateBankAccount(${account.BABA_ID});">修改</a> <a href="javaScript:void(0);" onclick="invalidBankAccount(${account.BABA_ID});">删除</a></td>
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