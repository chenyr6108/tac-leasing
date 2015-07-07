	<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/overlayer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>查看承租人</title>
		<script src="${ctx }/common/js/idCard.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/goodDrag.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/createCustNatu.js" type="text/javascript"></script>
		<style type="text/css">
			.trade_table tr {border: 0px white;}
		</style>
	</head>
	<body>
		<form id="createCustNatu" name="createCustNatu" action="#" method="get">
			<input type="hidden" name="cust_id" id="cust_id" value="${cust.CUST_ID }"></input>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;自然人详细档案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	        <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tbody>
					<tr >
						<td rowspan="17" width="5%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							人<br>员<br>	基<br>本<br>	情<br>况<br>	</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" >承租人编号</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">${cust.CUST_CODE }</td>
						<td rowspan="9" colspan="2" >
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
						<td >承租人分类</td>
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
						<td>姓名</td>
						<td>${cust.CUST_NAME }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证号码</td>
						<td>${cust.NATU_IDCARD}&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在省市</td>
						<td>${cust.CUST_AREA}<%-- <c:forEach items="${provinces}" var="item"><c:if test="${cust.PROVINCE_ID eq item.ID}">${item.NAME }</c:if></c:forEach><c:forEach items="${citys}" var="item"><c:if test="${cust.CITY_ID eq item.ID}">${item.NAME }</c:if></c:forEach> --%></td>
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
						<td>性别</td>
						<td>${cust.NATU_GENDER }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>年龄</td>
						<td>${cust.NATU_AGE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机号码</td>
						<td>${cust.NATU_MOBILE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系电话(家庭座机)</td>
						<td>${cust.NATU_PHONE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮编</td>
						<td>${cust.NATU_ZIP }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证地址</td>
						<td>${cust.NATU_IDCARD_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>家庭常住地址</td>
						<td>${cust.NATU_HOME_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td>${cust.NATU_WORK_UNITS }&nbsp;</td>						
						<td>单位地址</td>
						<td>${cust.NATU_WORK_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司邮箱</td>
						<td colspan="3">${cust.CORP_COMPANY_EMAIL }&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="4" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							配<br> 偶 <br>信<br>息
						</td>
						<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">
							配偶姓名
						</td>
						<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">
							${cust.NATU_MATE_NAME }&nbsp;
						</td>
						<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">
							身份证号码
						</td>
						<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">
							${cust.NATU_MATE_IDCARD }&nbsp;
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机号码</td>
						<td>${cust.NATU_MATE_MOBILE }&nbsp;</td>
						<td>身份证地址</td>
						<td>${cust.NATU_MATE_IDCARD_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td>${cust.NATU_MATE_WORK_UNITS }&nbsp;</td>
						<td>单位地址</td>
						<td>${cust.NATU_MATE_WORK_ADDRESS }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">备注</td>
						<td colspan="4">${cust.REMARK }&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="center">						
							<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1);"></input>
						</td>
					</tr>
				</tbody>
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
					
					</form>	
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