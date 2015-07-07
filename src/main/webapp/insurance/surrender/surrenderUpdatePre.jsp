<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>修改退保信息</title>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		
    	 	//提交付款申请
			function subNotice() {
			if(isNaN($("#SURRENDER_PRICE").val())){
				alert("金额只能输入数字！");
				return false;
			}
					$("#addform").submit();
			}
				//查看保单
			function showInsuList(id){
				
				window.location.href="../servlet/defaultDispatcher?__action=insure.showInsuList&INCU_ID="+id;
			}
			//校验数字
			function checkNum(Obj){
				if(isNaN(Obj.value)){
					alert('请输入数字');
					Obj.value="";
				}
			}
		</script>
		
		<script type="text/javascript">
			$(function (){
				$("#DANG_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#INSF_DATE").datepicker($.datepicker.regional['zh-CN']);
						var now= new Date();  
						var year=now.getYear()+1900;  
						var month=now.getMonth()+1;  
						var day=now.getDate();  
		   
			});
		</script>

	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="surrender.updateSurrender">
			<input type="hidden" name="ID" value="${surrender.ID }">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改退保信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:25%;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">退保日期:</th>
					<td style="text-align: left;height:24px;width:25%;"><input onfocus="this.value=''"  type="text" name="SURRENDER_DATE" id="DANG_DATE" value="${surrender.SURRENDER_DATE }">&nbsp;</td>
					<th style="text-align: left;height:24px;width:25%;" class="ui-state-default ui-th-ltr zc_grid_head">退保金额(元)：</th>
					<td style="text-align: left;height:24px;width:25%;"><input   type="text" name="SURRENDER_PRICE" id="SURRENDER_PRICE" value="${surrender.SURRENDER_PRICE }" onkeyup="checkNum(this)"><font color="red" size="5">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:25%;" class="ui-state-default ui-th-ltr zc_grid_head"  colspan="2">查看保单：</th>
					<td colspan="3"><a href="javascript:void(0)" onclick="showInsuList('${INCU_ID }');">点击查看</a></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:180px;" class="ui-state-default ui-th-ltr zc_grid_head">退保原因：</th>
					<td colspan="5"><textarea rows="3" cols="150" name=SURRENDER_REASON>${surrender.SURRENDER_REASON }</textarea><font color="red" size="5">*</font></td>

				</tr>

			</table>
			<center>
				<input type="button" value="提  交" class="ui-state-default ui-corner-all" onclick="javascript:subNotice();" />
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
