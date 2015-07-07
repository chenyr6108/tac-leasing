<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>授权书</title>

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
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">授&nbsp;权&nbsp; 书</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">鉴于本司与<u><%=Constants.COMPANY_NAME %></u>及向其以融资租赁形式承租租赁物的承租人<u>${LEASECODE.CUST_NAME }</u></td>
	</tr>
	<tr>
		<td align="left" colspan="4">签订的《租赁物委托管理三方协议》，及<u><%=Constants.COMPANY_NAME %></u>于_____年___月___日与</td>
	</tr>
	<tr>
		<td align="left" colspan="4"><u>${LEASECODE.CUST_NAME }</u>签订的合同编号为<u>${LEASECODE.LEASE_CODE }</u>的《融资租赁合同》，本司同意并授权与</td>
	</tr>
	<tr>
		<td align="left" colspan="4"><u><%=Constants.COMPANY_NAME %></u>就下列租赁物：</td>
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
		<td align="left" colspan="4">如承租人有迟延缴纳租金或其他违反上述协议及合同的行为，依上述协议及合同条款，<u><%=Constants.COMPANY_NAME %></u>有权解除合同并取回该租赁物，并同意<u><%=Constants.COMPANY_NAME %></u>可收回挂靠于我司的该租赁物及享有对该租赁物的全权处分权，且就处分后的所得及收益全归<u><%=Constants.COMPANY_NAME %></u>所有。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td align="left" colspan="4">特此授权</td>
	</tr>

	<tr>
		<td align="left" colspan="4">&nbsp;</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">授权人：${LEASECODE.CUST_NAME }</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人（签名）：</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">日期：______年____月____日</td>
	</tr>		
</table>
</div>		
</body>
</html>