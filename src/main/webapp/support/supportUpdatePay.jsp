<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改支付表号</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="deleteDate">
	<script type="text/javascript" src="${ctx }/support/js/supportUpdatePay.js"></script>
	<script type="text/javascript">
		function queryFinaIncome(){
			var name = $("#OPPOSING_UNIT").val() ;
			if(name == null || name ==""){
				alert("请填写来款账户！") ;
				return ;
			}
			$("#form1").submit() ;
		}
		function updateOpposingName(count,fiinId){
			var name = $("#current_opposing"+count).val() ;
			if(name != null || name != ''){
				if(confirm("确定要修改么？")){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:{'__action':'decompose.updateOpposingUnit',
							'OPPOSING_UNIT':name ,
							'FIIN_ID': fiinId },
						dataType:'json',
						success: function(data){
							alert(data.content) ;
							location.href='../servlet/defaultDispatcher?__action=decompose.queryNotDecomposeFinaIncome&OPPOSING_UNIT='+name;
						},
						error:function(callback){
							alert("修改失败");
							return;
						}
					}) ;
				}
			}
		}
	</script>
  </head>
  <body>
  			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改支付表号</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
						<tr class="ui-jqgrid-labels"><td width="200px" style=" text-align:center">输入旧支付表号</td><td width="230px"><input size="45"  type="text" id="oldPay"></td></tr>	
						<tr class="ui-jqgrid-labels"><td width="200px" style=" text-align:center">输入新支付表号</td><td width="230px"><input size="45"  type="text" id="newPay"></td></tr>			
						<tr class="ui-jqgrid-labels"><td colspan="2"><font color ="red" >说明： 此部分的功能是修改支付表号  进行的 
						                             操作有： 1 修改支付表号
						                          提交之前，请确认新的支付表号是否存在,合同号是否正确  </font></td></tr>		
						</table>
						<div align="center">		
							<input type="button" class="ui-state-default ui-corner-all" value="检测新旧支付表是否存在" name="sub" id="sub" onclick="checkPay()">
							<input type="button" class="ui-state-default ui-corner-all" value="提 交" name="but" id="but" onclick="updatePay()">		
						</div>						
				</div>
				</div>
			</div>	
			
  			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改合同号</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
						<tr class="ui-jqgrid-labels"><td width="200px" style=" text-align:center">输入旧合同号</td><td width="230px"><input size="45"  type="text" id="oldRent"></td></tr>	
						<tr class="ui-jqgrid-labels"><td width="200px" style=" text-align:center">输入新合同号</td><td width="230px"><input size="45"  type="text" id="newRent"></td></tr>			
						<tr class="ui-jqgrid-labels"><td colspan="2"><font color ="red" >说明： 此部分的功能是修改合同号，同步修改支付表号 进行的 
						                             操作有： 1  验证是否可以修改
						                                 2  修改合同号
						                                 3  修改支付表号，保持支付表和合同对应
						                          提交之前，请确认新的合同号是否存在！  </font></td></tr>		
						</table>
						<div align="center">		
							<input type="button" class="ui-state-default ui-corner-all" value="检测新旧合同号是否存在" name="sub" id="sub" onclick="checkRent()">
							<input type="button" class="ui-state-default ui-corner-all" value="提 交" name="but" id="but" onclick="updateRent()">		
						</div>						
				</div>
				</div>
			</div>	
			
  			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;逾期信息更新</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">	
					<div align="center">		
						<input type="button" class="ui-state-default ui-corner-all" value="逾期信息更新" name="sub" id="sub" onclick="dunUpdate()">		
					</div>						
				</div>
				</div>
			</div>	
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;删除合同</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
						<tr class="ui-jqgrid-labels"><td width="200px" style=" text-align:center">输入要删除的合同号</td><td width="230px"><input size="45"  type="text" id="deleteRent"></td></tr>	
						<tr class="ui-jqgrid-labels"><td colspan="2"><font color ="red" >说明： 此部分的功能是删除合同</font></td></tr>		
						</table>
						<div align="center">		
							<input type="button" class="ui-state-default ui-corner-all" value="检测要删除的合同号是否存在" name="sub" id="sub" onclick="checkDeleteRent()">
							<input type="button" class="ui-state-default ui-corner-all" value="删除" name="but" id="but" onclick="deleteRent()">		
						</div>						
				</div>
				</div>
			</div>	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业务人员活动日报表信息更新</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">	
					<div align="center">		
						<input type="button" class="ui-state-default ui-corner-all" value="业务人员活动日报表信息更新" name="sub" id="sub" onclick="logDayUpdate();">		
					</div>						
				</div>
				</div>
			</div>		
  </body>
</html>
