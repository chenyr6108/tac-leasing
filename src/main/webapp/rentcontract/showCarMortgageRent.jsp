<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>抵押合同</title>

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
		<td style="font-size: 25px; font-weight: bold;" colspan="4" align="center">机动车辆抵押合同</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">抵押权人（下称甲方）：<U><%=Constants.COMPANY_NAME %></U></td>
	</tr>
	<tr>
		<td align="left" colspan="4">抵押人（下称乙方）：<U>${LEASECODE.CUST_NAME }</U></td>
	</tr>	
	<tr>
		<td align="left" colspan="4">  为确保甲、乙双方签订的合同号为：<U>${LEASECODE.LEASE_CODE }</U>的《融资租赁合同》（下称主合同）</td>
	</tr>
	<tr>
		<td align="left" colspan="4">得到切实的履行，以保障甲方债权的实现，双方在友好、公平的情况下，通过充分的协商，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">乙方愿意提供其合法拥有的<U>机动车辆</U>（下称抵押物），作为抵押物抵押给甲方，担保其履行</td>
	</tr>
	<tr>
		<td align="left" colspan="4">主合同项下所生债务，双方并就抵押物抵押担保事宜达成以下协议：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第一条 抵押物</td>
	</tr>
	<tr>
		<td align="left" colspan="4">1、抵押物详细表：（下称抵押物）</td>
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
		<td colspan="4">
			<table cellspacing="0" cellpadding="5" border="1" style="background-color: black; text-align: center; width: 100%">
				<tr>
					<td class="solid_td" width="20%">抵押物价值</td>
					<td class="solid_td" width="80%" align="left">_____________元整<br>
					本约定价值不作为甲方对抵押物为处分的估价依据及行使抵押权的限制
					</td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">2、	本合同项下的抵押权及于抵押物的孳息、从物、从权利、附属物、附合物、加工物、添</td>
	</tr>
	<tr>
		<td align="left" colspan="4">    加物及其他与抵押物有不可分离或分离足以降低抵押物的价值者。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">3、	本合同项下的抵押权及于抵押物的代位物，包括但不限于保险赔偿金、其他损害赔偿金、</td>
	</tr>
	<tr>
		<td align="left" colspan="4">    各项补偿金、抵押物毁损后的残骸和残值及抵押物变卖的价款。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第二条 抵押物的权属</td>
	</tr>
	<tr>
		<td align="left" colspan="4">乙方须保证订立本合同之日止，抵押物未设置任何限制抵押物所有权的其他权利，设定抵押</td>
	</tr>
	<tr>
		<td align="left" colspan="4">后，未经甲方书面同意乙方不得擅自处分、变更、改造等影响抵押物或存在其他影响抵押物</td>
	</tr>
	<tr>
		<td align="left" colspan="4">价值的行为，由此造成甲方损害的应予以赔偿。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第三条 抵押担保的范围</td>
	</tr>
	<tr>
		<td align="left" colspan="4">主合同中所约定的本金、利息、违约金、因主合同所生的损害赔偿金、甲方实现债权的费用</td>
	</tr>
	<tr>
		<td align="left" colspan="4">及主合同约定应由承租人支付的费用（包括但不限于律师费、诉讼费）。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第四条 抵押期限</td>
	</tr>
	<tr>
		<td align="left" colspan="4">抵押权和其担保的主合同债权同时存在，主债权消灭的，抵押权亦消灭。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第五条 抵押的办理及费用</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">1、	乙方应无异议配合并提供所须相关材料予甲方或其委托方办理相关抵押登记手续。</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">2、	乙方应承担办理相关抵押登记手续的费用。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">第六条 抵押证件的保管</td>
	</tr>
	<tr>
		<td align="left" colspan="4">抵押物抵押登记完成后，抵押物登记证书、抵押物抵押证明文件及/或其他相关抵押文件，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">应交由甲方保管。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">第七条 抵押物的使用和保管</td>
	</tr>
	<tr>
		<td align="left" colspan="4">抵押物抵押期间，乙方应善尽其管理人责任:</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">1、未经抵押权人同意,抵押人不得对该抵押物做出任何实质性的结构改变,因抵押人违反本</td>
	</tr>
	<tr>
		<td align="left" colspan="4">合同所作的改变而使抵押物产生的任何增加物,自动转为本合同的抵押物。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">2、抵押期间,未经抵押权人同意,抵押人不得将该抵押物转让、出租、变卖、再抵押、抵偿</td>
	</tr>					
	<tr>
		<td align="left" colspan="4">债务、馈赠或以任何形式处置,由此引起抵押权人的任何损失,由抵押人承担责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">3、抵押人对该抵押物必须妥善保管,负有维修、保养、保证完好无损的责任,并随时接受及</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">配合抵押权人的监督检查,对该抵押物造成的任何损坏,由抵押人承担责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">4、抵押期间,乙方对甲方要求抵押物的检查应随时予以配合,抵押期间因乙方原因致抵押物</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">包括但不限于被查封、扣押、没入、消灭等情况,而造成甲方经济损失的,乙方应承担相应的</td>
	</tr>					
	<tr>
		<td align="left" colspan="4">损害赔偿责任。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第八条 抵押物的保险</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">1．抵押人须在取得该抵押物_________日内，到抵押权人指定的保险公司并按抵押权人指定。</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">的保险种类为该抵押物购买保险。保险的赔偿范围应包括该抵押物遭受任何火灾、水灾、地</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">震等自然灾害及其他意外事故所导致的破坏及损毁；投保金额不得少于重新购买该抵押物的</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">全部金额；保险期限至主合同到期之日，如抵押人不履行到期还款的义务，抵押人应继续购</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">买保险，直至主合同项下债务履行完毕为止</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">2．抵押人需在保险手续办理完毕十日内，将保险单正本交抵押权人保管。保险单的第一受</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">益人须为抵押权人，保险单不得附有任何损害或影响抵押权人权益的限制条件，或任何不负</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">责赔偿的条款。</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">3．抵押期内，抵押人不得以任何理由中断或撤销上述保险。否则，抵押人须无条件赔偿抵</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">押权人因此所受的一切损失。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">4．抵押人如违反上述保险条款，抵押权人可依照本合同之保险条款的规定，代为购买保险，</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">所有费用由抵押人支付。</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">5．抵押期间，该抵押物发生保险责任以外的毁损，抵押人应就受损部分及时提供新的担保，</td>
	</tr>
	<tr>
		<td align="left" colspan="4">并办理相应手续。</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">6．抵押人负责缴付涉及该抵押物的一切税费。抵押人因不履行该项义务而对抵押权人造成</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">的一切损失，抵押人应负责赔偿。</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">第九条 抵押权的实现</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">1、	乙方未依约定履行主合同项下的任何一项债务，甲方或其委托方，有权处分抵押物，以实现抵押权。</td>
	</tr>			
	<tr>
		<td align="left" colspan="4">2、	甲方依据本合同处分抵押物时，乙方应予以配合，不得有阻碍、藏匿或其他影响甲方处</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">  分抵押物的权利的行为,由此造成甲方损害的由乙方负责赔偿。</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">3、	抵押物折价、变卖后，其价款超过抵押担保范围债权数额部分归乙方所有。</td>
	</tr>
	<tr>
		<td align="left" colspan="4">第十条 合同的生效、终止</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">1、	本合同自甲、乙双方签名和/或盖章之日起生效。</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">2、	于全部清偿主合同项下所有应履行的债务及损害赔偿日时终止。</td>
	</tr>				
	<tr>
		<td align="left" colspan="4">3、	主合同条款部分或全部无效，不影响本抵押合同的效力，乙方仍应按约定承担责任。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">4、	本合同附件为本合同不可分割部份，与本合同条款具有同等法律效力。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">第十一条 争议解决</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">甲、乙双方于履行本合同过程中产生争议时，应先友好协商解决，协商不成时，则以</td>
	</tr>				
	<tr>
		<td align="left" colspan="4">甲方住所地法院为争议管辖法院。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">第十二条 合同份式</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">本合同一式 <u>四 </u>份，甲、乙双方各执一份，抵押物登记部门及___________各持一份具同</td>
	</tr>				
	<tr>
		<td align="left" colspan="4">等法律效力。</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">第十三条 其他约定事项</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;</td>
	</tr>		
	<tr>
		<td align="left" colspan="4">甲方（抵押权人）：<%=Constants.COMPANY_NAME %>（盖章）</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人或授权代表：</td>
	</tr>
	<tr>
		<td align="left" colspan="4">&nbsp;</td>
	</tr>						
	<tr>
		<td align="left" colspan="4">乙方（抵押人）：${LEASECODE.CUST_NAME }（盖章）</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">法定代表人或授权代表：</td>
	</tr>	
	<tr>
		<td align="left" colspan="4">&nbsp;</td>
	</tr>					
	<tr>
		<td align="center" colspan="4">签订日：&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日</td>
	</tr>										
	
</table>	
</body>
</html>