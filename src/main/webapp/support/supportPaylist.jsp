<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>删除支付表的起租日期</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="deleteDate">
	<script type="text/javascript" src="${ctx }/support/js/supportPaylist.js"></script>

	<script type="text/javascript" src="${ctx }/support/js/finaCllactionBill.js"></script>
	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  </head>
  
  <body>
   
  <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
        	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;删除支付表起租日期</span>
		   	</div>
		   	
		<table width="90%"  style="align:center"   cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				 
		<tr><td width="200px" style=" text-align:center">输入支付表号</td><td width="230px"><input size="45"  type="text" id="payListinfoNum1"></td></tr>		
		<tr><td colspan="2" style=" text-align:center"><input type="button" class="ui-state-default ui-corner-all"  value="检测" onclick="submitNum('payListinfoNum1','paylistsubmintButton1','payListinfoBack1')"  /><input type="button" id="paylistsubmintButton1" class="ui-state-default ui-corner-all"  value="提交" onclick="submitNum1()" disabled="disabled" /></td></tr>		
		<tr><td colspan="2">说明： 功能，删除支付表起租日
		                  操作有： 1检测 显示支付表号所对应的信息</td></tr>	
		                  <tr><td colspan="2">  &nbsp;  &nbsp;  &nbsp;   &nbsp;        2删除起租日期 结束日期
		                       3  删除每期租金的支付日期</td></tr>		
		<tr><td colspan="2"  style=" text-align:center"></td></tr>		
		</table>
		<table  style="display:none" >
		<tr><td> NAME 最近修改人 </td><td> STATUS状态 </td><td> VERSION_CODE版本号 </td><td>START_DATE起租日期  </td><td> END_DATE结束日期 </td><td> ASSET_STATUS资产状态 0正常 1融资 2保理 </td><td> FUND_STATUS资金状态 0正常 1正常结清 2提前结清 3回购 </td><td> WARN_STATUS异常状态 0正常 2转法务 </td><td> STAS </td><td> PAY_DATE支付日期 </td><td> DUN_STATUS催收状态 </td><td>  REDUCE_STATUS分解状态</td><td>PASSED是否已支付  </td><td> REDUCE_OWN_PRICE已分解本金 </td><td >LOCKED等额不等额</td><td ></td><td ></td></tr>		
		</table>
		<div style=" text-align:center; width:90%"    >
		<table style=" text-align:center; width:90%"   cellspacing="0" cellpadding="0" border="0"  id="payListinfoBack1" >
		<tr><td  style=" text-align:center"> <font color='blue'>操作结果将在这里显示 </font></td></tr>		
			
		</table>
		
		</div>
		
		</br>
			</br>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改支付表,调整日期标识</span>
		   	</div>
		
		<table width="90%"  style="align:center"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
			 
		<tr><td width="200px" style=" text-align:center">输入支付表号</td><td width="230px"><input size="45"  type="text" id="payListinfoNum2"></td></tr>		
		<tr><td colspan="2" style=" text-align:center"><input type="button"  class="ui-state-default ui-corner-all"  value="检测" onclick="submitNum('payListinfoNum2','paylistsubmintButton2','payListinfoBack2')"  /><input type="button" class="ui-state-default ui-corner-all" value="提交" id="paylistsubmintButton2" onclick="submitNum2()" disabled="disabled" /></td></tr>		
		<tr><td colspan="2">说明： 功能，修改支付表,调整日期标识</td></tr>
		<tr><td colspan="2">操作有： 1 调整日期标识 ,使该支付表起租日期变为可设定状态</td></tr>
		<tr><td colspan="2"> 2  保留原有起租日期 ,结束日期 , 每期租金的支付日期</td></tr>		
		<tr><td colspan="2" style=" text-align:center"></td></tr>		
		</table>
		
		<div style=" text-align:center; width:90%"    >
		<table style=" text-align:center; width:90%"    id="payListinfoBack2" >
		<tr><td  style=" text-align:center"><font color='blue'>操作结果将在这里显示</font> </td></tr>		
			
		</table>
		
		</div>
		
		
