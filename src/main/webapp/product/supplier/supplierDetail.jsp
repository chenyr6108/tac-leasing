<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>查看供应商</title>
		<%@ include file="/common/import.jsp"%>
	</head>
	<script type="text/javascript"> 
$(function() {
	//添加选项卡
	$("#tabs").tabs();
});


function gotoGH(id){
	window.parent.openNewTab("${ctx }","applyCompanyManage.getCreditLineForSupplier&id=" + id, "供应商归户");
}


</script> 

	<style type="text/css">
		th{
			text-align: right!important;
		}
	</style>

	<body>
	<table width="982" align="center">
			<input type="hidden" name="id" value="${rs.ID}" />
			<input type="hidden" name="supl_id" value="${rs.ID}" />
			<input type="hidden" name="suppl_id" id="suppl_id" value="${rs.ID }"></input>
				<tr>
					<td>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商查看</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
           	<div class="ui-state-default ui-jqgrid-hdiv ">		
			<table class="panel_table">
			<tr id="1">
				<th style="width: 10%">企业名称：</th>
				<td colspan="4">${rs.NAME}&nbsp;</td>
			</tr>
			<tr>
				<th>办事处：</th>
				<td colspan="4">${rs.DECP_NAME_CN}&nbsp;</td>
			</tr>
			<tr id="1">
				<th>编号：</th>
				<td colspan="4">${rs.CODE }&nbsp;</td>
			</tr>
			<tr id="18">
				<th>企业性质：</th>
				<td  colspan="4"><c:choose><c:when test="${rs.TYPE == 1}">厂商</c:when><c:when test="${rs.TYPE == 2 }">代理商</c:when><c:when test="${rs.TYPE == 3 }">其他供应商</c:when></c:choose></td>
			</tr>
			<tr id="18">
				<th>供应商型别：</th>
				<td  colspan="4"><c:if test="${rs.SUPP_TYPE == 0 }">非大型供应商</c:if><c:if test="${rs.SUPP_TYPE == 1 }">大型供应商</c:if>&nbsp;</td>
			</tr>
			<tr>	
				<th>供应商类别：</th> 
				<td colspan="4"><c:if test="${rs.SUPP_MODEL == 0 }">一般设备</c:if><c:if test="${rs.SUPP_MODEL == 1 }">重车</c:if><c:if test="${rs.SUPP_MODEL == 2 }">其他</c:if></td>
			</tr>
			<tr>
				<th style="width:130px;">供应商级别：</th> 
				<td  colspan="4">${rs.SUPP_LEVEL }</td>
			</tr>
			<tr id="2">
				<th>成立日期：</th>
				<td  colspan="4"><fmt:formatDate value="${rs.FOUNDED_DATE}" pattern="yyyy-MM-dd" /> &nbsp;</td>
			</tr>
			<tr>
			<th rowspan="2"><div align="center">专<br>案<br>条<br>件</div></th>
			<td colspan="4">全面回购:&nbsp;&nbsp;<input type="radio" name="BUY_BACK" <c:if test="${rs.BUY_BACK eq 'Y' }">checked="checked"</c:if> value="Y" disabled="disabled">是<input type="radio" name="BUY_BACK" <c:if test="${rs.BUY_BACK eq 'N' }">checked="checked"</c:if> value="N" disabled="disabled">否</td>
			
			</tr>
			<tr>
				<td colspan="4">网银汇款:&nbsp;&nbsp;<input type="radio" name="NET_PAY" <c:if test="${rs.NET_PAY eq 'Y' }">checked="checked"</c:if> value="Y" disabled="disabled">可<input type="radio" name="NET_PAY" <c:if test="${rs.NET_PAY eq 'N' }">checked="checked"</c:if> value="N" disabled="disabled">不可</td>
			</tr>
			
			<tr id="2">
				<th rowspan="7"><div align="center">企<br>业<br>基<br>本<br>信<br>息</div></th>
				<th style="width: 15%">注册资本(万)：</th>
				<td style="width: 30%">${rs.REGISTERED_CAPITAL }&nbsp;&nbsp;&nbsp;<select disabled="disabled"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.REGISTERED_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
				<th style="width: 15%">实收资本(万)：</th>
				<td style="width: 30%">${rs.INCOME_CAPITAL }&nbsp;&nbsp;&nbsp;<select disabled="disabled"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.INCOME_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr id="6">
				<th>营业执照注册号：</th>
				<td>${rs.BUSINESS_LICENCE }&nbsp;</td>
				<th>组织机构代码号：</th>
				<td>${rs.ORGANIZATION_CERTIFICATE }&nbsp;</td>
			</tr>
			<tr id="7">
				<th>税务登记号：</th>
				<td>${rs.TEX_CODE }&nbsp;</td>
				<th>有效期(年)：</th>
				<td>${rs.VALIDITY_PERIOD }&nbsp;</td>
			</tr>
			<tr id="8">
				<th>注册地址：</th>
				<td>${rs.LICENCE_ADDRESS }&nbsp;</td>
				<th>通讯地址：</th>
				<td>${rs.WORK_ADDRESS }&nbsp;</td>
			</tr>
			<tr id="12">
				<th>公司网址：</th>
				<td colspan="3">${rs.COMPANY_WEB }&nbsp;</td>
			</tr>
			<tr id="9">
				<th>经营范围：</th>
				<td  colspan="3">${rs.BUSINESS_SCOPE }&nbsp;</td>
			</tr>
			<tr id="14">
				<th>备注：</th>
				<td colspan="3">${rs.MEMO }&nbsp;</td>
			</tr>
			
			<tr>
				<th>
					<div align="center">
						授<br>信<br><br>
						<a href="javascript:void(0);" class="panel_a" onclick="gotoGH('${rs.ID}');" style="color: blue;">[归户]<a>
					</div>
				</th>
				<td colspan="4">
					<table class="panel_table">
						<tr>
							<th style="text-align: center!important;">类型</th>
							<th style="text-align: center!important;">是否循环</th>
							<th style="text-align: center!important;">有效期</th>
							<th style="text-align: center!important;">额度</th>
							<th style="text-align: center!important;">已用额度</th>
							<th style="text-align: center!important;">剩余额度</th>
						</tr>
						<c:forEach items="${creditLine }" var="i">
							<tr>
								<td style="text-align: center;">${i.lineName }</td>
								<td style="text-align: center;">${i.repeatFlag == 1 ? '是' : '否' }</td>
								<td style="text-align: center;">${i.startDate } ~ ${i.endDate }</td>
								<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.line }"/></td>
								<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.realUsedLine }"/></td>
								<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.lastLine }"/></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			
			<tr id="4">
				<th width="3%" rowspan="2"><div align="center">法<br>人</div></th>
				<th>法定代表人：</th>
				<td>${rs.COMPANY_CORPORATION }&nbsp;</td>
				<th>法人身份证号码：</th>
				<td>${rs.CORPORATION_ID_CARD }&nbsp;</td>
			</tr>
			<tr id="5">
				<th>法人联系方式：</th>
				<td>${rs.CORPORATION_LINK }&nbsp;</td>
				<th>法人代表住址：</th>
				<td>${rs.CORPORATION_ADDRESS }&nbsp;</td>
			</tr>
			
			<tr id="10">
				<th width="3%" rowspan="4"><div align="center">联<br>系<br>人</div></th>
				<th>联系人：</th>
				<td>${rs.LINKMAN_NAME }&nbsp;</td>
				<th>职务：</th>
				<td>${rs.LINKMAN_JOB }&nbsp;</td>
			</tr>
			<tr id="18">
				<th>办公电话：</th>
				<td>${rs.LINKMAN_TELPHONE }&nbsp;</td>
				<th>Email：</th>
				<td>${rs.LINKMAN_EMAIL }&nbsp;</td>
			</tr>
			<tr id="11">
				<th>邮编：</th>
				<td>${rs.LINKMAN_ZIP }&nbsp;</td>
				<th>手机：</th>
				<td>${rs.LINKMAN_MOBILE }&nbsp;</td>
			</tr>
				<tr id="12">
					<th>传真：</th>
					<td>${rs.LINKMAN_FAX }&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>			
			
			<tr id="13">
				<td  colspan="5"><table id="bankTab" class="panel_table">
							<tr>
								<th colspan="5">开户银行</th>
							</tr>
							<c:if test="${empty suplBankAccount}">
								<tr>
									<th width="13%" >基本账户</th>
									<th width="10%" >开户银行：</th>
									<td width="27%" ><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 200px;" readonly="readonly"></td>
									<th width="11%" >账号：</th>
									<td><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 200px;" readonly="readonly"></td>
								</tr>
							</c:if>
							<c:if test="${not empty suplBankAccount}">
								<c:forEach items="${suplBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr>
											<th width="13%" >基本账户</th>
											<th width="10%" >开户银行：</th>
											<td width="27%" ><input type="text" name="B_BANK_NAME" id="B_BANK_NAME"	style="width: 200px;" value="${item.BANK_NAME }" readonly="readonly"></td>
											<th width="11%" >账号：</th>
											<td ><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"	style="width: 200px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(suplBankAccount) >1}">
								<tr>
									<th  rowspan="${fn:length(suplBankAccount)}" id="bankTd">其他账户</th>
								</tr>
							</c:if>
							<c:forEach items="${suplBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<th >开户银行：</th>
										<td ><input type="text" name="BANK_NAME" id="BANK_NAME" style="width: 200px;" value="${item.BANK_NAME }" readonly="readonly"></td>
										<th >账号：</th>
										<td ><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 200px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
			</tr>
			<c:if test="${supplierImage != null &&  fn:length(supplierImage) > 0}">
				<tr>
					<th colspan="5"><strong>供应商图片</strong></th>
				</tr>
				<tr>
				<td style="text-align: center;" colspan="5"><c:forEach items="${supplierImage}" var="item" varStatus="status"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=supplierUpload'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a><br/></c:forEach></td>	
				</tr>	
			</c:if>
			<tr>
				<td colspan="5">
					<div align="center"><input type="button" name="gobackBut" class="ui-state-default ui-corner-all" value=返&nbsp;&nbsp;回 onClick="javascript:history.go(-1);"></div>
				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</td>
		</tr>
		</table>
<div id="tabs">
<ul>
	<li style="width: 100px;text-align: center;"><a href="#tabs-1" >联系人</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-2" >联系记录</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-3" >案件状况</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-4" >操作日志</a></li>
</ul>
	<div id="tabs-1">
       <%@ include file="querySupplLinkMan.jsp"%>
	</div>
	<div id="tabs-2">
		 <%@ include file="querySupplLinkRecord.jsp"%>
	</div>				
	<div id="tabs-3">
		 <%@ include file="querySupplLinkCredit.jsp"%>
	</div>					
	<div id="tabs-4">
		 <%@ include file="querySupplOperLogs.jsp"%>
	</div>				
</div>
	</body>
</html>