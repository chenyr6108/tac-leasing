<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>车辆处分授权委托书</title>

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
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">车辆处分授权委托书</td>
	</tr>
	<tr>
		<td align="left" colspan="4">致：__________市公安局公安交通管理局车辆管理所</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">兹委托：</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;<%=Constants.COMPANY_NAME %>（下称受托人），代为办理本司名下车辆（详下表）所有机动车辆相关</td>
	</tr>
	<tr>
		<td align="left" colspan="4">业务，本司并同意在本委托书授权范围内，得由受托人转委托于第三人办理机动车辆相关业务：</td>
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
		<td align="left" colspan="4">委托事项如下：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">一、	申办机动车产权注册、转移、注销、转入及变更的登记和备案。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">二、	申办机动车抵押、质押的设立解除，抵押、质押的登记备案。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">三、	其他对机动车辆的处分事宜。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;于此本司确认受托人在相关机关申办受托代理业务时，签署的文件及提供的材料，均代表本公司</td>
	</tr>
	<tr>
		<td align="left" colspan="4">意愿，本司就此愿承担相应的法律责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="2">委托人（承租方）：${LEASECODE.CUST_NAME }（签名或盖章）</td>
		<td align="left" colspan="2">受托人（出租方）：<%=Constants.COMPANY_NAME %>（签名或盖章）</td>
	</tr>	
	<tr>
		<td align="left" colspan="2">法定代表人/授权代表人：</td>
		<td align="left" colspan="2">法定代表人/授权代表人：</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">委托日期：______年 ___月 ___日</td>
	</tr>	
</table>
</div>		
</body>
</html>