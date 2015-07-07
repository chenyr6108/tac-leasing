<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>租赁物委托管理三方协议</title>

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
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">租赁物委托管理三方协议</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">甲方（委托管理方、出租人）：<%=Constants.COMPANY_NAME %></td>
	</tr>
	<tr>
		<td align="left" colspan="4">乙方（被委托管理方）：${LEASECODE.CUST_NAME }</td>
	</tr>
	<tr>
		<td align="left" colspan="4">丙方（实际使用人）：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">基于甲、丙双方就下表租赁物，依据《中华人民共和国合同法》第十四章融资租赁合同条款，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">签订了合同编号为<u>${LEASECODE.LEASE_CODE }</u>的《融资租赁合同》，合同条款确认在丙方未完全履行</td>
	</tr>
	<tr>
		<td align="left" colspan="4">合同条款义务前，甲方保有下表租赁物的完全所有权，现据上述法律关系，甲、乙、丙三方</td>
	</tr>
	<tr>
		<td align="left" colspan="4">在符合相关法、规的前提，本于公平互惠原则及经充分沟通协调情况下，就下表租赁物，委</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">托管理相关事宜一致同意，并达成签订本协议条款：</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">租赁物详表（下称租赁物）：</td>
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
		<td align="left" colspan="4">一、	甲方委托乙方的管理事项</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;1、向丙方收取并代为缴纳管理租赁物的相关运营税、费。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;2、向甲方指定的第三方办理投保事项，并代丙方处理租赁物出险事故及后续所有</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;保险理赔事宜。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;3、向丙方收取租赁物相关行政管理费用，并代为办理包括但不限于检验、办证、</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;验证、换证等相关行政管理事项。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">二、	三方的权利义务</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;（一）、甲方</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;1、保有租赁物车辆的所有权，甲方向乙方提供以乙方为名义购买人的租赁物销售发票，</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;但该销售发票仅作为乙方为租赁物车辆上牌、上户用，乙、丙方不得以此销售发票作</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;为租赁物车辆所有权的凭证。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、乙方、丙方同意甲方在本合同有效期间得将租赁物车辆权益为转让、处分等行为，但</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;对于受转让、处分的第三方，本协议对其有约束力。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;（二）、乙方</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;1、须善尽善良管理人责任，履行约定的管理事项。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、不干涉丙方对管理租赁物车辆的营运和使用，但对丙方营运的业务应给予适当的协助。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;3、乙方不得侵害甲方对租赁物车辆的所有权，不得出现本协议第一条委托管理事项以外</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;的行为。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;4、管理租赁物车辆在营运过程中发生违法、违章、肇事、交通事故造成生命和财产损失</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;时，乙方不承担任何责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;5、丙方须按时向乙方缴纳委托管理费和第一条所述的费用，否则乙方有权单方面解除本协议。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;6、丙方不得将管理的租赁物车辆，用于违法的目地使用，否则乙方有权单方面解除本协议。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;（三）、丙方</td>
	</tr>									
	<tr>
		<td align="left" colspan="4">&nbsp;1、保有租赁物车辆的营运和收益权。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、对租赁物车辆的营运和收益须遵守相关法规，否则丙方对其违法、违章、肇事、交通</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;事故造成的生命和财产的损失承担全部的责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;3、依本协议条款规定按时向乙方缴纳相关的费用。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;4、在乙方依本协议对租赁物车辆实施管理时，须给予完全、适当的配合。</td>
	</tr>		

	<tr>
		<td align="left" colspan="4">三、委托管理期限</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;1、委托管理期限与甲、丙双方就租赁物车辆所签定的《融资租赁合同》一致，但若丙方</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;于《融资租赁合同》有效期间内未完全履行《融资租赁合同》和其他相关文件的义务</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;时，租赁物车辆所有权不移转，委托管理期限顺延至丙方全面履行其义务之日止。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、若丙方提前清偿甲方租赁物车辆所有租金及完全履行《融资租赁合同》和其他相关文</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;件的义务时，则本协议效力亦终止，若丙方需续委托乙方管理时，由乙、丙双方另行签订书面协议。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;3、管理的租赁物车辆，因灭失、毁损等原因无法或无需再委托管理时，视为委托管理期限终结。</td>
	</tr>

	<tr>
		<td align="left" colspan="4">四、委托管理费用及支付</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;1、每一租赁物车辆的委托管理费为每月______元人民币。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp; 2、本协议签署时，丙方应向乙方就每一租赁物车辆一次缴纳____个月的委托管理费共</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;计______元人民币，或由乙、丙双方另行约定缴纳方式。</td>
	</tr>

	<tr>
		<td align="left" colspan="4">五、违约责任</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;1、本协议履行过程中，由于乙方违约或其他可归责于乙方的事由，导致甲方损失的，乙</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;方应承担对甲方相应的损害赔偿责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、本协议履行过程中，由于丙方违约或其他可归责于丙方的事由，导致乙方损失的，丙</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;方应承担对乙方相应的损害赔偿责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;3、因任一方违反本协议致使本协议无法继续履行，他方可解除本协议，并向违反协议的</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;一方请求支付所受的损害。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;4、因不可抗力原因造成本协议无法履行或无履行实益的，甲、乙任何一方均有权解除本</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;协议，但须以书面通知他方，对解除本协议有争议的事项，双方具体协商解决。</td>
	</tr>

	<tr>
		<td align="left" colspan="4">六、争议解决方式</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">于履行本协议或与本协议有关事项有所争议时，双方应先友好协商解决，协商不成时，以</td>
	</tr>
	<tr>
		<td align="left" colspan="4">甲方住所登记所在地法院为起诉管辖法院。</td>
	</tr>

	<tr>
		<td align="left" colspan="4">七、其他规定</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;1、本协议一式三份，具同等的效力，甲、乙、丙三方各执乙份为凭，本协议自三方当事</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;人签字盖章之日起生效。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;2、本协议未尽事宜，三方可另行签署补充协议。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td align="left" colspan="4">甲方：<%=Constants.COMPANY_NAME %>（盖章）</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人或授权代理人（签名）：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td align="left" colspan="4">乙方（挂靠行盖章）：${LEASECODE.CUST_NAME }</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人或授权代理人（签名）：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">丙方：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（盖章）</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人或授权代理人（签名）：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;&nbsp;</td>
	</tr>				
	<tr>
		<td align="left" colspan="4">签订日期：_______年 ____月 ____ 日</td>
	</tr>	
</table>
</div>		
</body>
</html>