<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insuCompany.js"></script>
		<%@ include file="/common/import.jsp"%>
		<title>保险公司添加页面</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" value="insuCompany.create">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险公司添加页面</span>
		  	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			  <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">	
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="10%">公司名称：</td>
					<td width="15%"><input type="text" name="incp_name" id="incp_name" > <font color="#ff0080">*</font></td>
					<td width="15%">公司简称：</td>
					<td><input type="text" name="short_name" id="short_name"   ><font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="10%">费率(‰)：</td>
					<td width="15%"><input type="text" name="rate" id="rate" > <font color="#ff0080">*</font></td>
					<td width="10%">系数：</td>
					<td><input type="text" name="factor" id="factor" ><font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人：</td>
					<td><input type="text" name="incp_linkman" id="incp_linkman"   ><font color="#ff0080">*</font></td>
					<td>联系电话：</td>
					<td><input type="text" name="incp_linktel" id="incp_linktel" ><font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>电子邮箱：</td>
					<td><input type="text" name="incp_email" id="incp_email" ></td>
					<td>邮编：</td>
					<td><input type="text" name="incp_zip" id="incp_zip"  ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>传真：</td>
					<td><input type="text" name="incp_fax" id="incp_fax"   ></td>
				<!--  	<td>公司类型：</td>
					<td><input type="radio" name="incp_type"  checked="checked" value="0" />总公司<input type="radio" name="incp_type" value="1" />事业部</td>
				-->
					<td width="10%">公司编号：</td>
					<td><input type="text" name="incp_code" id="incp_code" ><font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>公司地址：</td>
					<td colspan="3"><input type="text" name="incp_address" id="incp_address" style="width: 200px;"></td>
				</tr>
				<!--  
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td rowspan="2">机动车险种名称：</td>
					<td>必保险种</td>                                                                                                                                                                                                                                                                                                                                                                                               
					<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList1) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList1}" var="insureType1" varStatus="status" ><td width ="25%"><input type="checkbox" name="intp_id" value="${insureType1.INTP_ID }" checked="checked"/>${insureType1.INTP_NAME}&nbsp;&nbsp;&nbsp;</td><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>选保险种</td>
					<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList3) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList2}" var="insureType3" varStatus="status" ><td width ="25%"><input type="checkbox" name="intp_id" value="${insureType3.INTP_ID }" />${insureType3.INTP_NAME}&nbsp;&nbsp;&nbsp;</td><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row3"></c:set></c:forEach></table></td>
				</tr>   
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td rowspan="2">非机动车险种名称：</td>
					<td>必保险种</td> 
					<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList2) + 1) / 3 }" var="insureTypeListRow2"></c:set><c:set value="1" var="row2"></c:set><c:forEach items="${insureTypeList3}" var="insureType2" varStatus="status" ><td width ="25%"><input type="checkbox" name="intp_id" value="${insureType2.INTP_ID }" checked="checked"/>${insureType2.INTP_NAME}&nbsp;&nbsp;&nbsp;</td><c:if test="${status.count % 3 eq 0 and row2 eq insureTypeListRow2}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row2 + 1}" var="row2"></c:set></c:forEach></table></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>选保险种</td>
					<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList4) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList4}" var="insureType4" varStatus="status" ><td width ="25%"><input type="checkbox" name="intp_id" value="${insureType4.INTP_ID }" />${insureType4.INTP_NAME}&nbsp;&nbsp;&nbsp;</td><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
				</tr>-->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>备注：</td>
					<td colspan="3"><textarea rows="3" cols="70" name="remark" id="remark" onFocus="selectContent(this);" onBlur="lnOut(this);" style="border:#c0c0c0 solid 1px; width:585px; height:50px; font-size:12px"></textarea></td>
				</tr>
				
				
						<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head"><strong>开户银行</strong></td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head">相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="javascript:void(0)" onClick="addBank();">添加</a></td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head"><img src="${ctx }/images/u103.gif">&nbsp;<a href="javascript:void(0)" onClick="deleteBank();">删除</a></td>
							</tr>
		<tr id="13" class="ui-widget-content jqgrow ui-row-ltr">
		<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr"><table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<c:if test="${empty companyBankAccount}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;"></td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;"></td>
								</tr>
							</c:if>
							<c:if test="${not empty companyBankAccount}">
								<c:forEach items="${companyBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }"></td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
											<td   class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(companyBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td   rowspan="${fn:length(companyBankAccount)}" id="bankTd" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${companyBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="checkbox" name="check_id" id="check_id">开户银行：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_NAME" id="BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }"></td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
				</tr>
				
				
				
				
				
				<tr>
					<td colspan="4" align='center'>
						<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onclick="addInsuCompany();" />
						<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置" /> 
						<input type="button" class="ui-state-default ui-corner-all" value='返  回' onclick='javascript:history.go(-1)' />
					</td>
				</tr>
			</table>
			</div>
				</div>
			</div>
		</form>
	</body>
</html>