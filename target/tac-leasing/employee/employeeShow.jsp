<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head> 
		
		<title>员工查看</title>
	</head>
	<body>  
			<input type="hidden" name="id" value="${employee.ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工查看</span>
	   		</div>
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
           				<div class="ui-state-default ui-jqgrid-hdiv ">
					
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td rowspan="15" align="center" valign="middle" width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
									人<br>
									员<br>
									基<br>
									本<br>
									情<br>
									况<br>
								</td>
								<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">姓名:</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">${employee.NAME }&nbsp;</td>
								<td colspan="2" width="400" style="border-left: 0px;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<input type="hidden" name="head" id="head"></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td class="ui-widget-content jqgrow ui-row-ltr">身份证号码：</td>
								<td colspan="3">${employee.ID_CARD }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>性别：</td>
								<td colspan="3">${employee.SEX}&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>年龄：</td>
								<td colspan="3">${employee.AGE }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>身份证地址：</td>
								<td colspan="3">${employee.ID_CARD_ADDRESS }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>手机号码：</td>
								<td colspan="3">${employee.MOBILE }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>联系电话(家庭座机)：</td>
								<td colspan="3">${employee.TELEPHONE }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>邮编：</td>
								<td>${employee.ZIP }&nbsp;</td>
								<td>Email：</td>
								<td>${employee.EMAIL }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>家庭常住地址：</td>
								<td colspan="3">${employee.ADDRESS }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>配偶姓名：</td>
								<td>${employee.MATE_NAME }&nbsp;</td>
								<td>配偶身份证号：</td>
								<td>${employee.MATE_ID_CARD }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>配偶身份证地址：</td>
								<td colspan="3">${employee.RMATE_ID_CARD_ADDR }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>配偶联系电话：</td>
								<td colspan="3">${employee.MATE_TELPHONE }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>配偶工作单位：</td>
								<td colspan="3">${employee.MATE_WORK_UNIT }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>配偶工作地址：</td>
								<td colspan="3">${employee.MATE_WORK_UNIT_ADDRESS }&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>备注：</td>
								<td colspan="3"><pre>${employee.MEMO }&nbsp;</pre></td>
							</tr>
							
							
							
							<tr id="13" class="ui-widget-content jqgrow ui-row-ltr">
				<td  colspan="5"><table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head"><strong>开户银行</strong></td>
							</tr>
							<c:if test="${empty suplBankAccount}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;" readonly="readonly"></td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;" readonly="readonly"></td>
								</tr>
							</c:if>
							<c:if test="${not empty suplBankAccount}">
								<c:forEach items="${suplBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }" readonly="readonly"></td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
											<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"	style="width: 150px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(suplBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td  rowspan="${fn:length(suplBankAccount)}" id="bankTd" class="ui-widget-content jqgrow ui-row-ltr">其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${suplBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_NAME" id="BANK_NAME" style="width: 150px;" value="${item.BANK_NAME }" readonly="readonly"></td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
			</tr>
			
			
						</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="4" bgcolor="#c0c0c0" align="center" height="35" class="ui-state-default ui-th-ltr zc_grid_head">
						登录信息
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>用户名:</td>
								<td>${employee.CODE }</td>
								<td>所在部门：</td>
								<td>${employee.DEPT_NAME }</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>职务:</td>
								<td><c:forEach items="${jobs}" var="item"><c:if test="${ employee.JOB eq item.CODE }">${item.FLAG}<c:if test="${not empty employee.UPPER_USER}">&nbsp;&nbsp;主管姓名: ${employee.UPPER_USER}</c:if></c:if></c:forEach></td>
								<td>功能标识:</td>
								<td><c:if test="${employee.NODE eq 0}">全部</c:if><c:if test="${employee.NODE eq 1}">部分</c:if></td> 								 
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>入职时间:</td>
								<td>&nbsp;<fmt:formatDate value="${employee.IN_DATE }" pattern="yyyy-MM-dd"/></td>
								<td>离职时间:</td>
								<td>&nbsp;<fmt:formatDate value="${employee.OUT_DATE }" pattern="yyyy-MM-dd"/></td> 								 
							</tr>							 
				<tr>
					<td  colspan="4" align="center"><input type="button" class="ui-state-default ui-corner-all" name="gobackBut" value=返&nbsp;&nbsp;回 onclick="javascript:history.go(-1)"></td>
				</tr>
			</table>
			</div>
				</div>
				</div> 
	</body>
</html>