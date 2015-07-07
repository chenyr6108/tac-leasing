<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>确认函</title>

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
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">供应商确认函</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">致：<%=Constants.COMPANY_NAME %></td>
	</tr>
	<tr>
		<td align="left" colspan="4">本司<u>${INFOMAP.SUPL_NAME }<u>确认，本司已于本确认函出具之日收到<u>${LEASECODE.CUST_NAME }</u>（以下简称“承租人”）</td>
	</tr>
	<tr>
		<td align="left" colspan="4">汇入本司的下述设备的相关款项：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;（1）增值税税款，计人民币<u> 0  </u>元。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;（2）部分未含税价款，计人民币<u>${AGPRICE}</u>元。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;上述（1）和（2）合计人民币<u>${AGPRICE}</u>元整。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4"><b>设备详表：</b></td>
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
				<c:forEach items="${eqmts}" var="list" varStatus="status">
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
		<td colspan="4" align="left">
			&nbsp;&nbsp;依据贵公司和承租人签订的编号为<u>${LEASECODE.LEASE_CODE }</u>《委托购买合同》及相关协议，以及本司和承租
		</td>
	</tr>
	<tr>
		<td colspan="4" align="left">
			人签订的编号为____________________《销售合同》，贵公司就上述机器设备需向本公司另行支付
		</td>
	</tr>	
	<tr>
		<td colspan="4" align="left">
			人民币<u>${TOTALPRICE }</u>元货款。本司并确认于上述设备完成上牌及抵押登记予甲方后交付承租人。
		</td>
	</tr>
	<tr>
		<td colspan="4" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;特此确认
		</td>
	</tr>				
	<tr>
		<td align="right"colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="left" colspan="1">（供货商公司盖章）：${INFOMAP.SUPL_NAME }</td>
	</tr>
	<tr>
		<td align="right"colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="left" colspan="1">法定代表人或授权人：</td>
	</tr>	
	<tr>
		<td align="right"colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="left" colspan="1">日期：&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;月 &nbsp;&nbsp;日</td>
	</tr>
</table>
</div>		
</body>
</html>