</br>
			</br>

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;删除支付表</span>
		   	</div>

	<table width="90%"  style="align:center"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
		<tr><td width="200px" style=" text-align:center">输入支付表号</td><td width="230px"><input size="45"  type="text" id="payListinfoNum3"></td></tr>		
		<tr><td colspan="2" style=" text-align:center"><input type="button"  class="ui-state-default ui-corner-all" value="检测" onclick="submitNum('payListinfoNum3','paylistsubmintButton3','payListinfoBack3')"  /><input type="button" class="ui-state-default ui-corner-all"  value="提交"  id="paylistsubmintButton3" onclick="submitNum3()" disabled="disabled" /></td></tr>		
		<tr><td colspan="2"><font color ="red" >说明： 功能，删除支付表
		                             操作有： 1 删除支付表
		                                2 删除支付表相关的保险费，其他费用，融资租赁还款计划，融资租赁方案，备注信息,设备列表
		                                3 被删除支付表的部分信息将在下面显示 </font></td></tr>		
		<tr><td colspan="2" style=" text-align:center"></td></tr>		
		</table>
		
		<div style=" text-align:center; width:90%"    >
		<table style=" text-align:center; width:90%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   id="payListinfoBack3" >
		<tr><td  style=" text-align:center">  <font color='blue'>被删除支付表的部分信息将在这里显示</font> </td></tr>		
			
		</table>
		
		</div>

		</br>
			</br>

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;删除来款分解表</span>
		   	</div>
		
	
		<table width="90%"  style="align:center"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
			 
			<tr><td width="200px" style=" text-align:center">输入来款ID号</td><td width="230px"><input size="45"  type="text" id="finaId"></td></tr>		
			<tr><td colspan="2" style=" text-align:center"><input type="button"  class="ui-state-default ui-corner-all" value="提交" onclick="submitFinaId();"  /></td></tr>		
			<tr><td colspan="2"><font color ="red" >说明： 功能，删除来款分解单
			                             操作有： 1、 调整分解单表状态变为-2;
			                                 2、 调整来款表状态变为2</font></td></tr>		
			<tr><td colspan="2" style=" text-align:center"></td></tr>		
		</table>	
	
	
	
			</br>
			</br>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改删除合同备注信息</span>
		   	</div>
		
	<table width="90%"  style="align:center" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
		<tr><td width="200px" style=" text-align:center">输入合同号</td><td width="230px"><input size="45"  type="text" id="rentContractnum1"></td></tr>		
		<tr><td colspan="2" style=" text-align:center"><input type="button"  class="ui-state-default ui-corner-all" value="检测" onclick="submitNum4()"  /></td></tr>		
		<tr><td colspan="2"><font color ="red" >说明： 功能，分条目选择删除合同备注
		                             操作有： 1 显示合同备注信息
		                                2 用户可以分条目选择删除的备注
		                                 </font></td></tr>		
		<tr><td colspan="2"  style="text-align:center"></td></tr>		
		</table>
		
		<div style=" text-align:center; width:90%"    >
		<table style=" text-align:center; width:90%"    id="rentContractInfo1" >
		<tr><td  style=" text-align:center"><font color='blue'> 合同备注信息将在这里显示</font></td></tr>		

		</table>
		
		</div>
	
	</br>
			</br>
				
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改合同承租人信息</span>
		   	</div>
	<table width="90%"  style="align:center"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
		<tr><td width="200px" style=" text-align:center">输入合同号</td><td width="230px"><input size="45"  type="text" id="rentContractnum2"></td></tr>		
		<tr><td colspan="2" style=" text-align:center"><input type="button"  class="ui-state-default ui-corner-all" value="检测" onclick="submitNum5()"  /></td></tr>		
		<tr><td colspan="2"><font color ="red" >说明： 功能，分条目选择删除合同备注
		                             操作有： 1 显示合同备注信息
		                                2 用户可以分条目选择删除的备注
		                                 </font></td></tr>		
		<tr><td colspan="2"  style="text-align:center"></td></tr>		
		</table>
		<div style=" text-align:center; width:90%"    >
		<table style=" text-align:center; width:90%"    id="rentContractInfo2" >
		<tr><td  style=" text-align:center"> <font color='blue'>合同承租人信息将在这里显示</font></td></tr>		
		</table>
		</div>
		
		</div>
</div>
</div>
</body>
</html>
