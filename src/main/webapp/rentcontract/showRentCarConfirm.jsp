<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>重车确认书</title>

<script type="text/javascript">
//设置页眉页脚为空 
function PageSetup_Null() 
{ 
try{ var RegWsh = new ActiveXObject("WScript.Shell") ; 
hkey_root="HKEY_CURRENT_USER" ;
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup" ;
hkey_key="header" ; 
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"") ; 
hkey_key="footer" ; 
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"") ;
} catch(e){} 
} 
	$(function (){
		$("input").each(function (){
			$(this).attr("readonly", true);
		});
		PageSetup_Null();
		window.print();
	});
	
</script>
<style type="text/css">
	.tb_return {border-bottom: 1px solid black; border-left: 1px solid white; 
		border-right: 1px solid white; border-top:1px solid white;
		width: 180px; height: 22px; background-color: white;
		font-size: 13px;
		text-align: center;
	}
	.tb_return_2 {border-bottom: 1px solid black; border-left: 1px solid white; 
		border-right: 1px solid white; border-top:1px solid white;
		width: 420px; height: 22px; background-color: white;
		font-size: 13px;
	}
	#table1 tr {height: 35px; vertical-align: middle; }
	#table1 td {font-size: 13px; font-weight: bold;}
	.solid_td {background-color: white;}
</style>
</head>
<body>
<div style="border: 1px solid black; padding: 1px; width: 650px;">
<table cellspacing="0" cellpadding="5" border="0" style="width: 650px; border: 1px solid black; padding-left: 5px; padding-right: 5px;" id="table1">
	<tr>
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">确认书</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">承租人在此确认：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">1.承租人基于<U><%=Constants.COMPANY_NAME %></U>(下称<U>裕融公司</U>)的授权及委托，购买了合同号为[${LEASECODE.LEASE_CODE}]</td>
	</tr>
	<tr>
		<td align="left" colspan="4">的融资租赁合同和合同号为[${LEASECODE.LEASE_CODE}]的委托购买合同项下的所有设备（如下表）。</td>
	</tr>
	<tr>
		<td colspan="4">
			<table cellspacing="0" cellpadding="5" border="1" style="background-color: black; text-align: center; width: 100%">
				<tr>
					<td class="solid_td" width="5%">序号/车辆</td>
					<td class="solid_td" width="15%">机动车登记编号</td>
					<td class="solid_td" width="10%">车辆类型</td>
					<td class="solid_td" width="10%">车辆品牌</td>
					<td class="solid_td" width="10%">车辆型号</td>
					<td class="solid_td" width="5%">车身颜色</td>
					<td class="solid_td" width="15%">车辆识别代号/车架号</td>
					<td class="solid_td" width="10%">发动机号</td>
					<td class="solid_td" width="15%">制造厂名称</td>
					<td class="solid_td" width="5%">国产/进口</td>
				</tr>
				<c:forEach items="${leaseholds}" var="list" varStatus="status">
				<tr>
					<td class="solid_td" width="5%">${status.index+1}&nbsp;</td>
					<td class="solid_td" width="15%">${list.CAR_RIGSTER_NUMBER }&nbsp;</td>
					<td class="solid_td" width="10%">${list.THING_NAME }&nbsp;</td>
					<td class="solid_td" width="10%">${list.THING_KIND }&nbsp;</td>
					<td class="solid_td" width="10%">${list.MODEL_SPEC }&nbsp;</td>
					<td class="solid_td" width="5%">${list.CAR_COLOR }&nbsp;</td>
					<td class="solid_td" width="15%">${list.CAR_ID_NUMBER }&nbsp;</td>
					<td class="solid_td" width="10%">${list.CAR_ENGINE_NUMBER }&nbsp;</td>
					<td class="solid_td" width="15%">${list.MANUFACTURER }&nbsp;</td>
					<td class="solid_td" width="5%">${list.CAR_IMPORT_DOMESTIC }&nbsp;</td>
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="4">2.由于承租人用于支付设备价格的款项是由<U>裕融公司</U>提供的，所以设备自[${BASEINFO.BRAND}]</td>
	</tr>
	<tr>
		<td align="left" colspan="4">处交货并经承租人验收合格后即成为<U>裕融公司</U>之财产，<U>裕融公司</U>享有设备的所有权及其他利益。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">3.即使供应商开具的发票抬头为承租人及产权登记于承租人名下，也仅可证明承租人根据融</td>
	</tr>
	<tr>
		<td align="left" colspan="4">资赁合同和委托购买合同向供货商支付了部份的设备价格，在任何情况下不应视为承租人享</td>
	</tr>
	<tr>
		<td align="left" colspan="4">有设备所有权的证据。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">4.承租人同意在租赁期间将发票、机动车登记证书、机动车交通事故责任强制保险单交由裕</td>
	</tr>
	<tr>
		<td align="left" colspan="4">融公司保管。经<U>裕融公司</U>事先同意，承租人可以为其自身目的使用该发票。但使用后，承租</td>
	</tr>
	<tr>
		<td align="left" colspan="4">人应立即向<U>裕融公司</U>归还发票;如未及时返还者,<U>裕融公司</U>可视为承租人违约并保留终止合同</td>
	</tr>
	<tr>
		<td align="left" colspan="4">之权利。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">5.承租人在租赁期间，因各种原因被有关部门处罚所产生的经济损失，均由承租人自行承担。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">承租人：${LEASECODE.CUST_NAME }</td>
	</tr>
	<tr>
		<td align="left" colspan="4">签署：</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">日期：</td>
	</tr>		
	
</table>
</div>		
</body>
</html>