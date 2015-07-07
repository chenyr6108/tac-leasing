<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>承诺书</title>

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
<table cellspacing="0" cellpadding="5" border="0" style="width: 650px; border: 1px solid black; padding-left: 5px; padding-right: 5px;" id="table1">
	<tr>
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">承诺暨授权书</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;本司与贵司于_______年 ____月____日就下表所载车辆签订了编号为<U>${LEASECODE.LEASE_CODE }</U></td>
	</tr>
	<tr>
		<td align="left" colspan="4">的《融资租赁合同》，并为担保《融资租赁合同》项下的义</U>务按时完全履行，承租人除和贵司签订</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">《机动车辆抵押合同》，同意贵司就下表所载车辆办理抵押登记外，于此向贵司承诺并授权如下：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">车辆详表：</td>
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
		<td align="left" colspan="4">一、承诺本人不以任何理由向第三人声明或使第三人有认为本司是车辆所有权人之虞的行为。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">二、承诺本人与贵司所签订的《机动车辆抵押合同》，仅是由本司办理租赁车辆抵押登记手续</td>
	</tr>
	<tr>
		<td align="left" colspan="4">的必要文件之一。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">三、承诺租赁车辆仅因融资租赁法律性质及目前实务登记制度，所以由贵司同意以本人名义登记，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">对贵司就租赁车辆享有的所有权权益并无任何影响。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">四、承诺并授权贵司在上述《融资租赁合同》本人未完全履行所承担的债务及违约的情况下，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">得不经通知及本人同意下，由贵司自行向本人或第三人占有中取回、处分、变卖抵偿本人所欠</td>
	</tr>
	<tr>
		<td align="left" colspan="4">贵司所有债务。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">承诺授权人：${LEASECODE.CUST_NAME }（盖章）</td>
	</tr>
	<tr>
		<td align="left" colspan="4">法定代表人：（签名）</td>
	</tr>
	
	<tr>
		<td align="left" colspan="4">&nbsp;</td>
	</tr>					
	<tr>
		<td align="left" colspan="4">日期：_______年 ____月____日</td>
	</tr>										
	
</table>	
</body>
</html>