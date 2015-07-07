<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/overlayer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>法人详细档案</title>
		<script src="${ctx }/common/js/idCard.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/goodDrag.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/createCustCorp.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/readCorp.js" type="text/javascript"></script>
		<style type="text/css">
			.trade_table tr {border: 0px white;}
		</style>
	</head>
	<body>
		<form id="createCustCorp" name="createCustCorp" action="#" method="get">
			<input type="hidden" name="cust_id" id="cust_id" value="${cust.CUST_ID }"></input>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;法人详细档案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	        <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tbody>
					<tr>
						<td rowspan="22" align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="5%">
							人<br /> 员<br /> 基<br /> 本<br /> 情<br /> 况
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" width="8%">
							承租人编号
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							${cust.CUST_CODE }
						</td>
						<td rowspan="10" colspan="2">
							<table width="190" border="0" align="center" cellpadding="0"
								cellspacing="0" style="margin-top: 3px;">
								<tr>
									<td align="center">
										<a href="#" onClick="op('zz', 'hui');"><img
												src="${ctx}${card.path }" width="150" height="170"
												class="pic" />
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人分类</td>
						<td><c:forEach items="${custLevel}" var="item"><c:if test="${cust.CUST_LEVEL eq item.CODE}">${item.FLAG }</c:if></c:forEach></td>
					</tr>
					<%-- 2012/03/27 Yang Yun 新增行业别 --%>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>行业别</td>
						<td class="trade_table"><table border="0" cellpadding="0" cellspacing="0"><tr><td id="trade_type_1"></td><td id="trade_type_2"></td><td id="trade_type_3"></td></tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户经理</td>
						<td>${createName.NAME }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>企业名称 </td>
						<td>${cust.CUST_NAME }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>组织机构代码号 </td>
						<td>${cust.CORP_ORAGNIZATION_CODE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在省市</td>
						<td>${cust.CUST_AREA}<%-- <c:forEach items="${provinces}" var="item"><c:if test="${cust.PROVINCE_ID eq item.ID}">${item.NAME }</c:if></c:forEach><c:forEach items="${citys}" var="item"><c:if test="${cust.CITY_ID eq item.ID}">${item.NAME }</c:if></c:forEach> --%>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在经纬度</td>
						<td>X:${cust.X_POINT }-Y:${cust.Y_POINT }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人状态</td>
						<td><c:if test="${custType.STATETYPE==0 }">潜在客户</c:if><c:if test="${custType.STATETYPE==1 }">新客户</c:if><c:if test="${custType.STATETYPE==2 }">已提交客户</c:if><c:if test="${custType.STATETYPE==3 }">既有客户</c:if><c:if test="${custType.STATETYPE==4 }">其他</c:if>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>虚拟帐号</td>
						<td>${cust.VIRTUAL_CODE}</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>企业性质  </td>
						<td><c:forEach items="${corpTypeList}" var="item"><c:if test="${item.CODE eq cust.CORP_ENTERPRISES_PROPERTY }">${item.FLAG }</c:if></c:forEach>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>成立日期 </td>
						<td>${cust.CORP_SETUP_DATE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>注册资本（千元）</td>
						<td align="right"><fmt:formatNumber value="${cust.CORP_REGISTE_CAPITAL }"  />
						千元,货币：<select  disabled="disabled">
								<c:forEach var="currency" items="${currencys }">
									<option value="${currency.CODE }" <c:if test="${cust.CORP_REGISTE_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
								</c:forEach>
							</select>					
						</td>
						
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>实收资本 （千元）</td>
						<td align="right"><fmt:formatNumber value="${cust.CORP_PAICLUP_CAPITAL }"  />
							千元,货币：<select disabled="disabled">
								<c:forEach var="currency" items="${currencys }">
									<option value="${currency.CODE }" <c:if test="${cust.CORP_PAICLUP_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
								</c:forEach>
							</select>
						
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>营业执照注册号 </td>
						<td>${cust.CORP_BUSINESS_LICENSE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>税务编号</td>
						<td>${cust.TAX_CODE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>税务登记号</td>
						<td>${cust.CORP_TAX_CODE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>有效期 </td>
						<td>${cust.CORP_PERIOD_VALIDITY }&nbsp;</td>
						<td width="10%">公司邮编</td>
						<td>${cust.CORP_COMPANY_ZIP }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>注册地址 </td>
						<td colspan="3">${cust.CORP_REGISTE_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司办公地址</td>
						<td colspan="3">${cust.CORP_WORK_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>经营范围 </td>
						<td colspan="3">${cust.CORP_BUSINESS_RANGE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司网址</td>
						<td colspan="3">${cust.CORP_COMPANY_WEBSITE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司邮箱</td>
						<td colspan="3">${cust.CORP_COMPANY_EMAIL }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>其他信息 </td>
						<td colspan="3">${cust.CORP_OTHER_MASSAGE }&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							法<br />人<br />信<br />息
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							法定代表人 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">${cust.CORP_HEAD_SIGNATURE }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							法人身份证号码 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">${cust.CORP_HS_IDCARD }&nbsp;
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>法人联系方式 </td>
						<td colspan="3">${cust.CORP_HS_LINK_MODE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>法人代表住址</td>
						<td colspan="3">${cust.CORP_HS_HOME_ADDRESS }&nbsp;</td>
					</tr>
<%-- 					<tr >
						<td rowspan="4" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							增值税<br /> 开票资料
						</td >
						<td class="ui-widget-content jqgrow ui-row-ltr">开户行名称<font color="red">*</font></td>
						<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" size="50" name="open_bank_name" id="open_bank_name" value="${cust.OPEN_BANK_NAME }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>开户账号<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="open_bank_account" id="open_bank_account" value="${cust.OPEN_BANK_ACCOUNT }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="link_address" id="link_address" value="${cust.LINK_ADDRESS }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系电话<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="link_phone" id="link_phone" value="${cust.LINK_PHONE }"></td>	
					</tr> --%>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">备 注</td>
						<td colspan="4">${cust.REMARK }&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="center">						
							<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1);"></input>
						</td>
					</tr>
				</tbody>
				<tfoot>				
					<tr>

					</tr>
				</tfoot>
			</table>
								<div id="tabs">
						<ul>
							<li style="width: 100px;text-align: center;"><a href="#tabs-1" >联系人</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-2" >联系记录</a></li>
<!-- 							<li style="width: 100px;text-align: center;"><a href="#tabs-3" >客户关怀</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-4" >费用</a></li> -->
							<li style="width: 100px;text-align: center;"><a href="#tabs-3" >案件状况</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-4" >操作日志</a></li>
						</ul>
							<div id="tabs-1">
						        <%@ include file="readCustLinkMan.jsp"%>
							</div>
							<div id="tabs-2">
								 <%@ include file="readCustLinkRecord.jsp"%>
							</div>
<%-- 							<div id="tabs-3">
								 <%@ include file="readCustLinkManCare.jsp"%>
							</div>					
							<div id="tabs-4">
								 <%@ include file="readCustLinkExpense.jsp"%>
							</div> --%>
							<div id="tabs-3">
								 <%@ include file="readCustLinkCredit.jsp"%>
							</div>									
							<div id="tabs-4">
								 <%@ include file="queryCustOperLogs.jsp"%>
							</div>			
						</div>
			</div>
				</div>
				</div>
		<c:forEach items="${trade_type_list }" var="trade_type">
			<c:if test="${trade_type.TRADE_LEVEL == 1 }">
				<script type="text/javascript">
					$("#trade_type_1").text("${trade_type.TRADE_NAME}");
				</script>
			</c:if>
			<c:if test="${trade_type.TRADE_LEVEL == 2 }">
				<script type="text/javascript">
					$("#trade_type_2").text("-- ${trade_type.TRADE_NAME}");
				</script>
			</c:if>
			<c:if test="${trade_type.TRADE_LEVEL == 3 }">
				<script type="text/javascript">
					$("#trade_type_3").text("-- ${trade_type.TRADE_NAME}");
				</script>
			</c:if>
		</c:forEach>
	</body>
</html>

<script type="text/javascript"> 
$(function() {
	//添加选项卡
	$("#tabs").tabs();
});
</script> 