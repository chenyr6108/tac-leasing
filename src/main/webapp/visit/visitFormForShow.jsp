<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访厂报告书</title>
<style type="text/css">
	td{height: 25px;}
</style>
<script type="text/javascript">
	function printReport(e){
		e.style.display = "none";
		window.print();
		e.style.display = "block";
	}
</script>
</head>
<body>
<font color="red">${errorMsg }</font>
<input type="button" onclick="printReport(this);" value="打印"/>
<div id="main">
	<table border="0" style="width: 600px;">
		<tr>
			<td colspan="6" align="center" style="font-size: 26px;">访厂报告书</td>
		</tr>
		<tr>
			<td>实际访厂时间：</td>
			<td align="left"> ${reportTo.real_visit_date_str }</td>
			<td>实际访厂人员：</td>
			<td colspan="4" align="left">${reportTo.real_visitor_name }</td>
		</tr>
		<tr>
			<td width="18%">报告填写人： </td>
			<td width="20%" align="left">${reportTo.create_by_name }</td>
			<td width="18%">业务员： </td>
			<td width="15%" align="left">${reportTo.busi_name}</td>
			<td width="24%">业务主管是否访厂：</td>
			<td width="5%" align="left"><c:if test="${reportTo.busi_manager eq 'N'}">否</c:if><c:if test="${reportTo.busi_manager eq 'Y'}">是</c:if></td>
		</tr>
	</table>
	<table border="1" cellpadding="0" cellspacing="0" style="width: 600px;">
		<tr>
			<td width="5%" valign="middle" align="center" rowspan="7" style="font-size: 16px;">承<br/><br/>租<br/><br/>人</td>
			<td width="35%">公司名称：</td>
			<td width="60%">${reportTo.cust_comp_name }&nbsp;</td>
		</tr>
		<tr>
			<td>预计申请额度：</td>
			<td>${reportTo.cust_apply_amount }&nbsp;</td>
		</tr>
		<tr>
			<td>保证内容(包含预测保证)：</td>
			<td>${reportTo.cust_guar }&nbsp;</td>
		</tr>
		<tr>
			<td>公司形态：</td>
			<td>${reportTo.cust_comp_status }&nbsp;</td>
		</tr>
		<tr>
			<td>股东背景及关系</td>
			<td>${reportTo.cust_relation }&nbsp;</td>
		</tr>
		<tr>
			<td>主要产品及用途：</td>
			<td>${reportTo.cust_product }&nbsp;</td>
		</tr>
		<tr>
			<td>开票比例：</td>
			<td>${reportTo.cust_invoice }&nbsp;</td>
		</tr>
		
		<tr>
			<td valign="middle" align="center" rowspan="4" style="font-size: 14px;">法<br/>人<br/>代<br/>表<br/>或<br/>负<br/>责<br/>人<br/>背<br/>景</td>
			<td>面谈者：</td>
			<td>${reportTo.legal_name }&nbsp;</td>
		</tr>
		<tr>
			<td>(1)姓名、职位、出生年月(几岁)：</td>
			<td>${reportTo.legal_info }&nbsp;</td>
		</tr>
		<tr>
			<td>(2)国家地区：</td>
			<td>${reportTo.legal_address }&nbsp;</td>
		</tr>
		<tr style="height: 80px;">
			<td valign="middle">(3)本业资历(创业历程)：</td>
			<td>${reportTo.legal_experience}&nbsp;</td>
		</tr>
		
		<tr>
			<td valign="middle" align="center" rowspan="10" style="font-size: 16px;">厂<br/><br/>方<br/><br/>环<br/><br/>境</td>
			<td>工厂环境：</td>
			<td>${reportTo.factory_envi }&nbsp;</td>
		</tr>
		<tr>
			<td>(1)是否自己所有：</td>
			<td>${reportTo.factory_is_self }&nbsp;</td>
		</tr>
		<tr>
			<td>(2)有无员工宿舍：</td>
			<td>${reportTo.factory_has_dorm }&nbsp;</td>
		</tr>
		<tr>
			<td>(3)有无员工食堂：</td>
			<td>${reportTo.factory_has_mess }&nbsp;</td>
		</tr>
		<tr>
			<td>(4)生产车间清洁度：</td>
			<td>${reportTo.factory_clean }&nbsp;</td>
		</tr>
		<tr>
			<td>(5)工厂工人人数及轮班次数：</td>
			<td>${reportTo.factory_worker }&nbsp;</td>
		</tr>
		<tr>
			<td>(6)稼动率：</td>
			<td>${reportTo.factory_jia_dong }&nbsp;</td>
		</tr>
		<tr>
			<td>(7)本次申请设备用途：</td>
			<td>${reportTo.factory_apply_use_to }&nbsp;</td>
		</tr>
		<tr>
			<td>(8)工厂工人劳动态度：</td>
			<td>${reportTo.factory_worker_attitude }&nbsp;</td>
		</tr>
		<tr>
			<td>(9)有无穿工作服：</td>
			<td>${reportTo.factory_has_overalls }&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" align="center" rowspan="2" style="font-size: 16px;">存<br/>货</td>
			<td>工厂存货状况：</td>
			<td>${reportTo.inventory_status }&nbsp;</td>
		</tr>
		<tr>
			<td>(1)放置状况(整齐与否)：</td>
			<td>${reportTo.inventory_put_status }&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" align="center" rowspan="3" style="font-size: 16px;">管<br/>理<br/>部</td>
			<td>财务部门办公状况：</td>
			<td>${reportTo.manage_work_status }&nbsp;</td>
		</tr>
		<tr>
			<td>(1)有无工作服：</td>
			<td>${reportTo.manage_has_overalls }&nbsp;</td>
		</tr>
		<tr>
			<td>(2)劳动态度：</td>
			<td>${reportTo.manage_work_attitude }&nbsp;</td>
		</tr>
	</table>
	<table border="1" cellpadding="0" cellspacing="0" style="margin-top: -2px;width: 600px;">
		<tr height="60px;">
			<td align="center" style="font-size: 14px;">增提<br/>资料</td>
			<td align="left" colspan="3">${reportTo.added_info }</td>
		</tr>
		<tr>
			<td colspan="4" align="center" style="font-size: 20px;">建&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;议</td>
		</tr>
		<tr>
			<td align="center" width="10%">&nbsp;</td>
			<td align="center" width="30%"><c:choose><c:when test="${reportTo.visit_result eq 2 }">■</c:when><c:otherwise>□</c:otherwise></c:choose>婉拒</td>
			<td align="center" width="30%"><c:choose><c:when test="${reportTo.visit_result eq 0 }">■</c:when><c:otherwise>□</c:otherwise></c:choose>可申请(免补)</td>
			<td align="center" width="30%"><c:choose><c:when test="${reportTo.visit_result eq 1 }">■</c:when><c:otherwise>□</c:otherwise></c:choose>可(补)</td>
		</tr>
		<tr height="60px;">
			<td align="center" style="font-size: 14px;">理由</td>
			<td align="left" colspan="3">${reportTo.reason}&nbsp;</td>
		</tr>
	</table>
</div>
</body>
</html>